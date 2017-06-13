/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
This file shows how to implement the OperationObserver protocol.
*/

import Foundation

/**
    The `BlockObserver` is a way to attach arbitrary blocks to significant events
    in an `Operation`'s lifecycle.
*/
struct BlockObserver: OperationObserver {
    // MARK: Properties
    
    fileprivate let startHandler: ((APPLOperation) -> Void)?
    fileprivate let produceHandler: ((APPLOperation, Foundation.Operation) -> Void)?
    fileprivate let finishHandler: ((APPLOperation, [Error]) -> Void)?
    
    init(startHandler: ((APPLOperation) -> Void)? = nil, produceHandler: ((APPLOperation, Foundation.Operation) -> Void)? = nil, finishHandler: ((APPLOperation, [Error]) -> Void)? = nil) {
        self.startHandler = startHandler
        self.produceHandler = produceHandler
        self.finishHandler = finishHandler
    }
    
    // MARK: OperationObserver
    
    func operationDidStart(_ operation: APPLOperation) {
        startHandler?(operation)
    }
    
    func operation(_ operation: APPLOperation, didProduceOperation newOperation: Foundation.Operation) {
        produceHandler?(operation, newOperation)
    }
    
    func operationDidFinish(_ operation: APPLOperation, errors: [Error]) {
        finishHandler?(operation, errors)
    }
}

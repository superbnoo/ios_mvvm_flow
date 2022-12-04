//
//  DataTransferError+ConnectError.swift
//  Weather
//
//  Created by An Tran on 04/12/2022.
//

import Foundation

extension DataTransferError: ConnectionError {
    public var isInternetConnectionError: Bool {
        guard case let DataTransferError.networkFailure(networkError) = self,
            case .notConnected = networkError else {
                return false
        }
        return true
    }
}

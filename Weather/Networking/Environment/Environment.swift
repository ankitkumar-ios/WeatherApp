//
//  Environment.swift
//  Weather
//
//  Created by BasicFirst on 7/27/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import Foundation

public enum PlistKey {
    case ServerURL
    case ConnectionProtocol
    case DarkSkyKey
    
    func value() -> String {
        switch self {
        case .ServerURL:
            return "ServerURL"
        case .ConnectionProtocol:
            return "Protocol"
        case .DarkSkyKey:
            return "DarkSkyKey"
        }
    }
}
public struct Environment {
    fileprivate var infoDict: [String: Any]  {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            }else {
                fatalError("Plist file not found")
            }
        }
    }
    public func configuration(_ key: PlistKey) -> String {
        switch key {
        case .ServerURL:
            return infoDict[PlistKey.ServerURL.value()] as! String
        case .ConnectionProtocol:
            return infoDict[PlistKey.ConnectionProtocol.value()] as! String
        case .DarkSkyKey:
            return infoDict[PlistKey.DarkSkyKey.value()] as! String
        }
    }
}

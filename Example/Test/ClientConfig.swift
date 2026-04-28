//
//  ClientConfig.swift
//  IDity
//
//  Created by Mohamad Hammoud on 21/04/2026.
//

import Foundation

struct ClientConfig: Codable {
    let clientKey: String
    let bundleId: String
    let enabled: Bool
}

//
//  NEONetwork.swift
//  NeoSwift
//
//  Created by Apisit Toompakdee on 10/21/17.
//  Copyright © 2017 drei. All rights reserved.
//

import Foundation

public class NEONode: Codable {
    public var URL: String
    public var blockCount: UInt
    public var peerCount: UInt
    
    enum CodingKeys: String, CodingKey {
        case URL = "url"
        case blockCount = "blockcount"
        case peerCount = "peercount"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let url: String = try container.decode(String.self, forKey: .URL)
        let blockcount: UInt = try container.decode(UInt.self, forKey: .blockCount)
        let peercount: UInt = try container.decode(UInt.self, forKey: .peerCount)
        self.init(url: url, blockCount: blockcount, peerCount: peercount)
    }
    
    public init(url: String, blockCount: UInt, peerCount: UInt) {
        self.URL = url
        self.blockCount = blockCount
        self.peerCount = peerCount
    }
    
    public func refresh(completion: @escaping (NeoClientResult<Int64>) -> ()) {
        NeoClient(seed: self.URL).getBlockCount { result in
            completion(result)
        }
    }
}

public class NEONodes: Codable {
    
    public var nodes: [NEONode]
    
    enum CodingKeys: String, CodingKey {
        case nodes = "nodes"
    }
    
    public convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nodes: [NEONode] = try container.decode([NEONode].self, forKey: .nodes)
        self.init(nodes: nodes)
    }
    
    public init(nodes: [NEONode]) {
        self.nodes = nodes
    }
}

public struct NEONetwork: Codable {
    
    public var mainNet: NEONodes
    public var testNet: NEONodes
    
    enum CodingKeys: String, CodingKey {
        case mainNet = "main"
        case testNet = "test"
    }
    
    public init(mainNodes: NEONodes, testNodes: NEONodes) {
        self.mainNet = mainNodes
        self.testNet = testNodes
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let mainNodes: NEONodes = try container.decode(NEONodes.self, forKey: .mainNet)
        let testNodes: NEONodes = try container.decode(NEONodes.self, forKey: .testNet)
        self.init(mainNodes: mainNodes, testNodes: testNodes)
    }
}

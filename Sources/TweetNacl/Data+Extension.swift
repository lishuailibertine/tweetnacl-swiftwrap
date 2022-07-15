//
//  HAMC.swift
//  
//
//  Created by mathwallet on 2022/7/15.
//

import Foundation
import CommonCrypto

extension Data {
    public var bytes: Array<UInt8> {
      Array(self)
    }
    
    func hmacSHA512(key: Data) -> Data {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA512), key.bytes, key.count, self.bytes, self.count, &digest)
        return Data(bytes: digest)
    }
}

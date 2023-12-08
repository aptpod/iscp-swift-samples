//
//  String+Extensions.swift
//  VideoUpstreamApp
//
//  Created by uenomasamitsu on 2023/10/25.
//  Copyright © 2023 aptpod, Inc. All rights reserved.
//

import Foundation

extension String {
    
    var toBlankEqualNull: String? {
        guard !self.isEmpty else { return nil }
        return self
    }
    
    var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension Optional where Wrapped == String {
    
    var toBlankEqualNull: String? {
        guard let str = self else { return nil }
        guard !str.isEmpty else { return nil }
        return str
    }
    
}

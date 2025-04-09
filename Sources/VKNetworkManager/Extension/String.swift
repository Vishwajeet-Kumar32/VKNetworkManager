//
//  String.swift
//  VKNetworkManager
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import Foundation

extension String {
    /// Used to validate url
    var isValidURL: Bool {
        let regEx = "http[s]?://(([^/:.[:space:]]+(.[^/:.[:space:]]+)*)|([0-9](.[0-9]{3})))(:[0-9]+)?((/[^?#[:space:]]+)([^#[:space:]]+)?(#.+)?)?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
        return predicate.evaluate(with: self)
    }
}

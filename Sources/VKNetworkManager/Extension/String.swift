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
        let regEx =
        "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
        return predicate.evaluate(with: self)
    }
}

//
//  StringExtensions.swift
//  Travely
//
//  Created by Büşra Güneş on 10.10.2022.
//

import Foundation

extension String {
    func toLowercaseTr() -> String{
        return lowercased(with: Locale(identifier: "tr"))
    }
}

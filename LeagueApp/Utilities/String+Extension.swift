//
//  String+Extension.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}

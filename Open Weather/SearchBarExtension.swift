//
//  SearchBarExtension.swift
//  Open Weather
//
//  Created by Nishant Taneja on 14/10/20.
//

import UIKit

extension UISearchBar {
    /// This method checks that SearchBar's TextField contains some text or not.
    func isSearchable() -> Bool {
        if text?.count == 0 {
            return false
        }
        if text?.replacingOccurrences(of: " ", with: "").count == 0 {
            return false
        }
        return true
    }
}

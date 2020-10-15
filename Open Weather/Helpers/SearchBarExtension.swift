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
    
    /// This method modifies attributes of searchField
    func modifyAttributes(forWeatherCondition condition: String) {
        searchTextField.leftView?.tintColor = .white
        tintColor = .white
        searchTextField.textColor = .white
        
        searchTextField.attributedPlaceholder = NSAttributedString(string: searchTextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])

        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.white.cgColor
    }
}

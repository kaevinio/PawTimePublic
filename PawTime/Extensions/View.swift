//
//  View.swift
//  PawTime
//
//  Created by Kaevin on 01.12.23.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

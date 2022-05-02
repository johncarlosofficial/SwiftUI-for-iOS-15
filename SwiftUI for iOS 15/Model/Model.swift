//
//  Model.swift
//  SwiftUI for iOS 15
//
//  Created by João Carlos Magalhães on 04/04/22.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showDetail : Bool = false
    @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
    case signUp
    case signIn
}

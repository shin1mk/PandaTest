//
//  ContentViewModel.swift
//  PandaTest
//
//  Created by SHIN MIKHAIL on 15.02.2024.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var model: ScreenModel
    @Published var isDetailScreenPresented = false
    
    init() {
        self.model = ScreenModel(isBlocked: false)
    }
    
    func toggleBlock() {
        self.model.isBlocked.toggle()
    }
    
    func toggleDetailScreen() {
        self.isDetailScreenPresented.toggle()
    }
}

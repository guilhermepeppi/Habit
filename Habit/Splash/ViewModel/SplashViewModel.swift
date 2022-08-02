//
//  SplashViewModel.swift
//  Habit
//
//  Created by Guilherme Peppi on 02/08/22.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        // Faz algo assincrono e muda o estado da uiState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // É chamado depois de 2 segundos
            self.uiState = .goToSignInScreen
        }
    }
}

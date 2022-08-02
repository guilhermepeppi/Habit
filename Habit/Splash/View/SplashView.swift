//
//  SplashView.swift
//  Habit
//
//  Created by Guilherme Peppi on 01/08/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var ViewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch ViewModel.uiState {
            case .loading:
                loadingView()
            case .goToSignInScreen:
                Text("Carregar tela de login")
                // navegar para a proxima tela
            case .goToHomeScreen:
                Text("Carregar tela principal")
                // navegar para a proxima tela
            case .error(let msg):
                loadingView(error: msg)
                
            }
        } .onAppear(perform: {
            ViewModel.onAppear()
        })
    }
}

// Função em extensions
// Usado quando precisa passar parametros
extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity) // pra deixar dinamico
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"), message: Text(error), dismissButton: .default(Text("OK")) {
                            //Aqui fica o código que faz algo quando some o alerta
                        })
                    }
            }
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let ViewModel = SplashViewModel()
        SplashView(ViewModel: ViewModel)
    }
}

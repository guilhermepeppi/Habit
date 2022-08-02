//
//  SplashView.swift
//  Habit
//
//  Created by Guilherme Peppi on 01/08/22.
//

import SwiftUI

struct SplashView: View {
    
    @State var state: SplashUIState = .loading
    
    var body: some View {
        switch state {
        case .loading:
            loadingView()
            //loading - extensao
            //LoadingView() - Compartilhamento de objetos
        case .goToSignInScreen:
            Text("Carregar tela de login")
            // navegar para a proxima tela
        case .goToHomeScreen:
            Text("Carregar tela principal")
            // navegar para a proxima tela
        case .error(let msg):
            loadingView(error: msg)
            
        }
    }
}

// Compartilhamento de objetos
// Usado quando precisa reutilizar a mesma parte do código
struct LoadingView: View {
    var body: some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity) // pra deixar dinamico
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
        }
    }
}

// Extensão
// Usado quando NÃO precisa passar parametros
extension SplashView {
    var loading: some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity) // pra deixar dinamico
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
        }
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
        SplashView(state: .error("Teste de erro"))
    }
}

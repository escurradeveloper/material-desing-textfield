//
//  ContentView.swift
//  Clase37CustomTextFieldAnimation
//
//  Created by Escurra Colquis on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var nameTextField = ""
    @State var lastNameTextField = ""
    
    var body: some View {
        Text("Custom TextField")
            .font(.largeTitle)
            .padding(.top, 20)
            .padding(.bottom, 30)
            .fontWeight(.bold)
        VStack(spacing: 50) {
            CustomTextField(title: "Nombre", text: $nameTextField)
            CustomTextField(title: "Apellido", text: $lastNameTextField)
        }
        .padding()
        Spacer()
    }
}

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    @FocusState var isEnableFocus: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding(.leading)
                .frame(height: 55)
                .focused($isEnableFocus)
                .background(isEnableFocus ? .blue : .black, in: RoundedRectangle(cornerRadius: 14)
                    .stroke(lineWidth: 2))
            Text(title)
                .padding(.horizontal, 5)
                .foregroundStyle(isEnableFocus ? .blue : .black)
                .padding(.leading)
                .offset(y: isEnableFocus || !text.isEmpty ? -42 : 0)
        }
        .animation(.linear(duration: 0.3), value: isEnableFocus)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  PandaTest
//
//  Created by SHIN MIKHAIL on 15.02.2024.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var isBlocked = false
    @State private var isDetailScreenPresented = false

    var body: some View {
        VStack(spacing: 20) {
            Image("panda")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: UIScreen.main.bounds.height * 0.3)
                .clipped()

            HStack(spacing: 20) {
                Button(action: {
                    self.isBlocked.toggle()
                }) {
                    Text(self.isBlocked ? "Lock" : "Locked")
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(18)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.indigo, lineWidth: 3)
                        )
                }

                Button(action: {
                    self.isDetailScreenPresented.toggle()
                }) {
                    Text("Open from top")
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(18)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.indigo, lineWidth: 3)
                        )
                }
                .disabled(self.isBlocked)
                .opacity(self.isBlocked ? 0.5 : 1.0) // Dim the button if blocked
            }
            .padding(.horizontal, 20)

            Spacer()

            // Дополнительная кнопка внизу экрана
            Button(action: {
                self.isDetailScreenPresented.toggle()
            }) {
                Text("Open full")
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.indigo, lineWidth: 3)
                    )
            }
            .padding(.horizontal, 20)
        }
        .background(Color.gray.edgesIgnoringSafeArea(.all))
        .fullScreenCover(isPresented: $isDetailScreenPresented) {
            DetailView(isPresented: $isDetailScreenPresented)
                .transition(.move(edge: .top)) // Анимация сверху вниз
        }
    }
}

struct DetailView: View {
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Image("panda")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()

            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 32, height: 32)
                    }
                    .background(Color.gray)
                    .clipShape(Circle())
                    .padding(20)
                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

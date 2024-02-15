//
//  ContentView.swift
//  PandaTest
//
//  Created by SHIN MIKHAIL on 15.02.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image("panda")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: UIScreen.main.bounds.height * 0.3)
                .clipped()
            
            HStack(spacing: 20) {
                Button(action: {
                    viewModel.toggleBlock()
                }) {
                    Text(viewModel.model.isBlocked ? "Lock" : "Locked")
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
                    viewModel.toggleDetailScreen()
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
                .disabled(viewModel.model.isBlocked)
                .opacity(viewModel.model.isBlocked ? 0.5 : 1.0)
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {
                viewModel.toggleDetailScreen()
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
        
        .fullScreenCover(isPresented: self.$viewModel.isDetailScreenPresented) {
            DetailView(isPresented: self.$viewModel.isDetailScreenPresented)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

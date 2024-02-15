//
//  DetailView.swift
//  PandaTest
//
//  Created by SHIN MIKHAIL on 15.02.2024.
//

import SwiftUI

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

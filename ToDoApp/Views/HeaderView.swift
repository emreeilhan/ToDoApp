//
//  HeaderView.swift
//  ToDoApp
//
//  Created by Emre Ilhan on 5.06.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
            HStack{
                VStack(alignment: .leading){
                    Text("Hello")
                        .foregroundStyle(.secondary)
                        .font(.system(size: 20))
                    Text("Emre")
                        .font(.system(size: 45))
                }
                Spacer()
                Text(Date(), style: .date)
                    .foregroundStyle(.secondary)
            }.padding()
    }
}

#Preview {
    HeaderView()
}

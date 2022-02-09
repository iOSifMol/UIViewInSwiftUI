//
//  ContentView.swift
//  UIViewInSwiftUI
//
//  Created by Iosif Moldovan on 07.02.2022.
//

import SwiftUI

struct ContentView: View {
  @State private var progress: String = "0"
  
    var body: some View {
      HStack {
        CustomProgressView()
          .frame(height: 72)
        textField
      }
      .padding([.leading, .trailing], 20)
    }
  
  // MARK: - Subiews
  private var textField: some View {
    VStack {
      TextField("progress", text: $progress)
        .frame(height: 30)
      Rectangle()
        .frame(height: 1)
        .foregroundColor(.gray)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

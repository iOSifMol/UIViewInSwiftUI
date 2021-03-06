// MIT License
//
// Copyright (c) 2022 Iosif
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel: ViewModel
  
    var body: some View {
      HStack {
        ProgressView(progress: viewModel.progress, delegate: viewModel) { progress in
          viewModel.progress = progress
        }
        .frame(width: CustomProgressView.size.width, height: CustomProgressView.size.height)
        textField
      }
      .padding([.leading, .trailing], 20)
    }
  
  // MARK: - Sub views
  private var textField: some View {
    VStack {
      TextField("progress", text: $viewModel.progressText)
        .font(Font.title)
        .frame(height: 30)
        .padding(.top, -26)
        .keyboardType(.numberPad)
      Rectangle() // underline
        .frame(height: 1)
        .foregroundColor(.gray)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}

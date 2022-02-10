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

import UIKit
import SwiftUI

final class CustomProgressView: UIView {
  var progress: Float {
    get { slider.value }
    set { slider.value = newValue }
  }
  private let slider = UISlider(frame: .zero)
  private let upButton = UIButton(type: .custom)
  private let downButton = UIButton(type: .custom)
  // metrics
  private static let buttonSize = CGSize(width: 36, height: 36)
  private static let sliderWidth: CGFloat = 130
  static var size: CGSize {
    CGSize(width: sliderWidth + buttonSize.width, height: 2 * buttonSize.height)
  }
  
  init(frame: CGRect = .zero, progress: Float = 0) {
    super.init(frame: frame)
  
    setupView()
    self.progress = progress
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  // MARK: - Actions Methods
  @objc private func didChangeProgress(_ slider: UISlider) {
    print("Did change progress to: \(slider.value)")
  }
  
  @objc private func didPressUpButton(_ button: UIButton) {
    print("Did press up")
  }
  
  @objc private func didPressDownButton(_ button: UIButton) {
    print("Did press down")
  }
  
  // MARK: - Setup view
  private func setupView() {
    setupSlider()
    setupUpButton()
    setupDownButton()
  }
  
  private func setupSlider() {
    slider.addTarget(self, action: #selector(didChangeProgress(_:)), for: .valueChanged)
    addSubview(slider)
    slider.translatesAutoresizingMaskIntoConstraints = false
    slider.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    slider.widthAnchor.constraint(equalToConstant: Self.sliderWidth).isActive = true
    slider.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  private func setupUpButton() {
    upButton.setTitle("⬆️", for: .normal)
    upButton.setTitleColor(UIColor.systemBlue, for: .normal)
    upButton.addTarget(self, action: #selector(didPressUpButton(_:)), for: .touchUpInside)
    addSubview(upButton)
    upButton.translatesAutoresizingMaskIntoConstraints = false
    upButton.widthAnchor.constraint(equalToConstant: Self.buttonSize.width).isActive = true
    upButton.heightAnchor.constraint(equalToConstant: Self.buttonSize.height).isActive = true
    upButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
    upButton.leftAnchor.constraint(equalTo: slider.rightAnchor).isActive = true
  }
  
  private func setupDownButton() {
    downButton.setTitle("⬇️", for: .normal)
    downButton.setTitleColor(UIColor.systemBlue, for: .normal)
    downButton.addTarget(self, action: #selector(didPressDownButton(_:)), for: .touchUpInside)
    addSubview(downButton)
    downButton.translatesAutoresizingMaskIntoConstraints = false
    downButton.widthAnchor.constraint(equalToConstant: Self.buttonSize.width).isActive = true
    downButton.heightAnchor.constraint(equalToConstant: Self.buttonSize.height).isActive = true
    downButton.topAnchor.constraint(equalTo: upButton.bottomAnchor).isActive = true
    downButton.centerXAnchor.constraint(equalTo: upButton.centerXAnchor).isActive = true
  }

}

// MARK: - SwiftUI Representation
struct ProgressView: UIViewRepresentable {
  var progress: Float
  
  func makeUIView(context: UIViewRepresentableContext<ProgressView>) -> CustomProgressView {
    CustomProgressView(progress: progress)
  }
  
  func updateUIView(_ uiView: CustomProgressView, context: UIViewRepresentableContext<ProgressView>) {
    uiView.progress = progress
  }
}

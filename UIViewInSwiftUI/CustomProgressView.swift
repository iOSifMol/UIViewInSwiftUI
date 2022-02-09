//
//  CustomProgressView.swift
//  UIViewInSwiftUI
//
//  Created by Iosif Moldovan on 09.02.2022.
//

import UIKit
import SwiftUI

final class CustomProgressView: UIView {
  private let slider = UISlider(frame: .zero)
  private let upButton = UIButton(type: .custom)
  private let downButton = UIButton(type: .custom)
  // metrics
  private let buttonSize = CGSize(width: 36, height: 36)
  private let sliderWidth: CGFloat = 130
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  
    setupView()
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
    slider.widthAnchor.constraint(equalToConstant: sliderWidth).isActive = true
    slider.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  private func setupUpButton() {
    upButton.setTitle("⬆️", for: .normal)
    upButton.setTitleColor(UIColor.systemBlue, for: .normal)
    upButton.addTarget(self, action: #selector(didPressUpButton(_:)), for: .touchUpInside)
    addSubview(upButton)
    upButton.translatesAutoresizingMaskIntoConstraints = false
    upButton.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
    upButton.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
    upButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
    upButton.leftAnchor.constraint(equalTo: slider.rightAnchor).isActive = true
  }
  
  private func setupDownButton() {
    downButton.setTitle("⬇️", for: .normal)
    downButton.setTitleColor(UIColor.systemBlue, for: .normal)
    downButton.addTarget(self, action: #selector(didPressDownButton(_:)), for: .touchUpInside)
    addSubview(downButton)
    downButton.translatesAutoresizingMaskIntoConstraints = false
    downButton.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
    downButton.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
    downButton.topAnchor.constraint(equalTo: upButton.bottomAnchor).isActive = true
    downButton.centerXAnchor.constraint(equalTo: upButton.centerXAnchor).isActive = true
  }

}

// MARK: - SwiftUI Representation
extension CustomProgressView: UIViewRepresentable {
  func makeUIView(context: UIViewRepresentableContext<CustomProgressView>) -> CustomProgressView {
    CustomProgressView(frame: .zero)
  }
  
  func updateUIView(_ uiView: CustomProgressView, context: UIViewRepresentableContext<CustomProgressView>) {
      
  }
}

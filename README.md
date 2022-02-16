# UIViewInSwiftUI
A small project explaining how to embede an UIView in SwiftUI.
Also it implements intercation in both ways.

# UI wise
It implements a custom progress view as a subclass of UIView, that contains a slider and two buttons (up and down).
Then it embeds this UIView in SwiftUI next to a text field. Both, SwiftUI text field and custom progress view interacts with each other.
Progress slider changes the value of text filed, on the other hand the text filed changes the value of the progress view.
 
# Example:

![UIView_swiftUI_gif](https://user-images.githubusercontent.com/31770066/153535914-72b2b86e-31a1-4d02-925e-30913f932343.gif)


More details you can find in this article:
https://medium.com/@iOSifMol/embed-uiview-in-swiftui-define-communication-both-ways-122b84c75da8

# MVVM Design Pattern Demo
An Xcode 9 project written in Swift 4 code built using the MVVM design pattern, truly extolling the virtues of MVVM over MVC.

In the [tutorial](http://iosbrain.com/blog/2018/05/26/introduction-to-mvvm-refactoring-an-mvc-app-using-the-mvvm-design-pattern) accompanying this repo, I'll introduce you to the "Model-View-ViewModel" or "MVVM" design pattern. For a historical and pragmatic perspective, I'll compare the very well-known "Model-View-Controller" or "MVC" design pattern, long favored by many iOS developers, to MVVM, which has steadily been gaining traction among the same group of developers.

Here's the app -- resulting from building this project in Xcode -- in action:

![alt text][logo1]

[logo1]: http://iosbrain.com/blog/wp-content/uploads/2018/05/app_in_action_1.gif "Messier browser app"

## Xcode 9 project settings
**To get this project running on the Simulator or a physical device (iPhone, iPad)**, go to the following locations in Xcode and make the suggested changes:

1. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Signing
- [ ] Tick the "Automatically manage signing" box
- [ ] Select a valid name from the "Team" dropdown
  
2. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Identity
- [ ] Change the "com.yourDomainNameHere" portion of the value in the "Bundle Identifier" text field to your real reverse domain name (i.e., "com.yourRealDomainName.Project-Name").

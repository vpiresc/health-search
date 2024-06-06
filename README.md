# About the Health Search App #

![](https://github.com/vpiresc/health-search/blob/main/images/health-providers-high-level-design.png)

This is a list of health providers. You can search for a health provider name by text, and the list will be filtered accordingly.

## Technical Details
- The project follows the clean architecture, so It is organized into `Domain`, `Data`, and `Presentation` layers. The app is built using Swift and SwiftUI for the views, following the `Model-View-ViewModel`(MVVM) design pattern. This architectural choice enhances separation of concerns and facilitates testability. 

- Various design patterns such as `Dependency Injection`, `Dependency Inversion`, and `Factories` are also utilized. These patterns help in organizing code logic and promoting reusability.

- Unit tests were implemented to ensure quality and the code coverage is approximately 93%.

- By implementing these technologies and patterns, the project aims to achieve a clean, scalable, and maintainable codebase.


## Build Settings
- Xcode: 15.4
- iOS Deployment Target: 17.4


## Installation
To run the Health Search App locally, follow these steps:

1. Clone the repository to your local machine using `git clone`.
2. Open the project in Xcode.
3. Select your target device or simulator
4. Open Xcode to build and run the app.

That's it! The app should now be running on your device or simulator. If you encounter any issues during installation, let me know.

# IDity iOS SDK

![iOS](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)
![Swift](https://img.shields.io/badge/Swift-5.0%2B-orange.svg)
![Minimum iOS](https://img.shields.io/badge/iOS-15.6%2B-blue.svg)

**IDity** is an advanced identity verification SDK for iOS. It helps you read and extract information from a user's ID card or Passport through a secure and seamless mobile experience.

---

## 🔑 Request a Client Key
To use the IDity library in your project, you must obtain a **Client Key**. 
Please contact **[mhammoud85@hotmail.com](mailto:mhammoud85@hotmail.com)** to get your credentials before starting your integration.

---

## 📦 Installation

### Swift Package Manager (SPM)
1. In Xcode, go to **File > Add Packages...**
2. Enter the following repository URL:
   `https://github.com/mhammoud85/IDity-iOS.git`
3. Set the dependency rule to the latest version or branch.

**Minimum Deployment Target:** iOS 15.6

---

## ⚙️ Required Configuration

You must add the camera permission key to your app's **Info.plist**. Without this, the application will crash when the SDK attempts to scan a document.

| Key | Value |
| :--- | :--- |
| **NSCameraUsageDescription** | "We need camera access to scan your ID or Passport for identity verification." |

---

## 🚀 Getting Started

### 1. Initialize the SDK
Initialize the SDK in your `AppDelegate` or at your application's entry point to authenticate your session and set your theme color.

```swift
import IDity

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // Initialize the library
    IDitySDK.initialize(
        clientKey: "YOUR_CLIENT_KEY", 
        tintColor: .systemRed
    )
    
    return true
}
```

### 2. Start the Journey
Generate a unique reference number for the session and trigger the SDK UI.

```swift
// Generate a unique reference number
let referenceNo = "\(UIDevice.current.identifierForVendor?.uuidString ?? "")-\(Date().timeIntervalSince1970)"

// Start the verification process
IDitySDK.startJourney(
    from: self, 
    referenceNumber: referenceNo, 
    delegate: self
)
```

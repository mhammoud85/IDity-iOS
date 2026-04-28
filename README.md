# IDity iOS SDK

![iOS](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)
![Swift](https://img.shields.io/badge/Swift-5.0%2B-orange.svg)
![Minimum iOS](https://img.shields.io/badge/iOS-15.6%2B-blue.svg)

**IDity** is a powerful identity verification SDK for iOS. It allows your application to seamlessly read and verify information from user IDs and Passports using advanced optical and NFC technologies.

---

## 🔑 Request a Client Key
To use the IDity library in your project, you need a valid **Client Key**. 
Please [Contact Us](mailto:support@idity.io) to obtain your credentials before starting integration.

---

## 📦 Installation

### Swift Package Manager (SPM)
You can install IDity via Swift Package Manager. In Xcode, go to **File > Add Packages...** and enter the following repository URL:

```text
[https://github.com/mhammoud85/IDity-iOS.git](https://github.com/mhammoud85/IDity-iOS.git)

🚀 Getting Started
1. Initialize the SDK

Initialize the SDK in your AppDelegate or SceneDelegate before using any library features. This sets your credentials and the visual theme.

Swift
import IDity

// Initialize the library
IDitySDK.initialize(
    clientKey: "YOUR_CLIENT_KEY", 
    tintColor: .systemRed
)
2. Start the Journey

To begin the identity verification process, generate a unique reference number and call startJourney.

Swift
let referenceNo = "\(UIDevice.current.identifierForVendor?.uuidString ?? "")-\(Date().timeIntervalSince1970)"

IDitySDK.startJourney(
    from: self, 
    referenceNumber: referenceNo, 
    delegate: self
)
📩 Callbacks & Results
Conform to the IDityJourneyCallbacks protocol to handle the lifecycle of the identity verification process.

Swift
extension YourViewController: IDityJourneyCallbacks {

    func onJourneyStarted(journey: Int) {
        print("Journey started with ID: \(journey)")
    }

    func onJourneyCompleted(infoObject: IDity.InfoObject) {
        // Access the extracted ID or Passport data here
        print("User Name: \(infoObject.firstName ?? "")")
        print("Document Image: \(String(describing: infoObject.document.documentImage))")
    }

    func onJourneyCancelled() {
        print("User cancelled the identity process.")
    }

    func onError(error: any Error) {
        print("An error occurred: \(error.localizedDescription)")
    }
}
🛡️ Permissions
Ensure you add the following keys to your Info.plist to allow the SDK to access the device camera and NFC (if applicable):

NSCameraUsageDescription: "We need camera access to scan your ID/Passport."

NFCReaderUsageDescription: "We need NFC access to read your biometric passport chip."

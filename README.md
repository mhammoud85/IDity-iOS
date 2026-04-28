IDity iOS SDK
IDity is an advanced identity verification SDK for iOS. It enables your application to read and extract information directly from a user's ID card or Passport using a secure, cinematic UI.

🔑 Request a Client Key
To use the IDity library in your project, you must obtain a Client Key.
Please contact mhammoud85@hotmail.com to get your credentials before starting your integration.

📦 Installation
Swift Package Manager (SPM)

In Xcode, go to File > Add Packages...

Enter the following repository URL:
https://github.com/mhammoud85/IDity-iOS.git

Set the dependency rule to the latest version or branch.

Minimum Deployment Target: iOS 15.6

⚙️ Required Configuration
You must add the camera permission key to your app's Info.plist. Without this, the application will crash when the SDK attempts to scan a document.

Key	Value
NSCameraUsageDescription	"We need camera access to scan your ID or Passport for identity verification."
🚀 Getting Started
1. Initialize the SDK

Initialize the SDK in your AppDelegate or at your application's entry point to set the theme and authenticate your key.

Swift
import IDity

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // Initialize the library
    IDitySDK.initialize(
        clientKey: "YOUR_CLIENT_KEY", 
        tintColor: .systemRed
    )
    
    return true
}
2. Start the Journey

Create a unique reference number for the session and trigger the SDK UI.

Swift
// Generate a unique reference number
let referenceNo = "\(UIDevice.current.identifierForVendor?.uuidString ?? "")-\(Date().timeIntervalSince1970)"

// Start the verification process
IDitySDK.startJourney(
    from: self, 
    referenceNumber: referenceNo, 
    delegate: self
)
📩 Handling Results (IDityJourneyCallbacks)
Conform to the IDityJourneyCallbacks protocol to receive updates on the verification status and the extracted data.

Swift
extension YourViewController: IDityJourneyCallbacks {

    /// Called when the SDK successfully initializes and the UI appears
    func onJourneyStarted(journey: Int) {
        print("Identity journey \(journey) has started.")
    }

    /// Called when the document scanning and verification is successful
    func onJourneyCompleted(infoObject: IDity.InfoObject) {
        // Access extracted data
        print("First Name: \(infoObject.firstName ?? "N/A")")
        print("Last Name: \(infoObject.lastName ?? "N/A")")
        // Access document images if provided
        // let image = infoObject.document.documentImage
    }

    /// Called when the user manually closes the SDK
    func onJourneyCancelled() {
        print("User cancelled the verification process.")
    }

    /// Called if an error occurs during the journey
    func onError(error: any Error) {
        print("IDity Error: \(error.localizedDescription)")
    }
}
🛡️ Privacy & Security
The IDity SDK is designed with privacy in mind. Ensure you have included the PrivacyInfo.xcprivacy file if you are bundling this as a library to comply with Apple's latest privacy manifest requirements.

📧 Contact & Support
For technical support, feature requests, or to obtain your Client Key, please reach out via email:

Developer: mhammoud85

Email: mhammoud85@hotmail.com

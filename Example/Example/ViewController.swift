//
//  ViewController.swift
//  Example
//
//  Created by beIN MOBILES on 29/04/2026.
//

import UIKit
import AVFoundation
import IDity

class ViewController: UIViewController, IDityJourneyCallbacks {
    func onJourneyStarted() {
        
    }
    
    func onJourneyCompleted(infoObject: IDity.InfoObject) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DynamicFormViewController") as? DynamicFormViewController else { return }
        vc.infoObject = infoObject
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func onJourneyCancelled() {
        
    }
    
    func onError(error: any Error) {
        
    }
    
    @IBOutlet weak var captureButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapCapture(_ sender: Any) {
        IDitySDK.startJourney(from: self, delegate: self)
    }
}

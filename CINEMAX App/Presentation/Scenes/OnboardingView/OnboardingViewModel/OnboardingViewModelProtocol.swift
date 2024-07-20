//
//  OnboardingViewModelProtocol.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit

protocol OnboardingViewModelProtocol: AnyObject {
    var OnboardingItems: [OnboardingData] { get }
}

class OnboardingViewModel: OnboardingViewModelProtocol {
    var OnboardingItems: [OnboardingData] = [
        OnboardingData(image: (UIImage(named: "onboardingPicOne") ?? UIImage(systemName: "tray"))!, title: "Lorem ipsum dolor sit amet consecteur esplicit", description: "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient. "),
        OnboardingData(image: (UIImage(named: "onboardingPicTwo") ?? UIImage(systemName: "tray"))!, title: "Lorem ipsum dolor sit amet consecteur esplicit", description: "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient. "),
        OnboardingData(image: (UIImage(named: "onboardingPicThree") ?? UIImage(systemName: "tray"))!, title: "Lorem ipsum dolor sit amet consecteur esplicit", description: "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient. ")
    ]
    
}

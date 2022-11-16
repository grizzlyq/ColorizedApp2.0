//
//  MainScreenViewController.swift
//  ColorizedAppByMe
//
//  Created by Дмитрий on 15.11.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    var delegate: SettingsViewControllerDelegate!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorScreenVC = segue.destination as? SettingsViewController else { return }
        colorScreenVC.mainViewColor = view.backgroundColor
        colorScreenVC.delegate = self
    }
}

extension MainScreenViewController: SettingsViewControllerDelegate {
     func fillTheBackGroundColor(with: UIColor) {
        view.backgroundColor = with
    }
}


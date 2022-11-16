//
//  ViewController.swift
//  ColorizedAppByMe
//
//  Created by Дмитрий on 31.10.2022.
//

import UIKit


protocol SettingsViewControllerDelegate {
    func fillTheBackGroundColor(with: UIColor)
}

class SettingsViewController: UIViewController {

// MARK: - IB Outlets
    
    @IBOutlet weak var colorView: UIView!
   
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
   
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    
    
    var mainViewColor: UIColor!
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        setColor()
        settingsSliders()
        colorView.backgroundColor = mainViewColor
        navigationItem.hidesBackButton = true
        
        setValue(for: redLabel, greenLabel, blueLabel)
        
    }
    
    
    @IBAction func rgbSlider(_ sender: UISlider) {

        switch sender.tag {
        case 0:
            setValue(for: redLabel)
        case 1:
            setValue(for: greenLabel)
        case 2:
            setValue(for: blueLabel)
        default:
            break
        }
        setColor()
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
         
        let color = colorView.backgroundColor
        delegate?.fillTheBackGroundColor(with: color ?? .green)
        dismiss(animated: true)
        
    }
    

    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        redSlider.minimumTrackTintColor = .red
        blueSlider.minimumTrackTintColor = .blue
        greenSlider.minimumTrackTintColor = .green
    }
    
     private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default:
                break
            }
        }
    }
    
    private func settingsSliders() {
        let sliderColor = CIColor(color: mainViewColor)
        
        redSlider.value = Float(sliderColor.red)
        greenSlider.value = Float(sliderColor.green)
        blueSlider.value = Float(sliderColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}



//
//  SplashViewController.swift
//  Crazy time
//
//  Created by Вадим on 10.05.2023.
//

import UIKit

final class SplashViewController: UIViewController {
    
    private let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let roll: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Button")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let wheel: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Wheel")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let baseWheels: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: " Base for wheels")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setConstarints()
        self.wheel.layer.add(rotationAnimation(3.0, Double.pi * 2.0), forKey: "rotationAnimation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            self.view.window?.rootViewController = UINavigationController(rootViewController: GameWheelViewController())
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseWheels.layer.shadowColor = UIColor.white.cgColor
        baseWheels.layer.shadowRadius = 10
        baseWheels.layer.shadowOpacity = 1
    }
    
    private func setSubviews() {
        view.addSubview(background)
        background.addSubview(baseWheels)
        baseWheels.addSubview(wheel)
        background.addSubview(roll)
    }
    
    private func setConstarints() {
        NSLayoutConstraint.activate([
        
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            wheel.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            wheel.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            wheel.widthAnchor.constraint(equalToConstant: 330),
            wheel.heightAnchor.constraint(equalToConstant: 330),
            
            baseWheels.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            baseWheels.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            baseWheels.widthAnchor.constraint(equalToConstant: 340),
            baseWheels.heightAnchor.constraint(equalToConstant: 330),
            
            roll.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            roll.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            roll.widthAnchor.constraint(equalToConstant: 125),
            roll.heightAnchor.constraint(equalToConstant: 125),
        ])
    }
    
    fileprivate func rotationAnimation(_ duration: CFTimeInterval, _ angle: Double) -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: angle)
        rotationAnimation.duration = duration
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.greatestFiniteMagnitude
        return rotationAnimation
    }
    
}

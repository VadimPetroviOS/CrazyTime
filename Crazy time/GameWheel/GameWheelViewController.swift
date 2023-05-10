//
//  GameWheelViewController.swift
//  Crazy time
//
//  Created by Вадим on 10.05.2023.
//

import UIKit

final class GameWheelViewController: UIViewController {
    
    private let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let comeBack: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Come back_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        return button
    }()
    
    private let points: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Points")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let wheel54: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Wheel #1_54")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let baseWheels: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Base for wheels")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rollButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Roll_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        return button
    }()
    
    private let wheelArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Wheel arrow")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var collectionView = BidViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setConstarints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseWheels.layer.shadowColor = UIColor.white.cgColor
        baseWheels.layer.shadowRadius = 10
        baseWheels.layer.shadowOpacity = 1
    }
    
    private func setSubviews() {
        view.addSubview(background)
        background.addSubview(points)
        view.addSubview(comeBack)
        background.addSubview(baseWheels)
        baseWheels.addSubview(wheel54)
        view.addSubview(rollButton)
        background.addSubview(wheelArrow)
        
        view.addSubview(collectionView)
    }
    
    private func setConstarints() {
        NSLayoutConstraint.activate([
        
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          
            comeBack.topAnchor.constraint(equalTo: background.topAnchor, constant: 60),
            comeBack.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 25),
            comeBack.widthAnchor.constraint(equalToConstant: 70),
            comeBack.heightAnchor.constraint(equalToConstant: 70),
            
            points.topAnchor.constraint(equalTo: background.topAnchor, constant: 60),
            points.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 155),
            points.widthAnchor.constraint(equalToConstant: 215),
            points.heightAnchor.constraint(equalToConstant: 70),
            
            baseWheels.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            baseWheels.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            baseWheels.widthAnchor.constraint(equalToConstant: 340),
            baseWheels.heightAnchor.constraint(equalToConstant: 330),
            
            wheel54.centerXAnchor.constraint(equalTo: baseWheels.centerXAnchor),
            wheel54.centerYAnchor.constraint(equalTo: baseWheels.centerYAnchor),
            wheel54.widthAnchor.constraint(equalToConstant: 330),
            wheel54.heightAnchor.constraint(equalToConstant: 360),
            
            rollButton.centerXAnchor.constraint(equalTo: baseWheels.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: baseWheels.centerYAnchor),
            rollButton.widthAnchor.constraint(equalToConstant: 125),
            rollButton.heightAnchor.constraint(equalToConstant: 125),
            
            wheelArrow.topAnchor.constraint(equalTo: wheel54.topAnchor,constant: -25),
            wheelArrow.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            wheelArrow.widthAnchor.constraint(equalToConstant: 90),
            wheelArrow.heightAnchor.constraint(equalToConstant: 70),
            
            collectionView.collectionView.topAnchor.constraint(equalTo: wheel54.topAnchor, constant: 90),
            collectionView.collectionView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 45),
            collectionView.collectionView.widthAnchor.constraint(equalToConstant: 100),
            collectionView.collectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}

//
//  WinViewController.swift
//  Crazy time
//
//  Created by Вадим on 10.05.2023.
//

import UIKit

class WinViewController: UIViewController {

    var mainBG: String
    var value: String
    var index: Int
    var soundNumber: Float
    var musicNumber: Float
    var bet: String
    var tag: Int
    var bidNums: [Int]
    var bidDict: [Int: String]
    var income: String
    var sum: Int
    
    init(value: String, index: Int, soundNumber: Float, musicNumber: Float, mainBG: String, bet: String, tag: Int, bidNums: [Int], bidDict: [Int: String], income: String, sum: Int) {
        self.value = value
        self.index = index
        self.soundNumber = soundNumber
        self.musicNumber = musicNumber
        self.mainBG = mainBG
        self.bet = bet
        self.tag = tag
        self.bidNums = bidNums
        self.bidDict = bidDict
        self.income = income
        self.sum = sum
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "For win bg_wheel of  fortune")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let youWin: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "You win")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let confetti: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "For win bg_0")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let fireworks: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "For win bg_1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let coins: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "For win bg_coins")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let menuButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Menu_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(menuButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let repeatButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Repeat_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(repeatButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SoundAudioPlayer.shared.stopincorrectСhoice()
        SoundAudioPlayer.shared.playcorrectСhoice()
        valueLabel.text = income
        setBackground()
        setSubviews()
        setConstarints()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setFont(valueLabel, Constants.setSizeY(75.0), -2.0)
    }
    
    private func setBackground() {
        if mainBG == "2" {
            background.image = UIImage(named: "For win bg_dices")
        } else {
            background.image = UIImage(named: "For win bg_wheel of  fortune")
        }
    }
    
    private func setSubviews() {
        view.addSubview(background)
        background.addSubview(youWin)
        background.addSubview(confetti)
        background.addSubview(fireworks)
        background.addSubview(coins)
        view.addSubview(menuButton)
        view.addSubview(repeatButton)
        background.addSubview(coins)
        background.addSubview(valueLabel)
    }
    
    private func setConstarints() {
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            youWin.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            youWin.centerYAnchor.constraint(equalTo: background.centerYAnchor, constant: Constants.setSizeY(-50)),
            youWin.widthAnchor.constraint(equalToConstant: Constants.setSizeY(530)),
            youWin.heightAnchor.constraint(equalToConstant: Constants.setSizeY(390)),
            
            valueLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            valueLabel.topAnchor.constraint(equalTo: youWin.topAnchor, constant: Constants.setSizeY(325)),
            
            confetti.topAnchor.constraint(equalTo: background.topAnchor),
            confetti.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            confetti.trailingAnchor.constraint(equalTo: background.trailingAnchor),
            confetti.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            
            fireworks.topAnchor.constraint(equalTo: background.topAnchor),
            fireworks.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            fireworks.trailingAnchor.constraint(equalTo: background.trailingAnchor),
            fireworks.bottomAnchor.constraint(equalTo: youWin.topAnchor, constant: Constants.setSizeY(100)),
            
            coins.topAnchor.constraint(equalTo: youWin.bottomAnchor, constant: Constants.setSizeY(30)),
            coins.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            coins.trailingAnchor.constraint(equalTo: background.trailingAnchor),
            coins.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            
            menuButton.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: Constants.setSizeY(-135)),
            menuButton.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(55)),
            menuButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            menuButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            
            repeatButton.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: Constants.setSizeY(135)),
            repeatButton.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(55)),
            repeatButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            repeatButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            
            
        ])
    }
    
    private func setFont(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "CurlzMT", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 0.9414561391, green: 0.8249566555, blue: 0, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 0.9414561391, green: 0.8249566555, blue: 0, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    private func settingsDidChange() {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "value")
        defaults.set(index, forKey: "index")
        defaults.set(soundNumber, forKey: "soundNumber")
        defaults.set(musicNumber, forKey: "musicNumber")
        defaults.synchronize()
    }
    
    private func setValue() {
        let overValue = String(Int(value)! + Int(income)!)
        if Int(overValue)! <= 0 {
            self.view.window?.rootViewController = UINavigationController(rootViewController: FortuneViewController(
                value: value,
                index: 0,
                soundNumber: soundNumber,
                musicNumber: musicNumber))
            settingsDidChange()
        }
    }
    
    @objc func menuButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        let overValue = String(Int(value)! + Int(income)!)
        if mainBG == "1" {
            self.view.window?.rootViewController = UINavigationController(rootViewController: FortuneViewController(
                value: overValue,
                index: index,
                soundNumber: soundNumber,
                musicNumber: musicNumber))
        } else {
            self.view.window?.rootViewController = UINavigationController(rootViewController: DicesViewController(
                value: overValue,
                index: index,
                soundNumber: soundNumber,
                musicNumber: musicNumber,
                bet: bet))
        }
        settingsDidChange()
    }
    
    @objc func repeatButtonPressed() {
        setValue()
        SoundAudioPlayer.shared.playSoundEffect()
        let overValue = String(Int(value)! + Int(income)!)
        if mainBG == "1" {
            self.view.window?.rootViewController = UINavigationController(rootViewController: GameWheelViewController(
                value: overValue,
                wheel: index,
                soundNumber: soundNumber,
                musicNumber: musicNumber,
                tag: tag,
                bidNums: bidNums,
                bidDict: [:],
                income: income,
                changeValue: 1,
                betSum: sum,
                bet: bet))
        } else {
            self.view.window?.rootViewController = UINavigationController(rootViewController: GameDicesViewController(
                value: value,
                index: index,
                soundNumber: soundNumber,
                musicNumber: musicNumber,
                bet: bet))
        }
        settingsDidChange()
    }
    
}


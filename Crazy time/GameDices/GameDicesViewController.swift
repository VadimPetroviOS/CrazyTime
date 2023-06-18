//
//  GameDicesViewController.swift
//  Crazy time
//
//  Created by Вадим on 14.05.2023.
//

import UIKit

final class GameDicesViewController: UIViewController {
    
    var value: String
    var index: Int
    var soundNumber: Float
    var musicNumber: Float
    var bet: String
    
    init(value: String, index: Int, soundNumber: Float, musicNumber: Float, bet: String) {
        self.value = value
        self.index = index
        self.soundNumber = soundNumber
        self.musicNumber = musicNumber
        self.bet = bet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    var bid: Int?
    let dices = ["Dice_1", "Dice_2", "Dice_3", "Dice_4", "Dice_5", "Dice_6"]
    let array = [0, 1, 2, 3, 4, 5]
    
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
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(comeBackPressed), for: .touchUpInside)
        return button
    }()
    
    private let points: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Points")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 61
        return imageView
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "1000"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let diceOne: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Dice_1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 20
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    private let diceTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Dice_5")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 20
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    private let evenButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Even_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(evenButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let oddButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Odd_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(oddButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.layer.zPosition = 1
        view.alpha = 0.7
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private let placeBet: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Pop-up place a bet")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 1
        imageView.layer.zPosition = 1
        imageView.isHidden = true
        return imageView
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.layer.zPosition = 1
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let nameBid: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 1
        label.isHidden = true
        return label
    }()
    
    private let frameRates: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Frame for rates")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.zPosition = 1
        imageView.isHidden = true
        return imageView
    }()
    
    private let frameRatesLabel: UILabel = {
        let label = UILabel()
        label.text = "10"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let betButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Bet_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(betButtonPressed), for: .touchUpInside)
        button.layer.zPosition = 1
        button.isHidden = true
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Plus_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        button.layer.zPosition = 1
        button.isHidden = true
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Minus_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        button.layer.zPosition = 1
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueLabel.text = value
        frameRatesLabel.text = bet
        setSubviews()
        setConstarints()
        
        let blurEffect = UIBlurEffect(style: .dark)
        blurView.effect = blurEffect
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setFont(valueLabel, Constants.setSizeY(55.0), -2.0)
        setFont(frameRatesLabel, Constants.setSizeY(55.0), -2.0)
        valueLabel.textColor = #colorLiteral(red: 0.9613708854, green: 0.8320630193, blue: 0.7150039673, alpha: 1)
    }
    
    private func setValue() {
        if Int(valueLabel.text!)! <= 0 {
            value = valueLabel.text!
            self.view.window?.rootViewController = UINavigationController(rootViewController: FortuneViewController(
                value: value,
                index: index,
                soundNumber: soundNumber,
                musicNumber: musicNumber))
            settingsDidChange()
        }
    }
    
    private func setSubviews() {
        view.addSubview(background)
        background.addSubview(points)
        view.addSubview(comeBack)
        points.addSubview(valueLabel)
        background.addSubview(diceOne)
        background.addSubview(diceTwo)
        view.addSubview(evenButton)
        view.addSubview(oddButton)
        view.addSubview(blurView)
        view.addSubview(placeBet)
        view.addSubview(closeButton)
        view.addSubview(nameBid)
        view.addSubview(frameRates)
        frameRates.addSubview(frameRatesLabel)
        view.addSubview(betButton)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
    }
    
    private func setConstarints() {
        NSLayoutConstraint.activate([
        
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          
            comeBack.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(60)),
            comeBack.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: Constants.setSizeY(25)),
            comeBack.widthAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            comeBack.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            points.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(60)),
            points.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: Constants.setSizeY(155)),
            points.widthAnchor.constraint(equalToConstant: Constants.setSizeY(215)),
            points.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            valueLabel.centerXAnchor.constraint(equalTo: points.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: points.centerYAnchor),
            
            diceOne.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(235)),
            diceOne.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            diceOne.widthAnchor.constraint(equalToConstant: Constants.setSizeY(150)),
            diceOne.heightAnchor.constraint(equalToConstant: Constants.setSizeY(150)),
            
            diceTwo.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(460)),
            diceTwo.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            diceTwo.widthAnchor.constraint(equalToConstant: Constants.setSizeY(150)),
            diceTwo.heightAnchor.constraint(equalToConstant: Constants.setSizeY(150)),
            
            evenButton.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(710)),
            evenButton.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: Constants.setSizeY(-95)),
            evenButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(170)),
            evenButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(80)),
            
            oddButton.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(710)),
            oddButton.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: Constants.setSizeY(95)),
            oddButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(170)),
            oddButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(80)),
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            placeBet.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            placeBet.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            placeBet.widthAnchor.constraint(equalToConstant: Constants.setSizeY(310)),
            placeBet.heightAnchor.constraint(equalToConstant: Constants.setSizeY(275)),
            
            closeButton.centerXAnchor.constraint(equalTo: placeBet.centerXAnchor, constant: Constants.setSizeY(310/2)),
            closeButton.centerYAnchor.constraint(equalTo: placeBet.centerYAnchor, constant: Constants.setSizeY(-275/2)),
            closeButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            closeButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            
            nameBid.topAnchor.constraint(equalTo: placeBet.topAnchor, constant: Constants.setSizeY(25)),
            nameBid.centerXAnchor.constraint(equalTo: placeBet.centerXAnchor),
            
            frameRates.topAnchor.constraint(equalTo: placeBet.topAnchor, constant: Constants.setSizeY(90)),
            frameRates.centerXAnchor.constraint(equalTo: placeBet.centerXAnchor),
            frameRates.widthAnchor.constraint(equalToConstant: Constants.setSizeY(160)),
            frameRates.heightAnchor.constraint(equalToConstant: Constants.setSizeY(60)),
            frameRatesLabel.centerXAnchor.constraint(equalTo: frameRates.centerXAnchor),
            frameRatesLabel.centerYAnchor.constraint(equalTo: frameRates.centerYAnchor),
            
            betButton.topAnchor.constraint(equalTo: placeBet.topAnchor, constant: Constants.setSizeY(175)),
            betButton.centerXAnchor.constraint(equalTo: placeBet.centerXAnchor),
            betButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(150)),
            betButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            plusButton.centerYAnchor.constraint(equalTo: frameRates.centerYAnchor),
            plusButton.centerXAnchor.constraint(equalTo: frameRates.centerXAnchor, constant: Constants.setSizeY(115)),
            plusButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            plusButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            
            minusButton.centerYAnchor.constraint(equalTo: frameRates.centerYAnchor),
            minusButton.centerXAnchor.constraint(equalTo: frameRates.centerXAnchor, constant: Constants.setSizeY(-115)),
            minusButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            minusButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
        ])
    }
    
    private func setFont(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "curlzmt", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 0.9613708854, green: 0.8320630193, blue: 0.7150039673, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 0.9613708854, green: 0.8320630193, blue: 0.7150039673, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    private func isHidden(_ bool: Bool) {
        blurView.isHidden = bool
        placeBet.isHidden = bool
        frameRates.isHidden = bool
        frameRatesLabel.isHidden = bool
        closeButton.isHidden = bool
        nameBid.isHidden = bool
        plusButton.isHidden = bool
        minusButton.isHidden = bool
        betButton.isHidden = bool
    }
    
    private func settingsDidChange() {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "value")
        defaults.set(index, forKey: "index")
        defaults.set(soundNumber, forKey: "soundNumber")
        defaults.set(musicNumber, forKey: "musicNumber")
        defaults.synchronize()
    }
    
    @objc func plusButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        if Int(frameRatesLabel.text!)! >= Int(valueLabel.text!)! {
            
        } else {
            if Int(frameRatesLabel.text!)! < 100 {
                frameRatesLabel.text = String(Int(frameRatesLabel.text!)! + 10)
            } else if Int(frameRatesLabel.text!)! < 1000 {
                frameRatesLabel.text = String(Int(frameRatesLabel.text!)! + 100)
            } else {
                frameRatesLabel.text = String(Int(frameRatesLabel.text!)! + 1000)
            }
        }
        settingsDidChange()
    }
    
    @objc func minusButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        if Int(frameRatesLabel.text!)! > 1000 {
            frameRatesLabel.text = String(Int(frameRatesLabel.text!)! - 1000)
        } else if Int(frameRatesLabel.text!)! > 100 {
            frameRatesLabel.text = String(Int(frameRatesLabel.text!)! - 100)
        } else if Int(frameRatesLabel.text!)! == 10 {
        } else {
            frameRatesLabel.text = String(Int(frameRatesLabel.text!)! - 10)
        }
        settingsDidChange()
    }
    
    @objc func closeButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        isHidden(true)
        diceOne.isHidden = false
        diceTwo.isHidden = false
        settingsDidChange()
    }
    
    @objc func evenButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        nameBid.text = "EVEN"
        setFont(nameBid, 35, -2.5)
        isHidden(false)
        diceOne.isHidden = true
        diceTwo.isHidden = true
        settingsDidChange()
    }
    
    @objc func oddButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        nameBid.text = "ODD"
        setFont(nameBid, 35, -2.5)
        isHidden(false)
        diceOne.isHidden = true
        diceTwo.isHidden = true
        settingsDidChange()
    }
    
    @objc func betButtonPressed() {
        evenButton.isEnabled = false
        oddButton.isEnabled = false
        SoundAudioPlayer.shared.playSoundEffect()
        let numberOne = array.randomElement()!
        let numberTwo = array.randomElement()!
        let elementOne = dices[numberOne]
        let elementTwo = dices[numberTwo]
        self.isHidden(true)
        self.valueLabel.text = String(Int(self.valueLabel.text!)! - Int(self.frameRatesLabel.text!)!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            SoundAudioPlayer.shared.playAppearance()
            self.diceOne.image = UIImage(named: elementOne)
            self.diceTwo.image = UIImage(named: elementTwo)
            self.diceOne.isHidden = false
            self.diceTwo.isHidden = false
            
            if (numberOne + numberTwo) % 2 == 0 && self.nameBid.text == "EVEN" {
                self.valueLabel.text = String(Int(self.valueLabel.text!)! + 2 * Int(self.frameRatesLabel.text!)!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(
                        value: self.valueLabel.text!,
                        index: self.index,
                        soundNumber: self.soundNumber,
                        musicNumber: self.musicNumber,
                        mainBG: "2",
                        bet: self.frameRatesLabel.text!,
                        tag: 1,
                        bidNums: [0,0,0,0,0,0,0,0],
                        bidDict: [:],
                        income: String(2 * Int(self.frameRatesLabel.text!)!),
                        sum: 0))
                }
            } else if (numberOne + numberTwo) % 2 != 0 && self.nameBid.text == "ODD" {
                self.valueLabel.text = String(Int(self.valueLabel.text!)! + 2 * Int(self.frameRatesLabel.text!)!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(
                        value: self.valueLabel.text!,
                        index: self.index,
                        soundNumber: self.soundNumber,
                        musicNumber: self.musicNumber,
                        mainBG: "2",
                        bet: self.frameRatesLabel.text!,
                        tag: 1,
                        bidNums: [0,0,0,0,0,0,0,0],
                        bidDict: [:],
                        income: String(2 * Int(self.frameRatesLabel.text!)!),
                        sum: 0))
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    SoundAudioPlayer.shared.playincorrectСhoice()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.evenButton.isEnabled = true
                    self.oddButton.isEnabled = true
                    self.setValue()
                }
            }
            
        }
        settingsDidChange()
        bet = frameRatesLabel.text!
    }
    
    @objc func comeBackPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        self.view.window?.rootViewController = UINavigationController(rootViewController: DicesViewController(
            value: self.valueLabel.text!,
            index: index,
            soundNumber: soundNumber,
            musicNumber: musicNumber,
            bet: bet))
        settingsDidChange()
    }
}

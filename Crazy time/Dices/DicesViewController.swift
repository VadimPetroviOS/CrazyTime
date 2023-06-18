//
//  DicesViewController.swift
//  Crazy time
//
//  Created by Вадим on 13.05.2023.
//

import UIKit

final class DicesViewController: UIViewController {
    
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
    
    private let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let points: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Points")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fortune: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Dices")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    private let goPrev: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Leftward_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(goPrevPressed), for: .touchUpInside)
        return button
    }()
    
    private let cardWheel: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Card_Dices")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Play_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 10
        button.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let volumeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Settings_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(volumeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let exitButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Exit_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
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
    
    private let settingsPlace: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Settings pop-up")
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
    
    private let soundSlider: UISlider = {
        let slider = UISlider()
        slider.setThumbImage(UIImage(named: "Volume indicator"), for: .normal)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(soundSliderValueChanged(_:)), for: .valueChanged)
        slider.layer.zPosition = 1
        slider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        slider.isHidden = true
        return slider
    }()
    
    private let musicSlider: UISlider = {
        let slider = UISlider()
        slider.setThumbImage(UIImage(named: "Volume indicator"), for: .normal)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(musicSliderValueChanged(_:)), for: .valueChanged)
        slider.layer.zPosition = 1
        slider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        slider.isHidden = true
        return slider
    }()
    
    private let sound: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Sound")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.zPosition = 1
        imageView.isHidden = true
        return imageView
    }()
    
    private let music: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Music")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.zPosition = 1
        imageView.isHidden = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusic()
        valueLabel.text = value
        setSubviews()
        setConstarints()
        
        let blurEffect = UIBlurEffect(style: .dark)
        blurView.effect = blurEffect
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setFont(valueLabel, Constants.setSizeY(55.0), -2.0)
    }
    
    private func setSubviews() {
        view.addSubview(background)
        background.addSubview(points)
        points.addSubview(valueLabel)
        background.addSubview(fortune)
        view.addSubview(goPrev)
        background.addSubview(cardWheel)
        view.addSubview(playButton)
        view.addSubview(volumeButton)
        view.addSubview(exitButton)
        view.addSubview(blurView)
        view.addSubview(settingsPlace)
        view.addSubview(closeButton)
        settingsPlace.addSubview(sound)
        settingsPlace.addSubview(music)
        view.addSubview(musicSlider)
        view.addSubview(soundSlider)
    }
    
    private func setConstarints() {
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            points.topAnchor.constraint(equalTo: background.topAnchor, constant: Constants.setSizeY(70)),
            points.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            points.widthAnchor.constraint(equalToConstant: Constants.setSizeY(215)),
            points.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            valueLabel.centerXAnchor.constraint(equalTo: points.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: points.centerYAnchor),
            
            fortune.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            fortune.topAnchor.constraint(equalTo: points.bottomAnchor, constant: Constants.setSizeY(30)),
            fortune.widthAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            fortune.heightAnchor.constraint(equalToConstant: Constants.setSizeY(45)),
            
            goPrev.centerYAnchor.constraint(equalTo: fortune.centerYAnchor),
            goPrev.trailingAnchor.constraint(equalTo: points.leadingAnchor, constant: Constants.setSizeY(-15)),
            goPrev.widthAnchor.constraint(equalToConstant: Constants.setSizeY(55)),
            goPrev.heightAnchor.constraint(equalToConstant: Constants.setSizeY(55)),
            
            cardWheel.topAnchor.constraint(equalTo: fortune.bottomAnchor, constant: Constants.setSizeY(40)),
            cardWheel.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            cardWheel.widthAnchor.constraint(equalToConstant: Constants.setSizeY(280)),
            cardWheel.heightAnchor.constraint(equalToConstant: Constants.setSizeY(400)),
            
            playButton.centerXAnchor.constraint(equalTo: cardWheel.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: cardWheel.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(200)),
            playButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(90)),
            
            volumeButton.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: Constants.setSizeY(-70)),
            volumeButton.topAnchor.constraint(equalTo: cardWheel.bottomAnchor, constant: Constants.setSizeY(45)),
            volumeButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            volumeButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            
            exitButton.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: Constants.setSizeY(70)),
            exitButton.topAnchor.constraint(equalTo: cardWheel.bottomAnchor, constant: Constants.setSizeY(45)),
            exitButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            exitButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            settingsPlace.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            settingsPlace.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            settingsPlace.widthAnchor.constraint(equalToConstant: Constants.setSizeY(240)),
            settingsPlace.heightAnchor.constraint(equalToConstant: Constants.setSizeY(270)),
            
            closeButton.centerXAnchor.constraint(equalTo: settingsPlace.centerXAnchor, constant: Constants.setSizeY(240/2)),
            closeButton.centerYAnchor.constraint(equalTo: settingsPlace.centerYAnchor, constant: Constants.setSizeY(-270/2)),
            closeButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            closeButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            
            sound.topAnchor.constraint(equalTo: settingsPlace.topAnchor, constant: Constants.setSizeY(30)),
            sound.centerXAnchor.constraint(equalTo: settingsPlace.centerXAnchor, constant: Constants.setSizeY(-50)),
            sound.widthAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            sound.heightAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            
            music.topAnchor.constraint(equalTo: settingsPlace.topAnchor, constant: Constants.setSizeY(30)),
            music.centerXAnchor.constraint(equalTo: settingsPlace.centerXAnchor,constant: Constants.setSizeY(50)),
            music.widthAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            music.heightAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            
            soundSlider.centerXAnchor.constraint(equalTo: sound.centerXAnchor),
            soundSlider.topAnchor.constraint(equalTo: sound.bottomAnchor, constant: Constants.setSizeY(70)),
            soundSlider.widthAnchor.constraint(equalToConstant: Constants.setSizeY(160)),
            soundSlider.heightAnchor.constraint(equalToConstant: Constants.setSizeY(20)),
            
            musicSlider.centerXAnchor.constraint(equalTo: music.centerXAnchor),
            musicSlider.topAnchor.constraint(equalTo: music.bottomAnchor, constant: Constants.setSizeY(70)),
            musicSlider.widthAnchor.constraint(equalToConstant: Constants.setSizeY(160)),
            musicSlider.heightAnchor.constraint(equalToConstant: Constants.setSizeY(10)),
        ])
    }
    
    private func setFont(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "CurlzMT", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 0.9613708854, green: 0.8320630193, blue: 0.7150039673, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 0.9613708854, green: 0.8320630193, blue: 0.7150039673, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    private func showLine(_ imageView: UIImageView) {
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 1
    }
    
    private func isHidden(_ bool: Bool) {
        blurView.isHidden = bool
        settingsPlace.isHidden = bool
        closeButton.isHidden = bool
        sound.isHidden = bool
        soundSlider.isHidden = bool
        music.isHidden = bool
        musicSlider.isHidden = bool
    }
    
    private func setMusic() {
        soundSlider.value = soundNumber
        musicSlider.value = musicNumber
        SoundAudioPlayer.shared.currentVolume = soundNumber
        MusicAudioPlayer.shared.currentVolume = musicNumber
    }
    
    private func settingsDidChange() {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "value")
        defaults.set(index, forKey: "index")
        defaults.set(soundNumber, forKey: "soundNumber")
        defaults.set(musicNumber, forKey: "musicNumber")
        defaults.synchronize()
    }

    
    @objc func goPrevPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        self.view.window?.rootViewController = UINavigationController(rootViewController: FortuneViewController(
            value: value,
            index: index,
            soundNumber: soundNumber,
            musicNumber: musicNumber))
        settingsDidChange()
    }
    
    @objc func volumeButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        isHidden(false)
        settingsDidChange()
    }
    
    @objc func exitButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        settingsDidChange()
    }
    
    @objc func closeButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        isHidden(true)
        settingsDidChange()
    }
    
    @objc func musicSliderValueChanged(_ sender: UISlider) {
        MusicAudioPlayer.shared.currentVolume = sender.value
        musicNumber = sender.value
        settingsDidChange()
    }
    
    @objc func soundSliderValueChanged(_ sender: UISlider) {
        SoundAudioPlayer.shared.currentVolume = sender.value
        musicNumber = sender.value
        settingsDidChange()
    }

    @objc func playButtonPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        self.view.window?.rootViewController = UINavigationController(rootViewController: GameDicesViewController(
            value: value,
            index: index,
            soundNumber: soundNumber,
            musicNumber: musicNumber,
            bet: bet))
        settingsDidChange()
    }
}

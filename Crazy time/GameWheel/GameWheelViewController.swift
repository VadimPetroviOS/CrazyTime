//
//  GameWheelViewController.swift
//  Crazy time
//
//  Created by Вадим on 10.05.2023.
//

import UIKit

final class GameWheelViewController: UIViewController {
    
    var value: String
    var wheel: Int
    var soundNumber: Float
    var musicNumber: Float
    var tag: Int
    var bidNums: [Int]
    var bidDict: [Int: String]
    var income: String
    var changeValue: Int
    var betSum: Int
    var bet: String
    
    init(value: String, wheel: Int, soundNumber: Float, musicNumber: Float, tag: Int, bidNums: [Int], bidDict: [Int: String], income: String, changeValue: Int, betSum: Int, bet: String) {
        self.value = value
        self.wheel = wheel
        self.soundNumber = soundNumber
        self.musicNumber = musicNumber
        self.tag = tag
        self.bidNums = bidNums
        self.bidDict = bidDict
        self.income = income
        self.changeValue = changeValue
        self.betSum = betSum
        self.bet = bet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    var bid: Int?
    var dict: [Int : String] = [:]
    var bidArray: [Int] = [0,0,0,0,0,0,0,0]
    var win = false
    var lastBet1 = 0
    var lastBet2 = 0
    var lastBet5 = 0
    var lastBet10 = 0
    var lastBet15 = 0
    var lastBet20 = 0
    var lastBet30 = 0
    var lastBet40 = 0
    var indicator = false
    
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
        button.addTarget(self, action: #selector(comeBackPressed), for: .touchUpInside)
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let topStolb: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TopStolb")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let botStolb: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BotStolb")
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
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let wheelArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Wheel arrow")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let x1Button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "1_blue"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(x1ButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    private let x2Button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "2_yellow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(x2ButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    private let x5Button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "5_pink"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(x5ButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    private let x10Button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "10_violet"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(x10ButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    private let x15Button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "x15"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(x15ButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    private let x20Button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "x20"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(x20ButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    private let x30Button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "x30"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(x30ButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    private let x40Button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "x40"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(x40ButtonPressed), for: .touchUpInside)
        button.tag = 0
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
    
    private let colorBid: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.zPosition = 1
        imageView.isHidden = true
        return imageView
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
        label.text = ""
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
    
    private var rollLabel: UILabel = {
        let label = UILabel()
        label.text = "make your bet firstly"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueLabel.text = String(Int(value)! + Int(income)!)
        frameRatesLabel.text = bet
        if bidNums != bidArray { bidArray = bidNums }
        if dict != bidDict { dict = bidDict }
        rollButton.tag = tag
        valueLabel.text = value
        setWheel()
        setSubviews()
        setConstarints()
        
        let blurEffect = UIBlurEffect(style: .dark)
        blurView.effect = blurEffect
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setFont(valueLabel, Constants.setSizeY(55.0), -2.0)
        setFont(frameRatesLabel, Constants.setSizeY(55.0), -2.0)
        setFont2(rollLabel, Constants.setSizeY(35.0), -2.0)
        valueLabel.textColor = #colorLiteral(red: 0.9613708854, green: 0.8320630193, blue: 0.7150039673, alpha: 1)
        baseWheels.layer.shadowColor = UIColor.white.cgColor
        baseWheels.layer.shadowRadius = 10
        baseWheels.layer.shadowOpacity = 1
    }
    
    private func setSubviews() {
        view.addSubview(background)
        background.addSubview(points)
        view.addSubview(comeBack)
        background.addSubview(baseWheels)
        baseWheels.addSubview(topStolb)
        baseWheels.addSubview(botStolb)
        baseWheels.addSubview(wheel54)
        view.addSubview(rollButton)
        background.addSubview(wheelArrow)
        points.addSubview(valueLabel)
        view.addSubview(blurView)
        view.addSubview(placeBet)
        view.addSubview(closeButton)
        view.addSubview(colorBid)
        view.addSubview(frameRates)
        frameRates.addSubview(frameRatesLabel)
        view.addSubview(betButton)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        background.addSubview(rollLabel)
    }
    
    private func setConstarints() {
        let leftStack = createStackView(x1Button, x5Button, x15Button, x30Button)
        let rightStack = createStackView(x2Button, x10Button, x20Button, x40Button)
        leftStack.layer.zPosition = 0
        rightStack.layer.zPosition = 0
        [leftStack, rightStack].forEach{view.addSubview($0)}
        
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
            
            baseWheels.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            baseWheels.centerYAnchor.constraint(equalTo: background.centerYAnchor, constant: Constants.setSizeY(-90)),
            baseWheels.widthAnchor.constraint(equalToConstant: Constants.setSizeY(340)),
            baseWheels.heightAnchor.constraint(equalToConstant: Constants.setSizeY(330)),
            
            wheel54.centerXAnchor.constraint(equalTo: baseWheels.centerXAnchor),
            wheel54.centerYAnchor.constraint(equalTo: baseWheels.centerYAnchor),
            wheel54.widthAnchor.constraint(equalToConstant: Constants.setSizeY(330)),
            wheel54.heightAnchor.constraint(equalToConstant: Constants.setSizeY(330)),
            
            topStolb.centerXAnchor.constraint(equalTo: wheel54.centerXAnchor),
            topStolb.topAnchor.constraint(equalTo: wheel54.topAnchor, constant: Constants.setSizeY(-15)),
            topStolb.widthAnchor.constraint(equalToConstant: Constants.setSizeY(80)),
            topStolb.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            botStolb.centerXAnchor.constraint(equalTo: wheel54.centerXAnchor),
            botStolb.bottomAnchor.constraint(equalTo: wheel54.bottomAnchor, constant: Constants.setSizeY(15)),
            botStolb.widthAnchor.constraint(equalToConstant: Constants.setSizeY(80)),
            botStolb.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            rollButton.centerXAnchor.constraint(equalTo: baseWheels.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: baseWheels.centerYAnchor),
            rollButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(125)),
            rollButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(125)),
            
            wheelArrow.topAnchor.constraint(equalTo: wheel54.topAnchor,constant: Constants.setSizeY(-25)),
            wheelArrow.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            wheelArrow.widthAnchor.constraint(equalToConstant: Constants.setSizeY(90)),
            wheelArrow.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            valueLabel.centerXAnchor.constraint(equalTo: points.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: points.centerYAnchor),
            
            leftStack.topAnchor.constraint(equalTo: wheel54.bottomAnchor, constant: Constants.setSizeY(30)),
            leftStack.centerXAnchor.constraint(equalTo: wheel54.centerXAnchor, constant: Constants.setSizeY(-100)),
            leftStack.widthAnchor.constraint(equalToConstant: Constants.setSizeY(145)),
            leftStack.heightAnchor.constraint(equalToConstant: Constants.setSizeY(305)),
            
            rightStack.topAnchor.constraint(equalTo: leftStack.topAnchor),
            rightStack.centerXAnchor.constraint(equalTo: wheel54.centerXAnchor, constant: Constants.setSizeY(100)),
            rightStack.widthAnchor.constraint(equalToConstant: Constants.setSizeY(145)),
            rightStack.heightAnchor.constraint(equalToConstant: Constants.setSizeY(305)),
            
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
            
            colorBid.topAnchor.constraint(equalTo: placeBet.topAnchor, constant: Constants.setSizeY(25)),
            colorBid.centerXAnchor.constraint(equalTo: placeBet.centerXAnchor),
            colorBid.widthAnchor.constraint(equalToConstant: Constants.setSizeY(95)),
            colorBid.heightAnchor.constraint(equalToConstant: Constants.setSizeY(40)),
            
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
            
            rollLabel.topAnchor.constraint(equalTo: rollButton.bottomAnchor),
            rollLabel.centerXAnchor.constraint(equalTo: rollButton.centerXAnchor),
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
    
    private func setFont2(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "curlzmt", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 1, green: 0, blue: 0.07282159477, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 1, green: 0, blue: 0.07282159477, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    private func createStackView(_ one: UIButton, _ two: UIButton, _ three: UIButton, _ four: UIButton) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [one,two,three, four])
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    fileprivate func rotationAnimation54(_ imageView: UIImageView) -> Int {
        var randomNumber = Double(Int.random(in: 1...54))
//        if changeValue == 0 {
//            randomNumber = 3
//        } else {
//            randomNumber = 3
//        }
        
        print(randomNumber)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        if randomNumber == 1.0  {
            rotationAnimation.toValue = CGFloat.pi * 2 + CGFloat.pi * 1/54
        } else if randomNumber < 27 {
            rotationAnimation.toValue = CGFloat.pi * 2 + (CGFloat.pi * 2/54) * randomNumber - CGFloat.pi * 1/54
        } else {
            rotationAnimation.toValue = CGFloat.pi * 2 + (CGFloat.pi * 2/54) * randomNumber - CGFloat.pi * 1/54
        }
        print(rotationAnimation.toValue)
        rotationAnimation.duration = 4.0
        rotationAnimation.repeatCount = 1
        rotationAnimation.fillMode = .forwards
        rotationAnimation.isRemovedOnCompletion = false
        
        let timingFunction = CAMediaTimingFunction(name: .easeOut) // добавляем плавную остановку анимации
        rotationAnimation.timingFunction = timingFunction
        
        // Добавляем анимацию на изображение
        self.wheel54.layer.add(rotationAnimation, forKey: "rotationAnimation")
        return Int(randomNumber)
    }
    
    fileprivate func rotationAnimation50(_ imageView: UIImageView) -> Int {
        let randomNumber = Double(Int.random(in: 1...50))
        print(randomNumber)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        if randomNumber == 1.0  {
            rotationAnimation.toValue = CGFloat.pi * 2 + CGFloat.pi * 1/50
        } else if randomNumber < 25 {
            rotationAnimation.toValue = CGFloat.pi * 2 + (CGFloat.pi * 2/50) * randomNumber - CGFloat.pi * 1/50
        } else {
            rotationAnimation.toValue = CGFloat.pi * 2 + (CGFloat.pi * 2/50) * randomNumber - CGFloat.pi * 1/50
        }
        print(rotationAnimation.toValue)
        rotationAnimation.duration = 4.0
        rotationAnimation.repeatCount = 1
        rotationAnimation.fillMode = .forwards
        rotationAnimation.isRemovedOnCompletion = false
        
        let timingFunction = CAMediaTimingFunction(name: .easeOut) // добавляем плавную остановку анимации
        rotationAnimation.timingFunction = timingFunction
        
        // Добавляем анимацию на изображение
        self.wheel54.layer.add(rotationAnimation, forKey: "rotationAnimation")
        return Int(randomNumber)
    }
    
    fileprivate func rotationAnimation46(_ imageView: UIImageView) -> Int {
        let randomNumber = Double(Int.random(in: 1...46))
        print(randomNumber)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        if randomNumber == 1.0  {
            rotationAnimation.toValue = CGFloat.pi * 2 + CGFloat.pi * 1/46
        } else if randomNumber < 23 {
            rotationAnimation.toValue = CGFloat.pi * 2 + (CGFloat.pi * 2/46) * randomNumber - CGFloat.pi * 1/46
        } else {
            rotationAnimation.toValue = CGFloat.pi * 2 + (CGFloat.pi * 2/46) * randomNumber - CGFloat.pi * 1/46
        }
        print(rotationAnimation.toValue)
        rotationAnimation.duration = 4.0
        rotationAnimation.repeatCount = 1
        rotationAnimation.fillMode = .forwards
        rotationAnimation.isRemovedOnCompletion = false
        
        let timingFunction = CAMediaTimingFunction(name: .easeOut) // добавляем плавную остановку анимации
        rotationAnimation.timingFunction = timingFunction
        
        // Добавляем анимацию на изображение
        self.wheel54.layer.add(rotationAnimation, forKey: "rotationAnimation")
        return Int(randomNumber)
    }
    
    fileprivate func rotationAnimation45(_ imageView: UIImageView) -> Int {
        var randomNumber = Double(Int.random(in: 1...45))
        print(randomNumber)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        if randomNumber == 1.0  {
            rotationAnimation.toValue = CGFloat.pi * 2
        } else {
            rotationAnimation.toValue = CGFloat.pi * 2 + (CGFloat.pi * 2/45) * (randomNumber - 1.0)
        }
        print(rotationAnimation.toValue)
        rotationAnimation.duration = 4.0
        rotationAnimation.repeatCount = 1
        rotationAnimation.fillMode = .forwards
        rotationAnimation.isRemovedOnCompletion = false
        
        let timingFunction = CAMediaTimingFunction(name: .easeOut)
        rotationAnimation.timingFunction = timingFunction
        
        self.wheel54.layer.add(rotationAnimation, forKey: "rotationAnimation")
        return Int(randomNumber)
    }
    
    private func sectionwWheel54(_ number: Int) -> Int {
        switch number {
        case 1: return 40
        case 12, 36: return 30
        case 25, 49: return 20
        case 7, 19, 31, 43: return 15
        case 4, 16, 27, 39: return 10
        case 10, 15, 22, 29, 33, 47, 52: return 5
        case 3, 6, 9, 12, 17, 20, 23, 28, 35, 38, 41, 45, 50, 53: return 2
        default: return 1
        }
    }
    
    private func sectionwWheel50(_ number: Int) -> Int {
        switch number {
        case 1: return 40
        case 10, 30: return 30
        case 19, 40: return 20
        case 5, 20, 24, 33: return 10
        case 8, 15, 23, 26, 34, 45, 48: return 5
        case 3, 7, 11, 13, 17, 22, 28, 32, 36, 38, 41, 43, 46, 49: return 2
        default: return 1
        }
    }
    
    private func sectionwWheel46(_ number: Int) -> Int {
        switch number {
        case 1: return 40
        case 8, 20, 28, 40: return 10
        case 4, 12, 17, 24, 31, 46, 43: return 5
        case 3, 6, 10, 14, 16, 19, 22, 26, 29, 32, 34, 38, 42, 45: return 2
        default: return 1
        }
    }
    
    private func sectionwWheel45(_ number: Int) -> Int {
        switch number {
        case 6, 22, 27, 36: return 10
        case 3, 9, 14, 18, 25, 31, 40: return 5
        case 1, 4, 7, 11, 13, 16, 20, 24, 29, 33, 35, 38, 42, 44: return 2
        default: return 1
        }
    }
    
    private func isHidden(_ bool: Bool) {
        blurView.isHidden = bool
        placeBet.isHidden = bool
        frameRates.isHidden = bool
        frameRatesLabel.isHidden = bool
        closeButton.isHidden = bool
        colorBid.isHidden = bool
        plusButton.isHidden = bool
        minusButton.isHidden = bool
        betButton.isHidden = bool
    }
    
    private func setWheel() {
        switch wheel {
        case 0:
            wheel54.image = UIImage(named: "Wheel 54")
        case 1:
            wheel54.image = UIImage(named: "Wheel 50")
            x15Button.isEnabled = false
        case 2:
            wheel54.image = UIImage(named: "Wheel 46")
            x15Button.isEnabled = false
            x20Button.isEnabled = false
            x30Button.isEnabled = false
        default:
            wheel54.image = UIImage(named: "Wheel 45")
            x15Button.isEnabled = false
            x20Button.isEnabled = false
            x30Button.isEnabled = false
            x40Button.isEnabled = false
        }
    }
    
    private func settingsDidChange() {
        let index = self.wheel
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "value")
        defaults.set(index, forKey: "index")
        defaults.set(soundNumber, forKey: "soundNumber")
        defaults.set(musicNumber, forKey: "musicNumber")
        defaults.synchronize()
    }
    
    @objc func rollButtonPressed() {
        if rollButton.tag == 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.rollLabel.isHidden = true
            }
            rollLabel.isHidden = false
        } else {
            rollButton.tag == 1
            rollButton.isUserInteractionEnabled = false
            SoundAudioPlayer.shared.playvzux()
            SoundAudioPlayer.shared.stopincorrectСhoice()
            x1Button.isEnabled = false
            x2Button.isEnabled = false
            x5Button.isEnabled = false
            x10Button.isEnabled = false
            x15Button.isEnabled = false
            x20Button.isEnabled = false
            x30Button.isEnabled = false
            x40Button.isEnabled = false
            comeBack.isEnabled = false
            
            var section = 0
            switch wheel {
            case 0:
                section = sectionwWheel54(rotationAnimation54(wheel54))
            case 1:
                section = sectionwWheel50(rotationAnimation50(wheel54))
            case 2:
                section = sectionwWheel46(rotationAnimation46(wheel54))
            default:
                section = sectionwWheel45(rotationAnimation45(wheel54))
            }
            var numbers = ""
            var sum = 0
            if rollButton.tag == 2 {
                var dictValue = dict.values
                var intArray: [Int] = []
                for str in dictValue {
                    if let intValue = Int(str) {
                        intArray.append(intValue)
                    }
                }
                sum = intArray.reduce(0, +)
            }
            
            print("bid = \(bid), section = \(section)")
            print(bidArray)
            
            DispatchQueue.main.async {
                
                if self.bidArray.contains(section) {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        numbers = self.valueLabel.text!
                        var income = String(Int(self.dict[section]!)! * section)
                        self.settingsDidChange()
                        self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(
                            value: numbers,
                            index: self.wheel,
                            soundNumber: self.soundNumber,
                            musicNumber: self.musicNumber,
                            mainBG: "1",
                            bet: self.frameRatesLabel.text!,
                            tag: 1,
                            bidNums: self.bidArray,
                            bidDict: self.dict,
                            income: income,
                            sum: sum))
                    }
                } else {
                    numbers = self.valueLabel.text!
                    var income = -sum
                    if Int(self.valueLabel.text!)! <= 0 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            SoundAudioPlayer.shared.playincorrectСhoice()
                            self.settingsDidChange()
                            self.view.window?.rootViewController = UINavigationController(rootViewController: FortuneViewController(
                                value: numbers,
                                index: 1,
                                soundNumber: self.soundNumber,
                                musicNumber: self.musicNumber))
                        }
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            SoundAudioPlayer.shared.playincorrectСhoice()
                            self.settingsDidChange()
                            self.view.window?.rootViewController = UINavigationController(rootViewController: GameWheelViewController(
                                value: numbers,
                                wheel: self.wheel,
                                soundNumber: self.soundNumber,
                                musicNumber: self.musicNumber,
                                tag: 1,
                                bidNums: self.bidArray,
                                bidDict: [:],
                                income: String(income),
                                changeValue: 1,
                                betSum: 0,
                                bet: self.frameRatesLabel.text!))
                        }
                    }
                }
                
                
                /*
                for i in self.bidArray {
                    if i == section {
                        self.win = true
                        
                        if self.changeValue == 0 {
                            self.changeValue = 1
                        } else {
                            self.valueLabel.text! = String(Int(self.valueLabel.text!)! - self.betSum)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                
                            if self.income == "0" {
                                numbers = self.valueLabel.text!
                            } else {
                                numbers = self.valueLabel.text!
//                                numbers = String(Int(self.valueLabel.text!)! - sum)
                            }
                            
                            print("победа \(self.valueLabel.text)")
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            var income = String(i * Int(self.dict[i]!)!)
                            self.settingsDidChange()
                            self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(
                                value: numbers,
                                index: self.wheel,
                                soundNumber: self.soundNumber,
                                musicNumber: self.musicNumber,
                                mainBG: "1",
                                bet: self.frameRatesLabel.text!,
                                tag: self.rollButton.tag,
                                bidNums: self.bidArray,
                                bidDict: self.dict,
                                income: income,
                                sum: sum))
                        }
                    }
                }
                if self.win == false {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self.settingsDidChange()
                        SoundAudioPlayer.shared.playincorrectСhoice()
                        self.dict[0] = "0"
                        self.dict[1] = "0"
                        self.dict[2] = "0"
                        self.dict[3] = "0"
                        self.dict[4] = "0"
                        self.dict[5] = "0"
                        self.dict[6] = "0"
                        self.dict[7] = "0"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            if self.income == "0" {
                                numbers = self.valueLabel.text!
                            } else {
//                                numbers = String(Int(self.valueLabel.text!)! - sum)
                                numbers = self.valueLabel.text!
                            }
                            
                            if Int(self.valueLabel.text!)! <= 0 {
                                self.settingsDidChange()
                                self.view.window?.rootViewController = UINavigationController(rootViewController: FortuneViewController(
                                    value: numbers,
                                    index: 1,
                                    soundNumber: self.soundNumber,
                                    musicNumber: self.musicNumber))
                                
                            } else {
                                self.settingsDidChange()
                                self.view.window?.rootViewController = UINavigationController(rootViewController: GameWheelViewController(
                                    value: numbers,
                                    wheel: self.wheel,
                                    soundNumber: self.soundNumber,
                                    musicNumber: self.musicNumber,
                                    tag: 1,
                                    bidNums: self.bidArray,
                                    bidDict: self.dict,
                                    income: "0",
                                    changeValue: 1,
                                    betSum: sum))
                                
                            }
                        }
                        
                    }
                }
                */
            }
            settingsDidChange()
        }
    }
    
    @objc func x1ButtonPressed() {
        rollButton.tag = 2
        SoundAudioPlayer.shared.playSoundEffect()
        bid = 1
        bidArray[0] = bid!
        if ((dict[bid!]?.isEmpty) == nil) { dict[bid!] = "0" }
        isHidden(false)
        colorBid.image = UIImage(named: "1_blue")
        x1Button.tag += 1
    }
    
    @objc func x2ButtonPressed() {
        rollButton.tag = 2
        SoundAudioPlayer.shared.playSoundEffect()
        bid = 2
        bidArray[1] = bid!
        if ((dict[bid!]?.isEmpty) == nil) { dict[bid!] = "0" }
        isHidden(false)
        colorBid.image = UIImage(named: "2_yellow")
        x2Button.tag += 1
    }
    
    @objc func x5ButtonPressed() {
        rollButton.tag = 2
        SoundAudioPlayer.shared.playSoundEffect()
        bid = 5
        bidArray[2] = bid!
        dict[bid!] = "0"
        isHidden(false)
        colorBid.image = UIImage(named: "5_pink")
        x5Button.tag += 1
    }
    
    @objc func x10ButtonPressed() {
        rollButton.tag = 2
        SoundAudioPlayer.shared.playSoundEffect()
        bid = 10
        bidArray[3] = bid!
        dict[bid!] = "0"
        isHidden(false)
        colorBid.image = UIImage(named: "10_violet")
        x10Button.tag += 1
    }
    
    @objc func x15ButtonPressed() {
        rollButton.tag = 2
        SoundAudioPlayer.shared.playSoundEffect()
        bid = 15
        bidArray[4] = bid!
        dict[bid!] = "0"
        isHidden(false)
        colorBid.image = UIImage(named: "x15")
        x15Button.tag += 1
    }
    
    @objc func x20ButtonPressed() {
        rollButton.tag = 2
        SoundAudioPlayer.shared.playSoundEffect()
        bid = 20
        bidArray[5] = bid!
        dict[bid!] = "0"
        isHidden(false)
        colorBid.image = UIImage(named: "x20")
        x20Button.tag += 1
    }
    
    @objc func x30ButtonPressed() {
        rollButton.tag = 2
        SoundAudioPlayer.shared.playSoundEffect()
        bid = 30
        bidArray[6] = bid!
        dict[bid!] = "0"
        isHidden(false)
        colorBid.image = UIImage(named: "x30")
        x30Button.tag += 1
    }
    
    @objc func x40ButtonPressed() {
        rollButton.tag = 2
        SoundAudioPlayer.shared.playSoundEffect()
        bid = 40
        bidArray[7] = bid!
        dict[bid!] = "0"
        isHidden(false)
        colorBid.image = UIImage(named: "x40")
        x40Button.tag += 1
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
        rollButton.tag = 1
        SoundAudioPlayer.shared.playSoundEffect()
        isHidden(true)
        settingsDidChange()
    }
    
    @objc func betButtonPressed() {
        
        if lastBet1 == 0 && x1Button.tag == 1 {
            lastBet1 = Int(frameRatesLabel.text!)!
            dict[1] = String(lastBet1)
            valueLabel.text = String(Int(valueLabel.text!)! - lastBet1)
        } else if lastBet1 != 0 && x1Button.tag == 2 {
            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet1)
            lastBet1 = Int(frameRatesLabel.text!)!
            dict[1] = String(lastBet1)
            x1Button.tag = 1
        }
        
        if lastBet2 == 0 && x2Button.tag == 1 {
            lastBet2 = Int(frameRatesLabel.text!)!
            dict[2] = String(lastBet2)
            valueLabel.text = String(Int(valueLabel.text!)! - lastBet2)
        } else if lastBet2 != 0 && x2Button.tag == 2 {
            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet2)
            lastBet2 = Int(frameRatesLabel.text!)!
            dict[2] = String(lastBet2)
            x2Button.tag = 1
        }
        
        if lastBet5 == 0 && x5Button.tag == 1 {
            lastBet5 = Int(frameRatesLabel.text!)!
            dict[5] = String(lastBet5)
            valueLabel.text = String(Int(valueLabel.text!)! - lastBet5)
        } else if lastBet5 != 0 && x5Button.tag == 2 {
            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet5)
            lastBet5 = Int(frameRatesLabel.text!)!
            dict[5] = String(lastBet5)
            x5Button.tag = 1
        }
        
        if lastBet10 == 0 && x10Button.tag == 1 {
            lastBet10 = Int(frameRatesLabel.text!)!
            dict[10] = String(lastBet10)
            valueLabel.text = String(Int(valueLabel.text!)! - lastBet10)
        } else if lastBet10 != 0 && x10Button.tag == 2 {
            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet10)
            lastBet10 = Int(frameRatesLabel.text!)!
            dict[10] = String(lastBet10)
            x10Button.tag = 1
        }
        
        if lastBet15 == 0 && x15Button.tag == 1 {
            lastBet15 = Int(frameRatesLabel.text!)!
            dict[15] = String(lastBet15)
            valueLabel.text = String(Int(valueLabel.text!)! - lastBet15)
        } else if lastBet15 != 0 && x15Button.tag == 2 {
            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet15)
            lastBet15 = Int(frameRatesLabel.text!)!
            dict[15] = String(lastBet15)
            x15Button.tag = 1
        }
        
        if lastBet20 == 0 && x20Button.tag == 1 {
            lastBet20 = Int(frameRatesLabel.text!)!
            dict[20] = String(lastBet20)
            valueLabel.text = String(Int(valueLabel.text!)! - lastBet20)
        } else if lastBet20 != 0 && x20Button.tag == 2 {
            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet20)
            lastBet20 = Int(frameRatesLabel.text!)!
            dict[20] = String(lastBet20)
            x20Button.tag = 1
        }
        
        if lastBet30 == 0 && x30Button.tag == 1 {
            lastBet30 = Int(frameRatesLabel.text!)!
            dict[30] = String(lastBet30)
            valueLabel.text = String(Int(valueLabel.text!)! - lastBet30)
        } else if lastBet30 != 0 && x30Button.tag == 2 {
            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet30)
            lastBet30 = Int(frameRatesLabel.text!)!
            dict[30] = String(lastBet30)
            x30Button.tag = 1
        }
        
        if lastBet40 == 0 && x40Button.tag == 1 {
            lastBet40 = Int(frameRatesLabel.text!)!
            dict[40] = String(lastBet40)
            valueLabel.text = String(Int(valueLabel.text!)! - lastBet40)
        } else if lastBet40 != 0 && x40Button.tag == 2 {
            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet40)
            lastBet40 = Int(frameRatesLabel.text!)!
            dict[40] = String(lastBet40)
            x40Button.tag = 1
        }
        
        
//        if lastBet1 == 0 && x1Button.tag == 1 {
//            dict[1] = frameRatesLabel.text
//            lastBet1 = Int(dict[1]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        } else if lastBet1 != 0 && x1Button.tag == 2 {
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet1)
//            dict[1] = String(Int(frameRatesLabel.text!)!)
//            lastBet1 = Int(frameRatesLabel.text!)! - lastBet1
//            x1Button.tag = 1
//        }
        
//        if lastBet2 == 0 && x2Button.tag == 1 {
//            dict[2] = frameRatesLabel.text
//            lastBet2 = Int(dict[2]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        } else if lastBet2 != 0 && x2Button.tag == 2 {
//            dict[2] = String(Int(frameRatesLabel.text!)! - lastBet1)
//            lastBet2 = Int(dict[2]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)! + lastBet2)
//            x2Button.tag = 1
//        }
        
        
        
        
//        if lastBet1 != 0 {
//            dict[1] = String(Int(frameRatesLabel.text!)! - lastBet1)
//            lastBet1 = Int(dict[1]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! + Int(frameRatesLabel.text!)! - lastBet1)
//        } else if lastBet2 != 0 {
//            dict[2] = String(Int(frameRatesLabel.text!)! - lastBet1)
//            lastBet1 = Int(dict[2]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! + Int(frameRatesLabel.text!)! - lastBet1)
//        } else if lastBet5 != 0 {
//            dict[5] = String(Int(frameRatesLabel.text!)! - lastBet1)
//            lastBet1 = Int(dict[5]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! + Int(frameRatesLabel.text!)! - lastBet1)
//        } else if lastBet10 != 0 {
//            dict[10] = String(Int(frameRatesLabel.text!)! - lastBet1)
//            lastBet1 = Int(dict[10]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! + Int(frameRatesLabel.text!)! - lastBet1)
//        } else if lastBet15 != 0 {
//            dict[15] = String(Int(frameRatesLabel.text!)! - lastBet1)
//            lastBet1 = Int(dict[15]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! + Int(frameRatesLabel.text!)! - lastBet1)
//        } else if lastBet20 != 0 {
//            dict[20] = String(Int(frameRatesLabel.text!)! - lastBet1)
//            lastBet1 = Int(dict[20]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! + Int(frameRatesLabel.text!)! - lastBet1)
//        } else if lastBet30 != 0 {
//            dict[30] = String(Int(frameRatesLabel.text!)! - lastBet1)
//            lastBet1 = Int(dict[30]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! + Int(frameRatesLabel.text!)! - lastBet1)
//        } else if lastBet40 != 0 {
//            dict[40] = String(Int(frameRatesLabel.text!)! - lastBet1)
//            lastBet1 = Int(dict[40]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! + Int(frameRatesLabel.text!)! - lastBet1)
//        }
//
//        switch 0 {
//        case lastBet1:
//            dict[1] = frameRatesLabel.text
//            lastBet1 = Int(dict[1]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        case lastBet2:
//            dict[2] = frameRatesLabel.text
//            lastBet2 = Int(dict[2]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        case lastBet1:
//            dict[5] = frameRatesLabel.text
//            lastBet1 = Int(dict[1]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        case lastBet1:
//            dict[10] = frameRatesLabel.text
//            lastBet1 = Int(dict[1]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        case lastBet1:
//            dict[15] = frameRatesLabel.text
//            lastBet1 = Int(dict[1]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        case lastBet1:
//            dict[20] = frameRatesLabel.text
//            lastBet1 = Int(dict[1]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        case lastBet1:
//            dict[30] = frameRatesLabel.text
//            lastBet1 = Int(dict[1]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        default:
//            dict[40] = frameRatesLabel.text
//            lastBet1 = Int(dict[1]!)!
//            valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
//        }
        
        SoundAudioPlayer.shared.playSoundEffect()
        rollButton.isUserInteractionEnabled = true
        isHidden(true)
//        valueLabel.text = String(Int(valueLabel.text!)! - Int(frameRatesLabel.text!)!)
        settingsDidChange()
    }
    
    @objc func comeBackPressed() {
        SoundAudioPlayer.shared.playSoundEffect()
        self.view.window?.rootViewController = UINavigationController(rootViewController: ChoiseWheelViewController(
            value: value,
            index: wheel,
            soundNumber: soundNumber,
            musicNumber: musicNumber))
        settingsDidChange()
    }
}

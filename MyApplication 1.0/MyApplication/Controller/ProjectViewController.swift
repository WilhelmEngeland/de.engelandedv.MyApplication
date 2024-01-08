//
//  ProjectViewController.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 31.07.21.
//

import UIKit

func degreeToRadians(degree: CGFloat) -> CGFloat {
    return (degree * CGFloat.pi)/180
}

class ProjectViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    
    //MARK: - Variablen
    var defaultsLanguage = UserDefaults.standard
    let transfromLayer = CATransformLayer()
    var currentAngle: CGFloat = 0  
    var currentOffset: CGFloat = 0
    var rotationValue = 0.0
    var rotationValueRight = 0.0
    var ifRightValue = false
    var selectetImage = ""
     
    var textInputLabel: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = UIColor.init(named: "AccentColor")!
        label.textColor =  UIColor.init(named: "SaveColor")!
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup the Language Text
        setupLanguageText()
        // Setup the Background Z Position
        imageViewOutlet.layer.zPosition = -500
        // Setup the Text Label
        setupTextInputLabel()
        // Pressed Tap Gesture Recognizer
        addTapGestureImage()
        // Adding the images
        setupAddImage()
        // Spin of the carousel
        turnCarousel()
        // Variable of Gesture Recognition
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ProjectViewController.performAction(recognizer:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        transfromLayer.sublayers = nil
        viewDidLoad()
    }
    
    
    //MARK: - Setup Input Label Text
    func setupTextInputLabel() {
        view.addSubview(textInputLabel)
        textInputLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textInputLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textInputLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textInputLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textInputLabel.text = selectetImage
    }
    
    
    //MARK: - Setup Language Text
    func setupLanguageText() {
        title = Language.language.projectsText
        
        if selectetImage == "" {
            selectetImage = Language.language.quiz
        } else {
            // No function
        }
    }
    
    
    //MARK: - Setup adding the images
    func setupAddImage() {
        transfromLayer.frame = self.view.bounds
        view.layer.addSublayer(transfromLayer)

        // Add all images from assets
        for i in 1...4 {

            if (defaultsLanguage.string(forKey: "isLanguage") == "English") {
                addImage(name: "\(i)")
            } else if (defaultsLanguage.string(forKey: "isLanguage") == "German") {
                addImage(name: "\(i + 4)")
            }
        }
    }
    
    
    //MARK: - Which Imagecard was pressed
    func addTapGestureImage() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    //MARK: - Which Imagecard was selectet
    @objc func selectImage() {
        if selectetImage == Language.language.quiz {
            self.performSegue(withIdentifier: "segueToQuizViewController", sender: nil)
        } else if selectetImage == Language.language.weather {
            self.performSegue(withIdentifier: "segueToWeatherViewController", sender: nil)
        } else if selectetImage == Language.language.tasks {
            self.performSegue(withIdentifier: "segueToTasksViewController", sender: nil)
        } else if selectetImage == Language.language.tictactoe {
            self.performSegue(withIdentifier: "segueToTicTacToeViewController", sender: nil)
        }
    }
    
    
    //MARK: - Creation of the Imagecard
    func addImage(name: String) {
        
        let imageCardSize = CGSize(width: 175, height: 301)
        let imageLayer = CALayer()
        imageLayer.frame = CGRect(x: view.frame.size.width / 2 - imageCardSize.width / 2 , y: view.frame.size.height / 2 - imageCardSize.height / 2, width: imageCardSize.width, height: imageCardSize.height)

        imageLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        guard let imageCardImage = UIImage(named: name)?.cgImage else { return }

        imageLayer.contents = imageCardImage
        imageLayer.contentsGravity = .resizeAspectFill
        imageLayer.masksToBounds = true
        imageLayer.isDoubleSided = true

        imageLayer.borderColor = UIColor(white: 1, alpha: 1.0).cgColor
        imageLayer.borderWidth = 5
        imageLayer.cornerRadius = 10

        transfromLayer.addSublayer(imageLayer)
    }
    
    
    //MARK: - Spin of the carousel
    func turnCarousel() {
        
        guard let transformSubLayers = transfromLayer.sublayers else { return }
        
        let segmentForImageCard = CGFloat(360 / transformSubLayers.count)
        
        var angleOffset = currentAngle
        
        for layer in transformSubLayers {
            var transform = CATransform3DIdentity
            transform.m34 = -1 / 500
            
            transform = CATransform3DRotate(transform, degreeToRadians(degree: angleOffset), 0, 1, 0)
            transform = CATransform3DTranslate(transform, 0, 0, 200)
            
            CATransaction.setAnimationDuration(0)
            
            angleOffset += segmentForImageCard
            
            layer.transform = transform
        }
    }
    
    
    //MARK: - Action function spin of the carousel
    @objc func performAction(recognizer: UIPanGestureRecognizer) {
        
        let xOffset = recognizer.translation(in: self.view).x
        
        if recognizer.state == .began {
            currentOffset = 0
        }
        
        let xDifference = xOffset * 0.6 - currentOffset
        
        currentOffset += xDifference
        currentAngle += xDifference
        
        rotationValue = currentAngle
        
        var rightValue = "\(rotationValue)"
        
        if rightValue.contains("-") {
            ifRightValue = true
            rightValue = "\(rotationValue)".replacingOccurrences(of: "-", with: "")
            rotationValue = Double(rightValue)!
            selectImageValue()
        } else {
            ifRightValue = false
            selectImageValue()
        }
        
        turnCarousel()
    }
    
    
    //MARK: - Calculate the position of the carousel
    func selectImageValue() {
        //Loop when 360 degrees are exceeded
        while true {
            if rotationValue >= 360 {
                rotationValue -= 360
            } else {
                break
            }
        }
        
        //Case of 360 Crad rotation
        switch rotationValue {
        case 330.0...360.0:
            textInputLabel.text = Language.language.quiz
            selectetImage = Language.language.quiz
        case -30.0...30.0:
            textInputLabel.text = Language.language.quiz
            selectetImage = Language.language.quiz
        case 60.0...120.0:
            if ifRightValue == true {
                textInputLabel.text = Language.language.tictactoe
                selectetImage = Language.language.tictactoe
            } else {
                textInputLabel.text = Language.language.weather
                selectetImage = Language.language.weather
            }
        case 150.0...210.0:
            textInputLabel.text = Language.language.tasks
            selectetImage = Language.language.tasks
        case 240.0...300.0:
            if ifRightValue == true {
                textInputLabel.text = Language.language.weather
                selectetImage = Language.language.weather
            } else {
                textInputLabel.text = Language.language.tictactoe
                selectetImage = Language.language.tictactoe
            }
        //Value not found
        default:
            textInputLabel.text = ""
            selectetImage = ""
        }
    }
}

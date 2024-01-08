//
//  CoverLetterViewController.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 31.07.21.
//

import UIKit

class CoverLetterViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var textViewOutlet: UITextView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var textOneOutlet: UILabel!
    @IBOutlet weak var textTwoOutlet: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    //MARK: - Variablen
    var defaultsLanguage = UserDefaults.standard
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        Language.language.selectetLanguage()
        createOutlets()
        
        initTabBarControllers()
    }
    
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        if (defaultsLanguage.string(forKey: "isLanguage") == nil) {
            selectetTheLanguage()
        } else {
            // No function
        }
    }
    
    
    //MARK: - Init Title TabBar Controllers
    func initTabBarControllers() {
        self.tabBarController?.viewControllers?[0].tabBarItem.title = Language.language.writeToText
        self.tabBarController?.viewControllers?[1].tabBarItem.title = Language.language.curriculumVitae
        self.tabBarController?.viewControllers?[2].tabBarItem.title = Language.language.attachmentText
        self.tabBarController?.viewControllers?[3].tabBarItem.title = Language.language.projectsText
    }
    
    
    //MARK: - Create Outlets
    func createOutlets() {
        title = Language.language.writeToText
        
        textViewOutlet.text = Language.language.coverLetterText
        
        textViewOutlet.font = UIFont (name: "Helvetica Neue", size: 17)
        textViewOutlet.textColor = .white
        
        titleOutlet.text = Language.language.writeToText
        textOneOutlet.text = Language.language.textOneText
        textTwoOutlet.text = Language.language.textTwoText
        
        buttonOutlet.setTitle(Language.language.LanguageText, for: .normal)
        buttonOutlet.layer.masksToBounds = false
        buttonOutlet.layer.cornerRadius = 10
        buttonOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonOutlet.layer.shadowRadius = 8
        buttonOutlet.layer.shadowOpacity = 0.5
        
        imageOutlet.layer.cornerRadius = 20
    }
    
    
    //MARK: - Button select Language
    @IBAction func buttonTaped(_ sender: Any) {
        
        buttonAnimation()
        
        if (defaultsLanguage.string(forKey: "isLanguage") == "English") {
            defaultsLanguage.set("German", forKey: "isLanguage")
            viewDidLoad()
        } else if (defaultsLanguage.string(forKey: "isLanguage") == "German") {
            defaultsLanguage.set("English", forKey: "isLanguage")
            viewDidLoad()
        }
    }
    
    
    //MARK: - Alert for Start Language
    func selectetTheLanguage() {
        let alert = UIAlertController(title: "Select your language", message: "Wähle deine Sprache", preferredStyle: .alert)
        
        alert.view.tintColor = UIColor.init(named: "SaveColor")
        
        imageOutlet.isHidden = true
        buttonOutlet.isHidden = true
        
        let languageOne = UIAlertAction(title: "English", style: .default) { (languageOne) in
            self.defaultsLanguage.set("English", forKey: "isLanguage")
            Language.language.selectetLanguage()
            self.imageOutlet.isHidden = false
            self.buttonOutlet.isHidden = false
            self.viewDidLoad()
        }
        
        let languageTwo = UIAlertAction(title: "Deutsch", style: .default) { (languageTwo) in
            self.defaultsLanguage.set("German", forKey: "isLanguage")
            Language.language.selectetLanguage()
            self.imageOutlet.isHidden = false
            self.buttonOutlet.isHidden = false
            self.viewDidLoad()
        }
        
        //Add actions
        alert.addAction(languageOne)
        alert.addAction(languageTwo)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Button Animation
    func buttonAnimation() {
    let button = CABasicAnimation(keyPath: "opacity")
        button.duration = 0.3
        button.fromValue = 1
        button.toValue = 0.1
        button.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        button.autoreverses = true
        button.repeatCount = 1
        buttonOutlet.layer.add(button, forKey: nil)
    }
}


//MARK: - Extension Mutable Attributed String
extension NSMutableAttributedString {
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : UIFont (name: "Helvetica Neue", size: 24) as Any
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : UIFont (name: "Helvetica Neue", size: 17) as Any
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func underlined(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  UIFont (name: "Helvetica Neue", size: 17) as Any,
            .underlineStyle : NSUnderlineStyle.single.rawValue
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}

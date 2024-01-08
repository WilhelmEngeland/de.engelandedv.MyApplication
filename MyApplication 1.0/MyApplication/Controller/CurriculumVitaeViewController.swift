//
//  CurriculumVitaeViewController.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 31.07.21.
//

import UIKit

class CurriculumVitaeViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var textViewOutlet: UITextView!
    @IBOutlet weak var titleOutlet: UILabel!
    
    
    //MARK: - Variablen
    var defaultsLanguage = UserDefaults.standard
    var dateString = ""
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setDate()
        createOutlets()
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
    }

    
    //MARK: - Create Outlets
    func createOutlets() {
        title = Language.language.curriculumVitae
        
        titleOutlet.text = Language.language.curriculumVitae
        
        if (defaultsLanguage.string(forKey: "isLanguage") == "English") {
            textViewOutlet.attributedText = NSMutableAttributedString()
            
                .bold("Personal data:\n")

                .normal("\nName: Wilhelm Engeland\n\n")
                .normal("Residence: Am Berg 5, 35099 Burgwald\n\n")
                .normal("Mobile phone: +49 170 2678869\n\n")
                .normal("E-mail: w.engeland@icloud.com\n\n")
                .normal("Date of birth: 15.06.1987\n\n")
                .normal("Place of birth: Frankenberg/Eder\n\n")
                .normal("Marital status: married, 2 children\n\n\n")

                .bold("Special Knowledge:\n")

                .normal("\nSpecial Knowledge: Swift\n")
                .normal("Special Knowledge: IDE Xcode\n")
                .normal("Knowledge: HTML, CSS, JavaScript and Git\n")
                .normal("Knowledge: IT, through my work as an information electronics technician since March 2011\n\n\n")

                .bold("Professional background:\n")

                .underlined("\nNovember 2018 - today\n")
                .normal("Company Ridacom\n")
                .normal("Information electronics engineer\n")
                .normal("Initial activities: Installation and maintenance of large building systems for satellite, BK and satellite head stations\n")
                .normal("Additional, different activities: Creation of the customer app Ridacom (modular principle for IOS and Android) Remote\n")
                .normal("Creation of an internal employee app (with Swift for IOS) Remote\n\n")

                .underlined("March 2011 - October 2018\n")
                .normal("Company Media.Com\n")
                .normal("information electronics engineer\n")
                .normal("Activity: Internet, telephone and TV installation and troubleshooting at the customer\n\n")

                .underlined("August 2007 - February 2011\n")
                .normal("Woodworking mechanic at Ante-Holz\n\n")

                .underlined("August 2004 - July 2007\n")
                .normal("Apprenticeship as a woodworking mechanic at Ante-Holz\n\n\n")

                .bold("School career:\n")

                .underlined("\nSeptember 2003 – July 2004\n")
                .normal("Vocational school in Frankenberg\n")
                .normal("Vocational training year specializing in electrical engineering\n\n")

                .underlined("August 1999 - July 2003\n")
                .normal("Secondary school in Frankenberg\n")
                .normal("High school diploma\n\n")

                .underlined("August 1998 - June 1999\n")
                .normal("Secondary school in Frankenberg\n\n")

                .underlined("September 1994 - July 1998\n")
                .normal("Elementary school in Bottendorf\n\n\n")
            
                .normal("Date: \(dateString)")
            
        } else if (defaultsLanguage.string(forKey: "isLanguage") == "German") {
            textViewOutlet.attributedText = NSMutableAttributedString()
            
                .bold("Persönliche Daten:\n")

                .normal("\nName: Wilhelm Engeland\n\n")
                .normal("Wohnort: Am Berg 5, 35099 Burgwald\n\n")
                .normal("Mobiltelefon: +49 170 2678869\n\n")
                .normal("E-mail: w.engeland@icloud.com\n\n")
                .normal("Geburtsdatum: 15.06.1987\n\n")
                .normal("Geburtsort: Frankenberg/Eder\n\n")
                .normal("Familienstand: verheiratet, 2 Kinder\n\n\n")

                .bold("Besondere Kenntnisse:\n")

                .normal("\nBesondere Kenntnisse: Swift\n")
                .normal("Besondere Kenntnisse: IDE Xcode\n")
                .normal("Kenntnisse: HTML, CSS, JavaScript und Git\n")
                .normal("Kenntnisse: IT, durch meine Tätigkeit als Informationselektroniker seid  März 2011\n\n\n")

                .bold("Beruflicher Werdegang:\n")

                .underlined("\nNovember 2018 - heute\n")
                .normal("Firma Ridacom\n")
                .normal("Informationselektroniker\n")
                .normal("Anfängliche Tätigkeiten: Installation und Wartung von Großgebäudeanlagen für Sat, BK und Sat-Kopfstationen\n")
                .normal("Zusätzliche abweichende Tätigkeiten: Erstellung der Kundenapp Ridacom (Baukastenprinzip für IOS und Android) im Homeoffice\n")
                .normal("Erstellung einer Internen Mitarbeiter App ( mit Swift für IOS) im Homeoffice\n\n")

                .underlined("März 2011 - Oktober 2018\n")
                .normal("Firma Media.Com\n")
                .normal("Informationselektroniker\n")
                .normal("Tätigkeit: Internet, Telefon und TV Installation und Störungsbearbeitung bei dem Kunden\n\n")

                .underlined("August 2007 - Februar 2011\n")
                .normal("Holzbearbeitungsmechaniker bei der Firma Ante-Holz\n\n")

                .underlined("August 2004 - Juli 2007\n")
                .normal("Ausbildung zum Holzbearbeitungsmechaniker bei der Firma Ante-Holz\n\n\n")

                .bold("Schulischer Werdegang:\n")

                .underlined("\nSeptember 2003 – Juli 2004\n")
                .normal("Berufsschule Frankenberg\n")
                .normal("Berufsgrundbildungsjahr Fachrichtung Elektrotechnik\n\n")

                .underlined("August 1999 - Juli 2003\n")
                .normal("Hauptschule Frankenberg\n")
                .normal("Hauptschulabschluss\n\n")

                .underlined("August 1998 - Juni 1999\n")
                .normal("Realschule Frankenberg\n\n")

                .underlined("September 1994 - Juli 1998\n")
                .normal("Grundschule Bottendorf\n\n\n")
            
                .normal("Datum: \(dateString)")
        }
        
        textViewOutlet.textColor = .white
    }
    
    
    //MARK: - Set Date
    func setDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        formatter.locale = Locale(identifier: "de_DE")
        dateString = formatter.string(from: Date())
    }
}

//
//  AttachmentViewController.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 31.07.21.
//

import UIKit
import PDFKit

class AttachmentViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var touchLabel: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    
    
    //MARK: - Variablen
    var defaultsLanguage = UserDefaults.standard
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        createOutlets()
        createInfoAlert()
    }
    
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        createOutlets()
    }
    
    
    //MARK: - Create Outlets
    func createOutlets() {
        title = Language.language.attachmentText
        
        titleOutlet.text = Language.language.attachmentText
    }
    
    
    //MARK: - Create Item Function
    func createInfoAlert() {
        
        pdfView.backgroundColor = UIColor.init(named: "SaveColor")!
        
        touchLabel.isHidden = true
        
        if (defaultsLanguage.string(forKey: "isLanguage") == "English") {
            
            let alert = UIAlertController(title: "Language of attachments", message: "Unfortunately, these attachments are only available in German", preferredStyle: .alert)
            
            alert.view.tintColor = UIColor.init(named: "SaveColor")
            
            let action = UIAlertAction(title: Language.language.okText, style: .default) { (_) in
                self.touchLabelAnimation()
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        } else if (defaultsLanguage.string(forKey: "isLanguage") == "German") {
            
            touchLabelAnimation()
        }
    }
    
    
    //MARK: - Touch Label animation
    
    // Function of the TouchLabel animation
    func touchLabelAnimation() {
        
        touchLabel.isHidden = false
        
        touchLabel.frame = CGRect(x: touchLabel.center.x - 75, y: touchLabel.center.y + 75, width: 150, height: 150)
        
        UIView.animate(withDuration: 1.5) {
            self.touchLabel.center = CGPoint(x: self.touchLabel.center.x, y: self.touchLabel.center.y - 350)
        }
        pdfAnimation()
    }
    
    // Function of the PDF Animation
    func pdfAnimation() {
        
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (Timer) in
                
                UIView.animate(withDuration: 0.7) {
                    self.createPDFView()
                }
                self.touchLabel.isHidden = true
            }
        }
    }
    
    
    //MARK: - Create PDF
    func createPDFView() {
        // Setup PDF View
        pdfView.displayDirection = .vertical
        pdfView.usePageViewController(true)
        pdfView.pageBreakMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        pdfView.autoScales = true
        
        // Load PDF File
        pdfView.document = PDFDocument.init(url: Bundle.main.url(forResource: "SwiftCoaching", withExtension: "pdf")!)
        
        // Set background color after setting new document
        pdfView.backgroundColor = UIColor.init(named: "SaveColor")!
    }
}

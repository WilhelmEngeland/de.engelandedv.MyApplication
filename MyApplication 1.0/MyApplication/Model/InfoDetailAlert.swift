//
//  InfoDetailAlert.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 07.04.22.
//

import Foundation
import UIKit

class InfoDetailAlert {
    
    //MARK: - Create InfoDetail Alert
    func infoDetail(_text: String, _view: UIViewController) {
        let alert = UIAlertController(title: Language.language.projectInfoText, message: _text, preferredStyle: .alert)
        alert.view.tintColor = UIColor.init(named: "SaveColor")
        let okAction = UIAlertAction(title: Language.language.okText, style: .default) { (_) in }
        alert.addAction(okAction)
        _view.parent!.present(alert, animated: true, completion: nil)
    }
}

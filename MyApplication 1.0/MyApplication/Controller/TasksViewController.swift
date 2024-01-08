//
//  TasksViewController.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 31.07.21.
//

import UIKit
import CoreData

class TasksViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var tasksTableView: UITableView!
    
    
    //MARK: - Variablen
    let infoDetailAlert = InfoDetailAlert()
    
    var tasksArray = [Tasks]()
    var switchControl = UISwitch()
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
        viewDidLoad()
    }
    
    
    //MARK: - Create InfoDetail Button Tap
    @IBAction func infoDetailButton(_ sender: Any) {
        infoDetailAlert.infoDetail(_text: Language.language.infoDetailTasksViewController, _view: self)
    }
    
    
    //MARK: - Create Button Tap
    @IBAction func createButton(_ sender: Any) {
        createItem()
    }
    
    
    //MARK: - Create Item Function
    func createItem() {
        let alert = UIAlertController(title: Language.language.taskText, message: nil, preferredStyle: .alert)
        
        alert.view.tintColor = UIColor.init(named: "SaveColor")
        
        alert.addTextField { (aufgabenTextField) in
            aufgabenTextField.placeholder = Language.language.enterTaskText
        }
        
        alert.view.addSubview(createSwitch {})
        
        let action = UIAlertAction(title: Language.language.okText, style: .default) { (_) in
            if alert.textFields![0].text?.count != 0 {
                
                let title = alert.textFields![0].text
                let done = false
                
                // CoreData
                let item = CoreDataService.defaults.createTasks(_title: title!, _done: done, _isImportent: self.switchControl.isOn)
                
                // Array
                self.tasksArray.append(item)
                self.loadData()
            } else {
                self.errorMessage(_message: Language.language.tasksErrorMessageText)
            }
        }
        
        let cancelAction = UIAlertAction(title: Language.language.abortText, style: .default) { (_) in }
        
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Long Press Function
    @objc func longPress(_ sender: UIGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.ended {
            let longPressLocationPoint = sender.location(in: self.tasksTableView)
            
            if let pressIndexPath = self.tasksTableView.indexPathForRow(at: longPressLocationPoint) {
                
                var task = UITextField()
                
                let alert = UIAlertController(title: Language.language.changeTaskText, message: nil, preferredStyle: .alert)
                
                alert.view.tintColor = UIColor.init(named: "SaveColor")
                
                alert.addTextField { (textField) in
                    textField.text = self.tasksArray[pressIndexPath.row].title
                    task = textField
                }
                
                
                alert.view.addSubview(createSwitch {
                    if self.tasksArray[pressIndexPath.row].isImportant == true {
                        self.switchControl.setOn(true, animated: true)
                    } else {
                        self.switchControl.setOn(false, animated: true)
                    }
                })
                
                let action = UIAlertAction(title: Language.language.okText, style: .default) { (action) in
                    
                    self.tasksArray[pressIndexPath.row].title = task.text!
                    self.tasksArray[pressIndexPath.row].isImportant = self.switchControl.isOn
                    
                    self.loadData()
                    CoreDataService.defaults.saveContext()
                }
                let cancelAction = UIAlertAction(title: Language.language.abortText, style: .default) { (_) in }
                
                alert.addAction(action)
                alert.addAction(cancelAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    //MARK: - Create Switch
    func createSwitch(completion: () -> Void) -> UISwitch {
        switchControl = UISwitch(frame: CGRect(x: 10, y: 20, width: 0, height: 0))
        switchControl.isOn = false
        switchControl.setOn(false, animated: false)
        switchControl.onTintColor = UIColor.init(named: "SaveColor")
        switchControl.backgroundColor = UIColor.systemBackground
        switchControl.thumbTintColor = UIColor.black
        switchControl.layer.cornerRadius = 16
        switchControl.layer.borderWidth = 0.8
        switchControl.layer.borderColor = UIColor.darkGray.cgColor
        switchControl.layer.masksToBounds = true
        switchControl.addTarget(self, action: #selector(switchValueDidChange(sender:)), for: .valueChanged)
        completion()
        return switchControl
    }
    
    // Switch Target
    @objc func switchValueDidChange(sender: UISwitch) {
    }
    
    
    //MARK: - Load Data Function
    func loadData() {
        let tasksArray = CoreDataService.defaults.loadTasks()
        
        if let _tasksArray = tasksArray {
            self.tasksArray = _tasksArray
            self.tasksArray.reverse()
            self.tasksTableView.reloadData()
        }
    }
    
    
    //MARK: - Error Function
    func errorMessage(_message: String) {
        let alert = UIAlertController(title: Language.language.errorText, message: _message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Language.language.okText, style: .default) { (_) in }
        
        alert.view.tintColor = UIColor.init(named: "SaveColor")
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}


//MARK: - UITableViewDataSource
extension TasksViewController: UITableViewDataSource {
    
    // Number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArray.count
    }
    
    // Create Cell from Array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasksCell", for: indexPath)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_ :)))
        cell.addGestureRecognizer(longPressRecognizer)
        
        let tasks = tasksArray[indexPath.row]
        
        cell.textLabel?.text = tasks.title
        
        if tasks.isImportant == true {
            cell.backgroundColor = UIColor.init(named: "SaveColor")
        } else {
            cell.backgroundColor = UIColor.init(named: "SecondaryColor")
        }
        
        if tasks.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}


//MARK: - UITableViewDelegate
extension TasksViewController: UITableViewDelegate {
    
    // Height For Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    // Editing Cell with Data
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataService.defaults.deleteTasks(indexPath: indexPath, tasksArray: &tasksArray)
            tasksTableView.reloadData()
        }
    }
    
    // Selectet Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tasksArray[indexPath.row].done = !tasksArray[indexPath.row].done
        tasksTableView.reloadData()
        CoreDataService.defaults.saveContext()
    }
}

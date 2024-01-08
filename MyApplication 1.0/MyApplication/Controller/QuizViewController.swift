//
//  QuizViewController.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 31.07.21.
//

import UIKit

class QuizViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //MARK: - Variablen
    var defaultsLanguage = UserDefaults.standard
    let infoDetailAlert = InfoDetailAlert()
    
    var allQuestion = QuestionBank()
    var questionNumber = 0
    var score = 0
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup Buttons
        setupButton()
        // Create Questions
        setupQuestion()
        // Set up UI
        scoreLabel.text = "\(Language.language.scoreText): \(score)"
        questionCountLabel.text = "\(Language.language.questionContTextQuestion) \(questionNumber + 1) \(Language.language.questionContTextOf) \(allQuestion.questionList.count)"
    }
    
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        allQuestion = QuestionBank()
    }
    
    
    //MARK: - Create InfoDetail Alert
    @IBAction func infoDetailButton(_ sender: Any) {
        infoDetailAlert.infoDetail(_text: Language.language.infoDetailQuizViewController, _view: self)
    }
    
    
    //MARK: - Setup Buttons
    func setupButton() {
        answerButton1.tag = 1
        answerButton2.tag = 2
        answerButton3.tag = 3

        answerButton1.layer.cornerRadius = 20
        answerButton1.layer.borderWidth = 2
        answerButton1.layer.borderColor = UIColor.white.cgColor

        answerButton2.layer.cornerRadius = 20
        answerButton2.layer.borderWidth = 2
        answerButton2.layer.borderColor = UIColor.white.cgColor

        answerButton3.layer.cornerRadius = 20
        answerButton3.layer.borderWidth = 2
        answerButton3.layer.borderColor = UIColor.white.cgColor
    }


    //MARK: - Action Button Tapped
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let answerTag = sender.tag
        // check answer
        checkAnswer(answerTag: answerTag)
        // load next Question
        nextQuestion()
    }


    //MARK: - Setup Quistions
    func setupQuestion() {
        questionLabel.text = allQuestion.questionList[questionNumber].questionText
        answerButton1.setTitle(allQuestion.questionList[questionNumber].answer1, for: .normal)
        answerButton2.setTitle(allQuestion.questionList[questionNumber].answer2, for: .normal)
        answerButton3.setTitle(allQuestion.questionList[questionNumber].answer3, for: .normal)
    }


    //MARK: - check Answer
    func checkAnswer(answerTag: Int) {

        if questionNumber < allQuestion.questionList.count {
            if answerTag == allQuestion.questionList[questionNumber].correctAnswerTag {
                createAnswerText(_text1: Language.language.correctText, _text2: "\(allQuestion.questionList[questionNumber].trueAnswerText)")
                score += 10
            } else {
                createAnswerText(_text1: Language.language.notCorrectText, _text2: "\(allQuestion.questionList[questionNumber].falseAnswerText)")
            }
            questionNumber += 1
        } else {

            // create restart (game over)
            createRestart(answerTag)
        }
    }


    //MARK: - Create Answer Alert
    func createAnswerText(_text1: String, _text2: String) {
        let answerAlert = UIAlertController(title: _text1, message: _text2, preferredStyle: .alert)

        answerAlert.view.tintColor = UIColor.init(named: "SaveColor")

        let okAction = UIAlertAction(title: Language.language.okText, style: .default) { (_) in }

        answerAlert.addAction(okAction)
        present(answerAlert, animated: true, completion: nil)
    }


    //MARK: - next Question
    func nextQuestion() {
        if questionNumber < allQuestion.questionList.count {
            setupQuestion()

            updateUI()
        } else {
            scoreLabel.text = "\(Language.language.scoreText): \(score)"
            questionCountLabel.text = "\(Language.language.questionContTextQuestion) \(questionNumber) \(Language.language.questionContTextOf) \(allQuestion.questionList.count)"
            questionLabel.text = "\(score) \(Language.language.scoreEndText) \(createFinalLabel())"
            answerButton1.setTitle(Language.language.rebootText, for: .normal)
            answerButton2.setTitle(Language.language.endText, for: .normal)
            answerButton3.isHidden = true
        }
    }


    //MARK: - update User Interface
    func updateUI() {
        scoreLabel.text = "\(Language.language.scoreText): \(score)"
        questionCountLabel.text = "\(Language.language.questionContTextQuestion) \(questionNumber + 1) \(Language.language.questionContTextOf) \(allQuestion.questionList.count)"
    }


    //MARK: - Create Label end of the quiz
    func createFinalLabel() -> String {
        switch score {
        case 0:
            return Language.language.scoreCase1
        case 10...40:
            return Language.language.scoreCase2
        case 50...60:
            return Language.language.scoreCase3
        case 70:
            return Language.language.scoreCase4
        default:
            return ""
        }
    }


    //MARK: - create restart (game over)
    func createRestart(_ sender: Int) {
        if sender == 1 {
            restart()
        } else if sender == 2 {
            self.navigationController?.popViewController(animated: true)
        } else { }
    }


    //MARK: - restart function
    func restart() {
        questionNumber = 0
        score = 0
        answerButton3.isHidden = false
        questionCountLabel.text = "\(Language.language.questionContTextQuestion) \(questionNumber + 1) \(Language.language.questionContTextOf) \(allQuestion.questionList.count)"
        nextQuestion()
    }
}

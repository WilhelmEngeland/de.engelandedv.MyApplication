//
//  QuestionBank.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 07.04.22.
//

import Foundation

class QuestionBank {
    
    //MARK: - Variablen
    var questionList = [Question]()
    var defaultsLanguage = UserDefaults.standard
    
    //MARK: - Init
    init() {
        
        if (defaultsLanguage.string(forKey: "isLanguage") == "English") {
            // Create Question Object
            let question1 = Question(_questionText: "Why did I learn to program?", _answer1: "It gives me great pleasure", _answer2: "Because I had to learn", _answer3: "For no particular reason", _correctAnswerTag: 1, _trueAnswerText: "I started programming out of interest and I really enjoyed it.", _falseAnswerText: "The first answer (It gives me great pleasure) is correct. I started programming out of interest and I really enjoyed it.")

            let question2 = Question(_questionText: "Why did I learn Swift?", _answer1: "That was just coincidence", _answer2: "Special interest in Apple", _answer3: "Is the simplest programming language", _correctAnswerTag: 2, _trueAnswerText: "I own a lot of Apple products, so I can access some test devices there. In addition, I am convinced of the quality and the design of the software and would like to contribute to writing good quality software myself.", _falseAnswerText: "The second answer (Particular interest in Apple) is correct. I own a lot of Apple products, so I can access some test devices there. In addition, I am convinced of the quality and the design of the software and would like to contribute to writing good quality software myself.")

            let question3 = Question(_questionText: "Why do I want to leave my current employer?", _answer1: "Because of a bad working atmosphere", _answer2: "Because I don't like the work", _answer3: "Don't want to leave him at all", _correctAnswerTag: 3, _trueAnswerText: "Because I am very satisfied with my current employer. But I still want to take the risk to pursue my dream job as a developer.", _falseAnswerText: "The third answer (doesn't want to leave him at all) is correct. Because I am very satisfied with my current employer. But I still want to take the risk to pursue my dream job as a developer.")

            let question4 = Question(_questionText: "What do I want to have achieved in five years?", _answer1: "Senior Developer", _answer2: "Early retirees", _answer3: "No future goals", _correctAnswerTag: 1, _trueAnswerText: "I would like to constantly develop myself further and expand my skills.", _falseAnswerText: "The first answer (Senior Developer) is correct. I would like to constantly develop myself further and expand my skills.")

            let question5 = Question(_questionText: "How do I motivate myself to code?", _answer1: "I reward myself for achievements", _answer2: "I punish myself for failures", _answer3: "I don't need motivation", _correctAnswerTag: 3, _trueAnswerText: "Because programming is not a chore for me, but a pleasure.", _falseAnswerText: "The third answer (I don't need motivation) is correct. Because programming is not a chore for me, but a pleasure.")

            let question6 = Question(_questionText: "What is my greatest strength?", _answer1: "Ability to learn and willingness to achieve", _answer2: "I don't have any strengths", _answer3: "I always manage to get the smoke coming my way from the campfire", _correctAnswerTag: 1, _trueAnswerText: "I am constantly striving to develop myself further, to learn new frameworks and to expand the programming language Swift.", _falseAnswerText: "The first answer (ability to learn and willingness to achieve) is correct. I am constantly striving to develop myself further, to learn new frameworks and to expand the programming language Swift.")

            let question7 = Question(_questionText: "What is my greatest weakness?", _answer1: "Teamwork", _answer2: "English language", _answer3: "Independent work", _correctAnswerTag: 2, _trueAnswerText: "I'm not that good at English, I can read and write, but there are language deficits. But I'm in the process of catching up on the missing status through constant learning.", _falseAnswerText: "The second answer (English language) is correct. I'm not that good at English, I can read and write, but there are language deficits. But I'm in the process of catching up on the missing status through constant learning.")

            // Question Object to Array
            questionList.append(question1)
            questionList.append(question2)
            questionList.append(question3)
            questionList.append(question4)
            questionList.append(question5)
            questionList.append(question6)
            questionList.append(question7)
            
        } else if (defaultsLanguage.string(forKey: "isLanguage") == "German") {
            // Create Question Object
            let question1 = Question(_questionText: "Warum habe ich programmieren gelernt?", _answer1: "Es bereitet mir sehr viel Freude", _answer2: "Weil ich es Lernen musste", _answer3: "Aus keinem besonderen Grund", _correctAnswerTag: 1, _trueAnswerText: "Ich habe aus Interesse mit der Programmierung angefangen und habe sehr viel gefallen daran gefunden.", _falseAnswerText: "Die erste Antwort (Es bereitet mir sehr viel Freude) ist richtig. Ich habe aus Interesse mit der Programmierung angefangen und habe sehr viel gefallen daran gefunden.")

            let question2 = Question(_questionText: "Warum habe ich Swift gelernt?", _answer1: "Das war nur Zufall", _answer2: "Besonderes Interesse an Apple", _answer3: "Ist die einfachste Programmiersprache", _correctAnswerTag: 2, _trueAnswerText: "Ich besitze viele Apple Produkte, daher kann ich dort auf einige Testgeräte zugreifen. Zusätzlich bin ich von der Qualität und dem Design der Software überzeugt und möchte selbst dazu beitragen Qualitativ gute Software zu schreiben.", _falseAnswerText: "Die zweite Antwort (Besonderes Interesse an Apple) ist richtig. Ich besitze viele Apple Produkte, daher kann ich dort auf einige Testgeräte zugreifen. Zusätzlich bin ich von der Qualität und dem Design der Software überzeugt und möchte selbst dazu beitragen Qualitativ gute Software zu schreiben.")

            let question3 = Question(_questionText: "Aus welchem Grund will ich meinen jetzigen Arbeitgeber verlassen?", _answer1: "Wegen einem schlechtem Arbeitsklima", _answer2: "Weil mir die Arbeit nicht gefällt", _answer3: "Möchte Ihn gar nicht verlassen", _correctAnswerTag: 3, _trueAnswerText: "Weil ich mit meinem jetzigen Arbeitgeber sehr zufrieden bin. Ich aber dennoch das Risiko wagen möchte um meinen Traumberuf als Entwickler zu verfolgen.", _falseAnswerText: "Die dritte Antwort (Möchte Ihn garnicht verlassen) ist richtig. Weil ich mit meinem jetzigen Arbeitgeber sehr zufrieden bin. Ich aber dennoch das Risiko wagen möchte um meinen Traumberuf als Entwickler zu verfolgen.")

            let question4 = Question(_questionText: "Was möchte ich in fünf Jahren erreicht haben?", _answer1: "Senior Entwickler", _answer2: "Frührentner", _answer3: "Keine Ziele für die Zukunft", _correctAnswerTag: 1, _trueAnswerText: "Ich möchte mich stetig weiterentwickeln und meine Fertigkeiten ausbauen.", _falseAnswerText: "Die erste Antwort (Senior Entwickler) ist richtig. Ich möchte mich stetig weiterentwickeln und meine Fertigkeiten ausbauen.")

            let question5 = Question(_questionText: "Wie motiviere ich mich selbst zum Coden?", _answer1: "Ich belohne mich selbst für Erfolge", _answer2: "Ich bestrafe mich selbst für Misserfolge", _answer3: "Ich brauche keine Motivation", _correctAnswerTag: 3, _trueAnswerText: "Da das Programmieren für mich keine lästige Arbeit ist, sondern mir Freude bereitet.", _falseAnswerText: "Die dritte Antwort (Ich brauche keine Motivation) ist richtig. Da das Programmieren für mich keine lästige Arbeit ist, sondern mir Freude bereitet.")

            let question6 = Question(_questionText: "Was ist meine größte Stärke?", _answer1: "Lernfähigkeit und Wille etwas zu erreichen", _answer2: "Ich besitze keinerlei Stärken", _answer3: "Ich schaffe es immer, dass der Rauch am Lagerfeuer in meine Richtung zieht", _correctAnswerTag: 1, _trueAnswerText: "Ich bin ständig bemüht mich weiterzuentwickeln, neue Frameworks zu erlernen und die Programmiersprache Swift auszubauen.", _falseAnswerText: "Die erste Antwort (Lernfähigkeit und Wille etwas zu erreichen) ist richtig. Ich bin ständig bemüht mich weiterzuentwickeln, neue Frameworks zu erlernen und die Programmiersprache Swift auszubauen.")

            let question7 = Question(_questionText: "Was ist meine größte Schwäche?", _answer1: "Teamfähigkeit", _answer2: "Englische Sprache", _answer3: "Eigenverantwortliches Arbeiten", _correctAnswerTag: 2, _trueAnswerText: "In Englisch bin ich nicht so gut, lesen und schreiben funktioniert, sprachlich gibt es Defizite. Bin aber dabei den fehlenden Stand durch ständiges Lernen nachzuholen.", _falseAnswerText: "Die zweite Antwort (Englische Sprache) ist richtig. In Englisch bin ich nicht so gut, lesen und schreiben funktioniert, sprachlich gibt es Defizite. Bin aber dabei den fehlenden Stand durch ständiges Lernen nachzuholen.")

            // Question Object to Array
            questionList.append(question1)
            questionList.append(question2)
            questionList.append(question3)
            questionList.append(question4)
            questionList.append(question5)
            questionList.append(question6)
            questionList.append(question7)
        }
    }
}

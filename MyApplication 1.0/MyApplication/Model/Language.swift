//
//  LanguageEn.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 24.06.22.
//

import Foundation
import UIKit

class Language {
    
    static let language = Language()
    var defaultsLanguage = UserDefaults.standard
    
    // Language global
    var LanguageText = ""
    var okText = ""
    var rebootText = ""
    var endText = ""
    var abortText = ""
    var errorText = ""
    var timeText = ""
    var dateText = ""
    
    // InfoDetailAlert
    var projectInfoText = ""
    var infoDetailQuizViewController = ""
    var infoDetailTasksViewController = ""
    var infoDetailTicTacToeViewController = ""
    var infoDetailWeatherViewController = ""
    
    // Title of the ViewController
    var writeToText = ""
    var curriculumVitae = ""
    var attachmentText = ""
    var projectsText = ""
    
    // CoverLetterViewController
    var textOneText = ""
    var textTwoText = ""
    var coverLetterText = ""
    
    // ProjectViewController
    var quiz = ""
    var weather = ""
    var tasks = ""
    var tictactoe = ""
    
    // QuizViewController
    var questionContTextQuestion = ""
    var questionContTextOf = ""
    var scoreText = ""
    var correctText = ""
    var notCorrectText = ""
    var scoreEndText = ""
    var scoreCase1 = ""
    var scoreCase2 = ""
    var scoreCase3 = ""
    var scoreCase4 = ""
    
    // TasksViewController
    var taskText = ""
    var enterTaskText = ""
    var tasksErrorMessageText = ""
    var changeTaskText = ""
    
    // TicTacToeViewController
    var winnerLabelText1 = ""
    var winnerLabelText2 = ""
    var winnerLabelText3 = ""
    var playAgainText = ""
    
    // WeatherViewController
    var cityTextFieldText = ""
    var searchInfoLabelText = ""
    var statusFirstText = ""
    var statusSecondText = ""
    
    // WeatherInfoViewController
    var weatherInfoLabelText = ""
    var sunriseTextLabelText = ""
    var sunsetTextLabelText = ""
    var maxTempTextLabelText = ""
    var minTempTextLabelText = ""
    var luftdruckTextLabelText = ""
    var luftfeuchtigkeitTextLabelText = ""
    var rainTextLabelText = ""
    var windSpeedTextLabelText = ""
    
    
    func selectetLanguage() {
        if (defaultsLanguage.string(forKey: "isLanguage") == "English") {
            
            // Language english
            LanguageText = "English"
            okText = "OK"
            rebootText = "Reboot"
            endText = "End"
            abortText = "Abort"
            errorText = "Error"
            timeText = "Time"
            dateText = "Date"
            
            // InfoDetailAlert
            projectInfoText = "About the project"
            infoDetailQuizViewController = "This is a project that taught me classes and functions. This quiz also offers another opportunity to get to know me better."
            infoDetailTasksViewController = "This is a project that taught me tables and persistent data storage."
            infoDetailTicTacToeViewController = "This is a project that taught me functions and methods."
            infoDetailWeatherViewController = "This is a project that taught me how to get data from the internet. The data from the server is in JSON format."
            
            // Title of the ViewController
            writeToText = "Write to"
            curriculumVitae = "Curriculum Vitae"
            attachmentText = "Attachment"
            projectsText = "Projects"
            
            // CoverLetterViewController
            textOneText = "Application"
            textTwoText = "App developer IOS"
            coverLetterText = """
                        Ladies and Gentlemen

                        I am currently working as an information electronics technician for the Ridacom company. It was there that my skills and abilities as an app developer were recognized.

                        I developed an app for the company with a total of 14.600 lines of code for the documentation that is required there as part of the cooperation with various property management companies.

                        This app includes features such as taking photos of measurement data, which are then automatically inserted into an existing PDF form. Before the app, this data was entered manually in text fields in PDF forms. The automatic entry significantly increased efficiency.

                        This is possible for me because I am continuing to educate myself part-time in the field of programming language (Swift). I see my professional future there. In my current company, further training is not possible for me. I also miss the exchange in the team there. With this application app I want to convince of my qualifications.

                        Sincerely Wilhelm Engeland
                        """
            
            // ProjectViewController
            quiz = "Quiz Game"
            weather = "Weather App"
            tasks = "Tasks App"
            tictactoe = "TicTacToe Game"
            
            // QuizViewController
            questionContTextQuestion = "Question"
            questionContTextOf = "of"
            scoreText = "Score"
            correctText = "Correct"
            notCorrectText = "Not correct"
            scoreEndText = "out of 70 points achieved."
            scoreCase1 = "Repeat the quiz to improve."
            scoreCase2 = "That can definitely be better."
            scoreCase3 = "Great that was very good."
            scoreCase4 = "Congratulations full marks achieved."
            
            // TasksViewController
            taskText = "Task"
            enterTaskText = "Enter task"
            tasksErrorMessageText = "Please enter task"
            changeTaskText = "Change task"
            
            // TicTacToeViewController
            winnerLabelText1 = "Player 1 wins!"
            winnerLabelText2 = "Player 2 wins!"
            winnerLabelText3 = "draw"
            playAgainText = "Play again"
            
            // WeatherViewController
            cityTextFieldText = "Please enter city"
            searchInfoLabelText = "Please enter a city in the text field and start the search !!!"
            statusFirstText = "Today"
            statusSecondText = "The predicted maximum temperature is at"
            
            // WeatherInfoViewController
            weatherInfoLabelText = "Weather information:"
            sunriseTextLabelText = "Sunrise:"
            sunsetTextLabelText = "Sunset:"
            maxTempTextLabelText = "Max temperature:"
            minTempTextLabelText = "Min temperature:"
            luftdruckTextLabelText = "Air pressure:"
            luftfeuchtigkeitTextLabelText = "Humidity:"
            rainTextLabelText = "Probability of rain:"
            windSpeedTextLabelText = "Wind speed:"
            
        } else if (defaultsLanguage.string(forKey: "isLanguage") == "German") {
            
            // Language german
            LanguageText = "Deutsch"
            okText = "OK"
            rebootText = "Neustart"
            endText = "Beenden"
            abortText = "Abbrechen"
            errorText = "Fehler"
            timeText = "Uhrzeit"
            dateText = "Datum"
            
            // InfoDetailAlert
            projectInfoText = "Info zum Projekt"
            infoDetailQuizViewController = "Dies ist ein Projekt mit dem ich Klassen und Funktionen gelernt habe. Dieses Quiz bietet zusätzlich eine weitere Möglichkeit mich näher kennen zu lernen."
            infoDetailTasksViewController = "Dies ist ein Projekt mit dem ich Tabellen und persistente Datenspeicherung gelernt habe."
            infoDetailTicTacToeViewController = "Dies ist ein Projekt mit dem ich Funktionen und Methoden gelernt habe."
            infoDetailWeatherViewController = "Dies ist ein Projekt mit dem ich das Abrufen von Daten aus dem Internet gelernt habe. Die Daten vom Server sind im JSON Format."
            
            // Title of the ViewController
            writeToText = "Anschreiben"
            curriculumVitae = "Lebenslauf"
            attachmentText = "Anhänge"
            projectsText = "Projekte"
            
            // CoverLetterViewController
            textOneText = "Bewerbung"
            textTwoText = "App Entwickler IOS"
            coverLetterText = """
                        Sehr geehrte Damen und Herren,

                        zur Zeit arbeite ich in einem ungekündigten Angestelltenverhältnis bei der Firma Ridacom als Informationselektroniker. Dort wurden meine Fähigkeiten und Fertigkeiten als App-Entwickler erkannt.

                        Ich entwickelte für das Unternehmen eine App mit insgesamt 14.600 Codezeilen für die Dokumentation die dort, im Rahmen der Zusammenarbeit mit verschiedenen Hausverwaltungen, benötigt wird.

                        Diese App beinhaltet Features wie das Abfotografieren von Messdaten, welche dann automatisch in ein vorhandenes PDF Formular eingefügt werden. Diese Daten wurden vor der App händisch per Textfelder in PDF Formulare eingetragen. Durch die automatische Eingabe konnte die Effizienz erheblich gesteigert werden.

                        Dies ist mir möglich, weil ich mich nebenberuflich fortlaufend in dem Bereich Programmiersprache (Swift) weiterbilde. Ich sehe dort meine berufliche Zukunft. In meinem jetzigen Unternehmen ist eine Weiterbildung für mich nicht möglich. Mir fehlt dort auch der Austausch im Team. Mit dieser Bewerbungs App möchte ich von meiner Qualifikation überzeugen.

                        Mit Freundlichen Grüßen Wilhelm Engeland
                        """
            
            // ProjectViewController
            quiz = "Quiz Spiel"
            weather = "Wetter App"
            tasks = "Aufgaben App"
            tictactoe = "TicTacToe Spiel"
            
            // QuizViewController
            questionContTextQuestion = "Frage"
            questionContTextOf = "von"
            scoreText = "Punktzahl"
            correctText = "Richtig"
            notCorrectText = "Falsch"
            scoreEndText = "von 70 Punkten erreicht."
            scoreCase1 = "Wiederhole das Quiz um dich zu verbessern."
            scoreCase2 = "Das geht bestimmt noch besser."
            scoreCase3 = "Super das war sehr gut."
            scoreCase4 = "Glückwunsch volle Punktzahl erreicht."
            
            // TasksViewController
            taskText = "Aufgabe"
            enterTaskText = "Aufgabe eingeben"
            tasksErrorMessageText = "Bitte Aufgabe eingeben"
            changeTaskText = "Aufgabe ändern"
            
            // TicTacToeViewController
            winnerLabelText1 = "Spieler 1 gewinnt!"
            winnerLabelText2 = "Spieler 2 gewinnt!"
            winnerLabelText3 = "unentschieden"
            playAgainText = "Nochmal Spielen"
            
            // WeatherViewController
            cityTextFieldText = "Bitte Stadt eingeben"
            searchInfoLabelText = "Bitte im Textfeld eine Stadt eingeben und die suche Starten !!!"
            statusFirstText = "Heute"
            statusSecondText = "Die vorhergesagte Höchsttemperatur liegt bei"
            
            // WeatherInfoViewController
            weatherInfoLabelText = "Wetterinfos:"
            sunriseTextLabelText = "Sonnenaufgang:"
            sunsetTextLabelText = "Sonnenuntergang:"
            maxTempTextLabelText = "Max Temperatur:"
            minTempTextLabelText = "Min Temperatur:"
            luftdruckTextLabelText = "Lufdruck:"
            luftfeuchtigkeitTextLabelText = "Luftfeuchtigkeit:"
            rainTextLabelText = "Regenwahrscheinlichkeit:"
            windSpeedTextLabelText = "Windgeschwindigkeit:"
        }
    }
}

//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Руслан Шигапов on 08.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        emojiLabel.text = "Вы - \(getAnimal(from: answersChosen).rawValue)"
        textLabel.text = getAnimal(from: answersChosen).definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getAnimal(from answers: [Answer]) -> Animal {
        var animals: [Animal] = []

        for answer in answers {
            animals.append(answer.animal)
        }

        return animals.sorted { $0.rawValue.count > $1.rawValue.count }.last ?? .cat
    }
}

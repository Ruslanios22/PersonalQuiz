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
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }

        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        emojiLabel.text = "Вы - \(animal.rawValue)!"
        textLabel.text = animal.definition
    }
}

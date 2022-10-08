//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Руслан Шигапов on 08.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

//
//  SurveyViewController.swift
//  LibraFinalVersion
//
//  Created by Hiệp Nguyễn on 23/10/2021.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var notAtAllButton: UIButton!
    @IBOutlet weak var severalDaysButton: UIButton!
    @IBOutlet weak var moreThanHalfButton: UIButton!
    @IBOutlet weak var nearlyEveryDayButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var surveyQuestionDataReal = surveyQuestionData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        surveyQuestionDataReal.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        if surveyQuestionDataReal.getProgress() == 0.8{
            performSegue(withIdentifier: "go", sender: self)
        }else{
        questionLabel.text = surveyQuestionDataReal.getQuestionText()
        progressBar.progress = surveyQuestionDataReal.getProgress()
        notAtAllButton.backgroundColor = UIColor.clear
        severalDaysButton.backgroundColor = UIColor.clear
        moreThanHalfButton.backgroundColor = UIColor.clear
        nearlyEveryDayButton.backgroundColor = UIColor.clear
      }
    }
    

}

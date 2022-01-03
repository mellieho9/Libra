//
//  InitialCheckupVC.swift
//  LibraFinalVersion
//
//  Created by Vivaan Baid on 23/10/21.
//

import Foundation
import UIKit

class InitialCheckupVC: UIViewController{
    
    @IBOutlet weak var TakeQuestionnaire: UIButton!
    
    
    @IBAction func TakeQuestionnaireTapped(_ sender: Any) {
        //segue to survey screen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI(){
        TakeQuestionnaire.layer.cornerRadius = 15.0
        
    }
}

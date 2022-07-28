//
//  ViewController.swift
//  LibraFinalVersion
//
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nametxtFiled: UITextField!
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    
    @IBOutlet weak var NextTapped: UIButton!
    
    
    @IBAction func nextTappedAction(_ sender: Any) {
        if nametxtFiled.text != nametxtFiled.placeholder && emailTxtField.text != emailTxtField.placeholder {
            performSegue(withIdentifier: K.IntroToIntialcheckupVC, sender: self)
        }else{
            //shows an alert saying fill out all the fields
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

           //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
           //tap.cancelsTouchesInView = false

           view.addGestureRecognizer(tap)
               
     }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func setupUI(){
        NextTapped.layer.cornerRadius = 15.0
    }
     
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
   



}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}


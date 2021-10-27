//
//  ViewController.swift
//  LogIn
//
//  Created by Alik Nigay on 27.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var login: String!
    var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.text = login ?? ""
        passwordTF.text = password ?? ""
    }
    
    
    @IBAction func loginButtonPressed() {
        if loginTF.text == "User" && passwordTF.text == "123456" {
            performSegue(withIdentifier: "logIn", sender: self)
        } else {
            showAlert()
        }
    }
    
    @IBAction func loginHint(_ sender: UIButton) {
        showAlertHint("Ooops", description: "The user name is User", loginTF, "User")
    }
    
    
    @IBAction func passwordHint() {
        showAlertHint("Password", description: "The user password is 123456", passwordTF, "123456")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "logIn" else { return }
        
        let welcomeVC = segue.destination as! WelcomeViewController
        
        welcomeVC.textForLabel = "Welcome \(loginTF.text!) 🖐"
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "logOut" else { return }
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlertHint(_ title: String, description: String, _ field: UITextField, _ action: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let insert = UIAlertAction(title: "Insert", style: .default) { _ in
            field.text = action
        }
        let cancel = UIAlertAction(title: "Calcel", style: .cancel)
        alert.addAction(insert)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Invalid login or password", message: "Please, enter correct login and password ", preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

//MARK: - Work with keyboard

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        passwordTF.becomeFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

}


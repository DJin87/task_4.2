//
//  ViewController.swift
//  task_4.2
//
//  Created by DJin on 12/12/2020.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - IB Outlet
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    
    private let userName = "User"
    private let password = "Password"
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.identifier as? MainMyView else { return }
        dvc.userName = nameTextField.text
    }
    
    
    @IBAction func logInAction(_ sender: UIButton) {
    guard
            nameTextField.text == userName,
            passwordTextField.text == password
        else {
            showAlert(title: "Incorrect login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTextField)
            return
        }
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func forgotUserName() {
        showAlert(title: "Упс, а логин-то неверный",
                  message: "Your login is: \(userName)")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Забыл пароль? Ну как так-то",
                  message: "Your password is: \(password)")
    }

    
    @IBAction func logOffAction(segue: UIStoryboardSegue) {
        nameTextField.text = "Text"
        passwordTextField.text = "Password"
    }
    
}
    
    
    

extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            //logInAction()
        }
        return true
    }
}

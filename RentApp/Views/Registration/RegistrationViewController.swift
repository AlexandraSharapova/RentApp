//
//  RegistrationViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 05.12.2020.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController, RegistrationViewProtocol, UICollectionViewDelegateFlowLayout {
    func setView() {
        print("")
    }
    
    var presenter: RegistrationPresenterProtocol!
    let configurator: RegistrationConfiguratorProtocol = RegistrationConfigurator()
    
    let screenTitle: UITextView = {
        let title = UITextView()
        title.text = "Rent App"
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor(r: 20, g: 3, b: 22, a: 1)
        title.font = UIFont.boldSystemFont(ofSize: 70)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let loginContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 193, g: 191, b: 194, a: 0.7)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Ваш email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Придумайте пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textfield.isSecureTextEntry = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    //переделать в список либо добавить проверку
    let ageTextField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Ваш возраст", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textfield.isSecureTextEntry = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    let emailfieldSeparator: UIView = {
        let fieldSeparator = UIView()
        fieldSeparator.backgroundColor = UIColor(r: 69, g: 69, b: 69, a: 1)
        fieldSeparator.translatesAutoresizingMaskIntoConstraints = false
        return fieldSeparator
    }()
    
    let passwordfieldSeparator: UIView = {
        let fieldSeparator = UIView()
        fieldSeparator.backgroundColor = UIColor(r: 69, g: 69, b: 69, a: 1)
        fieldSeparator.translatesAutoresizingMaskIntoConstraints = false
        return fieldSeparator
    }()
    
    let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.backgroundColor = UIColor(r: 193, g: 191, b: 194, a: 0.8)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let loginTextField: UILabel = {
        let title = UILabel()
        title.text = "Уже есть аккаунт?"
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor(r: 20, g: 3, b: 22, a: 1)
        title.font = UIFont.boldSystemFont(ofSize: 12)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let logButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(handleLogButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    configurator.configure(with: self)
    presenter.configureView()
    setbackgroundImage()
    self.view.addSubview(loginContainerView)
    self.view.addSubview(registrationButton)
    self.view.addSubview(loginTextField)
    self.view.addSubview(logButton)
    self.view.addSubview(screenTitle)
    setupRegisterComponents()
    }
    
    func setupRegisterComponents() {
        loginContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loginContainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -24).isActive = true
        loginContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        loginContainerView.addSubview(nameTextField)
        loginContainerView.addSubview(passwordTextField)
        loginContainerView.addSubview(ageTextField)
        loginContainerView.addSubview(emailfieldSeparator)
        loginContainerView.addSubview(passwordfieldSeparator)
        
        nameTextField.topAnchor.constraint(equalTo: loginContainerView.topAnchor, constant: 8).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: loginContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 3).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: loginContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        ageTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true
        ageTextField.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor).isActive = true
        ageTextField.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
        ageTextField.heightAnchor.constraint(equalTo: loginContainerView.heightAnchor, multiplier: 1/3).isActive = true
        ageTextField.bottomAnchor.constraint(equalTo: loginContainerView.bottomAnchor, constant: 8).isActive = true
        
        emailfieldSeparator.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailfieldSeparator.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor).isActive = true
        emailfieldSeparator.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        emailfieldSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passwordfieldSeparator.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        passwordfieldSeparator.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor).isActive = true
        passwordfieldSeparator.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        passwordfieldSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        registrationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        registrationButton.topAnchor.constraint(equalTo: loginContainerView.bottomAnchor, constant: 12).isActive = true
        registrationButton.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 10).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: registrationButton.leftAnchor).isActive = true
        loginTextField.widthAnchor.constraint(equalTo: registrationButton.widthAnchor).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        logButton.leftAnchor.constraint(equalTo: loginTextField.rightAnchor, constant: -110).isActive = true
        logButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        logButton.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 10).isActive = true
        
        screenTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        screenTitle.bottomAnchor.constraint(equalTo: loginContainerView.topAnchor).isActive = true
        screenTitle.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
        screenTitle.heightAnchor.constraint(equalToConstant: 150).isActive = true

    }
    
    @objc
    func handleRegistration(){
        guard let email = nameTextField.text, let password = passwordTextField.text, let age = ageTextField.text else {
            print("error")
            return
        }
        presenter.registration(email: email, password: password, age: age)
        
        
    }
    
    @objc
    func handleLogButton() {
        presenter.backAction()
    }
    private func setbackgroundImage() {
        let background = UIImage(named: "backgound.jpg")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}

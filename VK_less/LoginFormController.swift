//
//  LoginFormController.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 15.03.2022.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginTextLabel: UILabel!
    @IBOutlet weak var passwordTextLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var isAnimating = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:  Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        //MARK:  Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    @IBAction func EnterPressed(_ sender: Any) {
        UIImageView.animate(withDuration: 0.2, delay: 0, options: [.autoreverse], animations: {
            self.logoImageView.transform = .init(scaleX: 2.1, y: 2.1)
        }, completion: { _ in
            self.logoImageView.transform = .identity
        })
    }
    
    //MARK:  Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        //MARK:  Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0,
                                         left: 0.0,
                                         bottom: kbSize.height,
                                         right: 0.0)
        
        //MARK:  Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //MARK: Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        //MARK:  Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK:  Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        //MARK:  Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //MARK:  Проверяем данные
        let checkResult = checkUserData()
        //MARK: Если данные не верны, покажем ошибку
        if !checkResult { showLoginError()
        }
        //MARK: Вернем результат
        return checkResult }
    func checkUserData() -> Bool {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return false }
        if login == "Логин" && password == "123456" { return true
        } else {
            return false
        }
    }
    
    func showLoginError() { //MARK:  Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Ваш логин или пароль содержат ошибку", preferredStyle: .alert)
        loginTextLabel.textColor = .red
        loginTextLabel.text = "Ошибка"
        passwordTextLabel.textColor = .red
        passwordTextLabel.text = "Ошибка"
        //MARK:  Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil) //MARK:  Добавляем кнопку на UIAlertController
        
        alter.addAction(action)
        //MARK:  Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
}


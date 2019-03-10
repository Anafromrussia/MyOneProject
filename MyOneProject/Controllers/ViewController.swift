//
//  ViewController.swift
//  MyOneProject
//
//  Created by Anastasia Gayvoronskaya on 08/03/2019.
//  Copyright © 2019 Anastasia Gayvoronskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //регистрация полей
    @IBOutlet weak var Login: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    //ф-ция смены цветов
    @IBAction func recolor(_ sender: UIButton) {
        //получение рандомного числа для составление RGB значения
        let red = CGFloat.random(in: 0.0...255.0) / 255.0
        let blue = CGFloat.random(in: 0.0...255.0) / 255.0
        let green = CGFloat.random(in: 0.0...255.0) / 255.0
        
        //применение рандомного цвета
        self.view.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    // переход на второй контроллер с передачей цвета
    @IBAction func auth(_ sender: UIButton) {
        //проверка инициализированного контроллера
        if let vc = UIStoryboard.init(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "two") as? TwoController {
            //передача цвета на второй контроллер
            vc.colorBG = self.view.backgroundColor
            //добавление анимации перехода на второй контроллер
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    //ф-ция скрытия пароля
    @IBAction func hiddenPassword(_ sender: UIButton) {
        if Password.isSecureTextEntry == true {
            Password.isSecureTextEntry = false
        }
        else {
            Password.isSecureTextEntry = true
        }
    }
}


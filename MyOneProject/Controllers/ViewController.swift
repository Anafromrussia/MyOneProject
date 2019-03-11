//
//  ViewController.swift
//  MyOneProject
//
//  Created by Anastasia Gayvoronskaya on 08/03/2019.
//  Copyright © 2019 Anastasia Gayvoronskaya. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //Пробуем коммит
    //регистрация полей
    @IBOutlet weak var Login: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var label: UILabel!
    
    //ф-ция смены цветов
    @IBAction func recolor(_ sender: UIButton) {
        //получение рандомного числа для составление RGB значения
        let red = CGFloat.random(in: 0.0...255.0) / 255.0
        let blue = CGFloat.random(in: 0.0...255.0) / 255.0
        let green = CGFloat.random(in: 0.0...255.0) / 255.0
        
        //применение рандомного цвета
        self.view.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    @IBAction func json(_ sender: UIButton) {
        //ссылка на сервер
        guard let url = URL.init(string: "http://127.0.0.1:8000/auth") else {fatalError("Error url")}
        //параметры  которые мы отправляем (берем их из наших полей)
        let requestJSON = ["username":self.Login.text!,"password":self.Password.text!]
        //отправляем post запрос и получает response
        Alamofire.request(url, method: .post, parameters: requestJSON).responseJSON { (response) in
            //сохраняем response в константу и далее работаем с ней
            if let json = response.data {
                //print("JSON: \(json)")
                //извлекаем данные и загоняем их в массив
                if let j = try? JSONSerialization.jsonObject(with: json) as? NSDictionary  {
                    if let answer = j?["answer"] as? NSDictionary {
                        if let status = answer["status"] as? String, let message = answer["message"] as? String {
                            //вывод в консоль
                            print("status: \(status), message: \(message)")
                            //вывод в label
                            self.label.text = "status: " + "\(status) \n" + "message:" + "\(message)"
                        }
                    }
                }
            }
        }
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


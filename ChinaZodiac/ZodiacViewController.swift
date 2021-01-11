//
//  ZodiacViewController.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 11.01.2021.
//

import UIKit

class ZodiacViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//        @IBOutlet weak var yearEdit: UITextField!
//        @IBOutlet weak var findButton: UIButton!
        
        let znakZodiac = ["Козерог", "Водолей", "Рыбы", "Овен", "Телец", "Близнецы", "Рак", "Лев", "Дева", "Весы", "Скорпион", "Стрелец"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = "Знаки Зодиака"
            navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return znakZodiac.count // количество элементов массива
            // сколько раз вызывается функция следующая
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // заполняем список знаками
            let cell = tableView.dequeueReusableCell(withIdentifier: "ZnakCell", for: indexPath)
            let znak = znakZodiac[indexPath.row] // получаем элемент массива
            cell.textLabel?.text = znak // заголовок экрана - название знака
            cell.textLabel?.font = UIFont(name: "Palatino", size: 25) // шрифт списка
            let imageName = "z\(indexPath.row+1).png" // имя картинки - порядковый номер
            let image = UIImage(named: imageName)
            cell.imageView?.image = image
            cell.imageView?.clipsToBounds = true // обрезаем картинку согласно слою Layer
            cell.imageView?.layer.cornerRadius = 27 // скругляем углы
            cell.imageView?.layer.borderWidth = 1 // толщина рамки
            cell.imageView?.layer.borderColor = UIColor.black.cgColor // цвет рамки
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let detailZodiacViewController = storyboard.instantiateViewController(identifier: "MonthDetail") as! DetailZodiacViewController // при нажатии открываем подробный экран
            
            let znak = znakZodiac[indexPath.row] // получаем элемент массива
            
            detailZodiacViewController.znak = znak // передаем его на новый экран
            detailZodiacViewController.number = indexPath.row + 1

            view.endEditing(true) // убираем клавиатуру
//            yearEdit.text = "" // обнуляем год в поле ввода
            navigationController?.pushViewController(detailZodiacViewController, animated: true)
        }
        
        
        @IBAction func onFindButtonClick(_ sender: Any) {
//            let storyboard = UIStoryboard(name: "Main", bundle: .main)
//            let detailViewController = storyboard.instantiateViewController(identifier: "YearDetail") as! DetailViewController // при нажатии открываем подробный экран
            
//            guard let year = Int(yearEdit.text ?? "") else {return}
//            let numAnimal = year % 12 // узнаем номер животного для введенного года
//            let animal = znakZodiac[numAnimal] // получаем элемент массива
            
//            detailViewController.animal = animal // передаем его на новый экран
//            detailViewController.number = numAnimal + 1
//            detailViewController.year = year

//            view.endEditing(true) // убираем клавиатуру
//            yearEdit.text = "" // обнуляем год в поле ввода
//            navigationController?.pushViewController(detailViewController, animated: true)
        }
        

    }

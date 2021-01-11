//
//  ChinaViewController.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 05.01.2021.
//

import UIKit



class ChinaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var yearEdit: UITextField!
    @IBOutlet weak var findButton: UIButton!
    
    let animalsZodiac = ["Обезьяна", "Петух", "Собака", "Свинья (Кабан)", "Крыса (Мышь)", "Бык", "Тигр", "Кролик (Кот)", "Дракон", "Змея", "Лошадь", "Коза (Овца)"]
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        // вызывается когда пользователь коснулся экрана
//        super.touchesBegan(touches, with: event)
//        view.endEditing(true) // убираем клавиатуру
//        print(#line, #function)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Символы года"
        navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
        //yearEdit.layer.cornerRadius = 10
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsZodiac.count // количество элементов массива
        // сколько раз вызывается функция следующая
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // заполняем список животными
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
        let animal = animalsZodiac[indexPath.row] // получаем элемент массива
        cell.textLabel?.text = animal // заголовок экрана - название животного
        cell.textLabel?.font = UIFont(name: "Palatino", size: 25) // шрифт списка
        //cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
                                  
//        guard let palatino = UIFont(name: "Palatino", size: 18) else {
//            fatalError("""
//                Failed to load the "Palatino" font.
//                """
//            )
//        }
//        cell.textLabel?.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: palatino)
//        cell.textLabel?.adjustsFontForContentSizeCategory = true
        
        let imageName = "\(indexPath.row+1).png" // имя картинки - порядковый номер
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
        let detailViewController = storyboard.instantiateViewController(identifier: "YearDetail") as! DetailViewController // при нажатии открываем подробный экран
        
        let animal = animalsZodiac[indexPath.row] // получаем элемент массива
        
        detailViewController.animal = animal // передаем его на новый экран
        detailViewController.number = indexPath.row + 1
        detailViewController.year = detailViewController.firstYear + indexPath.row

        view.endEditing(true) // убираем клавиатуру
        yearEdit.text = "" // обнуляем год в поле ввода
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
    @IBAction func onFindButtonClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let detailViewController = storyboard.instantiateViewController(identifier: "YearDetail") as! DetailViewController // при нажатии открываем подробный экран
        
        guard let year = Int(yearEdit.text ?? "") else {return}
        let numAnimal = year % 12 // узнаем номер животного для введенного года
        let animal = animalsZodiac[numAnimal] // получаем элемент массива
        
        detailViewController.animal = animal // передаем его на новый экран
        detailViewController.number = numAnimal + 1
        detailViewController.year = year

        view.endEditing(true) // убираем клавиатуру
        yearEdit.text = "" // обнуляем год в поле ввода
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    

}

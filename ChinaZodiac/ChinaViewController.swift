//
//  ChinaViewController.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 05.01.2021.
//

import UIKit



class ChinaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var animalsZodiac = ["Обезьяна", "Петух", "Собака", "Свинья (Кабан)", "Крыса (Мышь)", "Бык", "Тигр", "Кролик (Кот)", "Дракон", "Змея", "Лошадь", "Коза (Овца)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Символы года"
        navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsZodiac.count // количество элементов массива players
        // сколько раз вызывается функция следующая
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        detailViewController.number = indexPath.row+1
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
//        detailViewController.image = cell.imageView?.image
//
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

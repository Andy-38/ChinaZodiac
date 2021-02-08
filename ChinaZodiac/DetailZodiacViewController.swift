//
//  DetailZodiacViewController.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 11.01.2021.
//

import UIKit

class DetailZodiacViewController: UIViewController {
    @IBOutlet weak var znakImageView: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    
    let znakDate = ["23 декабря – 20 января", "21 января – 19 февраля", "20 февраля – 20 марта", "21 марта – 20 апреля", "21 апреля – 21 мая", "22 мая – 21 июня", "22 июня – 22 июля", "23 июля – 21 августа", "22 августа – 23 сентября", "24 сентября – 23 октября", "24 октября – 22 ноября", "23 ноября – 22 декабря"] // массив дат
    
    var znak  : String = "" // название знака
    var number: Int = 0 // порядковый номер в списке
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = znak
        navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
        let imageName = "z\(number).png"
        let image = UIImage(named: imageName) // грузим картинку из файла
        let sizeOfImage = view.frame.midX // размер картинки - половина экрана
        znakImageView.image = image?.resize(sizeOfImage,sizeOfImage) // изменяем размер
        
        znakImageView.clipsToBounds = true // обрезаем картинку согласно слою Layer
        znakImageView.layer.cornerRadius = sizeOfImage / 2 // скругляем углы
        znakImageView.layer.borderWidth = 2 // толщина рамки
        znakImageView.layer.borderColor = UIColor.blue.cgColor // цвет рамки
        
        dataLabel.text = znakDate[number - 1] // выводим дату для знака
    }
    
}

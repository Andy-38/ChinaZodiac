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
    var znakZodiacModel: ZnakZodiacModel = ZnakZodiacModel() // модель для работы со знаками Зодиака
    
    var znak  : String = "" // название знака
    var number: Int = 0 // порядковый номер в списке
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = znak // заголовок
        navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
        
        let imageName = znakZodiacModel.getImageName(index: number) // получаем путь к картинке по номеру
        let image = UIImage(named: imageName) // грузим картинку из файла
        let sizeOfImage = view.frame.midX // размер картинки - половина экрана
        znakImageView.image = image?.resize(sizeOfImage,sizeOfImage) // изменяем размер
        znakImageView.clipsToBounds = true // обрезаем картинку согласно слою Layer
        znakImageView.layer.cornerRadius = sizeOfImage / 2 // скругляем углы
        znakImageView.layer.borderWidth = 2 // толщина рамки
        znakImageView.layer.borderColor = UIColor.blue.cgColor // цвет рамки
        
        let znakText = znakZodiacModel.znakDate[safe: number]
        dataLabel.text = znakText ?? "Знаков Зодиака всего 12"// выводим дату для знака
        
    }
    
}

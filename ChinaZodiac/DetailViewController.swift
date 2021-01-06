//
//  DetailViewController.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 06.01.2021.
//

import UIKit

extension UIImage { // дополнительная функция для изменения размера изображения
    func resize(_ width: CGFloat, _ height:CGFloat) -> UIImage? {
        let widthRatio  = width / size.width
        let heightRatio = height / size.height
        let ratio = widthRatio > heightRatio ? heightRatio : widthRatio
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

class DetailViewController: UIViewController {

    var animal : String = "" // название животного
    var number: Int = 0 // порядковый номер в списке
    let firstYear: Int = 2016 // первый ближайщий год обезьяны
    var year = 2016 // центральный год на экране
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var yearImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = animal
        navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
        let imageName = "\(number).png"
        let image = UIImage(named: imageName) // грузим картинку из файла
        let sizeOfImage = view.frame.midX // размер картинки - половина экрана
        yearImageView.image = image?.resize(sizeOfImage,sizeOfImage) // изменяем размер
        
        yearImageView.clipsToBounds = true // обрезаем картинку согласно слою Layer
        yearImageView.layer.cornerRadius = sizeOfImage / 2 // скругляем углы
        yearImageView.layer.borderWidth = 1 // толщина рамки
        yearImageView.layer.borderColor = UIColor.black.cgColor // цвет рамки
        //year = firstYear + number - 1
        yearLabel.text = String(year) // основной год
        //let width = 100
        //let height = 20
        //yearLabel.frame = CGRect(x: Int(view.frame.midX) - width/2, y: Int(view.frame.maxY) - height - 100, width: width, height: height)
        //yearLabel.frame.
  
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

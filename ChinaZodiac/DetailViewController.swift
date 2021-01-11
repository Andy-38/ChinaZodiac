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

class DetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let maxYears = 10 // максимальное количество посчитанных лет для выбранного животного в одну сторону (прошлое/будущее)
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // количество крутящихся "барабанов"
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxYears * 2 + 1 // количество элементов в каждом "барабане"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { // содержимое строк в "барабане"
        return String(years[row]) // заполняем строки годами
    }
    
    

    var animal : String = "" // название животного
    var number: Int = 0 // порядковый номер в списке
    let firstYear: Int = 2016 // первый ближайщий год обезьяны
    var year = 2016 // центральный год на экране
    var years = [Int] () // массив годов для выбранного животного
    
    @IBOutlet weak var yearImageView: UIImageView!
    @IBOutlet weak var yearPickerView: UIPickerView!
    
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
        //yearLabel.text = String(year) // основной год
        //let width = 100
        //let height = 20
        //yearLabel.frame = CGRect(x: Int(view.frame.midX) - width/2, y: Int(view.frame.maxY) - height - 100, width: width, height: height)
        //yearLabel.frame.
        
        // заполняем массив годов
        for i in 0...maxYears - 1 {
            years.append(year + 12 * (i - maxYears))
        } // года до текущего
        years.append(year) // текущий год
        for i in 0...maxYears - 1 {
            years.append(year + 12 * (i + 1))
        } // года после текущего
        
        yearPickerView.dataSource = self
        yearPickerView.delegate = self
        
        yearPickerView.selectRow(maxYears, inComponent: 0, animated: true) // выбираем текущий год в "барабане"
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

//
//  DetailViewController.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 06.01.2021.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var zodiacModel : ZodiacModel = ZodiacModel() // модель для работы с животными по китайскому календарю
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // количество крутящихся "барабанов"
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return zodiacModel.numberOfElements // количество элементов в каждом "барабане"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { // содержимое строк в "барабане"
        return String(zodiacModel.years[row]) // заполняем строки годами
    }
    
    var animal: String = "" // название животного
    var number: Int = 0     // порядковый номер в списке
    var year:   Int = 0     // центральный год на экране
    
    @IBOutlet weak var yearImageView: UIImageView!
    @IBOutlet weak var yearPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = animal //заголовок экрана - выбранное животное
        navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
        
        let imageName = zodiacModel.getImageName(index: number) // путь к картинке
        let image = UIImage(named: imageName) // грузим картинку из файла
        let sizeOfImage = view.frame.midX // размер картинки - половина экрана
        yearImageView.image = image?.resize(sizeOfImage,sizeOfImage) // изменяем размер
        yearImageView.clipsToBounds = true // обрезаем картинку согласно слою Layer
        yearImageView.layer.cornerRadius = sizeOfImage / 2 // скругляем углы
        yearImageView.layer.borderWidth = 1 // толщина рамки
        yearImageView.layer.borderColor = UIColor.black.cgColor // цвет рамки
        
        // заполняем массив годов
        zodiacModel.getYearsArray(year: year)
        
        yearPickerView.dataSource = self // источник данных
        yearPickerView.delegate = self // делегат
        
        yearPickerView.selectRow(zodiacModel.maxYears, inComponent: 0, animated: true) // выбираем текущий год в "барабане"
    }
}

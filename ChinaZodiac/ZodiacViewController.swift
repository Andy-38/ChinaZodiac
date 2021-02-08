//
//  ZodiacViewController.swift
//  ChinaZodiac
//
//  Created by Andy Dvoytsov on 11.01.2021.
//

import UIKit

class ZodiacViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let znakZodiacModel : ZnakZodiacModel = ZnakZodiacModel() // модель для работы с животными по китайскому календарю
    let datePicker = UIDatePicker() // для ввода даты
    
    @IBOutlet weak var znakEdit: UITextField!
    @IBOutlet weak var findButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = znakZodiacModel.name // заголовок экрана
        navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
       
        znakEdit.inputView = datePicker // датапикер - источник данных для текстового поля
        datePicker.datePickerMode = .date
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: true)
        znakEdit.inputAccessoryView = toolbar
    }
    
    @objc func doneAction() {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return znakZodiacModel.znakZodiac.count // количество элементов массива
        // сколько раз вызывается функция следующая
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // заполняем список знаками
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZnakCell", for: indexPath)
        let znak = znakZodiacModel.znakZodiac[safe: indexPath.row] // получаем элемент массива
        cell.textLabel?.text = znak // заголовок экрана - название знака
        cell.textLabel?.font = UIFont(name: "Palatino", size: 25) // шрифт списка
        
        let imageName = znakZodiacModel.getImageName(index: indexPath.row) // путь к картинке знака Зодиака
        let image = UIImage(named: imageName)
        cell.imageView?.image = image
        cell.imageView?.clipsToBounds = true // обрезаем картинку согласно слою Layer
        cell.imageView?.layer.cornerRadius = 27 // скругляем углы
        cell.imageView?.layer.borderWidth = 1 // толщина рамки
        cell.imageView?.layer.borderColor = UIColor.black.cgColor // цвет рамки
        return cell
    }
    
    func showDetail(number: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let detailZodiacViewController = storyboard.instantiateViewController(identifier: "MonthDetail") as! DetailZodiacViewController // при нажатии открываем подробный экран
        let znak = znakZodiacModel.znakZodiac[safe: number] // получаем элемент массива
        detailZodiacViewController.znak = znak ?? "" // передаем его на новый экран
        detailZodiacViewController.number = number
        
        view.endEditing(true) // убираем клавиатуру
        znakEdit.text = "" // обнуляем знак в поле ввода
        navigationController?.pushViewController(detailZodiacViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetail(number: indexPath.row)
    }
    
    func getUserDate() { // узнаем дату, введенную пользователем
        
    }
    
    @IBAction func onFindButtonClick(_ sender: Any) {
        getUserDate()
        let number = znakZodiacModel.getZnakByDate()
        showDetail(number: number)
    }
    
}

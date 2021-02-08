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
    let zodiacModel : ZodiacModel = ZodiacModel() // модель для работы с животными по китайскому календарю
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = zodiacModel.name // заголовок экрана
        navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zodiacModel.animalsZodiac.count // количество элементов массива
        // сколько раз вызывается функция следующая
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // заполняем список животными
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
        let animal = zodiacModel.animalsZodiac[indexPath.row] // получаем элемент массива
        cell.textLabel?.text = animal // заголовок экрана - название животного
        cell.textLabel?.font = UIFont(name: "Palatino", size: 25) // шрифт списка
        
        let imageName = zodiacModel.getImageName(index: indexPath.row) // путь к картинке
        let image = UIImage(named: imageName)
        cell.imageView?.image = image
        cell.imageView?.clipsToBounds = true // обрезаем картинку согласно слою Layer
        cell.imageView?.layer.cornerRadius = 27 // скругляем углы
        cell.imageView?.layer.borderWidth = 1 // толщина рамки
        cell.imageView?.layer.borderColor = UIColor.black.cgColor // цвет рамки
        return cell
    }
    
    func showDetail(number: Int, year: Int ) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let detailViewController = storyboard.instantiateViewController(identifier: "YearDetail") as! DetailViewController // при нажатии открываем подробный экран
        
        let animal = zodiacModel.animalsZodiac[number] // получаем элемент массива
        
        detailViewController.animal = animal // передаем его на новый экран
        detailViewController.number = number
        detailViewController.year = year

        view.endEditing(true) // убираем клавиатуру
        yearEdit.text = "" // обнуляем год в поле ввода
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // при выборе животного из списка - открываем детальный экран
        let number = indexPath.row
        let year = zodiacModel.getNearestYear(offset: indexPath.row) // узнаем ближайщий год для выбранного животного
        showDetail(number: number, year: year)
    }
    
    
    @IBAction func onFindButtonClick(_ sender: Any) { // поиск по году

        guard let year = Int(yearEdit.text ?? "") else {return}
        let numAnimal = zodiacModel.getAnimalNumByYear(year: year) // узнаем номер животного для введенного года
        showDetail(number: numAnimal, year: year)
    }
    

}

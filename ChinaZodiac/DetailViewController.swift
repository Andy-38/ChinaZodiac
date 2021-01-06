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

    var animal : String = ""
    var number: Int = 0
    //var image: UIImage?
    
    @IBOutlet weak var yearImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = animal
        navigationController?.navigationBar.prefersLargeTitles = true // большие заголовки
        let imageName = "\(number).png"
        let image = UIImage(named: imageName)
        let sizeOfImage = view.frame.midX
        yearImageView.image = image?.resize(sizeOfImage,sizeOfImage)
        
        //yearImageView.image = yearImageView.image?.resize(200,200)
        
        //yearImageView.image?.size.
//        positionLabel.text = player?.position
//        heightLabel.text = player?.height
//        teamButton.setTitle(player?.team.fullName, for: .normal)
  
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

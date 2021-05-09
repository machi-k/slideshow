//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 河村万智 on 2021/05/06.
//

import UIKit

class ResultViewController: UIViewController {

    // スライドショーさせる画像の配列を宣言
        var imageArray:[UIImage] = [
            UIImage(named: "a1")!,
            UIImage(named: "b1")!,
            UIImage(named: "c1")!,
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

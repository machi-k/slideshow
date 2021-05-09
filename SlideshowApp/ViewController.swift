//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 河村万智 on 2021/04/25.
//

import UIKit

class ViewController: UIViewController {
  
    //画像表示
    

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var imagename: UIImageView!
    
    
    // 配列に指定するindex番号を宣言
        var nowIndex:Int = 0

    // スライドショーに使用するタイマーを宣言
        var timer: Timer!
    
    // スライドショーさせる画像の配列を宣言
        var imageArray:[UIImage] = [
            UIImage(named: "a1")!,
            UIImage(named: "b1")!,
            UIImage(named: "c1")!,
            ]
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

        // indexの画像をstoryboardの画像にセットす
       imagename.image = imageArray[nowIndex]
    }
    
   
    // 再生ボタンを押した時の処理
    @IBAction func start(_ sender: Any) {
    
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装

            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            // ボタンの名前を停止に変える
            start.setTitle("停止", for: .normal)

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直しておく
            start.setTitle("停止", for: .normal)
        }
    }
        

        @objc func changeImage() {
            // indexを増やして表示する画像を切り替える
            nowIndex += 1

            // indexが表示予定の画像の数と同じ場合
            if (nowIndex == imageArray.count) {
                // indexを一番最初の数字に戻す
                nowIndex = 0
            }
           
        }
    //画像タップすると動く画像
   
    //遷移先にタップで移動したい。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as!
            ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
       resultViewController.image = imageArray.image!
    }
        //進むボタン
    @IBAction func susumu(_ sender: Any) {
        // 表示している画像の番号を1減らす
               dispImageNo -= 1

               // 表示している画像の番号を元に画像を表示する
               displayImage()
    }
        //戻るボタン
    @IBAction func modoru(_ sender: Any) {
        // 表示している画像の番号を1増やす
                dispImageNo += 1

                // 表示している画像の番号を元に画像を表示する
                displayImage()
    }
    /// 表示している画像の番号
        var dispImageNo = 0

        /// 表示している画像の番号を元に画像を表示する
        func displayImage() {

            // 画像の名前の配列
            let imageNameArray = [
                "a1",
                "b1",
                "c1",
            ]
            // 画像の番号が正常な範囲を指しているかチェック

                 // 範囲より下を指している場合、最後の画像を表示
                 if dispImageNo < 0 {
                     dispImageNo = 2
                 }

                 // 範囲より上を指している場合、最初の画像を表示
                 if dispImageNo > 2 {
                     dispImageNo = 0
                 }
            // 表示している画像の番号から名前を取り出し
            let name = imageNameArray[dispImageNo]

            // 画像を読み込み
            let image = UIImage(named: name)

            // Image Viewに読み込んだ画像をセット
            imagename.image = image
        }
    
    let image = UIImage(named: "a1")
            imagename.image = image
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }


//
//  ViewController.swift
//  MCWeatherApp
//
//  Created by 高橋岳宏 on 2017/04/14.
//  Copyright © 2017年 takehiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // スプラッシュ画像
    @IBOutlet weak var weatherImage: UIImageView!
    
    // ラベル
    @IBOutlet weak var tempLabel: UILabel!
    
    // チェックボタン
    @IBOutlet weak var checkButton: UIButton!
    
    // APIリクエストや、レスポンスデータを利用するためのクラスインスタンス
    let dataManager = WeatherDataManager()
    

    // 画面が表示されたときの処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ここでAPIリクエストを行う
        self.dataManager.dataRequest()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    // ここでチェックボタンを押して離したときの挙動
    @IBAction func checkButtonTapped(_ sender: Any) {
        // お天気API 返却値によって画像を変更する条件式
        if dataManager.weatherData?.weather == "Clouds" {
            // 「Clouds」だったら「曇り」 画像を表示する
            weatherImage.image = UIImage(named: "cloud")
        } else if dataManager.weatherData?.weather == "Clear" {
            // 「Clear」だったら「晴れ」 画像を表示する 
            weatherImage.image = UIImage(named: "sunny")
        } else if dataManager.weatherData?.weather == "Rain" {
            // 「Rain」だったら「雨」 画像を表示する
            weatherImage.image = UIImage(named: "rain")
        }
        
        // 気温 ラベルに取得した気温を表示させる
        tempLabel.text = dataManager.weatherData?.temp.description
        // ボタンを隠す
        self.checkButton.isHidden = true
    }
    
    


}


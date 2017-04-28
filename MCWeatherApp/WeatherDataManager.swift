//
//  WeatherDataManager.swift
//  MCWeatherApp
//
//  Created by 高橋岳宏 on 2017/04/14.
//  Copyright © 2017年 takehiro. All rights reserved.
//

import Foundation

// 必要なフレームワークをインポートする
import Alamofire
import SwiftyJSON

// AlamofireによるAPI通信を管理するクラスを定義する
class WeatherDataManager: NSObject {
    
    // レスポンスデータをパースするモデルクラスインスタンスを格納するプロパティ
    var weatherData: WeatherDataModel?
    
    // リクエストするURL
    let url = "http://api.openweathermap.org/data/2.5/forecast?units=metric&q=Tokyo&APPID=2ec06eb3d8b93310aa2773a10f1dafe4"
    
    // APIリクエストを実行する
    func dataRequest() {
        // AlamofireによるAPI通信
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                // 通信成功時 処理
                // レスポンスデータをJSON型に変換する
                // これ SwiftyJSON ルール
                let json = JSON(value)
                // JSONデータを引数に渡してモデルクラス インスタンスを生成
                self.weatherData = WeatherDataModel(data: json)
                // デバッグ用 ログ出力を行う
                print(value)
            case .failure(let error):
                // 通信失敗時 処理
                // 今回 ログ出力だけ
                print(error)
            }
        }
    }
}

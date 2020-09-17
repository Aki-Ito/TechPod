//
//  ViewController.swift
//  TechPod
//
//  Created by 伊藤明孝 on 2020/09/15.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var table: UITableView!//storyboardで扱うUIboardを宣言
    
    //曲を入れるための配列
    var songNameArray = [String]()
    //曲のファイルを入れるための配列
    var fileNameArray = [String]()
    //音楽家の画像を入れるための配列
    var imageNameArray = [String]()
    //音楽を再生するための変数
    var audioPlayer : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource=self//テーブルビューのデータソースメソッドはViewControllerクラスに書くという意味
        
        table.delegate=self//テーブルビューのデリゲートメソッドはViewControllerクラスに書くという意味
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        
        fileNameArray = ["cannon", "elise", "aria"]
        
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }
    //セルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count//セルの数をsongNameArrayの数にする
    }
    //ID付きのセルを取得して、セル付属のtextLabelに『テスト』と表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text=songNameArray[indexPath.row]//セルにsongNameArrayの曲名を表示する
        
        
        
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }
    
    //セルが押されたときに呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType:"mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        audioPlayer.play()
    }
}


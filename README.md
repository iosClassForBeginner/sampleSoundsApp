# 第20回: １時間でiPhoneアプリを作ろう
## 音楽再生アプリ

<img src=https://github.com/iosClassForBeginner/sampleSoundsApp/blob/master/Assets/sample.png width=400px>
  
  当アカウントへ訪れていただき、誠にありがとうございます。第20回アプリ教室では、音楽再生アプリを作ります。自分のペースで勉強したい、勉強前に予習したい、内容を復習したい場合、ご利用ください。
  
## アプリ教室に興味ある方、歓迎します。  
  Meetup  
  http://www.meetup.com/ios-dev-in-namba/
  
## 別途アプリ教室(有料)も開いております  
  http://learning-ios-dev.esy.es/  

## 問い合わせ
  株式会社ジーライブ
  http://geelive-inc.com  

## アプリ作成手順

#### 0, 開発準備
> 0-1. xcodeで新規プロジェクトを立ち上げる
![image](https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/create_new_project.gif)

> 0-2. [音楽ファイルをダウンロード](https://github.com/iosClassForBeginner/sampleSoundsApp/raw/master/Assets/Sound.zip)

> 0-3. 音楽ファイルをプロジェクトにドロップ
![image](https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/file_drop.gif)

#### 1, Storyboardで、アプリのデザイン
> 1-1. main.storyboardを選択し、UI部品から下記を配置します。(ドラッグ&ドロップ)
- UIButton 再生ボタン
- UIButton 停止ボタン
![image](https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/set_button.gif)

> 1-2. Storyboardの下記UI部品を、ViewController.swiftに紐づけます（control押しながらドラッグ）
- UIButton 再生ボタン (actionで紐付ける)
- UIButton 停止ボタン (actionで紐付ける)

![image](https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/tying_button_action.gif)

#### 2, ViewController.swiftにコード記述
- 以下コードブロックを記入
  
```Swift
import UIKit
import AVFoundation // オーディオプレイヤー使うとき、インポートしましょう

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        initAudioPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // audioPlayer初期化
    func initAudioPlayer()
    {
        let filePath = Bundle.main.path(forResource: "sound", ofType: "mp3")
        let audioPath = URL(fileURLWithPath: filePath!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer?.prepareToPlay()
    }

    @IBAction func play(_ sender: UIButton) {
        audioPlayer?.play()
    }

    @IBAction func stop(_ sender: UIButton) {
        audioPlayer?.stop()
    }
}

```

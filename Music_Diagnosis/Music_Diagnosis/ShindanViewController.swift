//
//  ShindanViewController.swift
//  Music_Diagnosis
//
//  Created by Kazutomo Kita on 2020/04/07.
//  Copyright © 2020 Kazutomo Kita. All rights reserved.
//

import UIKit

class ShindanViewController: UIViewController {
    
    @IBOutlet weak var shindanNumberLabel: UILabel!
    @IBOutlet weak var shindanTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    
    var csvArray:[String] = []
    var shindanArray:[String] = []
    var shindanCount = 0
    let total = 2
    
    var loudCount = 0
    var popCount = 0
    var rollCount = 0
    var DanceCount = 0
    var ilusionCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

       let viewController = ViewController()
       
       csvArray = viewController.loadCSV(fileName: "shindan")
       
       shindanArray = csvArray[shindanCount].components(separatedBy: ",")
       
       shindanNumberLabel.text = "第\(shindanCount+1)問"
       
       shindanTextView.text = shindanArray[0]
       
       //選択肢ボタンのタイトルに選択肢を設定
       answerButton1.setTitle(shindanArray[1], for: .normal)
       answerButton2.setTitle(shindanArray[2], for: .normal)
    }
    
    @IBAction func buttonAction(sender: UIButton) {
        //正解番号(Int型にキャスト)とボタンのtagが同じなら正解
        if sender.tag == 0 {
            if shindanCount == 0 {
                rollCount += 2
            }
            else if shindanCount == 1 {
                loudCount += 3
            }
        } else {
        }
    
        nextProblem()
    }
    
    func nextProblem() {
        //問題カウント変数をカウントアップ
        shindanCount += 1
        
        //mondaiArrayに格納されている問題配列を削除
        shindanArray.removeAll()
        
        if shindanCount < total {
            //csvArrayから次の問題配列をmondaiArrayに格納
            shindanArray = csvArray[shindanCount].components(separatedBy: ",")
        
            //問題数ラベル、問題表示TextView, 選択肢ボタンに文字をセット
            shindanNumberLabel.text = "第\(shindanCount+1)問"
            shindanTextView.text = shindanArray[0]
            answerButton1.setTitle(shindanArray[1], for: .normal)
            answerButton2.setTitle(shindanArray[2], for: .normal)
        } else {
            performSegue(withIdentifier: "result", sender: nil)
        }
    }
    
    //得点画面に値渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sVC = segue.destination as! ResultViewController
        sVC.loud = loudCount
        sVC.pop = popCount
        sVC.roll = rollCount
        sVC.dance = DanceCount
        sVC.ilusion = ilusionCount
    }

}

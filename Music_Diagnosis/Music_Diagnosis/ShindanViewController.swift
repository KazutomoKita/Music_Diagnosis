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
    let total = 7
    
    

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
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

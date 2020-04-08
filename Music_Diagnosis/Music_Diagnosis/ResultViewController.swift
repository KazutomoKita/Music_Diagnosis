//
//  ResultViewController.swift
//  Music_Diagnosis
//
//  Created by Kazutomo Kita on 2020/04/07.
//  Copyright © 2020 Kazutomo Kita. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistTextView: UITextView!
    
    
    var loud = 0
    var pop = 0
    var roll = 0
    var dance = 0
    var ilusion = 0
    
    var csvArray:[String] = []
    var resultArray:[String] = []
    var resultCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if loud >= 3 {
            resultCount = 1
            
        } else if roll >= 2 {
            resultCount = 10
        }
        
        let viewController = ViewController()
        
        csvArray = viewController.loadCSV(fileName: "result")
        
        resultArray = csvArray[resultCount].components(separatedBy: ",")
        
        artistNameLabel.text = resultArray[0]
        artistTextView.text = resultArray[1]
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

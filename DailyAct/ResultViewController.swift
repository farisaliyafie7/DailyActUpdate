//
//  ResultViewController.swift
//  DailyActUpdate
//
//  Created by Faris Ali Yafie on 19/03/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var workStatus: UILabel!
    @IBOutlet weak var studyStatus: UILabel!
    @IBOutlet weak var exerciseStatus: UILabel!
    @IBOutlet weak var hangoutStatus: UILabel!
    @IBOutlet weak var restStatus: UILabel!
    
//    Set all variable
    var second:[String:Int?]     = ["work" : nil, "study" : nil, "exercise" : nil, "hangout" : nil, "rest" : nil]
    var minute:[String:Int]     = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    var hour:[String:Int]       = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    
//    var for result activity
    var resultCondition : [String] = ["Poor", "Good", "Over"]
    var result : [String:String] = ["work" : "", "study" : "", "exercise" : "", "hangout" : "", "rest" : ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        //         notification in console
                    print("display activity result")
                
        //      begin : calculate result
//              work : poor = less 8 hours, over = more 12 hours
                if hour["work"]! < 8 {
                    result["work"] = resultCondition[0]
                }else if hour["work"]! >= 8 && hour["work"]! < 12 || hour["work"]! == 12  && minute["work"]! == 0 && minute["work"]! == 0{
                    result["work"] = resultCondition[1]
                }else{
                    result["work"] = resultCondition[2]
                }

        //      study : poor = less 2 hours, over = more 6 hours
                if hour["study"]! < 2 {
                    result["study"] = resultCondition[0]
                }else if hour["study"]! >= 2 && hour["study"]! < 6 || hour["study"]! == 6 && minute["study"]! == 0 && second["study"]! == 0 {
                    result["study"] = resultCondition[1]
                }else{
                    result["study"] = resultCondition[2]
                }

        //      exercise : poor = less 30 minutes, over = more 2 hours
                if hour["exercise"]! < 1 && minute["exercise"]! < 30 {
                    result["exercise"] = resultCondition[0]
                }else if hour["exercise"]! == 0 && minute["exercise"]! >= 30 || hour["exercise"]! == 1 || hour["exercise"]! == 2  && minute["exercise"]! == 0 && minute["exercise"]! == 0{
                    result["exercise"] = resultCondition[1]
                }else{
                    result["exercise"] = resultCondition[2]
                }

        //      hangout : poor = less 1 hours, over = more 3 hours
                if hour["hangout"]! < 1 {
                    result["hangout"] = resultCondition[0]
                }else if hour["hangout"]! >= 1 && hour["hangout"]! < 3 || hour["hangout"]! == 3  && minute["hangout"]! == 0 && minute["hangout"]! == 0{
                    result["hangout"] = resultCondition[1]
                }else{
                    result["hangout"] = resultCondition[2]
                }

        //      rest : poor = less 6 hours, over = more 8 hours
                if hour["rest"]! < 6 {
                    result["rest"] = resultCondition[0]
                }else if hour["rest"]! >= 6 && hour["rest"]! < 8 || hour["rest"]! == 8  && minute["rest"]! == 0 && minute["rest"]! == 0{
                    result["rest"] = resultCondition[1]
                }else{
                    result["rest"] = resultCondition[2]
                }
        //      end : calculate result

        //      Set up Result
            workStatus.text = result["work"]
            studyStatus.text = result["study"]
            exerciseStatus.text = result["exercise"]
            hangoutStatus.text = result["hangout"]
            restStatus.text = result["rest"]
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

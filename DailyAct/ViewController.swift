//
//  ViewController.swift
//  DailyAct
//
//  Created by Faris Ali Yafie on 02/03/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var workTimeButton: UIButton!
    @IBOutlet weak var studyTimeButton: UIButton!
    @IBOutlet weak var exerciseButton: UIButton!
    @IBOutlet weak var hangoutButton: UIButton!
    @IBOutlet weak var restTimeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    
    @IBOutlet weak var workTimeLabel: UILabel!
    @IBOutlet weak var studyTimeLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var hangoutLabel: UILabel!
    @IBOutlet weak var restTimeLabel: UILabel!
    
//     set color
    let greenColor  = UIColor.green
    let redColor    = UIColor.red
    let blackColor  = UIColor.black
    let whiteColor  = UIColor.white

//     set var timer, counter and clock to all button
    var timer = Timer()
    var counter:[String:Int]    = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    var second:[String:Int]     = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    var minute:[String:Int]     = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    var hour:[String:Int]       = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    
//    Enum for State Label
    enum State {
       case Working
       case Studying
       case Training
       case HangingOut
       case Sleeping
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
//         blue button
        resetButton.layer.cornerRadius = 5
        pauseButton.layer.cornerRadius = 5
//        red button
        workTimeButton.layer.cornerRadius = 5
        studyTimeButton.layer.cornerRadius = 5
        exerciseButton.layer.cornerRadius = 5
        hangoutButton.layer.cornerRadius = 5
        restTimeButton.layer.cornerRadius = 5
        resultButton.layer.cornerRadius = 5
        
    }

    @IBAction func buttonPressed(_ sender: UIButton){
//        stop timer
        timer.invalidate()
//         call timer to count up
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerON), userInfo: nil, repeats: true)

        switch sender {
            case workTimeButton:
                stateLabel.text = "State : \(State.Working)"
            case studyTimeButton:
                stateLabel.text = "State : \(State.Studying)"
            case exerciseButton:
                stateLabel.text = "State : \(State.Training)"
            case hangoutButton:
                stateLabel.text = "State : \(State.HangingOut)"
            case restTimeButton:
                stateLabel.text = "State : \(State.Sleeping)"
            default:
                print("pause buttonPressed")
                stateLabel.text = "State : Do nothing"
//                stop timer
                timer.invalidate()
        }
        
    }
    
//          Select and counter timer activity
    @objc func timerON(){
//          start counter
//          input counter value to clock/timer activity
        switch stateLabel.text {
        case "State : \(State.Working)":
            counter["work"]! += 1
            second["work"] = counter["work"]!%60
            minute["work"] = (counter["work"]!/60)%60
            hour["work"] = (counter["work"]!/3600)%24
        case "State : \(State.Studying)":
            counter["study"]! += 1
            second["study"] = counter["study"]!%60
            minute["study"] = (counter["study"]!/60)%60
            hour["study"] = (counter["study"]!/3600)%24
        case "State : \(State.Training)":
            counter["exercise"]! += 1
            second["exercise"] = counter["exercise"]!%60
            minute["exercise"] = (counter["exercise"]!/60)%60
            hour["exercise"] = (counter["exercise"]!/3600)%24
        case "State : \(State.HangingOut)":
            counter["hangout"]! += 1
            second["hangout"] = counter["hangout"]!%60
            minute["hangout"] = (counter["hangout"]!/60)%60
            hour["hangout"] = (counter["hangout"]!/3600)%24
        case "State : \(State.Sleeping)":
            counter["rest"]! += 1
            second["rest"] = counter["rest"]!%60
            minute["rest"] = (counter["rest"]!/60)%60
            hour["rest"] = (counter["rest"]!/3600)%24
        default:
            print("pause countUp")
        }
        
        // display clock value to right label
        workTimeLabel.text = "\(hour["work"]!) h \(minute["work"]!) m \(second["work"]!) s"
        studyTimeLabel.text = "\(hour["study"]!) h \(minute["study"]!) m \(second["study"]!) s"
        exerciseLabel.text = "\(hour["exercise"]!) h \(minute["exercise"]!) m \(second["exercise"]!) s"
        hangoutLabel.text = "\(hour["hangout"]!) h \(minute["hangout"]!) m \(second["hangout"]!) s"
        restTimeLabel.text = "\(hour["rest"]!) h \(minute["rest"]!) m \(second["rest"]!) s"
    }
    
//     reset all status
    @IBAction func resetPressed(_ sender: UIButton){
        
//         notification in console
        print("reset task")
        
//         Set up Pop Up or alertController
        let alertController = UIAlertController(title: "Reset", message: "Are you sure?", preferredStyle: .alert)
        
//         set up action
        let yesAction = UIAlertAction(title: "Yes", style: .default){_ in
//            stop timer
            self.timer.invalidate()
            self.counter = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
            self.second = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
            self.minute = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
            self.hour = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
//            normalization button and label
            self.workTimeLabel.text  = "0 h 0 m 0 s"
            self.studyTimeLabel.text = "0 h 0 m 0 s"
            self.exerciseLabel.text  = "0 h 0 m 0 s"
            self.hangoutLabel.text   = "0 h 0 m 0 s"
            self.restTimeLabel.text  = "0 h 0 m 0 s"
            self.stateLabel.text     = "State : Do nothing"
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel)
        
//         add action
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
//         Present Pop Up
        present(alertController, animated: true)
    }
    
//     present activity result
    @IBAction func resultPressed(_ sender: UIButton){
         self.performSegue(withIdentifier: "toResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            //send data
            //segue target
            if let destination = segue.destination as? ResultViewController{
//                send data to work
                destination.second["work"] = self.second["work"]
                destination.minute["work"] = self.minute["work"]
                destination.hour["work"] = self.hour["work"]
//                send data to study
                destination.second["study"] = self.second["study"]
                destination.minute["study"] = self.minute["study"]
                destination.hour["study"] = self.hour["study"]
//                send data to exercise
                destination.second["exercise"] = self.second["exercise"]
                destination.minute["exercise"] = self.minute["exercise"]
                destination.hour["exercise"] = self.hour["exercise"]
//                send data to hang out
                destination.second["hangout"] = self.second["hangout"]
                destination.minute["hangout"] = self.minute["hangout"]
                destination.hour["hangout"] = self.hour["hangout"]
//                send data to rest
                destination.second["rest"] = self.second["rest"]
                destination.minute["rest"] = self.minute["rest"]
                destination.hour["rest"] = self.hour["rest"]
            }
        }else{
        }
    }
}

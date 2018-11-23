//
//  ViewController.swift
//  5KCoach
//
//  Created by webwerks on 21/11/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import UIKit
import SnapKit
import Foundation

class ViewController: UIViewController {

//    var buttonView = UIButton()
    
    var resetButton = UIButton()
    var startButton = UIButton()
    var minuteLabel = UILabel()
    var secondsLabel = UILabel()
    var miliSecondsLabel = UILabel()
    var timeView = UIView()
    var stopWatchView = UIView()
    var customTableView = UITableView()
    var customCell = UITableViewCell()
    
    
    override func loadView() {
        
        super.loadView()
        
        self.setViewFrames()
        self.configureMinuteLabel()
        self.configureSecondsLabel()
        self.configureMiliSecondsLabel()
        self.configureResetButton()
        self.configurestartButton()
        self.configureTimesView()
        self.configureStopwatchView()
        self.configureCustomTableView()
        self.configureConstraints()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "5K Coach"
        customTableView.dataSource = self
        customTableView.delegate = self
    }
    
    
    func setViewFrames(){
        
        minuteLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        secondsLabel = UILabel(frame: CGRect(x: 70, y: 0, width: 60, height: 60))
        miliSecondsLabel = UILabel(frame: CGRect(x: 140, y: 0, width: 60, height: 60))
        
        timeView = UIView(frame: CGRect(x: 0, y: 50, width: 220, height: 60))
        stopWatchView = UIView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 200))

        customTableView = UITableView(frame: CGRect(x: 0, y: 264, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 264), style: .plain)
        
        resetButton = UIButton(frame: CGRect(x: 10, y: 140, width: 60, height: 60))
        startButton = UIButton(frame: CGRect(x: 100, y: 140, width: 60, height: 60))
    }
    
    func configureMinuteLabel() {
        
        minuteLabel.text = "00"
        minuteLabel.textColor = UIColor.darkGray
        minuteLabel.font = UIFont(name: minuteLabel.font.fontName, size: 20)
        minuteLabel.textAlignment = .center
    }
    
    func configureSecondsLabel() {
        secondsLabel.text = "00"
        secondsLabel.textColor = UIColor.darkGray
        secondsLabel.font = UIFont(name: secondsLabel.font.fontName, size: 20)
        secondsLabel.textAlignment = .center

    }
    
    func configureMiliSecondsLabel() {
        miliSecondsLabel.text = "00"
        miliSecondsLabel.textColor = UIColor.darkGray
        miliSecondsLabel.font = UIFont(name: miliSecondsLabel.font.fontName, size: 20)
        miliSecondsLabel.textAlignment = .center

    }
    
    func configureTimesView() {
        
        timeView.addSubview(minuteLabel)
        timeView.addSubview(secondsLabel)
        timeView.addSubview(miliSecondsLabel)
        
        timeView.backgroundColor = UIColor.white

    }
    
    func configureStopwatchView() {
         stopWatchView.backgroundColor = UIColor.blue
        stopWatchView.addSubview(timeView)
        stopWatchView.addSubview(resetButton)
        stopWatchView.addSubview(startButton)
        self.view.addSubview(stopWatchView)
    }
    
    func configureResetButton() {
        resetButton.setTitle("Reset", for: .normal)
        resetButton.layer.borderWidth = 1.0
        resetButton.layer.borderColor = UIColor.gray.cgColor
        resetButton.layer.cornerRadius = 30
        resetButton.tag = 1

        
        resetButton.addTarget(self, action: #selector(resetButtonAction(sender:)), for: .touchUpInside)
        
    }
    
    func configurestartButton() {
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor.green
        startButton.layer.borderWidth = 1.0
        startButton.layer.borderColor = UIColor.gray.cgColor
        startButton.layer.cornerRadius = 30
        startButton.tag = 1

        startButton.addTarget(self, action: #selector(startButtonAction(sender:)), for: .touchUpInside)
    }
    
    func configureCustomTableView() {
        customTableView.backgroundColor = UIColor.green
        self.view.addSubview(customTableView)
    }
    
    func configureCustomCell() {
        
        customCell = UITableViewCell(frame: CGRect(x: 5, y: 5, width: 100, height: 50))
        customCell.selectionStyle = .none
//        customCell.reuseIdentifier = "StopwatchCustomCell"
    }
    
    func configureConstraints() {
        stopWatchView.snp.makeConstraints({
            (make) ->Void in
            make.top.equalTo(64)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(200)
            make.centerX.equalTo(self.view)
        })
        
        timeView.snp.makeConstraints({
            (make) ->Void in
            make.top.equalTo(40)
            make.width.equalTo(200)
            make.height.equalTo(60)
            make.centerX.equalTo(stopWatchView)
        })
        
        resetButton.snp.makeConstraints({(make) ->Void in
            make.leading.equalTo(10)
            make.width.height.equalTo(60)
            make.bottom.equalTo(-10)
        })
        
        startButton.snp.makeConstraints({(make) ->Void in
            make.trailing.equalTo(-10)
            make.bottom.equalTo(-10)
            make.width.height.equalTo(60)
            
        })
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false

    }
    
    @objc func resetButtonAction(sender: UIButton!) {
        let buttonTag = sender.tag
        if buttonTag == 1{
            //Show next view
            print("Show next view")
            let nextView = SecondViewController()
            self.navigationController?.pushViewController(nextView, animated: true)
            //            present(nextView, animated: true, completion: nil)
        }
    }
    
    @objc func startButtonAction(sender: UIButton!) {
        let buttonTag = sender.tag
        if buttonTag == 1{
            //Show next view
            print("Show next view")
            let nextView = SecondViewController()
            self.navigationController?.pushViewController(nextView, animated: true)
            //            present(nextView, animated: true, completion: nil)
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = UITableViewCell()
        return cell
        
    }
    
    
}

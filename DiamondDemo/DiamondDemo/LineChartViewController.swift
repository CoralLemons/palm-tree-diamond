//
//  LineChartViewController.swift
//  DiamondDemo
//
//  Created by Leeann Warren on 10/26/21.
//

import UIKit
import Charts

class LineChartViewController: UIViewController{
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // do after loading view
        customizeChart(dataPoints: users, values: screenTimeHours)
    }// end ViewDidLoad
    
} // end LineChartViewController

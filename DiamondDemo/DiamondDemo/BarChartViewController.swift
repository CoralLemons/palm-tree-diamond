//
//  BarChartViewController.swift
//  DiamondDemo
//
//  Created by Leeann Warren on 10/26/21.
//

import UIKit
import Charts

class BarChartViewController: UIViewController{
    
    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // do after loading view
        customizeChart(dataPoints: users, values: screenTimeHours)
    }// end ViewDidLoad
    
        // MARK: - Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        

} // end BarChartViewController

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
    
    func customizeChart(dataPoints: [String], values: [Double]){
        
        var entries: [ChartDataEntry] = [] // holds the data entries for the chart
        for value in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[value], label: dataPoints[value], data: dataPoints[value] as AnyObject)
            entries.append(dataEntry) // add dataEntry to the end of the ChartData array
        }// end for loop --
        
        let lineChartDataSet = LineChartDataSet(entries: entries, label: nil)
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
    }// end customizeChart -- pass in dataPoints and applicable values to populate (customize) the line chart
    
} // end LineChartViewController

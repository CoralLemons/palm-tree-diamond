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
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // do after loading view
        customizeChart(dataPoints: users, values: screenDoubleHours)
    }// end ViewDidLoad
    
    func customizeChart(dataPoints: [String], values: [Double]){
        var index = 0;
        var entries: [ChartDataEntry] = [] // holds the data entries for the chart
        for value in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(value), y: values[value])
            entries.append(dataEntry) // add dataEntry to the end of the ChartData array
            index = index + 1 // ++ for data
        }// end for loop --
        
        let lineChartDataSet = LineChartDataSet(entries: entries, label: "Simple Dataset")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
    }// end customizeChart -- pass in dataPoints and applicable values to populate (customize) the line chart
    
    @IBAction func didTapClose(_ sender: Any) {
        lineChartView.removeFromSuperview()
    }
}

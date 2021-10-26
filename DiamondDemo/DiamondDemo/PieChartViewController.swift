//
//  PieChartViewController.swift
//  DiamondDemo
//
//  Created by Leeann Warren on 10/26/21.
//

import UIKit
import Charts

class PieChartViewController: UIViewController{
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //customizeChart
        customizeChart(dataPoints: users, values: screenTimeHours)
    }// end ViewDidLoad
    
    func customizeChart(dataPoints: [String], values: [Double]){
        
        var entries: [ChartDataEntry] = [] // holds the data entries for the chart
        for value in 0..<dataPoints.count() {
            let dataEntry = PieChartDataEntry(value: values[value], label: dataPoints[value], data: dataPoints[values] as AnyObject)
            entries.append(dataEntry) // add dataEntry to the end of the ChartData array
        }// end for loop --
        
        let pieChartDataSet = PieChartDataSet(values: entries, label: nil)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColors: dataPoints.count)
        
    }// end customizeChart -- pass in dataPoints and applicable values to populate (customize) the pie chart
    
} // end PieChartViewController

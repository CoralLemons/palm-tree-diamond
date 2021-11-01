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
    @IBOutlet weak var swipeLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //customizeChart
        customizeChart(dataPoints: users, values: screenDoubleHours)
    }// end ViewDidLoad
    
    
    func customizeChart(dataPoints: [String], values: [Double]){
        
        var entries: [ChartDataEntry] = [] // holds the data entries for the chart
        for value in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[value], label: dataPoints[value], data: dataPoints[value] as AnyObject)
            entries.append(dataEntry) // add dataEntry to the end of the ChartData array
        }// end for loop
        
        let pieChartDataSet = PieChartDataSet(entries: entries, label: " ")
        pieChartDataSet.colors = getColor(numbersOfColor: dataPoints.count)
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
            
        pieChartView.data = pieChartData
        
    }// end customizeChart -- pass in dataPoints and applicable values to populate (customize) the pie chart
    
    private func getColor(numbersOfColor: Int) -> [UIColor] {
       var colors: [UIColor] = []
       for _ in 0..<numbersOfColor {
         let red = Double(arc4random_uniform(256))
         let green = Double(arc4random_uniform(256))
         let blue = Double(arc4random_uniform(256))
         let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
         colors.append(color)
       }
       return colors
     }// end getColor -- returns the array of UIColors to set the pie chart with random colors
    
} // end PieChartViewController

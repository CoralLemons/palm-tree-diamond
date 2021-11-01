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
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChartView.animate(yAxisDuration: 2.0)
        barChartView.pinchZoomEnabled = false
        barChartView.drawBarShadowEnabled = false
        barChartView.drawBordersEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = true
        barChartView.chartDescription.text = "Bar Chart View"
        
        setChart(dataPoints: users, values: screenTimeHours.map { Double($0) })
      }
      
    @IBAction func didTapClose(_ sender: Any) {
        barChartView.removeFromSuperview()
    }
      
      func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var entries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
          let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            entries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: entries, label: "Bar Chart View")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
      }
} // end BarChartViewController

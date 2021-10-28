//
//  ViewController.swift
//  DiamondDemo
//
//  Created by Leeann Warren on 10/26/21.
//

import UIKit

class ViewController: UIViewController{
    var thisBoard: UIStoryboard?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor =
        thisBoard = UIStoryboard(name: "GenericBoard", bundle: nil)
    }// init thisBoard to load GenericBoard storyboard
    
    @IBAction func didTapLineChart(_ sender: Any){
        guard let vc = thisBoard?.instantiateViewController(withIdentifier: "LineChartViewController") as? LineChartViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }// end didTapLineChart -- event function triggered when user taps on line chart button
    
    @IBAction func didTapPieChart(_ sender: Any){
        guard let vc = thisBoard?.instantiateViewController(withIdentifier: "PieChartViewController") as? PieChartViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }// end didTapPieChart -- event function triggered when user taps on pie chart button
    
    @IBAction func didTapBarChart(_ sender: Any){
        guard let vc = thisBoard?.instantiateViewController(withIdentifier: "BarChartViewController") as? BarChartViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }// end didTapBarChart -- event function triggered when user taps on bar chart button

} // end class ViewController -- serves as the VC for the Charts when tapped on by user

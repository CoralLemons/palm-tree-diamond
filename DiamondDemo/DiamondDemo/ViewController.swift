//
//  ViewController.swift
//  DiamondDemo
//
//  Created by Leeann Warren on 10/26/21.
//

import UIKit

class ViewController: UIViewController{
    var thisBoard: UIStoryboard?
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "Background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // end imageView -- allows for the rotation of screen and appropriate stretch of background img
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.insertSubview(imageView, at: 0) // insert at the lowest view
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor), // match this view to the main view's constraits
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
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

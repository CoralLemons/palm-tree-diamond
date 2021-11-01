//
//  ViewController.swift
//  DiamondDemo
//
//  Created by Leeann Warren on 10/26/21.
//

import UIKit
import SpriteKit
import SceneKit

class ViewController: UIViewController{
    var thisBoard: UIStoryboard?
    
    @IBOutlet weak var backgroundView: SKView!
    @IBOutlet weak var animationBox: SCNView!
    
    let emitterNode = SKEmitterNode(fileNamed: "diamondSparkle.sks")! // assign the created partile effect file to emitterNode for background assignment later
    
    override func viewDidLoad(){
        super.viewDidLoad()
        addParticleEffect() // method inits the background animation
        thisBoard = UIStoryboard(name: "Main", bundle: nil)
        createLogo()
    }// init thisBoard to load GenericBoard storyboard
    
    func createLogo(){
        let scene = SCNScene(named: "logoDemo.scn")
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.automaticallyAdjustsZRange = true

        // Position the camera off the floor vertically by 3 points, and place us away by 0 points
        cameraNode.position = SCNVector3Make(0, 3, 0)
        scene?.rootNode.addChildNode(cameraNode)
        
        let text = scene?.rootNode.childNode(withName: "text node", recursively: true)!
        let (minVec, maxVec) = text!.boundingBox
        text?.pivot = SCNMatrix4MakeTranslation((maxVec.x - minVec.x) / 2 + minVec.x, (maxVec.y - minVec.y) / 2 + minVec.y, 0)
        text?.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
        animationBox.scene = scene
    } // end createLogo --
    
    private func addParticleEffect(){
        let spriteView = SKView(frame: backgroundView.frame) // assign backgroundView to the spriteView
    
        let scene = SKScene(size: backgroundView.frame.size)
        spriteView.presentScene(scene) // present the scene for viewing
        backgroundView.isUserInteractionEnabled = false // remove user interaction b/c background
        
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.addChild(emitterNode)
        
        emitterNode.position.y = scene.frame.maxY
        emitterNode.particlePositionRange.dx = scene.frame.width
        backgroundView.addSubview(spriteView) // finally, present it all
    }// end addParticleEffect -- creates spriteKit view, presents the scene, and adds the emmitter
    
    @IBAction func didTapLineChart(_ sender: Any){
        guard let vc = thisBoard?.instantiateViewController(withIdentifier: "LineChartViewController") as? LineChartViewController else {return}
        self.navigationController?.present(vc, animated: true, completion: nil)
    }// end didTapLineChart -- event function triggered when user taps on line chart button
    
    @IBAction func didTapPieChart(_ sender: Any){
        guard let vc = thisBoard?.instantiateViewController(withIdentifier: "PieChartViewController") as? PieChartViewController else {return}
        self.navigationController?.present(vc, animated: true, completion: nil)
    }// end didTapPieChart -- event function triggered when user taps on pie chart button
    
    @IBAction func didTapBarChart(_ sender: Any){
        guard let vc = thisBoard?.instantiateViewController(withIdentifier: "BarChartViewController") as? BarChartViewController else {return}
        self.navigationController?.present(vc, animated: true, completion: nil)
    }// end didTapBarChart -- event function triggered when user taps on bar chart button

} // end class ViewController -- serves as the VC for the Charts when tapped on by user

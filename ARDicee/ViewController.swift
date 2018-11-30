//
//  ViewController.swift
//  ARDicee
//
//  Created by admin on 2018-11-26.
//  Copyright © 2018 nortohol. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
//        //Create cube with material
//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//        let material = SCNMaterial()
//        material.diffuse.contents = UIColor.red
//        cube.materials = [material]
//
//        //Create node with position
//        let node = SCNNode()
//        node.position = SCNVector3(0, 0.1, -0.5)
//
//        //Assign cube to node
//        node.geometry = cube
//        sceneView.scene.rootNode.addChildNode(node)
//        sceneView.autoenablesDefaultLighting = true
        
        //Create moon with material
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
        sphere.materials = [material]
        
        //Create node with position
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        
        //Assign cube to node
        node.geometry = sphere
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
        
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Session is supported = \(ARConfiguration.isSupported)")
        print("World tracking is supported= \(ARWorldTrackingConfiguration.isSupported)")
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}

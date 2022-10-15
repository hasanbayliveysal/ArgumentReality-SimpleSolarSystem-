//
//  ViewController.swift
//  ARKitFirstProject
//
//  Created by Veysal on 14.10.22.
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
//
//        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
//
//
//
//
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//#imageLiteral(resourceName: "earth.jpeg")
//        // Set the scene to the view
//        sceneView.scene = scene
        let myWorld = createSphare(radius: 0.2, content: "earth.jpeg", vector: SCNVector3(x: 0.1, y: 0.1, z: -0.3))
        let myJupiter = createSphare(radius: 0.4, content: "jupiter.jpeg", vector: SCNVector3(x: 0, y: 1, z: -2))
        let myMars = createSphare(radius: 0.1, content: "mars.jpeg", vector: SCNVector3(x: 0, y: 1, z: 0))
        let myMercury = createSphare(radius: 0.05, content: "mercury.jpeg", vector: SCNVector3(x: -1, y: 1, z: -1))
        let myMoon = createSphare(radius: 0.15, content: "moon.jpeg", vector: SCNVector3(x: 1, y: 1, z: -1))
        let mySun = createSphare(radius: 0.5, content: "sun.jpeg", vector: SCNVector3(x: 0, y: 2, z: -2))
        
        sceneView.scene.rootNode.addChildNode(myWorld)
        sceneView.scene.rootNode.addChildNode(myJupiter)
        sceneView.scene.rootNode.addChildNode(myMars)
        sceneView.scene.rootNode.addChildNode(myMercury)
        sceneView.scene.rootNode.addChildNode(myMoon)
        sceneView.scene.rootNode.addChildNode(mySun)
        
        sceneView.automaticallyUpdatesLighting = true
    }
    func createSphare (radius: CGFloat, content : String, vector: SCNVector3) -> SCNNode {
        
        let mySphare = SCNSphere(radius: 0.1)
        let sphareMaterial = SCNMaterial()
        sphareMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        mySphare.materials = [sphareMaterial]
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphare
        return node
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

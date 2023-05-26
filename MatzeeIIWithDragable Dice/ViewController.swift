//
//  ViewController.swift
//  MatzeeIIWithDragable Dice
//
//  Created by Derek Fitzer on 4/3/23.
//

import UIKit

class ViewController: UIViewController{
    
    // how to rename?
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var btmImg: UIImageView!
    @IBOutlet weak var topImg: UIImageView!
    var covers: [Album] = [eb,y,d, r, dd]
    var counter = 0

    @IBOutlet weak var keepReroll: UIView!
    @IBOutlet weak var keepTop: UIView!
    @IBOutlet weak var d1View: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btmImg.transform = backImage.transform.rotated(by: .pi)
        backImage.layer.zPosition = -10001
        perspectiveMod()
    }

    

    @IBAction func d1Movied(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
         
            if let viewToDrag = sender.view {
                viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x,
                    y: viewToDrag.center.y + translation.y)
                sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
            }
        if d1View.frame.intersects(keepTop.frame){
            print("intersects")
        } else {
            print("nope")
        }
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        var rotationAndPerspectiveTransform = CATransform3DIdentity
        rotationAndPerspectiveTransform.m34 = 1.0 / -500
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, -45.0 * CGFloat(Double.pi) / 180.0, 1.0, 0.0, 0.0)
      //  rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0 * CGFloat(Double.pi) / 180.0, 0.0, 1.0, 0.0)
        self.keepReroll.layer.transform = rotationAndPerspectiveTransform
        
        UIGraphicsBeginImageContextWithOptions(keepReroll.bounds.size, false, 0.0)
        view.drawHierarchy(in: keepReroll.bounds, afterScreenUpdates: true)
      //  let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        backRotate()
    }
    
    
    
    func backRotate(){
        
        var rotationAndPerspectiveTransform = CATransform3DIdentity
        rotationAndPerspectiveTransform.m34 = 1.0 / -500
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0 * CGFloat(Double.pi) / 180.0, 1.0, 0.0, 0.0)
      //  rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0 * CGFloat(Double.pi) / 180.0, 0.0, 1.0, 0.0)
        self.keepTop.layer.transform = rotationAndPerspectiveTransform
        
        UIGraphicsBeginImageContextWithOptions(keepTop.bounds.size, false, 0.0)
        view.drawHierarchy(in: keepReroll.bounds, afterScreenUpdates: true)
        UIGraphicsEndImageContext()
    }
    
    @IBAction func a1(_ sender: UITapGestureRecognizer) {
        print("TopTap")
        counter += 1
        if counter == covers.count {
            counter = 1
        }
            topImg.image = UIImage(named: covers[counter].frontImage)
            btmImg.image = UIImage(named: covers[counter - 1].backImage)
        perspectiveMod()
    }
    
    @IBAction func a2(_ sender: UITapGestureRecognizer) {
        print("bottom tap")
        counter -= 1
        if counter == 0 {
            counter = 1
        }
            topImg.image = UIImage(named: covers[counter].frontImage)
            btmImg.image = UIImage(named: covers[counter - 1].backImage)
            perspectiveMod()
        
    }
    
    
    @IBAction func top(_ sender: UITapGestureRecognizer) {
        
        
        

    }
    
    func perspectiveMod(){
        var rotationAndPerspectiveTransform = CATransform3DIdentity
        rotationAndPerspectiveTransform.m34 = 1.0 / -500
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, -45.0 * CGFloat(Double.pi) / 180.0, 1.0, 0.0, 0.0)
      //  rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0 * CGFloat(Double.pi) / 180.0, 0.0, 1.0, 0.0)
        self.keepReroll.layer.transform = rotationAndPerspectiveTransform
        
        UIGraphicsBeginImageContextWithOptions(keepReroll.bounds.size, false, 0.0)
        view.drawHierarchy(in: keepReroll.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        backRotate()
    }
    
    @IBAction func swipeTop(_ sender: UISwipeGestureRecognizer) {
        
        
    }
    
}


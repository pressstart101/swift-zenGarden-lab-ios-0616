//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rake: UIImageView!
    @IBOutlet weak var rock: UIImageView!
    @IBOutlet weak var shrub: UIImageView!
    @IBOutlet weak var sword: UIImageView!
    
    var rakeDifferencePoint: CGPoint?
    var rockDifferencePoint: CGPoint?
    var shrubDifferencePoint: CGPoint?
    var swordDifferencePoint: CGPoint?
    
    
    
    
    var rakeX = NSLayoutConstraint()
    var rakeY = NSLayoutConstraint()
    
    var rockX = NSLayoutConstraint()
    var rockY = NSLayoutConstraint()
    
    var shrubX = NSLayoutConstraint()
    var shrubY = NSLayoutConstraint()
    
    var swordX = NSLayoutConstraint()
    var swordY = NSLayoutConstraint()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        rake.userInteractionEnabled = true
        rock.userInteractionEnabled = true
        shrub.userInteractionEnabled = true
        sword.userInteractionEnabled = true
        
        newGame()
        
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func rakeDrag(recognizer: UIPanGestureRecognizer){
        let rakeCoordinates = recognizer.translationInView(self.rake)
        if recognizer.state == .Began{
            self.rakeDifferencePoint = rakeCoordinates
        }else{
            if let differencePoint = self.rakeDifferencePoint{
                let diffY = rakeCoordinates.y - differencePoint.y
                let diffX = rakeCoordinates.x - differencePoint.x
                self.rakeX.constant += diffX
                self.rakeY.constant += diffY
                self.rakeDifferencePoint = rakeCoordinates
                
                checkForWin()
            }

        }
    }
    
    
    func rockDrag(recognizer: UIPanGestureRecognizer){
        let coordinates = recognizer.translationInView(self.rock)
        if recognizer.state == .Began{
            self.rockDifferencePoint = coordinates
        }else{
            if let differencePoint = self.rockDifferencePoint{
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                self.rockX.constant += diffX
                self.rockY.constant += diffY
                self.rockDifferencePoint = coordinates
                
                checkForWin()
            }
            
        }
    }
    
    
    func shrubDrag(recognizer: UIPanGestureRecognizer){
        let coordinates = recognizer.translationInView(self.shrub)
        if recognizer.state == .Began{
            self.shrubDifferencePoint = coordinates
        }else{
            if let differencePoint = self.shrubDifferencePoint{
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                self.shrubX.constant += diffX
                self.shrubY.constant += diffY
                self.shrubDifferencePoint = coordinates
                
                checkForWin()
            }
            
        }
    }
    
    
    func swordDrag(recognizer: UIPanGestureRecognizer){
        let coordinates = recognizer.translationInView(self.sword)
        if recognizer.state == .Began{
            self.swordDifferencePoint = coordinates
        }else{
            if let differencePoint = self.swordDifferencePoint{
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                self.swordX.constant += diffX
                self.swordY.constant += diffY
                self.swordDifferencePoint = coordinates
                
                checkForWin()
            }
            
        }
    }
    
    
    
    func checkForWin(){
        var rakeWin = false
        var rockWin = false
        var shrubWin = false
        var swordWin = false
        
        if self.swordX.constant < -100.0 && self.swordY.constant < -300 || self.swordX.constant < -100.0 && self.swordY.constant > 200{
            swordWin = true
            //print(swordWin)
           // print("sword")
        }
        
        if self.rockY.constant > 0 && self.swordY.constant < 0 || self.rockY.constant < 0 && self.swordY.constant > 0{
        rockWin = true
            //print(rockWin)
            //print("rock")
        }
        if abs(self.shrubY.constant - self.rakeY.constant) < 50 && abs(self.shrubX.constant - self.rakeX.constant) < 50{
            rakeWin = true
            shrubWin = true
            //print("rake")
           // print("shrub")
            //print(shrubWin)
        }
        
        if rakeWin && rockWin && shrubWin && swordWin {
            
            let alertController = UIAlertController(title: nil, message: "YOU WON!", preferredStyle: .Alert)

            let oneAction = UIAlertAction(title: "Ok", style: .Default) { (_) in
                self.resetConstraints()
                self.resetConstraints()
                self.resetConstraints()

            }
            alertController.addAction(oneAction)
            self.presentViewController(alertController, animated: true) {}
      
        }else{
        print("\n\n\nsword:\(swordWin) rock:\(rockWin) shrub:\(shrubWin) rake:\(rakeWin)\n\n\n")
        }
        
    }

    
    func newGame(){
        self.view.removeConstraints(self.view.constraints)
        self.rake.removeConstraints(self.rake.constraints)
        self.rock.removeConstraints(self.rock.constraints)
        self.shrub.removeConstraints(self.shrub.constraints)
        self.sword.removeConstraints(self.sword.constraints)
        
        self.rake.translatesAutoresizingMaskIntoConstraints = false
        self.rock.translatesAutoresizingMaskIntoConstraints = false
        self.shrub.translatesAutoresizingMaskIntoConstraints = false
        self.sword.translatesAutoresizingMaskIntoConstraints = false
        
        self.resetConstraints()

        
        
    }
    func resetConstraints(){
        self.rakeX = self.rake.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(150)))
        rakeX.active = true
        self.rakeY = self.rake.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(150)))
        rakeY.active = true
        self.rake.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.3).active = true
        self.rake.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.3).active = true
        
        
        
        self.rockX = self.rock.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(150)))
        rockX.active = true
        self.rockY = self.rock.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(150)))
        rockY.active = true
        self.rock.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.3).active = true
        self.rock.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.3).active = true
        
        
        self.shrubX = self.shrub.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(150)))
        shrubX.active = true
        self.shrubY = self.shrub.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(150)))
        shrubY.active = true
        self.shrub.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.3).active = true
        self.shrub.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.3).active = true
        
        self.swordX = self.sword.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(150)))
        swordX.active = true
        self.swordY = self.sword.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(150)))
        swordY.active = true
        self.sword.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.3).active = true
        self.sword.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.3).active = true
        
        let rakeDragRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(rakeDrag))
        self.rake.addGestureRecognizer(rakeDragRecognizer)
        
        let rockDragRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(rockDrag))
        self.rock.addGestureRecognizer(rockDragRecognizer)
        
        let shrubDragRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(shrubDrag))
        self.shrub.addGestureRecognizer(shrubDragRecognizer)
        
        let swordDragRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(swordDrag))
        self.sword.addGestureRecognizer(swordDragRecognizer)
    }
    

}


//
//  ViewController.swift
//  RadiusView
//
//  Created by JNYJ on 14-11-14.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

/*
IMPT
From  http://www.cocoachina.com/bbs/read.php?tid-105689.html
By  "mhmwadm"
Note: Changed part of the codes by JNYJ
Original:

3.1	设置圆角
myView.layer.cornerRadius = 6;
myView.layer.masksToBounds = YES;

设置圆角和阴影：(必须分两层)
CALayer *shadowLayer = [CALayer layer];
shadowLayer.shadowColor = [UIColor blackColor].CGColor;
shadowLayer.shadowOffset = CGSizeMake(0, 0);
shadowLayer.shadowRadius = 5;
shadowLayer.shadowOpacity = 1;
shadowLayer.frame = self.bounds;
shadowLayer.backgroundColor = [UIColor clearColor ].CGColor;
shadowLayer.cornerRadius = 5;
shadowLayer.borderColor = [UIColor whiteColor].CGColor;
shadowLayer.borderWidth = 2.0;
[self.layer addSublayer:shadowLayer];

CALayer *borderLayer = [CALayer layer];
borderLayer.cornerRadius = 5;
borderLayer.masksToBounds = YES;
borderLayer.frame = shadowLayer.bounds;
[shadowLayer addSublayer:borderLayer];

*/

import UIKit

class ViewController: UIViewController {

	@IBOutlet var button_corner : UIButton!  // Add "!", Not need to override init method
	@IBOutlet var button_corner_shadow : UIButton!
	var isCorner : Bool!
	var isCorner_shadow : Bool!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		isCorner =  false
		isCorner_shadow = false
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.

	}

	@IBAction func event_corner(){
		if let item = self.button_corner {
			if let item = self.isCorner {
				if item {
					self.button_corner.layer.cornerRadius = 0;
					self.button_corner.layer.masksToBounds = false;
				}else{
					self.button_corner.layer.cornerRadius = 6;
					self.button_corner.layer.masksToBounds = true;
				}
				self.isCorner = !self.isCorner
			}
		}
	}
	@IBAction func event_corner_shadow(){
		if let item = self.button_corner_shadow {
			if let item = self.isCorner_shadow {
				if item {
//					self.button_corner_shadow.layer.cornerRadius = 0;
//					self.button_corner_shadow.layer.masksToBounds = false;
					self.button_corner_shadow.layer.sublayers.removeLast()
				}else{
//					self.button_corner_shadow.layer.cornerRadius = 0;
//					self.button_corner_shadow.layer.masksToBounds = true;
					var shadowLayer : CALayer = CALayer()
					shadowLayer.shadowColor = UIColor.blackColor().CGColor;
					shadowLayer.shadowOffset = CGSizeMake(0, 0);
					shadowLayer.shadowRadius = 5;
					shadowLayer.shadowOpacity = 1;
					shadowLayer.frame = self.button_corner_shadow.bounds;
					shadowLayer.backgroundColor = UIColor.clearColor().CGColor;
					shadowLayer.cornerRadius = 5;
					shadowLayer.borderColor = UIColor.whiteColor().CGColor;
					shadowLayer.borderWidth = 2.0;
					self.button_corner_shadow.layer.addSublayer(shadowLayer)

					var borderLayer : CALayer = CALayer()
					borderLayer.cornerRadius = 5;
					borderLayer.masksToBounds = true;
					borderLayer.frame = shadowLayer.bounds;
					shadowLayer.addSublayer(borderLayer)
				}
				self.isCorner_shadow = !self.isCorner_shadow
			}
		}
	}
}


//
//  ViewController.swift
//  Playground
//
//  Created by Elina on 5/5/16.
//  Copyright © 2016 Elina. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var myPickerView: UIPickerView!
    
    var flowers = [Flower]()
    var flowerNames = ["hrizantema", "detelina"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPickerView.dataSource = self
        myPickerView.delegate = self
        
        for flower in flowerNames {
        saveName(flower)
        }
    }
    
    func saveName(name: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Flower", inManagedObjectContext: managedContext)
        let flower = Flower(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        flower.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            flowers.append(flower)
        } catch let error as NSError {
            print("Error")
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flowers.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flowers[row].name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(flowers[row].name)
    }
    
}


//
//  ViewController.swift
//  FirstSwiftApps
//
//  Created by okitokagechika on 2014/06/12.
//  Copyright (c) 2014年 okito.kagechika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLabel: UILabel;
    
    @IBOutlet var myButton: UIButton;
    
    @IBOutlet var myImage: UIImageView;
    
    var datas = [
        "groupA":["BRAZIL","CROATIA","MEXICO","CAMEROON"],
        "groupB":["SPAIN","NETHERLANDS","AUSTRALIA","CHILE"],
        "groupC":["COLOMBIA","GREECE","COTE D'IVOIRE","JAPAN"],
        "groupD":["URUGUAY","COSTA RICA","ENGLAND","ITALY"],
        "groupE":["SWITZERLAND","ECUADOR","FRANCE","HONDURAS"],
        "groupF":["ARGENTINA","BOSNIA AND HERZEGOVINA","IRAN","NIGERIA"],
        "groupG":["GERMANY","PORTUGAL","GHANA","USA"],
        "groupH":["BELGIUM","ALGERIA","RUSSIA","KOREA REPUBLIC"]
    ];
    
    var countryList = String[]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myLabel.text = "";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPushed(){
        estChampionCountry();
    }
    
    func shuffle<T>(var list: Array<T>) -> Array<T> {
        for i in 0..list.count {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            list.insert(list.removeAtIndex(j), atIndex: i)
        }
        return list
    }
    
    func shuffleList() {
        for (key, group) in datas {
            for country in group {
                countryList.append(country);
            }
        }
        
        countryList = shuffle(countryList);
    }
    
    func estChampionCountry() {
        
        shuffleList();
        var number = Int(arc4random_uniform(32-1));
        myLabel.text = countryList[number]
        
        let img:UIImage = UIImage(named:myLabel.text+".gif");
        myImage.image = img;

    }

}


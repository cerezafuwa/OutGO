//
//  WeatherPrase.swift
//  OutGo
//
//  Created by 胡贝妮 on 2016/11/6.
//  Copyright © 2016年 胡贝妮. All rights reserved.
//

import UIKit

class WeatherPraseController: UITableViewController {
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windderectionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windpowerLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testXML()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func testXML() {
        //获取xml文件路径
        let url = iTunesURL()
        //获取xml文件内容
        let xmlData = try! Data(contentsOf: url)
        //可以转换为字符串输出查看
        //print(String(data:xmlData, encoding:String.Encoding.utf8))
        
        //使用NSData对象初始化文档对象
        //这里的语法已经把OC的初始化函数直接转换过来了
        let doc:GDataXMLDocument = try! GDataXMLDocument(data:xmlData, options : 0)
        
        //获取Users节点下的所有User节点，显式转换为element类型编译器就不会警告了
        //let users = doc.rootElement().elements(forName: "User") as! [GDataXMLElement]
        
        //通过XPath方式获取Users节点下的所有User节点，在路径复杂时特别方便
        let users = try! doc.nodes(forXPath: "//lives", namespaces:nil) as! [GDataXMLElement]
        
        for user in users {
            //User节点的id属性
            let uid = user.attribute(forName: "type").stringValue()
            //获取tel子节点
            let telElement = user.elements(forName: "live")[0] as! GDataXMLElement
            //获取tel节点下mobile和home节点
            let province = (telElement.elements(forName: "province")[0]
                as! GDataXMLElement).stringValue()
            let city = (telElement.elements(forName: "city")[0]
                as! GDataXMLElement).stringValue()
            let time = (telElement.elements(forName: "reporttime")[0]
                as! GDataXMLElement).stringValue()
            let weather = (telElement.elements(forName: "weather")[0]
                as! GDataXMLElement).stringValue()
            let temp = (telElement.elements(forName: "temperature")[0]
                as! GDataXMLElement).stringValue()
            let winddrection = (telElement.elements(forName: "winddirection")[0]
                as! GDataXMLElement).stringValue()
            let windpower = (telElement.elements(forName: "windpower")[0]
                as! GDataXMLElement).stringValue()
            let humidity = (telElement.elements(forName: "humidity")[0]
                as! GDataXMLElement).stringValue()
            //输出调试信息
            provinceLabel.text = "\(province)"
            cityLabel.text = "\(city)"
            timeLabel.text = "\(time)"
            weatherLabel.text = "\(weather)"
            temperatureLabel.text = "\(temp)"
            windpowerLabel.text = "\(windpower)"
            windderectionLabel.text = "\(winddrection)"
            humidityLabel.text = "\(humidity)"
            
        }
    }
    func iTunesURL() -> URL {
        let url1:String = "https://restapi.amap.com/v3/weather/weatherInfo?key=9875feb5ca66c5b4deb4fce6f7a9d950&city=310114&output=XML"
        let url = URL(string: url1)
        print("URL: \(url!)")
        return url!
    }
}


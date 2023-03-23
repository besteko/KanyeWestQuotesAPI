//
//  ViewController.swift
//  KanyeWestQuotesAPI
//
//  Created by Beste Kocaoglu on 23.03.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func randomQuoteButton(_ sender: Any) {
        
        let url = URL(string: "https://api.kanye.rest/")!
        let task = URLSession.shared.dataTask(with: url){ (Data: Data?, response: URLResponse?,error: Error?) in
            if let error = error{
                print(error)
                return
            }
            let json = try! JSONSerialization.jsonObject(with: Data!, options: []) as! [String: String]
            DispatchQueue.main.async {
                self.quoteLabel.text = json["qoute"]

            }
        }
        
        task.resume()
        
    }
}


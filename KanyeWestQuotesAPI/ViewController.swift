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
        if let url = URL(string: "https://api.kanye.rest/") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let dict = json as? [String: Any], let quote = dict["quote"] as? String {
                            DispatchQueue.main.async {
                                self.quoteLabel.text = quote
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
            
            
        }}
}


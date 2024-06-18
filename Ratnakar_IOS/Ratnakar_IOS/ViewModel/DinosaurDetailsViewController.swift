//
//  DinosaurDetailsViewController.swift
//  Ratnakar_IOS
//
//  Created by MahipalReddy on 18/06/24.
//

import UIKit

class DinosaurDetailsViewController: UIViewController {

    @IBOutlet weak var dinosaurImageView: UIImageView!
    @IBOutlet weak var dinosaurName: UILabel!
    @IBOutlet weak var dinosaurDescription: UILabel!
    var listOfDinosaurs: DinosaurList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDinosaurList()
    }
    
    func loadDinosaurList() {
        if let dinosaurList = listOfDinosaurs {
            dinosaurName.text = dinosaurList.name
            dinosaurDescription.text = dinosaurList.description
            let imageUrl = URL(string: dinosaurList.image)!
            dinosaurImageView.load(url: imageUrl)
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

//
//  HomeVC.swift
//  Ratnakar_IOS
//
//  Created by MahipalReddy on 18/06/24.
//

import UIKit

class HomeVC: UIViewController {

        var viewModel = DinosaurListViewModel()

        
        @IBOutlet weak var dinosaurListTableView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            self.registerCell()
            self.dinosaurListTableView.delegate  = self
            self.dinosaurListTableView.dataSource = self
        }
        
        func registerCell(){
            let nib = UINib(nibName: "DinosaurListTableViewCel", bundle: nil)
            self.dinosaurListTableView.register(nib, forCellReuseIdentifier: "DinosaurListTableViewCel")
        }
    }

    extension HomeVC : UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  viewModel.listOfDinosaurs.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DinosaurListTableViewCel", for: indexPath) as! DinosaurListTableViewCel
            let dinosaur = viewModel.listOfDinosaurs[indexPath.row]
            cell.dinosaurName.text = dinosaur.name
            let imageUrl = URL(string: dinosaur.image)!
            cell.dinosaurImageView.load(url: imageUrl)
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 90
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let dinosaur = viewModel.listOfDinosaurs[indexPath.row]
            let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DinosaurDetailsViewController") as! DinosaurDetailsViewController
            
            vc.listOfDinosaurs = dinosaur
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }





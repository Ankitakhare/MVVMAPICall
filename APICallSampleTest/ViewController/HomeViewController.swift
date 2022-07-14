//
//  ViewController.swift
//  APICallSampleTest
//
//  Created by ankita khare on 09/07/22.
//

import UIKit

class HomeViewController: UIViewController {

        private var transViewModel = APITransactionViewModel()
        
        @IBOutlet weak var tableView: UITableView!

        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            
            self.transViewModel.transLoaded = { [weak self] (_, success) in
                
                if success {
                    self?.tableView.reloadData()
                } else {

                }
            }
        }

        private func setupUI() {
            self.tableView.registerCell(type: TransactionTableViewCell.self)
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
    }

    extension HomeViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        }
    }

    extension HomeViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.transViewModel.numberOrRows()
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueCell(withType: TransactionTableViewCell.self, for: indexPath) as? TransactionTableViewCell,
                let transData = self.transViewModel.getTrans(index: indexPath.row) else {
                return UITableViewCell()
            }
            cell.setTransData(transData: transData)
            return cell
        }

    }





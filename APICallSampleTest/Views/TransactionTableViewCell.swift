//
//  TransactionTableViewCell.swift
//  APICallSampleTest
//
//  Created by ankita khare on 10/07/22.
//


import UIKit


class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var idlable: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.containerView.layer.cornerRadius = 8
        self.containerView.layer.masksToBounds = true
       
    }

    func setTransData(transData: Model) {
        idlable.text = "id: \(transData.id ?? 0)"
        titleLabel.text = transData.transactionDate
        descriptionLabel.text = transData.summary
        ibuLabel.text = "credit +$: \(transData.credit ?? 0)"
        abvLabel.text = "debit -$: \(transData.debit ?? 0)"
    }

}

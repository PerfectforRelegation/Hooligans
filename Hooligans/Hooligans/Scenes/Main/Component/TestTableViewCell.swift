//
//  TestTableViewCell.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/15.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    static let identifier = "testTableViewCell"
    
    var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: .zero, size: .zero)
        label.textColor = .black
        return label
    }()
    
    var date: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: .zero, size: .zero)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        // Configure the view for the selected state
    }

}

extension TestTableViewCell {
    private func setupView() {
        
        addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        
        addSubview(date)
        
        date.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        date.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
    }
}

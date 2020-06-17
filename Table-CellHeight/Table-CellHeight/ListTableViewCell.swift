//
//  ListTableViewCell.swift
//  Table-CellHeight
//
//  Created by 김광준 on 2020/06/16.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "ListTableViewCell"
    
    let cellLabel: UILabel = {
        var cellLabel: UILabel = UILabel()
        cellLabel.textAlignment = .left
        cellLabel.font = UIFont.systemFont(ofSize: 17)
        cellLabel.backgroundColor = .systemOrange
        return cellLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCellLabelAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setUpCellLabelAndConstraints() {
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(cellLabel)
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}

//
//  ListTableViewCell.swift
//  MyMovieChart
//
//  Created by 김광준 on 2020/06/14.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let cellIdentifier: String = "ListTableViewCell"
    
    let cellLabel: UILabel = {
        var cellLabel: UILabel = UILabel()
        cellLabel.textAlignment = .left
        cellLabel.font = UIFont.systemFont(ofSize: 19)
        cellLabel.backgroundColor = .systemOrange
        return cellLabel
    }()
    
    let subTitleCellLabel: UILabel = {
        var subTitleCellLabel: UILabel = UILabel()
        subTitleCellLabel.textAlignment = .left
        subTitleCellLabel.text = "dad"
        subTitleCellLabel.font = UIFont.systemFont(ofSize: 14)
        subTitleCellLabel.backgroundColor = .systemGray
        return subTitleCellLabel
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellLabel()
        setupSubTitleCellLabel()
        self.accessoryType = .disclosureIndicator
        
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
    
    private func setupCellLabel() {
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(cellLabel)
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            //cellLabel.heightAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor, multiplier: 0.5),
            cellLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
        ])
    }
    
    private func setupSubTitleCellLabel() {
        subTitleCellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(subTitleCellLabel)
        
        NSLayoutConstraint.activate([
            subTitleCellLabel.topAnchor.constraint(equalTo: cellLabel.bottomAnchor),
            subTitleCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subTitleCellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            subTitleCellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

}

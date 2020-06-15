//
//  ListTableViewCell.swift
//  MyMovieChart
//
//  Created by 김광준 on 2020/06/14.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "ListTableViewCell"
    
    let thumbnailImageView: UIImageView = {
        var thumbnailImageView: UIImageView = UIImageView()
//        thumbnailImageView.backgroundColor = .systemPurple
        return thumbnailImageView
    }()
    
    let cellLabel: UILabel = {
        var cellLabel: UILabel = UILabel()
        cellLabel.textAlignment = .left
        cellLabel.font = UIFont.systemFont(ofSize: 17)
        cellLabel.backgroundColor = .systemOrange
        cellLabel.tag = 101
        return cellLabel
    }()
    
    let subTitleCellLabel: UILabel = {
        var subTitleCellLabel: UILabel = UILabel()
        subTitleCellLabel.textAlignment = .left
        subTitleCellLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleCellLabel.backgroundColor = .systemGray
        return subTitleCellLabel
    }()
    
    let openDateLabel: UILabel = {
        var openDateLabel: UILabel = UILabel()
        openDateLabel.textAlignment = .right
        openDateLabel.font = UIFont.systemFont(ofSize: 12)
        openDateLabel.backgroundColor = .systemPink
        return openDateLabel
    }()
    
    let ratingLabel: UILabel = {
        var ratingLabel: UILabel = UILabel()
        ratingLabel.textAlignment = .right
        ratingLabel.font = UIFont.systemFont(ofSize: 12)
        ratingLabel.backgroundColor = .systemIndigo
        return ratingLabel
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 컨텐트 뷰 width 값
//        print("😀\(self.contentView.frame.size.width)")
        setUpThumbnailImageViewAndConstraints()
        setUpCellLabelAndConstraints()
        setUpSubTitleCellLabelAndConstraints()
        setUpOpenDateLabelAndConstraints()
        setUpRatingLabelAndConstraints()
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
    
    private func setUpThumbnailImageViewAndConstraints() {
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 55),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 68),
        ])
    }
    
    private func setUpCellLabelAndConstraints() {
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(cellLabel)
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            //cellLabel.heightAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor, multiplier: 0.5),
            cellLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
        ])
    }
    
    private func setUpSubTitleCellLabelAndConstraints() {
        subTitleCellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(subTitleCellLabel)
        
        NSLayoutConstraint.activate([
            subTitleCellLabel.topAnchor.constraint(equalTo: cellLabel.bottomAnchor),
            subTitleCellLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10),
            subTitleCellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            subTitleCellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func setUpOpenDateLabelAndConstraints() {
        openDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(openDateLabel)
        
        NSLayoutConstraint.activate([
            openDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            openDateLabel.leadingAnchor.constraint(equalTo: cellLabel.trailingAnchor),
            openDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            openDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
            
        ])
    }
    
    private func setUpRatingLabelAndConstraints() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: openDateLabel.bottomAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: subTitleCellLabel.trailingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ratingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

}

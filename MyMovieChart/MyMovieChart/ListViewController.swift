//
//  ViewController.swift
//  MyMovieChart
//
//  Created by 김광준 on 2020/06/14.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    lazy var list: [MovieVO] = {
        var dataList = [MovieVO]()
        for (title, desc, opendate, rating, thumbnail) in self.dataSet {
            var mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            dataList.append(mvo)
        }
        return dataList
    }()
    
    var dataSet = [
        ("다크 나이트", "박쥐 가면 쓰고 나오는 영웅물 영화", "2008-09-04", 8.95, "dark.jpg"),
        ("어바웃 타임", "어떠한 순간을 다시 살게 된다면, 과연 완벽한 사랑을 이룰 수 있을까?", "2013-12-05", 9.28, "about.jpg"),
        ("말할 수 없는 비밀", "비밀이 많은데 말 못하는 영화", "2015-05-07", 9.19, "secret.jpg"),
        ("해리 포터와 마법사의 돌","나의 모든 추억이 담겨있는 영화", "2001-12-24", 9.26, "harry.jpg"),
    ]
    
    private let listTableView: UITableView = {
        var listTableView: UITableView = UITableView()
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.reuseIdentifier)
        listTableView.backgroundColor = .white
        /// 테이블 뷰의 하단 빈 목록(빈 테이블 뷰 셀)이 표시되는 것을 채워주는 코드.
        listTableView.tableFooterView = UIView()
        return listTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .green
        self.title = "영화정보"
        listTableView.delegate = self
        listTableView.dataSource = self
        setUpListTableViewAndConstraints()
        // 테이블 뷰 행들의 일괄적인 행 높이 조정 코드
        // 직접 대입하여 행 높이 조정
//        self.listTableView.rowHeight = 70
        
        // 테이블 뷰 행들의 유동적인 행 높이 조정 코드
        // 행 높이가 유동적으로 바뀌지만 각각의 행들이 갖고있는 컨텐츠의 높이가 다르면 그에 따라 각각 달라질 수 있다는 점에 유의한다.
//        self.listTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setUpListTableViewAndConstraints() {
        let guide = self.view.safeAreaLayoutGuide
        
        self.listTableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(listTableView)
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: guide.topAnchor),
            listTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
        ])
    }


}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어옴.
        let row = self.list[indexPath.row]
        
        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier, for: indexPath) as? ListTableViewCell else {
            print("Error: Can't get ListTableViewCell")
            return UITableViewCell()
        }
        
        cell.cellLabel.text = row.title
        cell.subTitleCellLabel.text = row.description
        cell.openDateLabel.text = row.opendate
        cell.ratingLabel.text = row.convertRating
        cell.thumbnailImageView.image = UIImage(named: row.convertThumbnail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    // 테이블 뷰의 각 행의 높이를 정해주는 델리게이트 메소드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


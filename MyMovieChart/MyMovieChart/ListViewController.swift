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
        for (title, desc, opendate, rating) in self.dataSet {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            
            dataList.append(mvo)
        }
        return dataList
    }()
    
    var dataSet = [
        ("다크 나이트", "박쥐 가면 쓰고 나오는 영웅물 영화", "2008-09-04", 8.95),
        ("호우시절", "비 많이 내리는 영화", "2009-10-08", 7.31),
        ("말할 수 없는 비밀", "비밀이 많은데 말 못하는 영화", "2015-05-07", 9.19),
        ("해리 포터와 마법사의 돌","나의 모든 추억이 담겨있는 영화", "2001-12-24", 9.26),
    ]
    
    private let listTableView: UITableView = {
        var listTableView: UITableView = UITableView()
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
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
        setupListTableView()
        self.listTableView.rowHeight = 70
    }
    
    private func setupListTableView() {
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as? ListTableViewCell else {
            print("Error: Can't get ListTableViewCell")
            return UITableViewCell()
        }
        
        cell.cellLabel.text = row.title
        cell.subTitleCellLabel.text = row.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    
}


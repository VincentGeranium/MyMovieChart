//
//  ViewController.swift
//  Table-CellHeight
//
//  Created by 김광준 on 2020/06/16.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 테이블 뷰에 연결될 데이터를 저장하는 배열
    var list: [String] = []
    
    private let listTableView: UITableView = {
        var listTableView: UITableView = UITableView()
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.reuseIdentifier)
        listTableView.backgroundColor = .white
        // MARK: - 테이블 뷰의 하단 빈 목록(빈 테이블 뷰 셀)이 표시되는 것을 채워주는 코드.
        // 아래의 코드는 필요 없으므로 주석 처리. 혹시 테스트를 원한다면 풀어서 사용해보길 권장.
//        listTableView.tableFooterView = UIView()
        return listTableView
    }()

    
    lazy var addSystemItem: UIBarButtonItem = {
        
        var barButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addAction(_:))
        )
        return barButtonItem
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.listTableView.estimatedRowHeight = 50
        self.listTableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = addSystemItem
        
        view.backgroundColor = .systemGray
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        self.title = "글 목록"
        
        setUpListTableViewAndConstraints()
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
    
   
    @objc private func addAction(_ sender: UIBarButtonItem) {
        print("Action")
        // 알림창 객체의 인스턴스를 생성.
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요", preferredStyle: .alert)
        
        // 알림창에 입력폼을 추가
        alert.addTextField { (tf) in
            tf.placeholder = "내용을 입력하세요."
        }
        
        // OK 버튼 객체 생성
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            // 알림창의 0번째 입력필드에 값이 있다면
            if let title = alert.textFields?[0].text {
                // 배열에 읿력된 값을 추가하고 테이블을 갱신
                self.list.append(title)
                self.listTableView.reloadData()
            }
        }
        
        // 취소 버튼 객체 생성
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        // 알림창 객체에 버튼 등록
        alert.addAction(ok)
        alert.addAction(cancel)
        
        // 알림창 띄우기
        self.present(alert, animated: false, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UINavigationBarDelegate {
    // 테이블 뷰 행의 개수를 결정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    // 테이블 뷰의 가로 행 내용을 결정하는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier, for: indexPath) as? ListTableViewCell else {
            print("Error : can't get ListTableViewCell")
            return UITableViewCell()
        }
        // 셀의 기본 텍스트 레이블 행 수 제한을 없앤다.
        // numberOfLines는 레이블 객체의 행 수를 강제로 지정하는 속성.
        cell.cellLabel.numberOfLines = 0
        
        cell.cellLabel.text = list[indexPath.row]
        return cell
    }
    
    // MARK: - 셀의 높이를 조절해주는 메소드(heightForRowAt)
    // 셀의 높이를 조절해주는 메소드
    // viewWillAppera(_:)에 셀프 사이징 셀 방식을 코드로 작성하였으므로 아래의 코드는 주석 처리한다.
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = self.list[indexPath.row]
        
        // 높이를 조절. 기본 높이 60 + 글의 길이가 30자를 넘어갈 때마다 20만큼씩 높이를 늘려준다.
        let height = CGFloat(60 + (row.count / 30) * 20)
        
        return height
    }
 */
}


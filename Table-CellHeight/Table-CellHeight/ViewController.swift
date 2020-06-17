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
    
//    private let addSystemItem: UIBarButtonItem = {
//
//        var barButtonItem = UIBarButtonItem.init(title: "asd", style: .plain, target: , action: #selector(addAction(_:)))
//        return barButtonItem
//    }()


    
    private let listTableView: UITableView = {
        var listTableView: UITableView = UITableView()
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.reuseIdentifier)
        listTableView.backgroundColor = .white
        /// 테이블 뷰의 하단 빈 목록(빈 테이블 뷰 셀)이 표시되는 것을 채워주는 코드.
//        listTableView.tableFooterView = UIView()
        return listTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.rowHeight = 80
//        self.navigationController?.navigationBar.delegate = self
        self.title = "글 목록"
    
//        self.navigationItem.rightBarButtonItem = addSystemItem
        
        
        setUpListTableViewAndConstraints()
    }
    
    @objc func test() {
        print("asd")
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier, for: indexPath) as? ListTableViewCell else {
            print("Error : can't get ListTableViewCell")
            return UITableViewCell()
        }
        
        
        
        return cell
    }
    
    
}

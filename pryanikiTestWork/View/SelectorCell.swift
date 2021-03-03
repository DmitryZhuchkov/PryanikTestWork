//
//  SelectorCell.swift
//  pryanikiTestWork
//
//  Created by Дмитрий Жучков on 14.02.2021.
//

import Foundation
import UIKit
protocol didTapDelegate {
    func didTap(textIs: String)
}
class SelectorCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    var data:JSONDecode?
    var path:String?
    var delegate: didTapDelegate?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data?.data.count) ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath)
        cell.textLabel?.text = data?.data[2].data.variants![indexPath.row].text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTap(textIs: String((data?.data[2].data.variants![indexPath[1]].id)!))
    }
    var SelectorTableView: UITableView?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        SelectorTableView = UITableView(frame: .zero, style: .grouped)
                      guard let SelectorTableView = SelectorTableView else {
                          return
                      }
        SelectorTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ServiceCell")
        SelectorTableView.delegate = self
        SelectorTableView.dataSource = self
        SelectorTableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(SelectorTableView)
        SelectorTableView.topAnchor.constraint(equalTo:topAnchor).isActive = true
        SelectorTableView.leftAnchor.constraint(equalTo:leftAnchor).isActive = true
        SelectorTableView.rightAnchor.constraint(equalTo:rightAnchor).isActive = true
        SelectorTableView.bottomAnchor.constraint(equalTo:bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ViewController.swift
//  pryanikiTestWork
//
//  Created by Дмитрий Жучков on 11.02.2021.
//

import UIKit
import Kingfisher
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, didTapDelegate {
    func didTap(textIs: String) {
        let alert = UIAlertController( title: "", message: textIs, preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default, handler: nil))
              self.present(alert, animated: true, completion: nil)
    }
    var data: JSONDecode?
    var ServiceTableView: UITableView?
    var idLabel: Any = ()
    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceTableView = UITableView(frame: .zero, style: .grouped)
                      guard let ServiceTableView = ServiceTableView else {
                          return
                      }
        ServiceTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ServiceCell")
              ServiceTableView.register(ImageCell.self, forCellReuseIdentifier: "ImageCell")
              ServiceTableView.register(SelectorCell.self, forCellReuseIdentifier: "SelectorCell")
              ServiceTableView.dataSource = self
              ServiceTableView.delegate = self
              ServiceTableView.translatesAutoresizingMaskIntoConstraints = false
              view.addSubview(ServiceTableView)
              ServiceTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
              ServiceTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
              ServiceTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
              ServiceTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    override func viewWillAppear(_ animated: Bool) {
        JSONLoad.service.getData { [weak self] response in
            self!.data = response
            DispatchQueue.main.async {
                self!.ServiceTableView?.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data?.view.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (data != nil) {
        switch data!.view[indexPath.row] {
        case "hz":
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath)
            cell.textLabel?.text = data?.data[0].data.text
            return cell
        case "selector":
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorCell", for: indexPath) as? SelectorCell
            cell?.contentView.isUserInteractionEnabled = false 
            cell?.data = data
            cell?.delegate = self
            return cell!
        case "picture":
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageCell
            cell?.setImage(url: (data?.data[1].data.url)!)
            return cell!
        default:
            return UITableViewCell()
        }
    }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController( title: "", message: (data?.view[indexPath[1]])!, preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default, handler: nil))
              self.present(alert, animated: true, completion: nil)
    }
}

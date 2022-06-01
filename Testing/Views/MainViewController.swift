//
//  ViewController.swift
//  Testing
//
//  Created by  Artem Mazheykin on 26.05.2022.
//

import Alamofire
import UIKit
import PromiseKit
import Kingfisher

class MainViewController: UIViewController {

    var mainViewModel: MainViewModel!
    weak var navigator: Navigator!
    var selectedIndexPath: IndexPath?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel = MainViewModel()
        tableView.delegate = self
        tableView.dataSource = self
        
        _ = mainViewModel.parseJsonAndGetModel().done { _ in
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }

//    private var tableViewData: [(day: String, forecasts: [ForecastModel])]? {
//        didSet {
//            tableView.reloadData()
//        }
//    }

    

}

extension MainViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DispatchQueue.global(qos: .background).async {
            usleep(20000)
            DispatchQueue.main.async {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
        if let cell = tableView.cellForRow(at: indexPath) as? MainTableViewSelectorCell{
            popupAlert(title: "Была нажата кнопка №\(cell.nameLabel.text!)", message: cell.dataLabel.text, actionTitles: ["OK"], actions: [nil])
        }
        
        
    }
    
}

extension MainViewController: UITableViewDataSource{
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return mainViewModel.arrayOfSequenceCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellModel = mainViewModel.arrayOfSequenceCells[indexPath.row]
        switch cellModel{
        case let hzModel as CellHzModel:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewHzCell") as? MainTableViewHzCell{
                    cell.nameLabel.text = hzModel.nameText
                    cell.dataLabel.text = hzModel.dataText
                    return cell
                }
        case let selectorModel as CellSelectorModel:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewSelectorCell") as? MainTableViewSelectorCell{
                    cell.nameLabel.text = "\(selectorModel.IdNumber)"
                    cell.dataLabel.text = selectorModel.text
                    cell.selectorLabel.text = "Selector"
                    return cell
                }
        case let pictureModel as CellPictureModel:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewPictureCell") as? MainTableViewPictureCell{
                    cell.nameLabel.text = pictureModel.nameText
                    cell.dataLabel.text = pictureModel.pictureName
                    cell.picture.kf.setImage(with: URL(string: pictureModel.pictureUrl))
                    return cell
                }
        default: return UITableViewCell()
        }
        return UITableViewCell()
    }
    

}

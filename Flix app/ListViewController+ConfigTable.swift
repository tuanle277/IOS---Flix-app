import UIKit

extension ListViewController
{
    func configTable()
    {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)
        tableView.rowHeight = 210
        tableView.estimatedRowHeight = 210
    }
}

//
//  TableViewController.swift
//  StretchyHeader
//
//  Created by Paul Derbyshire on 26/02/2019.
//  Copyright © 2019 DERBS.CO. All rights reserved.
//
//  Photo by Alev Takil on Unsplash - Thanks!


import UIKit

class TableViewController: UITableViewController {
	
	
	@IBOutlet var headerView: UIView!
	@IBOutlet var headerImageView: UIImageView!
	@IBOutlet var headerViewHeightConstraint: NSLayoutConstraint!
	@IBOutlet var headerViewWidthConstraint: NSLayoutConstraint!
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.backgroundView = headerView
		tableView.contentInset = UIEdgeInsets(top: 210, left: 0, bottom: 0, right: 0)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		headerViewHeightConstraint.constant = 210 + self.view.safeAreaInsets.top
		headerViewWidthConstraint.constant = self.view.bounds.size.width
	}
	
	
	override func scrollViewDidScroll(_ scrollView: UIScrollView) {
		headerViewHeightConstraint.constant = abs(scrollView.contentOffset.y)
	}
	
	
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "Table item " + indexPath.description

        return cell
    }


}




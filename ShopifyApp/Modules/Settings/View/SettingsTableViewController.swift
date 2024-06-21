//
//  SettingsViewController.swift
//  ShopifyApp
//
//  Created by Youssef Waleed on 01/06/2024.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyLabel.text = CurrencyManager.currency
    }
    
    @IBAction func onLogOut(_ sender: Any) {
                _ = LocalDataSource.shared.deleteFromKeychain()
                 let storyboard = UIStoryboard(name: "Samuel", bundle: nil)
                  guard let onBoardingVC = storyboard.instantiateViewController(withIdentifier: "onboardingVC") as? OnboardingViewController else {
                      return
                  }
                 onBoardingVC.modalPresentationStyle = .fullScreen
                 self.present(onBoardingVC, animated: true)
                 self.navigationController?.viewControllers = []
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCurrencySegue" {
            let destVC = segue.destination as? CurrenciesTableViewController
            destVC?.onCurrencyChanged = { selectedCurrency in
                self.currencyLabel.text = selectedCurrency
            }
        }
    }
    
}

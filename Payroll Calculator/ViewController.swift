//
//  ViewController.swift
//  Payroll Calculator
//
//  Created by student19 on 2/7/19.
//  Copyright © 2019 Jose Alvarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // var statementList = ["Milk", "Honey", "Bread", "Tacos", "Tomatoes"]
    
    var statementList = [Employee]() // initialize statement array
    
    // initialize storyboard components
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var hourlyWageLabel: UITextField!
    @IBOutlet weak var hoursWorkedLabel: UITextField!
    @IBOutlet weak var periodSegment: UISegmentedControl!
    @IBOutlet weak var federalTaxRateLabel: UITextField!
    @IBOutlet weak var stateTaxRateLabel: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // method that retrieves the current date and time
    func getCurrentDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: date)
        
    }
    
    @IBAction func submitFormButtonPressed(_ sender: Any) {
        
        // retrieve values from form components
        let firstName: String = firstNameLabel.text ?? ""
        let lastName: String = lastNameLabel.text ?? ""
        let hourlyWageValue: String = hourlyWageLabel.text ?? ""
        let hourlyWage = Double(hourlyWageValue) ?? 0
        let hoursWorkedValue: String = hoursWorkedLabel.text ?? ""
        let hoursWorked = Double(hoursWorkedValue) ?? 0
        let period = periodSegment.titleForSegment(at: periodSegment.selectedSegmentIndex) ?? ""
        let federalTaxRateValue: String = federalTaxRateLabel.text ?? ""
        let federalTaxRate = Double(federalTaxRateValue) ?? 0
        let stateTaxRateValue: String = stateTaxRateLabel.text ?? ""
        let stateTaxRate = Double(stateTaxRateValue) ?? 0
        
        // retrieve the current date
        let dateCreated = getCurrentDate()
        
        
        print(firstName, lastName, hourlyWage, hoursWorked, period, federalTaxRate, stateTaxRate, dateCreated)
        
        let employeeInstance = Employee(firstName: firstName, lastName: lastName, payPeriod: period, hourlyWage: hourlyWage, hoursWorked: hoursWorked, federalTaxRate: federalTaxRate, stateTaxRate: stateTaxRate, dateCreated: dateCreated)
        
        // print(employeeInstance.calculateGrossEarnings())
        
        // print(employeeInstance.getFederalDeduction())
        
        // print(employeeInstance.getStateDeduction())
        
        statementList.append(employeeInstance) // append employee instance to array
        
        // refreshTableViewData()
        
        // print("STATEMENT NAME:", statementList[0].firstName)
        
        self.navigationController?.popToRootViewController(animated: true) // return to initial view controller
        
    }
    
    // method that refreshes the tableView data
    func refreshTableViewData() {
        
        print("Call to refresh executed...")
        
        // self.table.reloadData()
        
        /*
        DispatchQueue.main.async {
            self.table.reloadData()
        } */
        
    }
    
    
    // method that returns a list to the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("FUNCTION THAT RETURNS STATEMENTLIST EXECUTED")
        
        return (statementList.count)
        
    }
    
    // method that inserts cells into the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("FUNCTION THAT INSERTS TO TABLEVIEW EXECUTED!")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        print("MSG: COUNT:", statementList.count)
        
        if (statementList.count > 0) {
            print("MSG: STATEMENTS EXIST!")
            
            cell.textLabel?.text = statementList[indexPath.row].firstName + " " + statementList[indexPath.row].lastName
            cell.detailTextLabel?.text = statementList[indexPath.row].dateCreated
            
        }
        
        return (cell)
    }
    
    // method that navigates from the table view to the details view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // self.performSegue(withIdentifier: "detailsViewController", sender: self)
        
        performSegue(withIdentifier: "detailsViewController", sender: self)
        
    }
    
    
    // method that passes data between table view controller to detals view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailsViewController") {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let destinationViewController = segue.destination as! DetailsViewController
                
                destinationViewController.titleText = statementList[indexPath.row].firstName
                
            }
        
        }
    }
    
}


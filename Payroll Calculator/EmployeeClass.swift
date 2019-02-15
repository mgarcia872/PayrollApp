//
//  EmployeeClass.swift
//  Payroll Calculator
//
//  Created by student19 on 2/9/19.
//  Copyright © 2019 Jose Alvarez. All rights reserved.
//

import Foundation

class Employee: NSObject {
    
    // initialize constants
    let firstName: String
    let lastName: String
    let payPeriod: Int
    let dateCreated: String
    
    // initialize variables
    var hourlyWage: Double
    var hoursWorked: Double
    var federalTaxRate: Double
    var stateTaxRate: Double
    var grossEarnings: Double

    
    init(firstName: String, lastName: String, payPeriod: String, hourlyWage: Double, hoursWorked: Double, federalTaxRate: Double, stateTaxRate: Double, dateCreated: String) {
        
        // set values to constants & variables
        self.firstName = firstName
        self.lastName = lastName
        self.hourlyWage = hourlyWage
        self.hoursWorked = hoursWorked
        self.federalTaxRate = federalTaxRate / 100
        self.stateTaxRate = stateTaxRate / 100
        self.dateCreated = dateCreated
        
        if (payPeriod == "Weekly") {
            self.payPeriod = 2
        } else if (payPeriod == "Bi-Weekly") {
            self.payPeriod = 1
        } else {
            self.payPeriod = 0
        }
        
        grossEarnings = self.hourlyWage * self.hoursWorked * Double(self.payPeriod)
        
    }
    
    // Earnings (wage * hours worked)
    /* Deductions:
        - Federal Income Tax
        - Social Security Tax
        - Medicare Tax
        - IL State Income Tax
     */
    // Final Amount
    
    
    func getFederalDeduction() -> Double {
        
        print("Federal Tax Rate", federalTaxRate)
        
        let federalDeduction = grossEarnings * federalTaxRate
        
        return federalDeduction
        
    }
    
    func getStateDeduction() -> Double {
        
        print("State Tax Rate", stateTaxRate)
        
        let stateDeduction = grossEarnings * stateTaxRate
        
        return stateDeduction
        
    }
    
    func calculateGrossEarnings() -> Double {
        
        return grossEarnings
        
    }
    
    func calculateNetEarnings() -> Double {
        
        let federalDeduction: Double = grossEarnings * federalTaxRate
        
        let stateDeduction: Double = grossEarnings * stateTaxRate
        
        let netEarnings: Double = grossEarnings - federalDeduction - stateDeduction
        
        return netEarnings
        
    }
    
    /*
    func updateHourlyWage (hourlyWage: Double) {
        self.hourlyWage = hourlyWage
    }
    
    func updateFederalTaxRate (federalTaxRate: Double) {
        self.federalTaxRate = federalTaxRate
    }
    
    func updateStateTaxRate(stateTaxRate: Double) {
        self.stateTaxRate = stateTaxRate
    }
    */
    
}

import UIKit

class Bank {
    var accountType = ""
    
    func greetCustomer() {
        print("Welcome to your virtual bank system.")
    }
    func onboardCustomer() {
        print("What kind of account would you like to open?")
        print("1. Debit account")
        print("2. Credit account")
    }
    func makeAccount(numberPadKey: Int) {
        print("The selected option is \(numberPadKey).")
        switch numberPadKey {
        case 1:
            accountType = "dedit"
        case 2:
            accountType = "credit"
        default:
            print("Invalid input: \(numberPadKey)")
            return
        }
        print("You have opened a \(accountType) account.")
    }
}

let abcBank = Bank()
abcBank.greetCustomer()
repeat {
    abcBank.onboardCustomer()
    let numberPadKey = Int.random(in: 1...3)
    abcBank.makeAccount(numberPadKey: numberPadKey)
} while abcBank.accountType == ""

struct BankAccount {
    var debitBalance: Int = 0
    var creditBalance: Int = 0
    let creditLimit: Int = 100
    
    var debitBalanceInfo: String {
        "Debit balance: $\(debitBalance)"
    }
    
    var availableCredit: Int {
        creditLimit + creditBalance
    }
    
    var creditBalanceInfo: String {
        "Available credit: $\(availableCredit)"
    }
    
    mutating func debitDeposit(_ amount: Int) {
        debitBalance += amount
        print("Debit deposit: $\(amount). \(debitBalanceInfo)")
    }
    
    mutating func debitWithdraw(_ amount: Int) {
        if (amount > debitBalance) {
            print("Insufficient funds to withdraw $\(amount). \(debitBalanceInfo)")
        } else {
            debitBalance -= amount
            print("Debit withdraw: $\(amount). \(debitBalanceInfo)")
        }
    }
    
    mutating func creditDeposit(_ amount: Int) {
            creditBalance += amount
            print("Credit deposit: $\(amount). \(creditBalanceInfo)")
            if creditBalance == 0 {
                print("Paid off credit balance.")
            } else if creditBalance > 0 {
                print("Overpaid credit balance.")
            }
        }
    
        mutating func creditWithdraw(_ amount: Int) {
            if amount > availableCredit {
                print("Insufficient credit to withdraw $\(amount). \(creditBalanceInfo)")
            } else {
                creditBalance -= amount
                print("Credit withdraw: $\(amount). \(creditBalanceInfo)")
            }
        }
}

var bankAccount = BankAccount()
print(bankAccount.debitBalanceInfo)
bankAccount.debitDeposit(100)
bankAccount.debitWithdraw(20)
bankAccount.debitWithdraw(81)
print(bankAccount.creditBalanceInfo)
bankAccount.creditWithdraw(101)
bankAccount.creditWithdraw(100)
bankAccount.creditDeposit(50)
bankAccount.creditDeposit(50)
bankAccount.creditDeposit(100)

//
//  swift Stream 9
//  Lesson 7
//
//  Created by Evgeny Mastepan on 09.10.2024.
//

import Foundation

/* Домашнее задание:
 
 1. Создать структуру Rectangle:
 • Свойства: width и height.
 • Метод для расчёта площади.
 • Метод для проверки, является ли прямоугольник квадратом.
 
 */

struct Rectangle {
    var width:  Int
    var height: Int
    
    func square () -> Int {
        return width * height
    }
    
    func isBox () -> Bool {
        if width == height {
            return true
            
        } else { return false }
    }
}

let example = Rectangle.init(width: 56, height: 56)

print ("Площадь равна = ", example.square())
if example.isBox() {
    print ("Поздравляю, у нас квадрат!")
} else {
    print("К сожалению, это не квадрат.")
}


/* 2. Создать структуру BankAccount:
 • Свойства: accountNumber, balance.
 • Метод для пополнения счёта.
 • Метод для снятия денег (с проверкой, что сумма не превышает баланс).
 */

struct BancAccount {
    var accountNumber: Int
    var balance: Double
    private let strDouble = { (num: Double) -> String in String(format: "%.2f", num) }
    
    func accountBalance() {
        print("Состояние счёта №\(accountNumber) = \(strDouble(balance))")
    }

    mutating func addingFunds(addingFunds funds: Double) {
        balance += funds
        print("Сумма \(funds) добавлена.")
        accountBalance()
    }
    
    mutating func withdraw(withdrawalFunds funds: Double) {
        if funds <= balance {
            balance -= funds
            print ("Списание на сумму \(funds) произведено.")
            accountBalance()
        } else {
            print("Недостаточно средств на счету.")
        }
    }
}

var myDebit = BancAccount(accountNumber: 314159, balance: 524669.50)
myDebit.accountBalance()
myDebit.addingFunds(addingFunds: 10000.00)
myDebit.withdraw(withdrawalFunds: 4559.80)

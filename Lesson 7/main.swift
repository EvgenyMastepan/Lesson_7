//
//  swift Stream 9
//  Lesson 7
//
//  Created by Evgeny Mastepan on 09.10.2024.
//

import Foundation
//
///* Домашнее задание:
//
// 1. Создать структуру Rectangle:
// • Свойства: width и height.
// • Метод для расчёта площади.
// • Метод для проверки, является ли прямоугольник квадратом.
//
// */
//
//struct Rectangle {
//    var width:  Int
//    var height: Int
//
//    func square () -> Int {
//        return width * height
//    }
//
//    func isBox() -> Bool {
//        width == height
//    }
//}
//
//let example = Rectangle.init(width: 56, height: 56)
//
//print ("Площадь равна = ", example.square())
//if example.isBox() {
//    print ("Поздравляю, у нас квадрат!")
//} else {
//    print("К сожалению, это не квадрат.")
//}
//
//
///* 2. Создать структуру BankAccount:
// • Свойства: accountNumber, balance.
// • Метод для пополнения счёта.
// • Метод для снятия денег (с проверкой, что сумма не превышает баланс).
// */
//
//// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//// Задание закоммениторовано потому что одно из следующих заданий по условию дублирует имена.
//// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
////struct BancAccount {
////    var accountNumber: Int
////    var balance: Double
////    private let strDouble = { (num: Double) -> String in String(format: "%.2f", num) }
////
////    func accountBalance() {
////        print("Состояние счёта №\(accountNumber) = \(strDouble(balance))")
////    }
////
////    mutating func addingFunds(addingFunds funds: Double) {
////        balance += funds
////        print("Сумма \(funds) добавлена.")
////        accountBalance()
////    }
////
////    mutating func withdraw(withdrawalFunds funds: Double) {
////        if funds <= balance {
////            balance -= funds
////            print ("Списание на сумму \(funds) произведено.")
////            accountBalance()
////        } else {
////            print("Недостаточно средств на счету.")
////        }
////    }
////}
////
////var myDebit = BancAccount(accountNumber: 314159, balance: 524669.50)
////myDebit.accountBalance()
////myDebit.addingFunds(addingFunds: 10000.00)
////myDebit.withdraw(withdrawalFunds: 4559.80)
//
///*
// Задача 3: Магазин товаров
// Создайте структуру Product, которая описывает товар в магазине. У каждого товара должны быть следующие свойства:
// 1. Название товара (name) — строка.
// 2. Цена за единицу (price) — число с плавающей точкой.
// 3. Количество на складе (quantity) — целое число.
// Реализуйте в структуре следующие методы:
// ● totalCost() — возвращает общую стоимость всех
// единиц данного товара (цена * количество).
// ● restock(_:) — метод, который принимает количество и
// увеличивает запас на складе.
// ● sell(_:) — метод, который принимает количество и
// уменьшает запас на складе. Если на складе недостаточно товара, выводите сообщение: "Недостаточно товара на складе".
// */
//
//struct Product {
//    var name: String
//    var price: Double
//    var quantity: Int
//
//    func totalCost() -> Double {
//        return price * Double(quantity)
//    }
//
//    mutating func restock(amount amt: Int) {
//        quantity += amt
//    }
//
//    mutating func sell(amount amt: Int) {
//        if amt <= quantity {
//            quantity -= amt
//        } else {
//            print ("Недостаточно товара на складе")
//        }
//    }
//}
//
//var iphone = Product(name: "Айфон", price: 100000.00, quantity: 50)
//print ("Товара \(iphone.name) на складе на сумму = ", iphone.totalCost())
//iphone.restock(amount: 15)
//print ("Товара \(iphone.name) на складе на сумму = ", iphone.totalCost())
//iphone.sell(amount: 49)
//print ("Товара \(iphone.name) на складе на сумму = ", iphone.totalCost())
//iphone.sell(amount: 50)

/* Задача 1: Управление банковским счётом
 Создайте структуру BankAccount, которая описывает банковский счёт. У счёта должны быть следующие свойства:
 1. Номер счёта (accountNumber) — строка.
 2. Баланс (balance) — число с плавающей точкой.
 Реализуйте в структуре:
 ● deposit(_:) — метод, который увеличивает баланс на указанную сумму.
 ● withdraw(_:) — метод, который снимает указанную сумму со счёта. Если на счёте недостаточно средств, выводите сообщение "Недостаточно средств на счёте".
 ● transfer(amount:to:) — метод, который переводит указанную сумму на другой банковский счёт (объект BankAccount). Если средств недостаточно, операция должна быть отклонена. */

struct BancAccount {
    var accountNumber: String
    var balance: Double
    private let strDouble = { (num: Double) -> String in String(format: "%.2f", num) }
    
    func accountBalance() {
        print("Состояние счёта №\(accountNumber) = \(strDouble(balance))")
    }

    mutating func deposit(addingFunds funds: Double) {
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
            print("Недостаточно средств на счете.")
        }
    }
    
    mutating func transfer (amount: Double, to: inout BancAccount) {
        // Тут в реальном приложении хорошо бы передавать экземпляр счета получателя как опционал и списывать со счета отправителя только при валидном результате проверки раскрытия опционала и подтверждении выполнения операции зачисления.
        if amount <= balance {
            balance -= amount
            to.balance += amount
            print("Перевод средств со счёта \(accountNumber) на счёт \(to.accountNumber) произведён.")
            accountBalance()
            // Внимание! Отладочная информация! Перед релизом обязательно удалить!
            print (to.accountBalance())
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        } else {
            print ("Недостаточно средств насчёте.")
        }
    }
}


var myDebit = BancAccount(accountNumber: "314159", balance: 524669.50)
myDebit.accountBalance()
myDebit.deposit(addingFunds: 10000.00)
myDebit.withdraw(withdrawalFunds: 4559.80)
var recipientDebit = BancAccount(accountNumber: "965329", balance: 10000.00)
recipientDebit.accountBalance()
myDebit.transfer(amount: 5000.00, to: &recipientDebit)


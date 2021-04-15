//
//  SwiftTDDTests.swift
//  SwiftTDDTests
//
//  Created by GwanhoKim on 2021/04/06.
//

import XCTest
@testable import SwiftTDD

class SwiftTDDTests: XCTestCase {

    func testMultiplication() throws {
//        let five = Dollar(5)
//        five.times(2)
//        XCTAssertEqual(10, five.amount)
    }

    func testMultiplication1() throws {
        class Dollar {
            var amount: Int = 0

            init(_ amount: Int) {
                
            }

            func times(_ multiplier: Int) {
                
            }
        }
        let five = Dollar(5)
        five.times(2)
        XCTAssertEqual(10, five.amount)
    }
    
    func testMultiplication2() throws {
        class Dollar {
            var amount: Int = 10

            init(_ amount: Int) {
                
            }

            /*
            스텁(stub) 메서드의 서명부와 (반환값이 있을 경우) 반환 명령만 적는 식으로 해서, 이 메서드를 호출하는 코드가 컴파일 될 수 있도록 껍데기만 만들어 두는것.
             */
            func times(_ multiplier: Int) {
                
            }
        }
        let five = Dollar(5)
        five.times(2)
        XCTAssertEqual(10, five.amount)
    }
    
    func testMultiplication3() throws {
        class Dollar {
            var amount: Int = 10

            init(_ amount: Int) {
                
            }

            func times(_ multiplier: Int) {
                amount = 5 * 2
            }
        }
        let five = Dollar(5)
        five.times(2)
        XCTAssertEqual(10, five.amount)
    }
    
    func testMultiplication4() throws {
        class Dollar {
            var amount: Int

            init(_ amount: Int) {
                self.amount = amount
            }

            func times(_ multiplier: Int) {
                self.amount *= multiplier
            }
        }
        let five = Dollar(5)
        five.times(2)
        XCTAssertEqual(10, five.amount)
    }

    func testMultiplication5() throws {
//        class Dollar {
//            var amount: Int
//
//            init(_ amount: Int) {
//                self.amount = amount
//            }
//
//            func times(_ multiplier: Int) {
//                self.amount *= multiplier
//            }
//        }
//        let five = Dollar(5)
//        five.times(2)
//        XCTAssertEqual(10, product.amount)
//        five.times(3)
//        XCTAssertEqual(15, product.amount)
    }

    func testMultiplication6() throws {
//        class Dollar {
//            var amount: Int
//
//            init(_ amount: Int) {
//                self.amount = amount
//            }
//
//            func times(_ multiplier: Int) {
//                self.amount *= multiplier
//            }
//        }
//        let five = Dollar(5)
//        var product: Dollar = five.times(2)
//        XCTAssertEqual(10, product.amount)
//        product = five.times(3)
//        XCTAssertEqual(15, product.amount)
    }
    
    func testMultiplication7() throws {
        class Dollar {
            var amount: Int

            init(_ amount: Int) {
                self.amount = amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                self.amount *= multiplier
                return nil
            }
        }
        let five = Dollar(5)
        var product: Dollar = five.times(2)!
        XCTAssertEqual(10, product.amount)
        product = five.times(3)!
        XCTAssertEqual(15, product.amount)
    }

    func testMultiplication8() throws {
        class Dollar {
            var amount: Int

            init(_ amount: Int) {
                self.amount = amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                self.amount *= multiplier
                return nil
            }
        }
        let five = Dollar(5)
        var product: Dollar = five.times(2)!
        XCTAssertEqual(10, product.amount)
        product = five.times(3)!
        XCTAssertEqual(15, product.amount)
    }
    
    /*
     - 가짜로 구현하기: 상수를 반환하게 만들고 진짜 코드를 얻을 떄까지 단계적으로 상수를 변수로 바꾸어 간다.
     - 명백한 구현 사용하기: 실제 구현을 입력한다.
     */
    
    func testMultiplication9() throws {
        class Dollar {
            var amount: Int

            init(_ amount: Int) {
                self.amount = amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                return Dollar(self.amount * multiplier)
            }
        }
        let five = Dollar(5)
        var product: Dollar = five.times(2)!
        XCTAssertEqual(10, product.amount)
        product = five.times(3)!
        XCTAssertEqual(15, product.amount)
    }
    
    
    
    
    func testEquality() throws {
//        class Dollar {
//            var amount: Int
//
//            init(_ amount: Int) {
//                self.amount = amount
//            }
//
//            func times(_ multiplier: Int) -> Dollar? {
//                return Dollar(self.amount * multiplier)
//            }
//        }
//        XCTAssertTrue(Dollar(5).equals(Dollar(5)))
    }
    
    func testEquality1() throws {
        class Dollar {
            var amount: Int

            init(_ amount: Int) {
                self.amount = amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                return Dollar(self.amount * multiplier)
            }
            
            func equals(_ object: AnyObject) -> Bool {
                return true
            }
        }
        XCTAssertTrue(Dollar(5).equals(Dollar(5)))
    }
    
    func testEquality2() throws {
        class Dollar {
            var amount: Int

            init(_ amount: Int) {
                self.amount = amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                return Dollar(self.amount * multiplier)
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let dollar = object as! Dollar
                return amount == dollar.amount
            }
        }
        XCTAssertTrue(Dollar(5).equals(Dollar(5)))
        XCTAssertFalse(Dollar(5).equals(Dollar(6)))
    }

    func testMultiplication10() throws {
        class Dollar {
            var amount: Int
            var value: Int {
                return self.amount
            }

            init(_ amount: Int) {
                self.amount = amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                return Dollar(self.amount * multiplier)
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let dollar = object as! Dollar
                return amount == dollar.amount
            }
        }
        let five = Dollar(5)
        XCTAssertEqual(Dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Dollar(15).value, five.times(3)!.value)
    }
    
    func testMultiplication11() throws {
        class Dollar {
            private var amount: Int
            var value: Int {
                return self.amount
            }

            init(_ amount: Int) {
                self.amount = amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                return Dollar(self.amount * multiplier)
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let dollar = object as! Dollar
                return amount == dollar.amount
            }
        }
        let five = Dollar(5)
        XCTAssertEqual(Dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Dollar(15).value, five.times(3)!.value)
    }

    func testFrancMultiplication() throws {
        class Franc {
            private var amount: Int
            var value: Int {
                return self.amount
            }

            init(_ amount: Int) {
                self.amount = amount
            }

            func times(_ multiplier: Int) -> Franc? {
                return Franc(self.amount * multiplier)
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let dollar = object as! Franc
                return amount == dollar.amount
            }
        }
        let five = Franc(5)
        XCTAssertEqual(Franc(10).value, five.times(2)!.value)
        XCTAssertEqual(Franc(15).value, five.times(3)!.value)
    }
    
    func testMoney() throws {
        class Money {
            fileprivate var amount: Int
            
            init(_ amount: Int) {
                self.amount = amount
            }
            
        }

        class Dollar: Money {
            var value: Int {
                return self.amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                return Dollar(self.amount * multiplier)
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let dollar = object as! Money
                return amount == dollar.amount
            }
        }
        let five = Dollar(5)
        XCTAssertEqual(Dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Dollar(15).value, five.times(3)!.value)
    }
    
    func testMoney2() throws {
        class Money {
            fileprivate var amount: Int
            
            init(_ amount: Int) {
                self.amount = amount
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount
            }
        }

        class Dollar: Money {
            var value: Int {
                return self.amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                return Dollar(self.amount * multiplier)
            }
        }
        class Franc: Money {
            var value: Int {
                return self.amount
            }

            func times(_ multiplier: Int) -> Franc? {
                return Franc(self.amount * multiplier)
            }
        }
        XCTAssertTrue(Dollar(5).equals(Dollar(5)))
        XCTAssertFalse(Dollar(5).equals(Dollar(6)))
        XCTAssertTrue(Franc(5).equals(Franc(5)))
        XCTAssertFalse(Franc(5).equals(Franc(6)))
    }
    
    func testMoney3() throws {
        class Money {
            fileprivate var amount: Int
            
            init(_ amount: Int) {
                self.amount = amount
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount
            }
        }

        class Dollar: Money {
            var value: Int {
                return self.amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                return Dollar(self.amount * multiplier)
            }
        }
        class Franc: Money {
            var value: Int {
                return self.amount
            }

            func times(_ multiplier: Int) -> Franc? {
                return Franc(self.amount * multiplier)
            }
        }
        XCTAssertTrue(Dollar(5).equals(Dollar(5)))
        XCTAssertFalse(Dollar(5).equals(Dollar(6)))
        XCTAssertTrue(Franc(5).equals(Franc(5)))
        XCTAssertFalse(Franc(5).equals(Franc(6)))
        XCTAssertFalse(Franc(5).equals(Dollar(5)))
    }
    
    func testMoney4() throws {
        class Money {
            fileprivate var amount: Int
            
            init(_ amount: Int) {
                self.amount = amount
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self)" == "\(money.self)"
            }
        }

        class Dollar: Money {
            var value: Int {
                return self.amount
            }

            func times(_ multiplier: Int) -> Dollar? {
                return Dollar(self.amount * multiplier)
            }
        }
        class Franc: Money {
            var value: Int {
                return self.amount
            }

            func times(_ multiplier: Int) -> Franc? {
                return Franc(self.amount * multiplier)
            }
        }
        XCTAssertTrue(Dollar(5).equals(Dollar(5)))
        XCTAssertFalse(Dollar(5).equals(Dollar(6)))
        XCTAssertTrue(Franc(5).equals(Franc(5)))
        XCTAssertFalse(Franc(5).equals(Franc(6)))
        XCTAssertFalse(Franc(5).equals(Dollar(5)))
    }
    
    func testMoney5() throws {
        class Money {
            fileprivate var amount: Int
            
            var value: Int {
                return self.amount
            }
        
            init(_ amount: Int) {
                self.amount = amount
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self)" == "\(money.self)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return nil
            }
            
            static func dollar(_ amount: Int) -> Dollar {
                return Dollar(amount)
            }
        }

        class Dollar: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Dollar(self.amount * multiplier)
            }
        }
        class Franc: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Franc(self.amount * multiplier)
            }
        }
        XCTAssertTrue(Dollar(5).equals(Dollar(5)))
        XCTAssertFalse(Dollar(5).equals(Dollar(6)))
        XCTAssertTrue(Franc(5).equals(Franc(5)))
        XCTAssertFalse(Franc(5).equals(Franc(6)))
        XCTAssertFalse(Franc(5).equals(Dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Dollar(15).value, five.times(3)!.value)
    }
    
    func testMoney6() throws {
        class Money {
            fileprivate var amount: Int
            
            var value: Int {
                return self.amount
            }
        
            init(_ amount: Int) {
                self.amount = amount
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self)" == "\(money.self)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return nil
            }
            
            static func dollar(_ amount: Int) -> Dollar {
                return Dollar(amount)
            }
            
            static func franc(_ amount: Int) -> Franc {
                return Franc(amount)
            }
        }

        class Dollar: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Dollar(self.amount * multiplier)
            }
        }
        class Franc: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Franc(self.amount * multiplier)
            }
        }
        XCTAssertTrue(Money.dollar(5).equals(Money.dollar(5)))
        XCTAssertFalse(Money.dollar(5).equals(Money.dollar(6)))
        XCTAssertTrue(Money.franc(5).equals(Money.franc(5)))
        XCTAssertFalse(Money.franc(5).equals(Money.franc(6)))
        XCTAssertFalse(Money.franc(5).equals(Money.dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Money.dollar(15).value, five.times(3)!.value)
    }
    
    func testMoney7() throws {
        class Money {
            fileprivate var amount: Int
            
            var value: Int {
                return self.amount
            }
            
            var currency: String {
                return ""
            }
        
            init(_ amount: Int) {
                self.amount = amount
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self)" == "\(money.self)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return nil
            }
            
            static func dollar(_ amount: Int) -> Dollar {
                return Dollar(amount)
            }
            
            static func franc(_ amount: Int) -> Franc {
                return Franc(amount)
            }
        }

        class Dollar: Money {
            override var currency: String {
                return "USD"
            }

            override func times(_ multiplier: Int) -> Money? {
                return Dollar(self.amount * multiplier)
            }
        }
        class Franc: Money {
            override var currency: String {
                return "CHF"
            }

            override func times(_ multiplier: Int) -> Money? {
                return Franc(self.amount * multiplier)
            }
        }
        XCTAssertTrue(Money.dollar(5).equals(Money.dollar(5)))
        XCTAssertFalse(Money.dollar(5).equals(Money.dollar(6)))
        XCTAssertTrue(Money.franc(5).equals(Money.franc(5)))
        XCTAssertFalse(Money.franc(5).equals(Money.franc(6)))
        XCTAssertFalse(Money.franc(5).equals(Money.dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Money.dollar(15).value, five.times(3)!.value)
        
        
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
    }
    
    func testMoney8() throws {
        class Money {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self)" == "\(money.self)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return nil
            }
            
            static func dollar(_ amount: Int) -> Dollar {
                return Dollar(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Franc {
                return Franc(amount, currency: "CHF")
            }
        }

        class Dollar: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Money.dollar(self.amount * multiplier)
            }
        }
        class Franc: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Money.franc(self.amount * multiplier)
            }
        }
        XCTAssertTrue(Money.dollar(5).equals(Money.dollar(5)))
        XCTAssertFalse(Money.dollar(5).equals(Money.dollar(6)))
        XCTAssertTrue(Money.franc(5).equals(Money.franc(5)))
        XCTAssertFalse(Money.franc(5).equals(Money.franc(6)))
        XCTAssertFalse(Money.franc(5).equals(Money.dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Money.dollar(15).value, five.times(3)!.value)
        
        
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
    }
    
    func testMoney9() throws {
        class Money {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self)" == "\(money.self)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return nil
            }
            
            static func dollar(_ amount: Int) -> Dollar {
                return Dollar(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Franc {
                return Franc(amount, currency: "CHF")
            }
        }

        class Dollar: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Dollar(self.amount * multiplier, currency: self.currency)
            }
        }
        class Franc: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Franc(self.amount * multiplier, currency: self.currency)
            }
        }
        XCTAssertTrue(Money.dollar(5).equals(Money.dollar(5)))
        XCTAssertFalse(Money.dollar(5).equals(Money.dollar(6)))
        XCTAssertTrue(Money.franc(5).equals(Money.franc(5)))
        XCTAssertFalse(Money.franc(5).equals(Money.franc(6)))
        XCTAssertFalse(Money.franc(5).equals(Money.dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Money.dollar(15).value, five.times(3)!.value)
        
        
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
    }
    
    func testMoney10() throws {
        class Money {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self)" == "\(money.self)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return nil
            }
            
            static func dollar(_ amount: Int) -> Dollar {
                return Dollar(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Franc {
                return Franc(amount, currency: "CHF")
            }
        }

        class Dollar: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
        }
        class Franc: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
        }
        XCTAssertTrue(Money.dollar(5).equals(Money.dollar(5)))
        XCTAssertFalse(Money.dollar(5).equals(Money.dollar(6)))
        XCTAssertTrue(Money.franc(5).equals(Money.franc(5)))
        XCTAssertFalse(Money.franc(5).equals(Money.franc(6)))
        XCTAssertFalse(Money.franc(5).equals(Money.dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Money.dollar(15).value, five.times(3)!.value)
        
        
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
    }
    
    func testMoney11() throws {
        class Money {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self)" == "\(money.self)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return nil
            }
            
            static func dollar(_ amount: Int) -> Dollar {
                return Dollar(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Franc {
                return Franc(amount, currency: "CHF")
            }
        }

        class Dollar: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
        }
        class Franc: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
        }
        XCTAssertTrue(Money.dollar(5).equals(Money.dollar(5)))
        XCTAssertFalse(Money.dollar(5).equals(Money.dollar(6)))
        XCTAssertTrue(Money.franc(5).equals(Money.franc(5)))
        XCTAssertFalse(Money.franc(5).equals(Money.franc(6)))
        XCTAssertFalse(Money.franc(5).equals(Money.dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Money.dollar(15).value, five.times(3)!.value)
        
        
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
        XCTAssertTrue(Money(10, currency: "CHF").equals(Franc(10, currency: "CHF")))
    }
    
    func testMoney12() throws {
        class Money {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return nil
            }
            
            static func dollar(_ amount: Int) -> Dollar {
                return Dollar(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Franc {
                return Franc(amount, currency: "CHF")
            }
        }

        class Dollar: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
        }
        class Franc: Money {
            override func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
        }
        XCTAssertTrue(Money.dollar(5).equals(Money.dollar(5)))
        XCTAssertFalse(Money.dollar(5).equals(Money.dollar(6)))
        XCTAssertTrue(Money.franc(5).equals(Money.franc(5)))
        XCTAssertFalse(Money.franc(5).equals(Money.franc(6)))
        XCTAssertFalse(Money.franc(5).equals(Money.dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Money.dollar(15).value, five.times(3)!.value)
        
        
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
        XCTAssertTrue(Money(10, currency: "CHF").equals(Franc(10, currency: "CHF")))
    }
    
    func testMoney13() throws {
        class Money {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            static func dollar(_ amount: Int) -> Dollar {
                return Dollar(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Franc {
                return Franc(amount, currency: "CHF")
            }
        }

        class Dollar: Money {
            
        }
        
        class Franc: Money {
            
        }
        XCTAssertTrue(Money.dollar(5).equals(Money.dollar(5)))
        XCTAssertFalse(Money.dollar(5).equals(Money.dollar(6)))
        XCTAssertTrue(Money.franc(5).equals(Money.franc(5)))
        XCTAssertFalse(Money.franc(5).equals(Money.franc(6)))
        XCTAssertFalse(Money.franc(5).equals(Money.dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Money.dollar(15).value, five.times(3)!.value)
        
        
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
        XCTAssertTrue(Money(10, currency: "CHF").equals(Franc(10, currency: "CHF")))
    }
    
    func testMoney14() throws {
        class Money {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }

        XCTAssertTrue(Money.dollar(5).equals(Money.dollar(5)))
        XCTAssertFalse(Money.dollar(5).equals(Money.dollar(6)))
        XCTAssertTrue(Money.franc(5).equals(Money.franc(5)))
        XCTAssertFalse(Money.franc(5).equals(Money.franc(6)))
        XCTAssertFalse(Money.franc(5).equals(Money.dollar(5)))
        
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10).value, five.times(2)!.value)
        XCTAssertEqual(Money.dollar(15).value, five.times(3)!.value)
        
        
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
        XCTAssertTrue(Money(10, currency: "CHF").equals(Money(10, currency: "CHF")))
    }
    
    func testMoney15() throws {
        class Money {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Money {
                return Money(amount + addend.amount, currency: currency)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }

        let sum = Money.dollar(5).plus(Money.dollar(5))
        XCTAssertTrue(Money.dollar(10).equals(sum))
    }
    
    func testBank() throws {
        class Experssion {
            
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Experssion {
                return Money(amount + addend.amount, currency: currency)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        class Bank {
            func reduce(_ source: Experssion, to: String) -> Money {
                return Money.dollar(10)
            }
        }
        
        let five: Money = Money.dollar(5)
        let bank = Bank()
        let sum = five.plus(five)
        let reduced = bank.reduce(sum, to: "USD")
        XCTAssertTrue(Money.dollar(10).equals(reduced))
    }
    
    func testBank2() throws {
        class Experssion {
            
        }
        
        class Sum: Experssion {
            var augend: Money
            var addend: Money
            
            init(_ augend: Money, _ addend: Money) {
                self.augend = augend
                self.addend = addend
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Experssion {
                return Sum(self, addend)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        class Bank {
            func reduce(_ source: Experssion, to: String) -> Money {
                return Money.dollar(10)
            }
        }
        
        let five: Money = Money.dollar(5)
        let result: Experssion = five.plus(five)
        let sum: Sum = result as! Sum
        XCTAssertTrue(five.equals(sum.augend))
        XCTAssertTrue(five.equals(sum.addend))
        
        let bank = Bank()
        let reduced = bank.reduce(sum, to: "USD")
        XCTAssertTrue(Money.dollar(10).equals(reduced))
        
        let sum2 = Sum(Money.dollar(3), Money.dollar(4))
        let result2 = bank.reduce(sum2, to: "USD")
        XCTAssertTrue(Money.dollar(7).equals(result2))
    }
    
    func testBank3() throws {
        class Experssion {
            
        }
        
        class Sum: Experssion {
            var augend: Money
            var addend: Money
            
            init(_ augend: Money, _ addend: Money) {
                self.augend = augend
                self.addend = addend
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Experssion {
                return Sum(self, addend)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        class Bank {
            func reduce(_ source: Experssion, to: String) -> Money {
                let sum = source as! Sum
                let amount = sum.augend.amount + sum.addend.amount
                return Money(amount, currency: to)
            }
        }
        
        let five: Money = Money.dollar(5)
        let result: Experssion = five.plus(five)
        let sum: Sum = result as! Sum
        XCTAssertTrue(five.equals(sum.augend))
        XCTAssertTrue(five.equals(sum.addend))
        
        let bank = Bank()
        let reduced = bank.reduce(sum, to: "USD")
        XCTAssertTrue(Money.dollar(10).equals(reduced))
        
        let sum2 = Sum(Money.dollar(3), Money.dollar(4))
        let result2 = bank.reduce(sum2, to: "USD")
        XCTAssertTrue(Money.dollar(7).equals(result2))
    }
    
    func testBank4() throws {
        class Experssion {
            
        }
        
        class Sum: Experssion {
            var augend: Money
            var addend: Money
            
            init(_ augend: Money, _ addend: Money) {
                self.augend = augend
                self.addend = addend
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Experssion {
                return Sum(self, addend)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        class Bank {
            func reduce(_ source: Experssion, to: String) -> Money {
                let sum = source as! Sum
                let amount = sum.augend.amount + sum.addend.amount
                return Money(amount, currency: to)
            }
        }
        
        let five: Money = Money.dollar(5)
        let result: Experssion = five.plus(five)
        let sum: Sum = result as! Sum
        XCTAssertTrue(five.equals(sum.augend))
        XCTAssertTrue(five.equals(sum.addend))
        
        let bank = Bank()
        let reduced = bank.reduce(sum, to: "USD")
        XCTAssertTrue(Money.dollar(10).equals(reduced))
        
        let sum2 = Sum(Money.dollar(3), Money.dollar(4))
        let result2 = bank.reduce(sum2, to: "USD")
        XCTAssertTrue(Money.dollar(7).equals(result2))
        
        let result3 = bank.reduce(Money.dollar(1), to: "USD")
        XCTAssertTrue(Money.dollar(1).equals(result3))
    }
    
    func testBank5() throws {
        class Experssion {
            
        }
        
        class Sum: Experssion {
            var augend: Money
            var addend: Money
            
            init(_ augend: Money, _ addend: Money) {
                self.augend = augend
                self.addend = addend
            }
            
            func reduce(_ to: String) -> Money {
                let amount = augend.amount + addend.amount
                return Money(amount, currency: to)
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Experssion {
                return Sum(self, addend)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        class Bank {
            func reduce(_ source: Experssion, to: String) -> Money {
                if let sum = source as? Money {
                    return sum
                }  else {
                    let sum = source as! Sum
                    return sum.reduce(to)
                }
            }
        }
        
        let five: Money = Money.dollar(5)
        let result: Experssion = five.plus(five)
        let sum: Sum = result as! Sum
        XCTAssertTrue(five.equals(sum.augend))
        XCTAssertTrue(five.equals(sum.addend))
        
        let bank = Bank()
        let reduced = bank.reduce(sum, to: "USD")
        XCTAssertTrue(Money.dollar(10).equals(reduced))
        
        let sum2 = Sum(Money.dollar(3), Money.dollar(4))
        let result2 = bank.reduce(sum2, to: "USD")
        XCTAssertTrue(Money.dollar(7).equals(result2))
        
        let result3 = bank.reduce(Money.dollar(1), to: "USD")
        XCTAssertTrue(Money.dollar(1).equals(result3))
    }
    
    func testBank6() throws {
        class Experssion {
            func reduce(_ to: String) -> Money {
                return Money(0, currency: "")
            }
        }
        
        class Sum: Experssion {
            var augend: Money
            var addend: Money
            
            init(_ augend: Money, _ addend: Money) {
                self.augend = augend
                self.addend = addend
            }
            
            override func reduce(_ to: String) -> Money {
                let amount = augend.amount + addend.amount
                return Money(amount, currency: to)
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Experssion {
                return Sum(self, addend)
            }
            
            override func reduce(_ to: String) -> Money {
                return self
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        class Bank {
            func reduce(_ source: Experssion, to: String) -> Money {
                return source.reduce(to)
            }
        }
        
        let five: Money = Money.dollar(5)
        let result: Experssion = five.plus(five)
        let sum: Sum = result as! Sum
        XCTAssertTrue(five.equals(sum.augend))
        XCTAssertTrue(five.equals(sum.addend))
        
        let bank = Bank()
        let reduced = bank.reduce(sum, to: "USD")
        XCTAssertTrue(Money.dollar(10).equals(reduced))
        
        let sum2 = Sum(Money.dollar(3), Money.dollar(4))
        let result2 = bank.reduce(sum2, to: "USD")
        XCTAssertTrue(Money.dollar(7).equals(result2))
        
        let result3 = bank.reduce(Money.dollar(1), to: "USD")
        XCTAssertTrue(Money.dollar(1).equals(result3))
    }
    
    func testBank7() throws {
        class Experssion {
            func reduce(_ bank: Bank, to: String) -> Money {
                return Money(0, currency: "")
            }
        }
        
        class Sum: Experssion {
            var augend: Money
            var addend: Money
            
            init(_ augend: Money, _ addend: Money) {
                self.augend = augend
                self.addend = addend
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let amount = augend.amount + addend.amount
                return Money(amount, currency: to)
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Experssion {
                return Sum(self, addend)
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let rate = bank.rate(currency, to: to)
                return Money(amount / rate, currency: to)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        struct Pair: Hashable {
            private let from: String
            private let to: String
            
            init(from: String, to: String) {
                self.from = from
                self.to = to
            }
            
            func equal(_ pair: Pair) -> Bool {
                return from == pair.from && to == pair.to
            }
        }
        
        class Bank {
            private var rates = [Pair: Int]()

            func reduce(_ source: Experssion, to: String) -> Money {
                return source.reduce(self, to: to)
            }
            
            func rate(_ from: String, to: String) -> Int {
                return rates[Pair(from: from, to: to)]!
            }
            
            func addRate(_ from: String, _ to: String, rate: Int) {
                rates.updateValue(rate, forKey: Pair(from: from, to: to))
            }
        }
        
        XCTAssertEqual(1, Bank().rate("USD", to: "USD"))
//        let bank = Bank()
//        bank.addRate("CHF", "USD", 2)
//        let result = bank.reduce(Money.franc(2), to: "USD")
//        XCTAssertTrue(Money.dollar(1).equals(result))
    }
    
    func testBank8() throws {
        class Experssion {
            func reduce(_ bank: Bank, to: String) -> Money {
                return Money(0, currency: "")
            }
        }
        
        class Sum: Experssion {
            var augend: Money
            var addend: Money
            
            init(_ augend: Money, _ addend: Money) {
                self.augend = augend
                self.addend = addend
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let amount = augend.amount + addend.amount
                return Money(amount, currency: to)
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Experssion {
                return Sum(self, addend)
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let rate = bank.rate(currency, to: to)
                return Money(amount / rate, currency: to)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        struct Pair: Hashable {
            private let from: String
            private let to: String
            
            init(from: String, to: String) {
                self.from = from
                self.to = to
            }
            
            func equal(_ pair: Pair) -> Bool {
                return from == pair.from && to == pair.to
            }
        }
        
        class Bank {
            private var rates = [Pair: Int]()

            func reduce(_ source: Experssion, to: String) -> Money {
                return source.reduce(self, to: to)
            }
            
            func rate(_ from: String, to: String) -> Int {
                if from == to { return 1 }
                return rates[Pair(from: from, to: to)]!
            }
            
            func addRate(_ from: String, _ to: String, _ rate: Int) {
                rates.updateValue(rate, forKey: Pair(from: from, to: to))
            }
        }
        
        XCTAssertEqual(1, Bank().rate("USD", to: "USD"))
        let bank = Bank()
        bank.addRate("CHF", "USD", 2)
        let result = bank.reduce(Money.franc(2), to: "USD")
        XCTAssertTrue(Money.dollar(1).equals(result))
        
        let fiveBucks = Money.dollar(5)
        let tenFrancs = Money.franc(10)
        let result2 = bank.reduce(fiveBucks.plus(tenFrancs), to: "USD")
        XCTAssertTrue(Money.dollar(10).equals(result2))
    }
    
    func testBank9() throws {
        class Experssion {
            func reduce(_ bank: Bank, to: String) -> Money {
                return Money(0, currency: "")
            }
        }
        
        class Sum: Experssion {
            var augend: Money
            var addend: Money
            
            init(_ augend: Money, _ addend: Money) {
                self.augend = augend
                self.addend = addend
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let amount = augend.reduce(bank, to: to).amount + addend.reduce(bank, to: to).amount
                return Money(amount, currency: to)
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Money? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            func plus(_ addend: Money) -> Experssion {
                return Sum(self, addend)
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let rate = bank.rate(currency, to: to)
                return Money(amount / rate, currency: to)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        struct Pair: Hashable {
            private let from: String
            private let to: String
            
            init(from: String, to: String) {
                self.from = from
                self.to = to
            }
            
            func equal(_ pair: Pair) -> Bool {
                return from == pair.from && to == pair.to
            }
        }
        
        class Bank {
            private var rates = [Pair: Int]()

            func reduce(_ source: Experssion, to: String) -> Money {
                return source.reduce(self, to: to)
            }
            
            func rate(_ from: String, to: String) -> Int {
                if from == to { return 1 }
                return rates[Pair(from: from, to: to)]!
            }
            
            func addRate(_ from: String, _ to: String, _ rate: Int) {
                rates.updateValue(rate, forKey: Pair(from: from, to: to))
            }
        }
        
        XCTAssertEqual(1, Bank().rate("USD", to: "USD"))
        let bank = Bank()
        bank.addRate("CHF", "USD", 2)
        let result = bank.reduce(Money.franc(2), to: "USD")
        XCTAssertTrue(Money.dollar(1).equals(result))
        
        let fiveBucks = Money.dollar(5)
        let tenFrancs = Money.franc(10)
        let result2 = bank.reduce(fiveBucks.plus(tenFrancs), to: "USD")
        XCTAssertTrue(Money.dollar(10).equals(result2))
    }
    
    func testBank10() throws {
        class Experssion {
            func reduce(_ bank: Bank, to: String) -> Money {
                return Money(0, currency: "")
            }
            
            func plus(_ addend: Experssion) -> Experssion {
                return Sum(self, addend)
            }
        }
        
        class Sum: Experssion {
            var augend: Experssion
            var addend: Experssion
            
            init(_ augend: Experssion, _ addend: Experssion) {
                self.augend = augend
                self.addend = addend
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let amount = augend.reduce(bank, to: to).amount + addend.reduce(bank, to: to).amount
                return Money(amount, currency: to)
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            func times(_ multiplier: Int) -> Experssion? {
                return Money(self.amount * multiplier, currency: self.currency)
            }
            
            override func plus(_ addend: Experssion) -> Experssion {
                return Sum(self, addend)
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let rate = bank.rate(currency, to: to)
                return Money(amount / rate, currency: to)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        struct Pair: Hashable {
            private let from: String
            private let to: String
            
            init(from: String, to: String) {
                self.from = from
                self.to = to
            }
            
            func equal(_ pair: Pair) -> Bool {
                return from == pair.from && to == pair.to
            }
        }
        
        class Bank {
            private var rates = [Pair: Int]()

            func reduce(_ source: Experssion, to: String) -> Money {
                return source.reduce(self, to: to)
            }
            
            func rate(_ from: String, to: String) -> Int {
                if from == to { return 1 }
                return rates[Pair(from: from, to: to)]!
            }
            
            func addRate(_ from: String, _ to: String, _ rate: Int) {
                rates.updateValue(rate, forKey: Pair(from: from, to: to))
            }
        }
        
        XCTAssertEqual(1, Bank().rate("USD", to: "USD"))
        let bank = Bank()
        bank.addRate("CHF", "USD", 2)
        let result = bank.reduce(Money.franc(2), to: "USD")
        XCTAssertTrue(Money.dollar(1).equals(result))
        
        let fiveBucks: Experssion = Money.dollar(5)
        let tenFrancs: Experssion = Money.franc(10)
        let result2 = bank.reduce(fiveBucks.plus(tenFrancs), to: "USD")
        XCTAssertTrue(Money.dollar(10).equals(result2))
    }
    
    func testBank11() throws {
        class Experssion {
            func reduce(_ bank: Bank, to: String) -> Money {
                return Money(0, currency: "")
            }
            
            func plus(_ addend: Experssion) -> Experssion {
                return Sum(self, addend)
            }
            
            func times(_ multiplier: Int) -> Experssion {
                return Experssion()
            }
        }
        
        class Sum: Experssion {
            var augend: Experssion
            var addend: Experssion
            
            init(_ augend: Experssion, _ addend: Experssion) {
                self.augend = augend
                self.addend = addend
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let amount = augend.reduce(bank, to: to).amount + addend.reduce(bank, to: to).amount
                return Money(amount, currency: to)
            }
            
            override func plus(_ addend: Experssion) -> Experssion {
                return Sum(self, addend)
            }
            
            override func times(_ multiplier: Int) -> Experssion {
                return Sum(augend.times(multiplier), addend.times(multiplier))
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            override func times(_ multiplier: Int) -> Experssion {
                return Money(amount * multiplier, currency: currency)
            }
            
            override func plus(_ addend: Experssion) -> Experssion {
                return Sum(self, addend)
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let rate = bank.rate(currency, to: to)
                return Money(amount / rate, currency: to)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        struct Pair: Hashable {
            private let from: String
            private let to: String
            
            init(from: String, to: String) {
                self.from = from
                self.to = to
            }
            
            func equal(_ pair: Pair) -> Bool {
                return from == pair.from && to == pair.to
            }
        }
        
        class Bank {
            private var rates = [Pair: Int]()

            func reduce(_ source: Experssion, to: String) -> Money {
                return source.reduce(self, to: to)
            }
            
            func rate(_ from: String, to: String) -> Int {
                if from == to { return 1 }
                return rates[Pair(from: from, to: to)]!
            }
            
            func addRate(_ from: String, _ to: String, _ rate: Int) {
                rates.updateValue(rate, forKey: Pair(from: from, to: to))
            }
        }
        
        let fiveBucks: Experssion = Money.dollar(5)
        let tenFrancs: Experssion = Money.franc(10)
        let bank: Bank = Bank()
        bank.addRate("CHF", "USD", 2)
        let sum: Experssion = Sum(fiveBucks, tenFrancs).plus(fiveBucks)
        let result: Money = bank.reduce(sum, to: "USD")
        XCTAssertTrue(Money.dollar(15).equals(result))
        
        let sum2: Experssion = Sum(fiveBucks, tenFrancs).times(2)
        let result2: Money = bank.reduce(sum2, to: "USD")
        XCTAssertTrue(Money.dollar(20).equals(result2))
        
        let sum3: Experssion = Money.dollar(1).plus(Money.dollar(1))
        XCTAssertTrue((sum3 as? Money != nil))
    }
    
    func testBank12() throws {
        class Experssion {
            func reduce(_ bank: Bank, to: String) -> Money {
                return Money(0, currency: "")
            }
            
            func plus(_ addend: Experssion) -> Experssion {
                return Sum(self, addend)
            }
            
            func times(_ multiplier: Int) -> Experssion {
                return Experssion()
            }
        }
        
        class Sum: Experssion {
            var augend: Experssion
            var addend: Experssion
            
            init(_ augend: Experssion, _ addend: Experssion) {
                self.augend = augend
                self.addend = addend
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let amount = augend.reduce(bank, to: to).amount + addend.reduce(bank, to: to).amount
                return Money(amount, currency: to)
            }
            
            override func plus(_ addend: Experssion) -> Experssion {
                return Sum(self, addend)
            }
            
            override func times(_ multiplier: Int) -> Experssion {
                return Sum(augend.times(multiplier), addend.times(multiplier))
            }
        }
        
        class Money: Experssion {
            fileprivate var amount: Int
            var currency: String
            
            var value: Int {
                return self.amount
            }
            
            init(_ amount: Int, currency: String) {
                self.amount = amount
                self.currency = currency
            }
            
            func equals(_ object: AnyObject) -> Bool {
                let money = object as! Money
                return amount == money.amount && "\(self.currency)" == "\(money.currency)"
            }
            
            override func times(_ multiplier: Int) -> Experssion {
                return Money(amount * multiplier, currency: currency)
            }
            
            override func plus(_ addend: Experssion) -> Experssion {
                return Sum(self, addend)
            }
            
            override func reduce(_ bank: Bank, to: String) -> Money {
                let rate = bank.rate(currency, to: to)
                return Money(amount / rate, currency: to)
            }
            
            static func dollar(_ amount: Int) -> Money {
                return Money(amount, currency: "USD")
            }
            
            static func franc(_ amount: Int) -> Money {
                return Money(amount, currency: "CHF")
            }
        }
        
        struct Pair: Hashable {
            private let from: String
            private let to: String
            
            init(from: String, to: String) {
                self.from = from
                self.to = to
            }
            
            func equal(_ pair: Pair) -> Bool {
                return from == pair.from && to == pair.to
            }
        }
        
        class Bank {
            private var rates = [Pair: Int]()

            func reduce(_ source: Experssion, to: String) -> Money {
                return source.reduce(self, to: to)
            }
            
            func rate(_ from: String, to: String) -> Int {
                if from == to { return 1 }
                return rates[Pair(from: from, to: to)]!
            }
            
            func addRate(_ from: String, _ to: String, _ rate: Int) {
                rates.updateValue(rate, forKey: Pair(from: from, to: to))
            }
        }
        
        let fiveBucks: Experssion = Money.dollar(5)
        let tenFrancs: Experssion = Money.franc(10)
        let bank: Bank = Bank()
        bank.addRate("CHF", "USD", 2)
        let sum: Experssion = Sum(fiveBucks, tenFrancs).plus(fiveBucks)
        let result: Money = bank.reduce(sum, to: "USD")
        XCTAssertTrue(Money.dollar(15).equals(result))
        
        let sum2: Experssion = Sum(fiveBucks, tenFrancs).times(2)
        let result2: Money = bank.reduce(sum2, to: "USD")
        XCTAssertTrue(Money.dollar(20).equals(result2))
    }
}

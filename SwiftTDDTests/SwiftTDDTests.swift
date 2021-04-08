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
}

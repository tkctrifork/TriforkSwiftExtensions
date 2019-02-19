//
//  StringProtocolTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 14/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import XCTest

final class StringProtocolTests: XCTestCase {

    // MARK: - trimmed(
    func testStringTrimWithWhitespaceAndNewLine() {
        let testString = "\nHello World  \n".trimmed()

        XCTAssertEqual(testString, "Hello World")
    }

    func testStringTrimmedString() {
        let testString = "Hello World".trimmed()

        XCTAssertEqual(testString, "Hello World")
    }

    func testStringWhitespaceString() {
        let testString = "   Hello World   ".trimmed()

        XCTAssertEqual(testString, "Hello World")
    }

    func testSubstringTrimWithWhitespaceAndNewLine() {
        let testString = Substring("\nHello World  \n").trimmed()

        XCTAssertEqual(testString, "Hello World")
    }

    func testSubstringTrimmedString() {
        let testString = Substring("Hello World").trimmed()

        XCTAssertEqual(testString, "Hello World")
    }

    func testSubstringWhitespaceString() {
        let testString = Substring("   Hello World   ").trimmed()

        XCTAssertEqual(testString, "Hello World")
    }

    // MARK: - slicing
    func testStringSlicing() {
        let testString = "App=Foo&App=Bar".slicing(from: "=", to: "&")

        XCTAssertEqual(testString, "Foo")
    }

    func testStringSlicingWithInvalidTo() {
        let testString = "App=Foo&App=Bar".slicing(from: "=", to: "!")

        XCTAssertNil(testString)
    }

    func testStringSlicingWithInvalidFrom() {
        let testString = "App=Foo&App=Bar".slicing(from: "!", to: "&")

        XCTAssertNil(testString)
    }

    func testStringSlicingWithInvalidFromAndTo() {
        let testString = Substring("App=Foo&App=Bar").slicing(from: "!", to: "!")

        XCTAssertNil(testString)
    }

    func testSubstringSlicing() {
        let testString = Substring("App=Foo&App=Bar").slicing(from: "=", to: "&")

        XCTAssertEqual(testString, "Foo")
    }

    func testSubstringSlicingWithInvalidTo() {
        let testString = Substring("App=Foo&App=Bar").slicing(from: "=", to: "!")

        XCTAssertNil(testString)
    }

    func testSubstringSlicingWithInvalidFrom() {
        let testString = Substring("App=Foo&App=Bar").slicing(from: "!", to: "&")

        XCTAssertNil(testString)
    }

    func testSubstringSlicingWithInvalidFromAndTo() {
        let testString = Substring("App=Foo&App=Bar").slicing(from: "!", to: "!")

        XCTAssertNil(testString)
    }

    // MARK: - nilIfEmpty
    func testStringNilIfEmptyWithNoEmptyString() {
        let testString = "Hello World".nilIfEmpty()

        XCTAssertEqual(testString, "Hello World")
    }

    func testStringNilIfEmptyWithEmptyString() {
        let testString = "".nilIfEmpty()

        XCTAssertNil(testString)
    }

    func testSubstringNilIfEmptyWithNoEmptyString() {
        let testString = Substring("Hello World").nilIfEmpty()

        XCTAssertEqual(testString, "Hello World")
    }

    func testSubstringNilIfEmptyWithEmptyString() {
        let testString = Substring("").nilIfEmpty()

        XCTAssertNil(testString)
    }
}

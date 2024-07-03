//
//  TableViewControllerTests.swift
//  UnitTestTableViewTests
//
//  Created by ZEUS on 3/7/24.
//

import XCTest
@testable import UnitTestTableView

final class TableViewControllerTests: XCTestCase {
    
    var sut: TableViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: TableViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tableviewDelegates_shouldBeConnected(){
        XCTAssertNotNil(sut.tableView.dataSource, "datasource")
        XCTAssertNotNil(sut.tableView.delegate, "delegate")
    }
    
    func test_numberOfRows_shouldBe3(){
        XCTAssertEqual(numberOfRows(in: sut.tableView), 3)
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToOne(){
        let cell = cellForRow(in: sut.tableView, row: 0)
        XCTAssertEqual(cell?.textLabel?.text, "One")
    }
    
    func test_cellForRowAt_withRow1_shouldSetCellLabelToTwo(){
        let cell = cellForRow(in: sut.tableView, row: 1)
        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }
    
    func test_cellForRowAt_withRow1_shouldSetCellLabelToThree(){
        let cell = cellForRow(in: sut.tableView, row: 2)
        XCTAssertEqual(cell?.textLabel?.text, "Three")
    }
}

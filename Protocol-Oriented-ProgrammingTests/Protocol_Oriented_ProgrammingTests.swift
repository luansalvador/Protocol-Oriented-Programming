//
//  Protocol_Oriented_ProgrammingTests.swift
//  Protocol-Oriented-ProgrammingTests
//
//  Created by Luan Henrique Salvador Amorim on 02/01/23.
//

import XCTest
@testable import Protocol_Oriented_Programming

final class Protocol_Oriented_ProgrammingTests: XCTestCase {
    
    private var sut: UserViewModel!
    private var userService: MockUserService!
    private var delegate: MockUserViewModelDelegate!

    override func setUpWithError() throws {
        // Mocking UserService below to simulate APIManager and test View Model
        delegate = MockUserViewModelDelegate()
        userService = MockUserService()
        sut = UserViewModel(userService: userService)
        sut.delegate = delegate
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        userService = nil
        try super.tearDownWithError()
    }

    func testUpdateView_onAPISuccess_showsImageAndEmail() {
        // given
        let user = User(id: 1, email: "luan@gmail.com", avatar: "https://www.something.com/2")
        userService.fetchUserMockResult = .success(user)
        // when
        sut.fetchUser()
        // then
        XCTAssertEqual(delegate.updateViewArray.count, 1)
        XCTAssertEqual(delegate.updateViewArray[0].email, "luan@gmail.com")
        XCTAssertEqual(delegate.updateViewArray[0].imageUrl, "https://www.something.com/2")
    }
    
    func testUpdateView_onAPIFailure_showsErrorImageAndDefaultNoUserFoundText() {
        // given
        userService.fetchUserMockResult = .failure(NSError())
        // when
        sut.fetchUser()
        // then
        XCTAssertEqual(delegate.updateViewArray.count, 1)
        XCTAssertEqual(delegate.updateViewArray[0].email, "No user found")
        XCTAssertEqual(delegate.updateViewArray[0].imageUrl, "https://cdn1.iconfinder.com/data/icons/user-fill-icons-set/144/User003_Error-1024.png")
    }
    
}

class MockUserService: UserService {
    var fetchUserMockResult: Result<Protocol_Oriented_Programming.User, Error>?
    func fetchUser(completion: @escaping (Result<Protocol_Oriented_Programming.User, Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
}

class MockUserViewModelDelegate: UserViewModelDelegate {
    
    // tuple to receive two values from delegate
    var updateViewArray: [(imageUrl: String, email: String)] = []
    
    func updateView(imageUrl: String, email: String) {
        self.updateViewArray.append((imageUrl, email))
    }
    
    
}

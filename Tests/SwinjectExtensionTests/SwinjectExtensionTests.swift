@testable import SwinjectDIContainer
@testable import SwinjectExtension
import XCTest

final class SwinjectExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()

        DIContainer.shared.assembler = .init()
    }

    override func tearDown() {
        super.tearDown()

        DIContainer.shared.assembler = .init()
    }

    func test_noNamed() {
        DIContainer.shared.container.register(TestClass.self) { _ in
            return TestClass()
        }

        let _: TestClass = DIContainer.shared.resolver.resolve()
    }

    func test_named() {
        DIContainer.shared.container.register(TestClass.self, name: "TestName") { _ in
            return TestClass()
        }

        let _: TestClass = DIContainer.shared.resolver.resolve(name: "TestName")
    }

    func test_noNamed_arg1() {
        DIContainer.shared.container.register(TestClass.self) { _, arg1 in
            return TestClass(arg1: arg1)
        }

        let _: TestClass = DIContainer.shared.resolver.resolve(argument: 1)
    }

    func test_noNamed_arg2() {
        DIContainer.shared.container.register(TestClass.self) { _, arg1, arg2 in
            return TestClass(arg1: arg1, arg2: arg2)
        }

        let _: TestClass = DIContainer.shared.resolver.resolve(arguments: 1, 2)
    }

    func test_noNamed_arg3() {
        DIContainer.shared.container.register(TestClass.self) { _, arg1, arg2, arg3 in
            return TestClass(arg1: arg1, arg2: arg2, arg3: arg3)
        }

        let _: TestClass = DIContainer.shared.resolver.resolve(arguments: 1, 2, 3)
    }

    func test_needResolve() {
        DIContainer.shared.container.register(Foo.self) { _ in
            return Foo()
        }

        DIContainer.shared.container.register(TestClass.self) { resolver in
            let foo: Foo = resolver.resolve()
            return TestClass(foo: foo)
        }

        let _: TestClass = DIContainer.shared.resolver.resolve()
    }

}

final class Foo {

    init() {}

}

final class TestClass {

    let foo: Foo

    let arg1: Int

    let arg2: Int

    let arg3: Int

    init(foo: Foo = .init(), arg1: Int = 1, arg2: Int = 2, arg3: Int = 3) {
        self.foo = foo
        self.arg1 = arg1
        self.arg2 = arg2
        self.arg3 = arg3
    }

}

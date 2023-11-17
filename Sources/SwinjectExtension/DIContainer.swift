import Foundation
import Swinject

/// A custom container wrapping `Assembler` and `Container`.
public final class DIContainer {

    /// A singleton object. Assembler is initialized with baseline container.
    public static let shared: DIContainer = .init(assembler: .init())

    /// An assembler used to resolve service.
    public var assembler: Assembler

    public var container: Container {
        self.assembler.resolver as! Container
    }

    public var resolver: Resolver {
        self.assembler.resolver
    }

    init(assembler: Assembler) {
        self.assembler = assembler
    }

}

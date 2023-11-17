import Foundation
import Swinject

extension Swinject.Resolver {

    /// Retrieves the instance with the specified service type. Infer the type if can be inferred.
    ///
    /// If not found service, occur fatalError.
    ///
    /// - Parameter serviceType: The service type to resolve.
    /// - Returns: The resolved service type instance.
    public func resolve<Service>(_ serviceType: Service.Type = Service.self) -> Service {
        guard let resolved = self.resolve(serviceType) else {
            resolveOrFatalError(Service.self)
        }

        return resolved
    }

    public func resolve<Service>(_ serviceType: Service.Type = Service.self, name: String) -> Service {
        guard let resolved = self.resolve(serviceType, name: name) else {
            resolveOrFatalError(Service.self)
        }

        return resolved
    }

    public func resolve<Service, Arg1>(_ serviceType: Service.Type = Service.self, argument: Arg1) -> Service {
        guard let resolved = self.resolve(serviceType, argument: argument) else {
            resolveOrFatalError(Service.self)
        }

        return resolved
    }

    public func resolve<Service, Arg1, Arg2>(_ serviceType: Service.Type = Service.self, arguments: Arg1, _ arg2: Arg2) -> Service {
        guard let resolved = self.resolve(serviceType, arguments: arguments, arg2) else {
            resolveOrFatalError(Service.self)
        }

        return resolved
    }

    public func resolve<Service, Arg1, Arg2, Arg3>(_ serviceType: Service.Type = Service.self, arguments: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> Service {
        guard let resolved = self.resolve(serviceType, arguments: arguments, arg2, arg3) else {
            resolveOrFatalError(Service.self)
        }

        return resolved
    }

}

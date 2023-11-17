//
//  SwinjectExtension.swift
//
//
//  Created by Jaewon Yun on 2023/11/17.
//

import Foundation

func resolveOrFatalError<Service>(_ serviceType: Service.Type, file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("Failed to resolve for '\(serviceType.self)' type.", file: file, line: line)
}

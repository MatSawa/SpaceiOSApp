//
//  SchedulerProvider.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//

import Foundation
import RxSwift
import RxCocoa

public protocol SchedulerProviderable {
    func comptutation() -> ImmediateSchedulerType
    func main() -> ImmediateSchedulerType
}

public class SchedulerProvider: SchedulerProviderable {
    public func main() -> ImmediateSchedulerType {
        return MainScheduler.instance
    }
    
    public func comptutation() -> ImmediateSchedulerType {
        return ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global(qos: .background))
    }
}

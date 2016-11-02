//
//  Functions.swift
//  OutGo
//
//  Created by 胡贝妮 on 2016/11/2.
//  Copyright © 2016年 胡贝妮. All rights reserved.
//

import Foundation
import Dispatch

func afterDelay(_ seconds: Double, closure: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: closure)
}

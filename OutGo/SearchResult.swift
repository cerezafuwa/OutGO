//
//  SearchResult.swift
//  OutGo
//
//  Created by 胡贝妮 on 2016/11/5.
//  Copyright © 2016年 胡贝妮. All rights reserved.
//

class SearchResult {
    var name = ""
    var address = ""
    var pname = ""
    var cityname = ""
    var adname = ""
    var location = ""
}

func < (lhs: SearchResult, rhs: SearchResult) -> Bool {
    return lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
}


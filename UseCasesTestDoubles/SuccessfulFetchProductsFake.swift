//
//  SuccessfulFetchProductsFake.swift
//  Telephone
//
//  Copyright (c) 2008-2016 Alexey Kuznetsov
//  Copyright (c) 2016 64 Characters
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

import UseCases

public final class SuccessfulFetchProductsFake {
    fileprivate let origin: Products = SimpleProductsFake()
    fileprivate let target: ProductsEventTarget

    public init(target: ProductsEventTarget) {
        self.target = target
    }
}

extension SuccessfulFetchProductsFake: Products {
    public var all: [Product] {
        return origin.all
    }

    public subscript(identifier: String) -> Product? {
        return origin[identifier]
    }

    public func fetch() {
        target.didFetch(self)
    }
}

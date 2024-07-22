//
//  Sequence.swift
//  miti-miti
//
//  Created by cecruzmo on 22/07/24.
//

extension Sequence  {
    func sum<T: AdditiveArithmetic>(_ predicate: (Element) -> T) -> T { reduce(.zero) { $0 + predicate($1) } }
}

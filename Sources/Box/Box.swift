/// Box transforms any type into a reference type.
@propertyWrapper
@dynamicMemberLookup
public final class Box<Wrapped> {

    public internal(set) var wrappedValue: Wrapped

    public var projectedValue: Box<Wrapped> { self }

    public init(wrappedValue value: Wrapped) {
        self.wrappedValue = value
    }

    public subscript<Value>(dynamicMember keyPath: KeyPath<Wrapped, Value>) -> Value {
        wrappedValue[keyPath: keyPath]
    }
}

extension Box: Equatable where Wrapped: Equatable {
    public static func == (lhs: Box<Wrapped>, rhs: Box<Wrapped>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}

extension Box: Hashable where Wrapped: Hashable {
    public func hash(into hasher: inout Hasher) {
        wrappedValue.hash(into: &hasher)
    }
}

extension Box: Comparable where Wrapped: Comparable {
    public static func < (lhs: Box<Wrapped>, rhs: Box<Wrapped>) -> Bool {
        lhs.wrappedValue < rhs.wrappedValue
    }
}

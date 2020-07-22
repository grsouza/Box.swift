/// Box transforms any type into a reference type.
@propertyWrapper
@dynamicMemberLookup
public final class MutableBox<Wrapped> {

    public var wrappedValue: Wrapped

    public var projectedValue: MutableBox<Wrapped> { self }

    public init(wrappedValue value: Wrapped) {
        self.wrappedValue = value
    }

    public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Wrapped, Value>) -> Value {
        get { wrappedValue[keyPath: keyPath] }
        set { wrappedValue[keyPath: keyPath] = newValue }
    }
}

extension MutableBox: Equatable where Wrapped: Equatable {
    public static func == (lhs: MutableBox<Wrapped>, rhs: MutableBox<Wrapped>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}

extension MutableBox: Hashable where Wrapped: Hashable {
    public func hash(into hasher: inout Hasher) {
        wrappedValue.hash(into: &hasher)
    }
}

extension MutableBox: Comparable where Wrapped: Comparable {
    public static func < (lhs: MutableBox<Wrapped>, rhs: MutableBox<Wrapped>) -> Bool {
        lhs.wrappedValue < rhs.wrappedValue
    }
}

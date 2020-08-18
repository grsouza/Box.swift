/// Box transforms any type into a reference type.
@propertyWrapper
@dynamicMemberLookup
public final class MutableBox<Wrapped> {

    public var wrappedValue: Wrapped

    public var projectedValue: MutableBox<Wrapped> { self }

    public init(_ value: Wrapped) {
        self.wrappedValue = value
    }

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

extension MutableBox: Encodable where Wrapped: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

extension MutableBox: Decodable where Wrapped: Decodable {
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        try self.init(wrappedValue: container.decode(Wrapped.self))
    }
}

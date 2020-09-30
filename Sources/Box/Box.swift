/// Box transforms any type into a reference type.
public final class Box<Wrapped> {

    public internal(set) var value: Wrapped

    public init(_ value: Wrapped) {
        self.value = value
    }
}

extension Box: Equatable where Wrapped: Equatable {
    public static func == (lhs: Box<Wrapped>, rhs: Box<Wrapped>) -> Bool {
        lhs.value == rhs.value
    }
}

extension Box: Hashable where Wrapped: Hashable {
    public func hash(into hasher: inout Hasher) {
        value.hash(into: &hasher)
    }
}

extension Box: Comparable where Wrapped: Comparable {
    public static func < (lhs: Box<Wrapped>, rhs: Box<Wrapped>) -> Bool {
        lhs.value < rhs.value
    }
}

extension Box: Encodable where Wrapped: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

extension Box: Decodable where Wrapped: Decodable {
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        try self.init(container.decode(Wrapped.self))
    }
}

extension Box: CustomStringConvertible where Wrapped: CustomStringConvertible {
    public var description: String { value.description }
}

extension Box: CustomDebugStringConvertible where Wrapped: CustomDebugStringConvertible {
    public var debugDescription: String { value.debugDescription }
}

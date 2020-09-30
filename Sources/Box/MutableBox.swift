/// Box transforms any type into a reference type.
public final class MutableBox<Wrapped> {

    public var value: Wrapped

    public init(_ value: Wrapped) {
        self.value = value
    }
}

extension MutableBox: Equatable where Wrapped: Equatable {
    public static func == (lhs: MutableBox<Wrapped>, rhs: MutableBox<Wrapped>) -> Bool {
        lhs.value == rhs.value
    }
}

extension MutableBox: Hashable where Wrapped: Hashable {
    public func hash(into hasher: inout Hasher) {
        value.hash(into: &hasher)
    }
}

extension MutableBox: Comparable where Wrapped: Comparable {
    public static func < (lhs: MutableBox<Wrapped>, rhs: MutableBox<Wrapped>) -> Bool {
        lhs.value < rhs.value
    }
}

extension MutableBox: Encodable where Wrapped: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

extension MutableBox: Decodable where Wrapped: Decodable {
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        try self.init(container.decode(Wrapped.self))
    }
}

extension MutableBox: CustomStringConvertible where Wrapped: CustomStringConvertible {
    public var description: String { value.description }
}

extension MutableBox: CustomDebugStringConvertible where Wrapped: CustomDebugStringConvertible {
    public var debugDescription: String { value.debugDescription }
}

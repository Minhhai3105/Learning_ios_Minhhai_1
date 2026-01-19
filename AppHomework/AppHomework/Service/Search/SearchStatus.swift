enum SearchOrderStatus {
    case emptyKeyword
    case found
    case notFound

    var message: String {
        switch self {
        case .emptyKeyword:
            return "Từ khóa rỗng"
        case .found:
            return "Tìm thấy đơn hàng"
        case .notFound:
            return "Không tìm thấy đơn hàng"
        }
    }
}

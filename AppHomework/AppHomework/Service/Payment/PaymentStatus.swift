enum PaymentStatus {
    case success
    case failed
    case invalid

    var message: String {
        switch self {
        case .success:
            return "Thanh toán thành công"
        case .failed:
            return "Thanh toán thất bại"
        case .invalid:
            return "Thanh toán không hợp lệ"
        }
    }
}

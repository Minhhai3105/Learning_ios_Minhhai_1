struct PaymentService {
    func payment(total: Double?) -> PaymentStatus {
        guard let total = total, total > 0 else {
            return .invalid
        }
        return total <= 1_000_000 ? .success : .failed
    }
    
    func pay(amount: Double) -> PaymentStatus {
        payment(total: amount)
    }
}

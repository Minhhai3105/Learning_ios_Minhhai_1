struct SearchService {
    func searchOrderByProductName(keyword: String?, orders: [Order])
        -> SearchOrderStatus
    {
        if let keyword = keyword, !keyword.isEmpty {
            let lowerKeyword = keyword.lowercased()
            for oder in orders {
                for product in oder.products {
                    if product.name.lowercased().contains(lowerKeyword) {
                        return .found
                    }

                }
            }
            return .notFound
        } else {
            return .emptyKeyword
        }

    }
}

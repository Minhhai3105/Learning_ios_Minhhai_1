enum LoadState {
    case idle
    case loading
    case success ( dataCount: Int)
    case empty
    case failure (errorMessage: String)
}
func hardLoadState( state: LoadState ) -> String {
    switch state {
        case .idle: return "idle"
        case .loading: return "loading"
        case .success (let dataCount): return "success\(dataCount)"
        case .empty: return "empty"
        case .failure (let errorMessage): return "failure\(errorMessage)"
    }
}
let State = LoadState.success(dataCount: 10)
print(hardLoadState(state: State))
let error = LoadState.failure(errorMessage: "Error")
print(hardLoadState(state: error))

log("Start", "Loading", "Done")
log("Timeout", prefix: "[ERROR]")

func log(_ message: String..., prefix: String = "[APP]") {
    for msg in message {
        print("\(prefix): \(msg)")
    }
}

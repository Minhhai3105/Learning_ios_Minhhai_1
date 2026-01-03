// xử lý danh sách bình luận: bỏ qua comment rỗng và ẩn comment chứa từ cấm
let comments = ["Hello", "this is stupid", "nice"]
let banned = ["stupid", "hate"]

func filterEmpty(_ comments: [String]) -> [String] {
    return comments.filter( { !$0.isEmpty })
}
func containsBannedWord(_ comment: String, banned: [String]) -> Bool {
    for word in banned {
        if comment.contains(word) {
            return true
        }
    }
    return false
}
func moderate(_ comments: [String], banned: [String]) -> [String] {
    var result: [String] = []
    
    for comment in comments {
        if comment.isEmpty {
            continue
        }
        
        
        if containsBannedWord(comment, banned: banned) {
            result.append("Comment này đã bị ẩn")
        }else {
            result.append(comment)
        }
    }
    return result
}

let moderated = moderate(comments, banned: banned)
print(moderated)

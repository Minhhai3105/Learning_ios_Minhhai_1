let scores: [Double] = [7.5, 8.0, 6.5, 9.0, 5.5]

func averageScore(_ scores: [Double]) -> Double {
    var sum = 0.0
    
    for score in scores {
        sum += score
    }
    
    return scores.isEmpty ? 0 : sum / Double(scores.count)
}

func maxScore(_ scores: [Double]) -> Double? {
    var max = scores[0]
    
    for score in scores {
        if score > max {
            max = score
        }
    }
    return max
}

func MinScore(_ scores: [Double]) -> Double? {
    var min = scores [0]
    
    for score in scores {
        if score < min {
            min = score
        }
    }
    return min
}
func garade(for average: Double) -> String {
    if avg >= 8 {
        return "Gioi"
    } else if avg >= 6.5 {
        return "Kha"
    } else if avg >= 5 {
        return "Trung Binh"
    } else {
        return "Yeu"
    }
}
let avg = averageScore(scores)
print("Diem trung binh: ", avg)
print("Diem cao nhat: ", maxScore(scores) ?? 0)
print("Diem thap nhat: ", MinScore(scores) ?? 0)
print("Xep loai hoc luc: ", garade(for: avg))

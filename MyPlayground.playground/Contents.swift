//Don't change this
var studentsAndScores = ["Amy": Int(readLine()!)!, "James": Int(readLine()!)!, "Helen": Int(readLine()!)!]

func highestScore(scores: [String: Int]) {
  var max: Int?
  for score in scores {
    if max == nil {
      max = score.value
    }
    else if (score.value > max!) {
      max = score.value
    }
  }
  
  print(max ?? "No values")
}

highestScore(scores: studentsAndScores)


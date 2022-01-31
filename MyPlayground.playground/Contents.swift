// Custom Data Type
// Create a Quiz Question
// Could use 2d array to link a question and an answer

struct QuizQuestion {
  
}

struct Town {
  let name: String
  var citizens: [String]
  var resources: [String: Int]
  
  init(townName: String, people: [String], stats: [String: Int]) {
    name = townName
    citizens = people
    resources = stats
  }
  
  func fortify() {
    print("Defenses increased!")
  }
}

var someTown = Town(townName: "Ry-Land", people: ["Ry", "Amanda", "Ronnie", "Olive", "Fury"], stats: ["Frisbees": 100, "Moneys": 1, "Toys": 999])

someTown.citizens.append("Spider")
print(someTown.citizens)

var anotherTown = Town(townName: "Tampa", people: ["Blair Bristow", "Jaclyn Bristow"], stats: ["Dogs": 0, "Disney's": 1])





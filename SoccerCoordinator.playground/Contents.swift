// Unit 01 - Team Treehouse Soccer Coordinator Project

//Declare necessary variables and constants
let players: [[String: String]] =
    [["name": "Joe Smith", "height": "42", "experience": "yes", "guardian": "Jim and Jan Smith"],
     ["name": "Jill Tanner", "height": "36", "experience": "yes", "guardian": "Clara Tanner"],
     ["name": "Bill Bon", "height": "43", "experience": "yes", "guardian": "Sara and Jenny Bon"],
     ["name": "Eva Gordon", "height": "45", "experience": "no", "guardian": "Wendy and Mike Gordon"],
     ["name": "Matt Gill", "height": "40", "experience": "no", "guardian": "Charles and Sylvia Gill"],
     ["name": "Kimmy Stein", "height": "41", "experience": "no", "guardian": "Bill and Hillary Stein"],
     ["name": "Sammy Adams", "height": "45", "experience": "no", "guardian": "Jeff Adams"],
     ["name": "Karl Saygan", "height": "42", "experience": "yes", "guardian": "Heather Bledsoe"],
     ["name": "Suzane Greenberg", "height": "44", "experience": "yes", "guardian": "Henrietta Dumas"],
     ["name": "Sal Dali", "height": "41", "experience": "no", "guardian": "Gala Dali"],
     ["name": "Joe Kavalier", "height": "39", "experience": "no", "guardian": "Sam and Elaine Kavalier"],
     ["name": "Ben Finkelstein", "height": "44", "experience": "no", "guardian": "Aaron and Jill Finkelstein"],
     ["name": "Diego Soto", "height": "41", "experience": "yes", "guardian": "Robin and Sarika Soto"],
     ["name": "Chloe Alaska", "height": "47", "experience": "no", "guardian": "David and Jamie Alaska"],
     ["name": "Arnold Willis", "height": "43", "experience": "no", "guardian": "Claire Willis"],
     ["name": "Philip Helm", "height": "44", "experience": "yes", "guardian": "Thomas Helm and Eva Jones"],
     ["name": "Les Clay", "height": "42", "experience": "yes", "guardian": "Wynonna Brown"],
     ["name": "Herschel Krustofski", "height": "45", "experience": "yes", "guardian": "Hyman and Rachel Krustofski"],
]
var soccerTeams: [String] = ["Dragons", "Sharks", "Raptors"]
var teamDragons: [[String: String]] = []
var teamSharks: [[String: String]] = []
var teamRaptors: [[String: String]] = []
var letters: [[String: String]] = []

//Function to sort and assign players based on experience
func sortAndAssignPlayers() -> Void   {
    var experienceYes: [[String: String]] = []
    var experienceNo: [[String: String]] = []
    
    //Divide players into experienced and unexperienced groups
    for player in players {
        if player["experience"] == "yes"    {
            experienceYes.append(player)
        } else if player["experience"] == "no"  {
            experienceNo.append(player)
        }
    }
    //Sort groups by height
    /* Researched on StackOverflow on how to use the sort function for an array of dictionaries
       Specifically, the {($0["height"]! as String) < $1["height"]! as String} part.
    */
    experienceYes.sort(by: {($0["height"]! as String) > $1["height"]! as String})
    experienceNo.sort(by: {($0["height"]! as String) < $1["height"]! as String})

    //Assign players evenly over the teams
    assignGroups(ofPlayers: experienceYes)
    assignGroups(ofPlayers: experienceNo)
}

//Function to send customized letters to the players for each team
func createLetters(forTeams teams: [String])  -> [[String: String]]  {
    var results: [[String: String]] = []
    var letter: String = ""
    for team in teams {
        var practiceTime = ""
        var members: [[String: String]] = []
        if team == "Dragons"    {
            practiceTime = "March 17, 1pm"
            members = teamDragons
        } else if team == "Sharks"  {
            practiceTime = "March 17, 3pm"
            members = teamSharks
        } else if team == "Raptors" {
            practiceTime = "March 18, 1pm"
            members = teamRaptors
        }
        for member in members {
            if member["guardian"] != nil && member["name"] != nil   {
                letter = "Dear \(member["guardian"]!),\r\n\r\nWe hope you're as excited as we are that \(member["name"]!) will be playing for the \(team) this year!\r\n\r\nThe practice time for your team is: \(practiceTime)\r\n\r\nRemember, have fun!\r\n\r\n\r\nSincerely,\r\nJason A. Vest\r\n\r\n"
                results.append([member["name"]!: letter])
            }
        }
    }
    return results
}
//Function to evenly divide the players among the teams.
func assignGroups(ofPlayers players: [[String: String]]) -> Void {
    var index = 0
    var lastTeamAssigned = ""
    while index < players.count {
        if lastTeamAssigned == "" {
            teamDragons.append(players[index])
            lastTeamAssigned = "Dragons"
            index += 1
            continue
        } else if lastTeamAssigned == "Dragons" {
            teamSharks.append(players[index])
            lastTeamAssigned = "Sharks"
            index += 1
            continue
        } else if lastTeamAssigned == "Sharks"   {
            teamRaptors.append(players[index])
            lastTeamAssigned = ""
            index += 1
            continue
        }
    }
}
//Function to add the height of the members of the teams and print out the average.
func calculateAverageHeight(ofTeams teams: [String])    {
    for team in teams {
        var teamTotalHeight: Double = 0.0
        var teamAverageHeight: Double = 0.0
        var members: [[String: String]] = []
        if team == "Dragons"    {
            members = teamDragons
        } else if team == "Sharks"  {
            members = teamSharks
        } else if team == "Raptors" {
            members = teamRaptors
        }
        for member in members   {
            if let height = Double(member["height"]!)    {
                teamTotalHeight = teamTotalHeight + height
            }
        }
        teamAverageHeight = teamTotalHeight/Double(members.count)
        print("\(team) avergage height: \(teamAverageHeight)")
    }
}
//Send letters to the guardians of the team members
func sendLetters(toGaurdians letters: [[String: String]]) -> Void   {
    for letter in letters {
        for (_, value) in letter  {
            print(value)
        }
    }
}
sortAndAssignPlayers()
letters = createLetters(forTeams: soccerTeams)
sendLetters(toGaurdians: letters)
calculateAverageHeight(ofTeams: soccerTeams)



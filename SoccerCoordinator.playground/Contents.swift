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
//var soccerTeams: [String: [String]] = ["Dragons": [], "Sharks": [], "Raptors": []]
var soccerTeams: [String: [[String: String]]] = ["Dragons": [], "Sharks": [], "Raptors": []]
var letters: [[String: String]]
//Function to sort and assign players based on experience

func sortAndAssignPlayers() -> Void   {
    var experienceYes: [[String: String]] = []
    var experienceNo: [[String: String]] = []
    for player in players {
        if player["experience"] == "yes"    {
            experienceYes.append(player)
        } else if player["experience"] == "no"  {
            experienceNo.append(player)
        }
    }
    var indexExp = 0
    var lastTeamAssignedExperienced = ""
    while indexExp < experienceYes.count {
        if lastTeamAssignedExperienced == "" {
            soccerTeams["Dragons"]?.append(experienceYes[indexExp])
            lastTeamAssignedExperienced = "Dragons"
            indexExp += 1
            continue
        } else if lastTeamAssignedExperienced == "Dragons" {
            soccerTeams["Sharks"]?.append(experienceYes[indexExp])
            lastTeamAssignedExperienced = "Sharks"
            indexExp += 1
            continue
        } else if lastTeamAssignedExperienced == "Sharks"   {
            soccerTeams["Raptors"]?.append(experienceYes[indexExp])
            lastTeamAssignedExperienced = ""
            indexExp += 1
            continue
        }
    }
    var indexNotExp = 0
    var lastTeamAssignedNotExperienced = ""
    while indexNotExp < experienceNo.count {
        if lastTeamAssignedNotExperienced == "" {
            soccerTeams["Dragons"]?.append(experienceYes[indexNotExp])
            lastTeamAssignedNotExperienced = "Dragons"
            indexNotExp += 1
            continue
        } else if lastTeamAssignedNotExperienced == "Dragons" {
            soccerTeams["Sharks"]?.append(experienceYes[indexNotExp])
            lastTeamAssignedNotExperienced = "Sharks"
            indexNotExp += 1
            continue
        } else if lastTeamAssignedNotExperienced == "Sharks"   {
            soccerTeams["Raptors"]?.append(experienceYes[indexNotExp])
            lastTeamAssignedNotExperienced = ""
            indexNotExp += 1
            continue
        }
    }
}

func sendLetters(toTeams teams: [String: [[String: String]]])  -> Void  {
    for (team, members) in teams   {
        var practiceTime = ""
        switch team {
        case "Dragons":
            practiceTime = "March 17, 1pm"
        case "Sharks":
            practiceTime = "March 17, 3pm"
        case "Raptors":
            practiceTime = "March 18, 1pm"
        default:
            practiceTime = "n/a"
        }
        for member in members {
            print("Dear \(member["guardian"]!),\r\n\r\n We hope you're as excited as we are that \(member["name"]!) will be playing for the \(team) this year!\r\n\r\nThe practice time for your team is: \(practiceTime)\r\n\r\nRemember, have fun!\r\n\r\n\r\nSincerely,\r\nJason A. Vest\r\n\r\n")
        }
    }
}


sortAndAssignPlayers()
sendLetters(toTeams: soccerTeams)


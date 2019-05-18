// Unit 01 - Team Treehouse Soccer Coordinator Project

//Declare necessary variables and constants
let players: [String: [String: String]] =
    ["Joe Smith": ["height": "42", "experience": "yes", "guardian": "Jim and Jan Smith"],
     "Jill Tanner": ["height": "36", "experience": "yes", "guardian": "Clara Tanner"],
     "Bill Bon": ["height": "43", "experience": "yes", "guardian": "Sara and Jenny Bon"],
     "Eva Gordon": ["height": "45", "experience": "yes", "guardian": "Wendy and Mike Gordon"],
     "Matt Gill": ["height": "40", "experience": "no", "guardian": "Charles and Sylvia Gill"],
     "Kimmy Stein": ["height": "41", "experience": "no", "guardian": "Bill and Hillary Stein"],
     "Sammy Adams": ["height": "45", "experience": "no", "guardian": "Jeff Adams"],
     "Karl Saygan": ["height": "42", "experience": "42", "guardian": "Heather Bledsoe"],
     "Suzane Greenberg": ["height": "44", "experience": "yes", "guardian": "Henrietta Dumas"],
     "Sal Dali": ["height": "41", "experience": "no", "guardian": "Gala Dali"],
     "Joe Kavalier": ["height": "39", "experience": "no", "guardian": "Sam and Elaine Kavalier"],
     "Ben Finkelstain": ["height": "44", "experience": "no", "guardian": "Aaron and Jill Finkelstein"],
     "Diego Soto": ["height": "41", "experience": "yes", "guardian": "Robin and Sarika Soto"],
     "Chloe Alaska": ["height": "47", "experience": "no", "guardian": "David and Jamie Alaska"],
     "Arnold Willis": ["height": "43", "experience": "no", "guardian": "Claire Willis"],
     "Philip Helm": ["height": "44", "experience": "yes", "guardian": "Thomas Helm and Eva Jones"],
     "Les Clay": ["height": "42", "experience": "yes", "guardian": "Wynonna Brown"],
     "Herschel Krustofski": ["height": "45", "experience": "yes", "guardian": "Hyman and Rachel Krustofski"],
]

var dragonsTeam: [String] = []
var sharksTeam: [String] = []
var raptorsTeam: [String] = []

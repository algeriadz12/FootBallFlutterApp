///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class TestingModelResponseLeagueStandingsAwayGoals {
/*
{
  "for": 9,
  "against": 3
}
*/

  int? theFor;
  int? against;

  TestingModelResponseLeagueStandingsAwayGoals({
    this.theFor,
    this.against,
  });
  TestingModelResponseLeagueStandingsAwayGoals.fromJson(Map<String, dynamic> json) {
    theFor = json['for']?.toInt();
    against = json['against']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['for'] = theFor;
    data['against'] = against;
    return data;
  }
}

class TestingModelResponseLeagueStandingsAway {
/*
{
  "played": 3,
  "win": 3,
  "draw": 0,
  "lose": 0,
  "goals": {
    "for": 9,
    "against": 3
  }
}
*/

  int? played;
  int? win;
  int? draw;
  int? lose;
  TestingModelResponseLeagueStandingsAwayGoals? goals;

  TestingModelResponseLeagueStandingsAway({
    this.played,
    this.win,
    this.draw,
    this.lose,
    this.goals,
  });
  TestingModelResponseLeagueStandingsAway.fromJson(Map<String, dynamic> json) {
    played = json['played']?.toInt();
    win = json['win']?.toInt();
    draw = json['draw']?.toInt();
    lose = json['lose']?.toInt();
    goals = (json['goals'] != null) ? TestingModelResponseLeagueStandingsAwayGoals.fromJson(json['goals']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['played'] = played;
    data['win'] = win;
    data['draw'] = draw;
    data['lose'] = lose;
    if (goals != null) {
      data['goals'] = goals!.toJson();
    }
    return data;
  }
}

class TestingModelResponseLeagueStandingsHomeGoals {
/*
{
  "for": 2,
  "against": 1
}
*/

  int? theFor;
  int? against;

  TestingModelResponseLeagueStandingsHomeGoals({
    this.theFor,
    this.against,
  });
  TestingModelResponseLeagueStandingsHomeGoals.fromJson(Map<String, dynamic> json) {
    theFor = json['for']?.toInt();
    against = json['against']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['for'] = theFor;
    data['against'] = against;
    return data;
  }
}

class TestingModelResponseLeagueStandingsHome {
/*
{
  "played": 1,
  "win": 1,
  "draw": 0,
  "lose": 0,
  "goals": {
    "for": 2,
    "against": 1
  }
}
*/

  int? played;
  int? win;
  int? draw;
  int? lose;
  TestingModelResponseLeagueStandingsHomeGoals? goals;

  TestingModelResponseLeagueStandingsHome({
    this.played,
    this.win,
    this.draw,
    this.lose,
    this.goals,
  });
  TestingModelResponseLeagueStandingsHome.fromJson(Map<String, dynamic> json) {
    played = json['played']?.toInt();
    win = json['win']?.toInt();
    draw = json['draw']?.toInt();
    lose = json['lose']?.toInt();
    goals = (json['goals'] != null) ? TestingModelResponseLeagueStandingsHomeGoals.fromJson(json['goals']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['played'] = played;
    data['win'] = win;
    data['draw'] = draw;
    data['lose'] = lose;
    if (goals != null) {
      data['goals'] = goals!.toJson();
    }
    return data;
  }
}

class TestingModelResponseLeagueStandingsAllGoals {
/*
{
  "for": 11,
  "against": 4
}
*/

  int? theFor;
  int? against;

  TestingModelResponseLeagueStandingsAllGoals({
    this.theFor,
    this.against,
  });
  TestingModelResponseLeagueStandingsAllGoals.fromJson(Map<String, dynamic> json) {
    theFor = json['for']?.toInt();
    against = json['against']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['for'] = theFor;
    data['against'] = against;
    return data;
  }
}

class TestingModelResponseLeagueStandingsAll {
/*
{
  "played": 4,
  "win": 4,
  "draw": 0,
  "lose": 0,
  "goals": {
    "for": 11,
    "against": 4
  }
}
*/

  int? played;
  int? win;
  int? draw;
  int? lose;
  TestingModelResponseLeagueStandingsAllGoals? goals;

  TestingModelResponseLeagueStandingsAll({
    this.played,
    this.win,
    this.draw,
    this.lose,
    this.goals,
  });
  TestingModelResponseLeagueStandingsAll.fromJson(Map<String, dynamic> json) {
    played = json['played']?.toInt();
    win = json['win']?.toInt();
    draw = json['draw']?.toInt();
    lose = json['lose']?.toInt();
    goals = (json['goals'] != null) ? TestingModelResponseLeagueStandingsAllGoals.fromJson(json['goals']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['played'] = played;
    data['win'] = win;
    data['draw'] = draw;
    data['lose'] = lose;
    if (goals != null) {
      data['goals'] = goals!.toJson();
    }
    return data;
  }
}

class TestingModelResponseLeagueStandingsTeam {
/*
{
  "id": 541,
  "name": "Real Madrid",
  "logo": "https://media.api-sports.io/football/teams/541.png"
}
*/

  int? id;
  String? name;
  String? logo;

  TestingModelResponseLeagueStandingsTeam({
    this.id,
    this.name,
    this.logo,
  });
  TestingModelResponseLeagueStandingsTeam.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    logo = json['logo']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}

class TestingModelResponseLeagueStandings {
/*
{
  "rank": 1,
  "team": {
    "id": 541,
    "name": "Real Madrid",
    "logo": "https://media.api-sports.io/football/teams/541.png"
  },
  "points": 12,
  "goalsDiff": 7,
  "group": "Primera División",
  "form": "WWWW",
  "status": "same",
  "description": "Promotion - Champions League (Group Stage)",
  "all": {
    "played": 4,
    "win": 4,
    "draw": 0,
    "lose": 0,
    "goals": {
      "for": 11,
      "against": 4
    }
  },
  "home": {
    "played": 1,
    "win": 1,
    "draw": 0,
    "lose": 0,
    "goals": {
      "for": 2,
      "against": 1
    }
  },
  "away": {
    "played": 3,
    "win": 3,
    "draw": 0,
    "lose": 0,
    "goals": {
      "for": 9,
      "against": 3
    }
  },
  "update": "2022-09-10T00:00:00+00:00"
}
*/

  int? rank;
  TestingModelResponseLeagueStandingsTeam? team;
  int? points;
  int? goalsDiff;
  String? group;
  String? form;
  String? status;
  String? description;
  TestingModelResponseLeagueStandingsAll? all;
  TestingModelResponseLeagueStandingsHome? home;
  TestingModelResponseLeagueStandingsAway? away;
  String? update;

  TestingModelResponseLeagueStandings({
    this.rank,
    this.team,
    this.points,
    this.goalsDiff,
    this.group,
    this.form,
    this.status,
    this.description,
    this.all,
    this.home,
    this.away,
    this.update,
  });
  TestingModelResponseLeagueStandings.fromJson(Map<String, dynamic> json) {
    rank = json['rank']?.toInt();
    team = (json['team'] != null) ? TestingModelResponseLeagueStandingsTeam.fromJson(json['team']) : null;
    points = json['points']?.toInt();
    goalsDiff = json['goalsDiff']?.toInt();
    group = json['group']?.toString();
    form = json['form']?.toString();
    status = json['status']?.toString();
    description = json['description']?.toString();
    all = (json['all'] != null) ? TestingModelResponseLeagueStandingsAll.fromJson(json['all']) : null;
    home = (json['home'] != null) ? TestingModelResponseLeagueStandingsHome.fromJson(json['home']) : null;
    away = (json['away'] != null) ? TestingModelResponseLeagueStandingsAway.fromJson(json['away']) : null;
    update = json['update']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['rank'] = rank;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['points'] = points;
    data['goalsDiff'] = goalsDiff;
    data['group'] = group;
    data['form'] = form;
    data['status'] = status;
    data['description'] = description;
    if (all != null) {
      data['all'] = all!.toJson();
    }
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (away != null) {
      data['away'] = away!.toJson();
    }
    data['update'] = update;
    return data;
  }
}

class TestingModelResponseLeague {
/*
{
  "id": 140,
  "name": "La Liga",
  "country": "Spain",
  "logo": "https://media.api-sports.io/football/leagues/140.png",
  "flag": "https://media.api-sports.io/flags/es.svg",
  "season": 2022,
  "standings": [
    [
      {
        "rank": 1,
        "team": {
          "id": 541,
          "name": "Real Madrid",
          "logo": "https://media.api-sports.io/football/teams/541.png"
        },
        "points": 12,
        "goalsDiff": 7,
        "group": "Primera División",
        "form": "WWWW",
        "status": "same",
        "description": "Promotion - Champions League (Group Stage)",
        "all": {
          "played": 4,
          "win": 4,
          "draw": 0,
          "lose": 0,
          "goals": {
            "for": 11,
            "against": 4
          }
        },
        "home": {
          "played": 1,
          "win": 1,
          "draw": 0,
          "lose": 0,
          "goals": {
            "for": 2,
            "against": 1
          }
        },
        "away": {
          "played": 3,
          "win": 3,
          "draw": 0,
          "lose": 0,
          "goals": {
            "for": 9,
            "against": 3
          }
        },
        "update": "2022-09-10T00:00:00+00:00"
      }
    ]
  ]
}
*/

  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  List<List<TestingModelResponseLeagueStandings?>?>? standings;

  TestingModelResponseLeague({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.standings,
  });
  TestingModelResponseLeague.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    country = json['country']?.toString();
    logo = json['logo']?.toString();
    flag = json['flag']?.toString();
    season = json['season']?.toInt();
    if (json['standings'] != null) {
      final v = json['standings'];
      final arr0 = <List<TestingModelResponseLeagueStandings>>[];
      v.forEach((v) {
        final arr1 = <TestingModelResponseLeagueStandings>[];
        v.forEach((v) {
          arr1.add(TestingModelResponseLeagueStandings.fromJson(v));
        });
        arr0.add(arr1);
      });
      standings = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country'] = country;
    data['logo'] = logo;
    data['flag'] = flag;
    data['season'] = season;
    if (standings != null) {
      final v = standings;
      final arr0 = [];
      v!.forEach((v) {
        final arr1 = [];
        v!.forEach((v) {
          arr1.add(v!.toJson());
        });
        arr0.add(arr1);
      });
      data['standings'] = arr0;
    }
    return data;
  }
}

class TestingModelResponse {
/*
{
  "league": {
    "id": 140,
    "name": "La Liga",
    "country": "Spain",
    "logo": "https://media.api-sports.io/football/leagues/140.png",
    "flag": "https://media.api-sports.io/flags/es.svg",
    "season": 2022,
    "standings": [
      [
        {
          "rank": 1,
          "team": {
            "id": 541,
            "name": "Real Madrid",
            "logo": "https://media.api-sports.io/football/teams/541.png"
          },
          "points": 12,
          "goalsDiff": 7,
          "group": "Primera División",
          "form": "WWWW",
          "status": "same",
          "description": "Promotion - Champions League (Group Stage)",
          "all": {
            "played": 4,
            "win": 4,
            "draw": 0,
            "lose": 0,
            "goals": {
              "for": 11,
              "against": 4
            }
          },
          "home": {
            "played": 1,
            "win": 1,
            "draw": 0,
            "lose": 0,
            "goals": {
              "for": 2,
              "against": 1
            }
          },
          "away": {
            "played": 3,
            "win": 3,
            "draw": 0,
            "lose": 0,
            "goals": {
              "for": 9,
              "against": 3
            }
          },
          "update": "2022-09-10T00:00:00+00:00"
        }
      ]
    ]
  }
}
*/

  TestingModelResponseLeague? league;

  TestingModelResponse({
    this.league,
  });
  TestingModelResponse.fromJson(Map<String, dynamic> json) {
    league = (json['league'] != null) ? TestingModelResponseLeague.fromJson(json['league']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (league != null) {
      data['league'] = league!.toJson();
    }
    return data;
  }
}

class TestingModelPaging {
/*
{
  "current": 1,
  "total": 1
}
*/

  int? current;
  int? total;

  TestingModelPaging({
    this.current,
    this.total,
  });
  TestingModelPaging.fromJson(Map<String, dynamic> json) {
    current = json['current']?.toInt();
    total = json['total']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current'] = current;
    data['total'] = total;
    return data;
  }
}

class TestingModelParameters {
/*
{
  "league": "140",
  "season": "2022"
}
*/

  String? league;
  String? season;

  TestingModelParameters({
    this.league,
    this.season,
  });
  TestingModelParameters.fromJson(Map<String, dynamic> json) {
    league = json['league']?.toString();
    season = json['season']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['league'] = league;
    data['season'] = season;
    return data;
  }
}

class TestingModel {
/*
{
  "get": "standings",
  "parameters": {
    "league": "140",
    "season": "2022"
  },
  "errors": [
    null
  ],
  "results": 1,
  "paging": {
    "current": 1,
    "total": 1
  },
  "response": [
    {
      "league": {
        "id": 140,
        "name": "La Liga",
        "country": "Spain",
        "logo": "https://media.api-sports.io/football/leagues/140.png",
        "flag": "https://media.api-sports.io/flags/es.svg",
        "season": 2022,
        "standings": [
          [
            {
              "rank": 1,
              "team": {
                "id": 541,
                "name": "Real Madrid",
                "logo": "https://media.api-sports.io/football/teams/541.png"
              },
              "points": 12,
              "goalsDiff": 7,
              "group": "Primera División",
              "form": "WWWW",
              "status": "same",
              "description": "Promotion - Champions League (Group Stage)",
              "all": {
                "played": 4,
                "win": 4,
                "draw": 0,
                "lose": 0,
                "goals": {
                  "for": 11,
                  "against": 4
                }
              },
              "home": {
                "played": 1,
                "win": 1,
                "draw": 0,
                "lose": 0,
                "goals": {
                  "for": 2,
                  "against": 1
                }
              },
              "away": {
                "played": 3,
                "win": 3,
                "draw": 0,
                "lose": 0,
                "goals": {
                  "for": 9,
                  "against": 3
                }
              },
              "update": "2022-09-10T00:00:00+00:00"
            }
          ]
        ]
      }
    }
  ]
}
*/

  String? theGet;
  TestingModelParameters? parameters;
  int? results;
  TestingModelPaging? paging;
  List<TestingModelResponse?>? response;

  TestingModel({
    this.theGet,
    this.parameters,
    this.results,
    this.paging,
    this.response,
  });
  TestingModel.fromJson(Map<String, dynamic> json) {
    theGet = json['get']?.toString();
    parameters = (json['parameters'] != null) ? TestingModelParameters.fromJson(json['parameters']) : null;
    paging = (json['paging'] != null) ? TestingModelPaging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
    final v = json['response'];
    final arr0 = <TestingModelResponse>[];
    v.forEach((v) {
    arr0.add(TestingModelResponse.fromJson(v));
    });
    response = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['get'] = theGet;
    if (parameters != null) {
      data['parameters'] = parameters!.toJson();
    }
    if (paging != null) {
    data['paging'] = paging!.toJson();
    }
    if (response != null) {
    final v = response;
    final arr0 = [];
    v!.forEach((v) {
    arr0.add(v!.toJson());
    });
    data['response'] = arr0;
    }
    return data;
  }
}
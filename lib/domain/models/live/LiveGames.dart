class LiveGames {
  LiveGames({
      String? get, 
      Parameters? parameters, 

      num? results, 
      Paging? paging, 
      List<Response>? response,}){
    _get = get;
    _parameters = parameters;
    _errors = errors;
    _results = results;
    _paging = paging;
    _response = response;
}

  LiveGames.fromJson(dynamic json) {
    _get = json['get'];
    _parameters = json['parameters'] != null ? Parameters.fromJson(json['parameters']) : null;
    _results = json['results'];
    _paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  String? _get;
  Parameters? _parameters;
  List<dynamic>? _errors;
  num? _results;
  Paging? _paging;
  List<Response>? _response;
LiveGames copyWith({  String? get,
  Parameters? parameters,
  List<dynamic>? errors,
  num? results,
  Paging? paging,
  List<Response>? response,
}) => LiveGames(  get: get ?? _get,
  parameters: parameters ?? _parameters,
  results: results ?? _results,
  paging: paging ?? _paging,
  response: response ?? _response,
);
  String? get get => _get;
  Parameters? get parameters => _parameters;
  List<dynamic>? get errors => _errors;
  num? get results => _results;
  Paging? get paging => _paging;
  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['get'] = _get;
    if (_parameters != null) {
      map['parameters'] = _parameters?.toJson();
    }
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    map['results'] = _results;
    if (_paging != null) {
      map['paging'] = _paging?.toJson();
    }
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Response {
  Response({
      Fixture? fixture, 
      League? league, 
      Teams? teams, 
      Goals? goals, 
      Score? score, 
      List<Events>? events,}){
    _fixture = fixture;
    _league = league;
    _teams = teams;
    _goals = goals;
    _score = score;
    _events = events;
}

  Response.fromJson(dynamic json) {
    _fixture = json['fixture'] != null ? Fixture.fromJson(json['fixture']) : null;
    _league = json['league'] != null ? League.fromJson(json['league']) : null;
    _teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
    _goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
    _score = json['score'] != null ? Score.fromJson(json['score']) : null;
    if (json['events'] != null) {
      _events = [];
      json['events'].forEach((v) {
        _events?.add(Events.fromJson(v));
      });
    }
  }
  Fixture? _fixture;
  League? _league;
  Teams? _teams;
  Goals? _goals;
  Score? _score;
  List<Events>? _events;
Response copyWith({  Fixture? fixture,
  League? league,
  Teams? teams,
  Goals? goals,
  Score? score,
  List<Events>? events,
}) => Response(  fixture: fixture ?? _fixture,
  league: league ?? _league,
  teams: teams ?? _teams,
  goals: goals ?? _goals,
  score: score ?? _score,
  events: events ?? _events,
);
  Fixture? get fixture => _fixture;
  League? get league => _league;
  Teams? get teams => _teams;
  Goals? get goals => _goals;
  Score? get score => _score;
  List<Events>? get events => _events;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_fixture != null) {
      map['fixture'] = _fixture?.toJson();
    }
    if (_league != null) {
      map['league'] = _league?.toJson();
    }
    if (_teams != null) {
      map['teams'] = _teams?.toJson();
    }
    if (_goals != null) {
      map['goals'] = _goals?.toJson();
    }
    if (_score != null) {
      map['score'] = _score?.toJson();
    }
    if (_events != null) {
      map['events'] = _events?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Events {
  Events({
      Time? time, 
      Team? team, 
      Player? player, 
      Assist? assist, 
      String? type, 
      String? detail, 
      dynamic comments,}){
    _time = time;
    _team = team;
    _player = player;
    _assist = assist;
    _type = type;
    _detail = detail;
    _comments = comments;
}

  Events.fromJson(dynamic json) {
    _time = json['time'] != null ? Time.fromJson(json['time']) : null;
    _team = json['team'] != null ? Team.fromJson(json['team']) : null;
    _player = json['player'] != null ? Player.fromJson(json['player']) : null;
    _assist = json['assist'] != null ? Assist.fromJson(json['assist']) : null;
    _type = json['type'];
    _detail = json['detail'];
    _comments = json['comments'];
  }
  Time? _time;
  Team? _team;
  Player? _player;
  Assist? _assist;
  String? _type;
  String? _detail;
  dynamic _comments;
Events copyWith({  Time? time,
  Team? team,
  Player? player,
  Assist? assist,
  String? type,
  String? detail,
  dynamic comments,
}) => Events(  time: time ?? _time,
  team: team ?? _team,
  player: player ?? _player,
  assist: assist ?? _assist,
  type: type ?? _type,
  detail: detail ?? _detail,
  comments: comments ?? _comments,
);
  Time? get time => _time;
  Team? get team => _team;
  Player? get player => _player;
  Assist? get assist => _assist;
  String? get type => _type;
  String? get detail => _detail;
  dynamic get comments => _comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_time != null) {
      map['time'] = _time?.toJson();
    }
    if (_team != null) {
      map['team'] = _team?.toJson();
    }
    if (_player != null) {
      map['player'] = _player?.toJson();
    }
    if (_assist != null) {
      map['assist'] = _assist?.toJson();
    }
    map['type'] = _type;
    map['detail'] = _detail;
    map['comments'] = _comments;
    return map;
  }

}

class Assist {
  Assist({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Assist.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Assist copyWith({  num? id,
  String? name,
}) => Assist(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

class Player {
  Player({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Player.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Player copyWith({  num? id,
  String? name,
}) => Player(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

class Team {
  Team({
      num? id, 
      String? name, 
      String? logo,}){
    _id = id;
    _name = name;
    _logo = logo;
}

  Team.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
  }
  num? _id;
  String? _name;
  String? _logo;
Team copyWith({  num? id,
  String? name,
  String? logo,
}) => Team(  id: id ?? _id,
  name: name ?? _name,
  logo: logo ?? _logo,
);
  num? get id => _id;
  String? get name => _name;
  String? get logo => _logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['logo'] = _logo;
    return map;
  }

}

class Time {
  Time({
      num? elapsed, 
      dynamic extra,}){
    _elapsed = elapsed;
    _extra = extra;
}

  Time.fromJson(dynamic json) {
    _elapsed = json['elapsed'];
    _extra = json['extra'];
  }
  num? _elapsed;
  dynamic _extra;
Time copyWith({  num? elapsed,
  dynamic extra,
}) => Time(  elapsed: elapsed ?? _elapsed,
  extra: extra ?? _extra,
);
  num? get elapsed => _elapsed;
  dynamic get extra => _extra;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['elapsed'] = _elapsed;
    map['extra'] = _extra;
    return map;
  }

}

class Score {
  Score({
      Halftime? halftime, 
      Fulltime? fulltime, 
      Extratime? extratime, 
      Penalty? penalty,}){
    _halftime = halftime;
    _fulltime = fulltime;
    _extratime = extratime;
    _penalty = penalty;
}

  Score.fromJson(dynamic json) {
    _halftime = json['halftime'] != null ? Halftime.fromJson(json['halftime']) : null;
    _fulltime = json['fulltime'] != null ? Fulltime.fromJson(json['fulltime']) : null;
    _extratime = json['extratime'] != null ? Extratime.fromJson(json['extratime']) : null;
    _penalty = json['penalty'] != null ? Penalty.fromJson(json['penalty']) : null;
  }
  Halftime? _halftime;
  Fulltime? _fulltime;
  Extratime? _extratime;
  Penalty? _penalty;
Score copyWith({  Halftime? halftime,
  Fulltime? fulltime,
  Extratime? extratime,
  Penalty? penalty,
}) => Score(  halftime: halftime ?? _halftime,
  fulltime: fulltime ?? _fulltime,
  extratime: extratime ?? _extratime,
  penalty: penalty ?? _penalty,
);
  Halftime? get halftime => _halftime;
  Fulltime? get fulltime => _fulltime;
  Extratime? get extratime => _extratime;
  Penalty? get penalty => _penalty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_halftime != null) {
      map['halftime'] = _halftime?.toJson();
    }
    if (_fulltime != null) {
      map['fulltime'] = _fulltime?.toJson();
    }
    if (_extratime != null) {
      map['extratime'] = _extratime?.toJson();
    }
    if (_penalty != null) {
      map['penalty'] = _penalty?.toJson();
    }
    return map;
  }

}

class Penalty {
  Penalty({
      dynamic home, 
      dynamic away,}){
    _home = home;
    _away = away;
}

  Penalty.fromJson(dynamic json) {
    _home = json['home'];
    _away = json['away'];
  }
  dynamic _home;
  dynamic _away;
Penalty copyWith({  dynamic home,
  dynamic away,
}) => Penalty(  home: home ?? _home,
  away: away ?? _away,
);
  dynamic get home => _home;
  dynamic get away => _away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = _home;
    map['away'] = _away;
    return map;
  }

}

class Extratime {
  Extratime({
      dynamic home, 
      dynamic away,}){
    _home = home;
    _away = away;
}

  Extratime.fromJson(dynamic json) {
    _home = json['home'];
    _away = json['away'];
  }
  dynamic _home;
  dynamic _away;
Extratime copyWith({  dynamic home,
  dynamic away,
}) => Extratime(  home: home ?? _home,
  away: away ?? _away,
);
  dynamic get home => _home;
  dynamic get away => _away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = _home;
    map['away'] = _away;
    return map;
  }

}

class Fulltime {
  Fulltime({
      dynamic home, 
      dynamic away,}){
    _home = home;
    _away = away;
}

  Fulltime.fromJson(dynamic json) {
    _home = json['home'];
    _away = json['away'];
  }
  dynamic _home;
  dynamic _away;
Fulltime copyWith({  dynamic home,
  dynamic away,
}) => Fulltime(  home: home ?? _home,
  away: away ?? _away,
);
  dynamic get home => _home;
  dynamic get away => _away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = _home;
    map['away'] = _away;
    return map;
  }

}

class Halftime {
  Halftime({
      num? home, 
      num? away,}){
    _home = home;
    _away = away;
}

  Halftime.fromJson(dynamic json) {
    _home = json['home'];
    _away = json['away'];
  }
  num? _home;
  num? _away;
Halftime copyWith({  num? home,
  num? away,
}) => Halftime(  home: home ?? _home,
  away: away ?? _away,
);
  num? get home => _home;
  num? get away => _away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = _home;
    map['away'] = _away;
    return map;
  }

}

class Goals {
  Goals({
      num? home, 
      num? away,}){
    _home = home;
    _away = away;
}

  Goals.fromJson(dynamic json) {
    _home = json['home'];
    _away = json['away'];
  }
  num? _home;
  num? _away;
Goals copyWith({  num? home,
  num? away,
}) => Goals(  home: home ?? _home,
  away: away ?? _away,
);
  num? get home => _home;
  num? get away => _away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = _home;
    map['away'] = _away;
    return map;
  }

}

class Teams {
  Teams({
      Home? home, 
      Away? away,}){
    _home = home;
    _away = away;
}

  Teams.fromJson(dynamic json) {
    _home = json['home'] != null ? Home.fromJson(json['home']) : null;
    _away = json['away'] != null ? Away.fromJson(json['away']) : null;
  }
  Home? _home;
  Away? _away;
Teams copyWith({  Home? home,
  Away? away,
}) => Teams(  home: home ?? _home,
  away: away ?? _away,
);
  Home? get home => _home;
  Away? get away => _away;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_home != null) {
      map['home'] = _home?.toJson();
    }
    if (_away != null) {
      map['away'] = _away?.toJson();
    }
    return map;
  }

}

class Away {
  Away({
      num? id, 
      String? name, 
      String? logo, 
      bool? winner,}){
    _id = id;
    _name = name;
    _logo = logo;
    _winner = winner;
}

  Away.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
    _winner = json['winner'];
  }
  num? _id;
  String? _name;
  String? _logo;
  bool? _winner;
Away copyWith({  num? id,
  String? name,
  String? logo,
  bool? winner,
}) => Away(  id: id ?? _id,
  name: name ?? _name,
  logo: logo ?? _logo,
  winner: winner ?? _winner,
);
  num? get id => _id;
  String? get name => _name;
  String? get logo => _logo;
  bool? get winner => _winner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['logo'] = _logo;
    map['winner'] = _winner;
    return map;
  }

}

class Home {
  Home({
      num? id, 
      String? name, 
      String? logo, 
      bool? winner,}){
    _id = id;
    _name = name;
    _logo = logo;
    _winner = winner;
}

  Home.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
    _winner = json['winner'];
  }
  num? _id;
  String? _name;
  String? _logo;
  bool? _winner;
Home copyWith({  num? id,
  String? name,
  String? logo,
  bool? winner,
}) => Home(  id: id ?? _id,
  name: name ?? _name,
  logo: logo ?? _logo,
  winner: winner ?? _winner,
);
  num? get id => _id;
  String? get name => _name;
  String? get logo => _logo;
  bool? get winner => _winner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['logo'] = _logo;
    map['winner'] = _winner;
    return map;
  }

}

class League {
  League({
      num? id, 
      String? name, 
      String? country, 
      String? logo, 
      String? flag, 
      num? season, 
      String? round,}){
    _id = id;
    _name = name;
    _country = country;
    _logo = logo;
    _flag = flag;
    _season = season;
    _round = round;
}

  League.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _country = json['country'];
    _logo = json['logo'];
    _flag = json['flag'];
    _season = json['season'];
    _round = json['round'];
  }
  num? _id;
  String? _name;
  String? _country;
  String? _logo;
  String? _flag;
  num? _season;
  String? _round;
League copyWith({  num? id,
  String? name,
  String? country,
  String? logo,
  String? flag,
  num? season,
  String? round,
}) => League(  id: id ?? _id,
  name: name ?? _name,
  country: country ?? _country,
  logo: logo ?? _logo,
  flag: flag ?? _flag,
  season: season ?? _season,
  round: round ?? _round,
);
  num? get id => _id;
  String? get name => _name;
  String? get country => _country;
  String? get logo => _logo;
  String? get flag => _flag;
  num? get season => _season;
  String? get round => _round;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['country'] = _country;
    map['logo'] = _logo;
    map['flag'] = _flag;
    map['season'] = _season;
    map['round'] = _round;
    return map;
  }

}

class Fixture {
  Fixture({
      num? id, 
      String? referee, 
      String? timezone, 
      String? date, 
      num? timestamp, 
      Periods? periods, 
      Venue? venue, 
      Status? status,}){
    _id = id;
    _referee = referee;
    _timezone = timezone;
    _date = date;
    _timestamp = timestamp;
    _periods = periods;
    _venue = venue;
    _status = status;
}

  Fixture.fromJson(dynamic json) {
    _id = json['id'];
    _referee = json['referee'];
    _timezone = json['timezone'];
    _date = json['date'];
    _timestamp = json['timestamp'];
    _periods = json['periods'] != null ? Periods.fromJson(json['periods']) : null;
    _venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  num? _id;
  String? _referee;
  String? _timezone;
  String? _date;
  num? _timestamp;
  Periods? _periods;
  Venue? _venue;
  Status? _status;
Fixture copyWith({  num? id,
  String? referee,
  String? timezone,
  String? date,
  num? timestamp,
  Periods? periods,
  Venue? venue,
  Status? status,
}) => Fixture(  id: id ?? _id,
  referee: referee ?? _referee,
  timezone: timezone ?? _timezone,
  date: date ?? _date,
  timestamp: timestamp ?? _timestamp,
  periods: periods ?? _periods,
  venue: venue ?? _venue,
  status: status ?? _status,
);
  num? get id => _id;
  String? get referee => _referee;
  String? get timezone => _timezone;
  String? get date => _date;
  num? get timestamp => _timestamp;
  Periods? get periods => _periods;
  Venue? get venue => _venue;
  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['referee'] = _referee;
    map['timezone'] = _timezone;
    map['date'] = _date;
    map['timestamp'] = _timestamp;
    if (_periods != null) {
      map['periods'] = _periods?.toJson();
    }
    if (_venue != null) {
      map['venue'] = _venue?.toJson();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }

}

class Status {
  Status({
      String? long, 
      String? short, 
      num? elapsed,}){
    _long = long;
    _short = short;
    _elapsed = elapsed;
}

  Status.fromJson(dynamic json) {
    _long = json['long'];
    _short = json['short'];
    _elapsed = json['elapsed'];
  }
  String? _long;
  String? _short;
  num? _elapsed;
Status copyWith({  String? long,
  String? short,
  num? elapsed,
}) => Status(  long: long ?? _long,
  short: short ?? _short,
  elapsed: elapsed ?? _elapsed,
);
  String? get long => _long;
  String? get short => _short;
  num? get elapsed => _elapsed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long'] = _long;
    map['short'] = _short;
    map['elapsed'] = _elapsed;
    return map;
  }

}

class Venue {
  Venue({
      num? id, 
      String? name, 
      String? city,}){
    _id = id;
    _name = name;
    _city = city;
}

  Venue.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _city = json['city'];
  }
  num? _id;
  String? _name;
  String? _city;
Venue copyWith({  num? id,
  String? name,
  String? city,
}) => Venue(  id: id ?? _id,
  name: name ?? _name,
  city: city ?? _city,
);
  num? get id => _id;
  String? get name => _name;
  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['city'] = _city;
    return map;
  }

}

class Periods {
  Periods({
      num? first, 
      num? second,}){
    _first = first;
    _second = second;
}

  Periods.fromJson(dynamic json) {
    _first = json['first'];
    _second = json['second'];
  }
  num? _first;
  num? _second;
Periods copyWith({  num? first,
  num? second,
}) => Periods(  first: first ?? _first,
  second: second ?? _second,
);
  num? get first => _first;
  num? get second => _second;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = _first;
    map['second'] = _second;
    return map;
  }

}

class Paging {
  Paging({
      num? current, 
      num? total,}){
    _current = current;
    _total = total;
}

  Paging.fromJson(dynamic json) {
    _current = json['current'];
    _total = json['total'];
  }
  num? _current;
  num? _total;
Paging copyWith({  num? current,
  num? total,
}) => Paging(  current: current ?? _current,
  total: total ?? _total,
);
  num? get current => _current;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['total'] = _total;
    return map;
  }

}

class Parameters {
  Parameters({
      String? live, 
      String? league, 
      String? season,}){
    _live = live;
    _league = league;
    _season = season;
}

  Parameters.fromJson(dynamic json) {
    _live = json['live'];
    _league = json['league'];
    _season = json['season'];
  }
  String? _live;
  String? _league;
  String? _season;
Parameters copyWith({  String? live,
  String? league,
  String? season,
}) => Parameters(  live: live ?? _live,
  league: league ?? _league,
  season: season ?? _season,
);
  String? get live => _live;
  String? get league => _league;
  String? get season => _season;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['live'] = _live;
    map['league'] = _league;
    map['season'] = _season;
    return map;
  }

}
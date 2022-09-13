class StModel {
  StModel({
      String? get, 
      Parameters? parameters, 
      List<dynamic>? errors, 
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

  StModel.fromJson(dynamic json) {
    _get = json['get'];
    _parameters = json['parameters'] != null ? Parameters.fromJson(json['parameters']) : null;
    if (json['errors'] != null) {
      _errors = [];
      json['errors'].forEach((v) {
        _errors?.add(v);
      });
    }
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
StModel copyWith({  String? get,
  Parameters? parameters,
  List<dynamic>? errors,
  num? results,
  Paging? paging,
  List<Response>? response,
}) => StModel(  get: get ?? _get,
  parameters: parameters ?? _parameters,
  errors: errors ?? _errors,
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
      League? league,}){
    _league = league;
}

  Response.fromJson(dynamic json) {
    _league = json['league'] != null ? League.fromJson(json['league']) : null;
  }
  League? _league;
Response copyWith({  League? league,
}) => Response(  league: league ?? _league,
);
  League? get league => _league;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_league != null) {
      map['league'] = _league?.toJson();
    }
    return map;
  }

}

class League {
  String? country;
  String? flag;
  int? id;
  String? logo;
  String? name;
  int? season;
  List<List<Standing>>? standings;

  League({this.country, this.flag, this.id, this.logo, this.name, this.season, this.standings});

  factory League.fromJson(Map<String, dynamic> json) {
    List<List<Standing>>? standings = [];
    for (var element in json['league']['standings'] as List) {
      List<Standing> temp = [];
      for (var item in element) {
        temp.add(Standing.fromJson(item));
      }
      standings.add(temp);
    }
    return League(
      country: json['country'],
      flag: json['flag'],
      id: json['id'],
      logo: json['logo'],
      name: json['name'],
      season: json['season'],
      standings: standings,
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'country' : country,
    'logo' : logo,
    'flag' : flag,
    'season' : season,
    'standings' : standings
  };
}

class Standing {
  All? all;
  Away? away;
  String? form;
  int? goalsDiff;
  String? group;
  Home? home;
  int? points;
  int? rank;
  String? status;
  Team? team;
  String? update;

  Standing({this.all, this.away, this.form, this.goalsDiff, this.group, this.home, this.points, this.rank, this.status, this.team, this.update});

  factory Standing.fromJson(Map<String, dynamic> json) {
    return Standing(
      all: json['all'] != null ? All.fromJson(json['all']) : null,
      away: json['away'] != null ? Away.fromJson(json['away']) : null,
      form: json['form'],
      goalsDiff: json['goalsDiff'],
      group: json['group'],
      home: json['home'] != null ? Home.fromJson(json['home']) : null,
      points: json['points'],
      rank: json['rank'],
      status: json['status'],
      team: json['team'] != null ? Team.fromJson(json['team']) : null,
      update: json['update'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['form'] = this.form;
    data['goalsDiff'] = this.goalsDiff;
    data['group'] = this.group;
    data['points'] = this.points;
    data['rank'] = this.rank;
    data['status'] = this.status;
    data['update'] = this.update;
    final all = this.all;
    if (all != null) {
      data['all'] = all.toJson();
    }
    final away = this.away;
    if (away != null) {
      data['away'] = away.toJson();
    }

    final home = this.home;
    if (home != null) {
      data['home'] = home.toJson();
    }
    final team = this.team;
    if (team != null) {
      data['team'] = team.toJson();
    }
    return data;
  }
}

class Away {
  Away({
      num? played, 
      num? win, 
      num? draw, 
      num? lose,}){
    _played = played;
    _win = win;
    _draw = draw;
    _lose = lose;
}

  Away.fromJson(dynamic json) {
    _played = json['played'];
    _win = json['win'];
    _draw = json['draw'];
    _lose = json['lose'];
  }
  num? _played;
  num? _win;
  num? _draw;
  num? _lose;
Away copyWith({  num? played,
  num? win,
  num? draw,
  num? lose,

}) => Away(  played: played ?? _played,
  win: win ?? _win,
  draw: draw ?? _draw,
  lose: lose ?? _lose,
  
);
  num? get played => _played;
  num? get win => _win;
  num? get draw => _draw;
  num? get lose => _lose;
 

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['played'] = _played;
    map['win'] = _win;
    map['draw'] = _draw;
    map['lose'] = _lose;
   
    return map;
  }

}

class Home {
  Home({
      num? played, 
      num? win, 
      num? draw, 
      num? lose,}){
    _played = played;
    _win = win;
    _draw = draw;
    _lose = lose;
}

  Home.fromJson(dynamic json) {
    _played = json['played'];
    _win = json['win'];
    _draw = json['draw'];
    _lose = json['lose'];
  }
  num? _played;
  num? _win;
  num? _draw;
  num? _lose; 
Home copyWith({  num? played,
  num? win,
  num? draw,
  num? lose,
}) => Home(  played: played ?? _played,
  win: win ?? _win,
  draw: draw ?? _draw,
  lose: lose ?? _lose,
  
);
  num? get played => _played;
  num? get win => _win;
  num? get draw => _draw;
  num? get lose => _lose;
 

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['played'] = _played;
    map['win'] = _win;
    map['draw'] = _draw;
    map['lose'] = _lose;
    return map;
  }

}

class All {
  All({
      num? played, 
      num? win, 
      num? draw, 
      num? lose,}){
    _played = played;
    _win = win;
    _draw = draw;
    _lose = lose;
}

  All.fromJson(dynamic json) {
    _played = json['played'];
    _win = json['win'];
    _draw = json['draw'];
    _lose = json['lose'];
  }
  num? _played;
  num? _win;
  num? _draw;
  num? _lose;
All copyWith({  num? played,
  num? win,
  num? draw,
  num? lose,
}) => All(  played: played ?? _played,
  win: win ?? _win,
  draw: draw ?? _draw,
  lose: lose ?? _lose,
 
);
  num? get played => _played;
  num? get win => _win;
  num? get draw => _draw;
  num? get lose => _lose;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['played'] = _played;
    map['win'] = _win;
    map['draw'] = _draw;
    map['lose'] = _lose;
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
      String? league, 
      String? season,}){
    _league = league;
    _season = season;
}

  Parameters.fromJson(dynamic json) {
    _league = json['league'];
    _season = json['season'];
  }
  String? _league;
  String? _season;
Parameters copyWith({  String? league,
  String? season,
}) => Parameters(  league: league ?? _league,
  season: season ?? _season,
);
  String? get league => _league;
  String? get season => _season;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['league'] = _league;
    map['season'] = _season;
    return map;
  }

}
class GameRecord {
  final String date;//날짜
  final String playerName;//선수 이름
  final int holeNumber;//홀 번호
  final int parValue;//파 값
  final String team;//팀원
  final int strokes;//타수
  final int specialScore;// 버디, 이글, 앨버스트로스 등의 점수
  final int bogeyScore;//보기 점수
  final int totalScore;//총 점수
  final int wins;//승
  final int losses;//패
  final int draws;//무
  final int rank;//순위

  GameRecord({
    required this.date,
    required this.playerName,
    required this.holeNumber,
    required this.parValue,
    required this.team,
    required this.strokes,
    required this.specialScore,
    required this.bogeyScore,
    required this.totalScore,
    required this.wins,
    required this.losses,
    required this.draws,
    required this.rank,
  });

  Map<String, dynamic> toJson() => {
    'date': date,
    'playerName': playerName,
    'holeNumber': holeNumber,
    'parValue': parValue,
    'team': team,
    'strokes': strokes,
    'specialScore': specialScore,
    'bogeyScore': bogeyScore,
    'totalScore': totalScore,
    'wins': wins,
    'losses': losses,
    'draws': draws,
    'rank': rank,
  };

  factory GameRecord.fromJson(Map<String, dynamic> json) {
    return GameRecord(
      date: json['date'],
      playerName: json['playerName'],
      holeNumber: json['holeNumber'],
      parValue: json['parValue'],
      team: json['team'],
      strokes: json['strokes'],
      specialScore: json['specialScore'],
      bogeyScore: json['bogeyScore'],
      totalScore: json['totalScore'],
      wins: json['wins'],
      losses: json['losses'],
      draws: json['draws'],
      rank: json['rank'],
    );
  }
}

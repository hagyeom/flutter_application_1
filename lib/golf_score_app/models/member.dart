class Member {
  final String name;//이름
  final String phoneNumber;//전화번호
  final String id;//아이디
  final String pw;//비밀번호
  final String memberCode;//회원코드
  int totalHoles;//총 홀 수
  int wins;//승
  int losses;//패
  int draws;//무
  List<String> friends;//친구목록

  Member({
    required this.name,
    required this.phoneNumber,
    required this.id,
    required this.pw,
    required this.memberCode,
    this.totalHoles = 0,
    this.wins = 0,
    this.losses = 0,
    this.draws = 0,
    List<String>? friends,
  }) : friends = friends ?? [];

  Map<String, dynamic> toJson() => {
    'name': name,
    'phoneNumber': phoneNumber,
    'id': id,
    'pw': pw,
    'memberCode': memberCode,
    'totalHoles': totalHoles,
    'wins': wins,
    'losses': losses,
    'draws': draws,
    'friends': friends,
  };

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      id: json['id'],
      pw: json['pw'],
      memberCode: json['memberCode'],
      totalHoles: json['totalHoles'],
      wins: json['wins'],
      losses: json['losses'],
      draws: json['draws'],
      friends: List<String>.from(json['friends']),
    );
  }

  void addFriend(String friendName) {
    if (!friends.contains(friendName)) {
      friends.add(friendName);
    }
  }

  void updateRecord(int win, int loss, int draw) {
    wins += win;
    losses += loss;
    draws += draw;
    totalHoles = wins + losses + draws;
  }
}

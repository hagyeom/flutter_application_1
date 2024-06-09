import 'package:flutter/material.dart';

class Player {
  final String name;
  final int wins;
  final int holes;

  Player({required this.name, required this.wins, required this.holes});
}

class WLDcard extends StatelessWidget {
  final String date;
  final int wins;
  final int losses;
  final int draws;
  final List<Player> players;

  WLDcard({
    required this.date,
    required this.wins,
    required this.losses,
    required this.draws,
    required this.players,
  });

  Color _getBorderColor() {
    if (wins > losses && wins > draws) {
      return Color(0xFFFFB3B3);
    } else if (losses > wins && losses > draws) {
      return Color(0xFFC8C2FA);
    } else {
      return Color(0xFF00A64F);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: _getBorderColor(),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      '$date',
                      style: TextStyle(
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: () {
                        // 공유 버튼 기능
                      },
                      icon: Icon(
                        Icons.share,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFD9D9D9),
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              child: Text(
                '$wins승 $losses패 $draws무',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width - 110,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFB9CA98),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var player in players)
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Text(
                              '${player.name} ${player.wins}승(${player.holes}타)',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

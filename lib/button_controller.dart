import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:game_1/main.dart';

class ButtonController extends StatelessWidget {
  final MyGame game;
  const ButtonController({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.volume_up_rounded, size: 40.0),
              color: Colors.deepPurple,
              onPressed: () {
                FlameAudio.bgm.play('bensound-enigmatic.mp3');
              },
            ),

            IconButton(
              icon: const Icon(Icons.volume_off_rounded, size: 40.0),
              color: Colors.deepPurple,
              onPressed: () {
                FlameAudio.bgm.stop();
              },
            ),
            /*
            Text(
              game.soundTrackName,
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),

            Spacer(),

            Image.asset(
                'assets/images/red_gem.png',
                scale: 0.8),
            SizedBox(
              width: 12,
            ),
            Text(
                '${game.numChallengesCompleted}',
                style: TextStyle(fontSize: 28, color: Colors.black45),
            ),
             */
          ],
        ),
      ],
    );
  }
}


import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

class MyCrate extends SpriteComponent {
  // creates a component that renders the crate.png sprite, with size 16 x 16
  MyCrate() : super(size: Vector2.all(33));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('pacman_closed.png');
    anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    // We don't need to set the position in the constructor, we can set it directly here since it will
    // be called once before the first time it is rendered.
    position = gameSize / 2;
  }
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(MyCrate());
    add(PacMan());
  }
}

class PacMan extends SpriteAnimationComponent {
  final sprites = [0, 1, 2]
      .map((i) => Sprite.load('player_$i.png'));
  @override

  animation = SpriteAnimation.spriteList(
      await Future.wait(sprites),
      stepTime: 0.01,
  );
  this.player = SpriteAnimationComponent(
  animation: animation,
  size: Vector2.all(64.0),
  );
}

main() {
  final myGame = MyGame();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}
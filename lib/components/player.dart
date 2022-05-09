import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:game_1/main.dart';
import '../helpers/direction.dart';
import 'package:flame/geometry.dart';
import 'obstacles.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  //final MyGame game;

  late SpriteAnimation rightAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation downAnimation;
  late SpriteAnimation idleAnimation;
  final double animationSpeed = 0.25;
  double playerSpeed = 100.0;

  Direction direction = Direction.none;
  bool hasCollided = false;
  Direction collisionDirection = Direction.none;

  //PlayerComponent({required this.game}) {
  Player() : super(size: Vector2(32, 64), position: Vector2(342, 690),) {
    debugMode = false;
    add(RectangleHitbox());
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final spriteSheet = SpriteSheet(
        image: await gameRef.images.load('Adam_run_16x16.png'),
        srcSize: Vector2(16, 32));

    // new
    rightAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 0, to: 6);
    upAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 6, to: 12);
    leftAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 12, to: 18);
    downAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 18, to: 24);
    idleAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 18, to: 19);
    //animation = idleAnimation;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

      if (other is Obstacles) {
        if (!hasCollided) {
          hasCollided = true;
          collisionDirection = direction;
        }
      }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    hasCollided = false;
  }

  @override
  void update(double delta) {
    super.update(delta);
    movePlayer(delta);
  }

  void movePlayer(double delta) {
    switch (direction) {
      case Direction.up:
        if (canPlayerMoveUp()) {
          animation = upAnimation;
          moveUp(delta);
        }
        break;
      case Direction.down:
        if (canPlayerMoveDown()) {
          animation = downAnimation;
          moveDown(delta);
        }
        break;
      case Direction.left:
        if (canPlayerMoveLeft()) {
          animation = leftAnimation;
          moveLeft(delta);
        }
        break;
      case Direction.right:
        if (canPlayerMoveRight()) {
          animation = rightAnimation;
          moveRight(delta);
        }
        break;
      case Direction.none:
        animation = idleAnimation;
        break;
    }
  }

  bool canPlayerMoveUp() {
    if (hasCollided && collisionDirection == Direction.up) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveDown() {
    if (hasCollided && collisionDirection == Direction.down) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveLeft() {
    if (hasCollided && collisionDirection == Direction.left) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveRight() {
    if (hasCollided && collisionDirection == Direction.right) {
      return false;
    }
    return true;
  }

  void moveUp(double delta) {
    position.add(Vector2(0, delta * -playerSpeed));
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * playerSpeed));
  }

  void moveLeft(double delta) {
    position.add(Vector2(delta * -playerSpeed, 0));
  }

  void moveRight(double delta) {
    position.add(Vector2(delta * playerSpeed, 0));
  }

  /*
  @override
  void update(double dt) {
    super.update(dt);
    switch (game.direction) {
      case 0:
        animation = idleAnimation;
        break;
      case 1:
        animation = rightAnimation;
        if (x < game.mapWidth - width * 2) {
          x += dt * game.playerSpeed;
        }
        break;
      case 2:
        animation = upAnimation;
        if (y > height * 2) {
          y -= dt * game.playerSpeed;
        }
        break;
      case 3:
        animation = leftAnimation;
        if (x > 0) {
          x -= dt * game.playerSpeed;
        }
        break;
      case 4:
        animation = downAnimation;
        if (y < game.mapHeight - height * 1.5) {
          y += dt * game.playerSpeed;
        }
        break;
    }
    super.update(dt);
  }
  */
}
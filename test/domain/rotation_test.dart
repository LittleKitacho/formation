import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:formation/domain/rotation.dart';

void main() {
  test('test dir angle calculation', () {
    Rotation dir1 = Rotation(dir: 0);
    expect(dir1.calculateAngle(0, 0), equals(0));
    Rotation dir2 = Rotation(dir: 0.5);
    expect(dir2.calculateAngle(0, 0), equals(pi / 4));
    Rotation dir3 = Rotation(dir: 2);
    expect(dir3.calculateAngle(0, 0), equals(pi));
  });

  group("test toHomeYardline angle calculations", () {
    Rotation line25 = Rotation(toHomeYardline: 25);
    Rotation line50 = Rotation(toHomeYardline: 50);
    Rotation line75 = Rotation(toHomeYardline: 75);
    test("left of yardline", () {
      expect(line25.calculateAngle(22, 84), equals(0),
          reason: "to 25 from 22, 84 to equal 0");
      expect(line25.calculateAngle(14, 69), closeTo(pi / 6, 0.001),
          reason: "to 25 from 14, 69 to equal pi / 6");
      expect(line25.calculateAngle(22, 66), equals(pi / 4),
          reason: "to 25 from 22, 66 to equal pi / 4");
      expect(line25.calculateAngle(25, 58), closeTo(pi / 3, 0.001),
          reason: "to 25 from 25, 58 to equal pi / 3");

      expect(line50.calculateAngle(62, 84), equals(0),
          reason: "to 50 from 62, 84 to equal 0");
      expect(line50.calculateAngle(54, 69), closeTo(pi / 6, 0.0005),
          reason: "to 50 from 54, 69 to equal pi / 6");
      expect(line50.calculateAngle(61, 65), equals(pi / 4),
          reason: "to 50 from 61, 65 to equal pi / 4");
      expect(line50.calculateAngle(65, 58), closeTo(pi / 3, 0.0005),
          reason: "to 50 from 65, 58 to equal pi / 3");

      expect(line75.calculateAngle(102, 84), equals(0),
          reason: "to 75 from 102, 84 to equal 0");
      expect(line75.calculateAngle(94, 69), closeTo(pi / 6, 0.001),
          reason: "to 75 from 94, 69 to equal pi / 6");
      expect(line75.calculateAngle(101, 65), equals(pi / 4),
          reason: "to 75 from 101, 65 to equal pi / 4");
      expect(line75.calculateAngle(105, 58), closeTo(pi / 3, 0.001),
          reason: "to 75 from 105, 58 to equal pi / 3");
    });

    test("on yardline", () {
      expect(line25.calculateAngle(40, 70), equals(pi / 2));
      expect(line50.calculateAngle(80, 70), equals(pi / 2));
      expect(line75.calculateAngle(120, 70), equals(pi / 2));
    });

    test("right of yardline", () {
      expect(line25.calculateAngle(58, 84), equals(pi),
          reason: "to 25 from 58, 84 to equal pi");
      expect(line25.calculateAngle(66, 69), closeTo(5 * pi / 6, 0.001),
          reason: "to 25 from 66, 69 to equal 5 * pi / 6");
      expect(line25.calculateAngle(58, 66), equals(3 * pi / 4),
          reason: "to 25 from 58, 66 to equal 3 * pi / 4");
      expect(line25.calculateAngle(55, 58), closeTo(2 * pi / 3, 0.001),
          reason: "to 25 from 55, 58 to equal 2 * pi / 3");

      expect(line50.calculateAngle(62, 84), equals(0),
          reason: "to 50 from 62, 84 to equal 0");
      expect(line50.calculateAngle(54, 69), closeTo(pi / 6, 0.0005),
          reason: "to 50 from 54, 69 to equal pi / 6");
      expect(line50.calculateAngle(61, 65), equals(pi / 4),
          reason: "to 50 from 61, 65 to equal pi / 4");
      expect(line50.calculateAngle(65, 58), closeTo(pi / 3, 0.0005),
          reason: "to 50 from 65, 58 to equal pi / 3");

      expect(line75.calculateAngle(102, 84), equals(0),
          reason: "to 75 from 102, 84 to equal 0");
      expect(line75.calculateAngle(94, 69), closeTo(pi / 6, 0.001),
          reason: "to 75 from 94, 69 to equal pi / 6");
      expect(line75.calculateAngle(101, 65), equals(pi / 4),
          reason: "to 75 from 101, 65 to equal pi / 4");
      expect(line75.calculateAngle(105, 58), closeTo(pi / 3, 0.001),
          reason: "to 75 from 105, 58 to equal pi / 3");
    });
  });

  group("test toAwayYardline angle calculation", () {
    Rotation line25 = Rotation(toAwayYardline: 25);
    Rotation line50 = Rotation(toAwayYardline: 50);
    Rotation line75 = Rotation(toAwayYardline: 75);
    test("left of yardline", () {
      expect(line25.calculateAngle(22, 0), equals(2 * pi),
          reason: "to 25 from 22, 0 to equal 2 * pi");
      expect(line25.calculateAngle(14, 15), closeTo(11 * pi / 6, 0.001),
          reason: "to 25 from 14, 15 to equal 11 * pi / 6");
      expect(line25.calculateAngle(22, 18), equals(7 * pi / 4),
          reason: "to 25 from 22, 18 to equal 7 * pi / 4");
      expect(line25.calculateAngle(25, 26), closeTo(5 * pi / 3, 0.001),
          reason: "to 25 from 25, 26 to equal 5 * pi / 3");

      expect(line50.calculateAngle(62, 0), equals(2 * pi),
          reason: "to 50 from 62, 0 to equal 2 * pi");
      expect(line50.calculateAngle(54, 15), closeTo(11 * pi / 6, 0.0005),
          reason: "to 50 from 54, 15 to equal 11 * pi / 6");
      expect(line50.calculateAngle(61, 19), equals(7 * pi / 4),
          reason: "to 50 from 61, 19 to equal 7 * pi / 4");
      expect(line50.calculateAngle(65, 26), closeTo(5 * pi / 3, 0.0005),
          reason: "to 50 from 65, 26 to equal 5 * pi / 3");

      expect(line75.calculateAngle(102, 0), equals(2 * pi),
          reason: "to 75 from 102, 0 to equal 2 * pi");
      expect(line75.calculateAngle(94, 15), closeTo(11 * pi / 6, 0.001),
          reason: "to 75 from 94, 15 to equal 11 * pi / 6");
      expect(line75.calculateAngle(101, 19), equals(7 * pi / 4),
          reason: "to 75 from 101, 19 to equal 7 * pi / 4");
      expect(line75.calculateAngle(105, 26), closeTo(5 * pi / 3, 0.001),
          reason: "to 75 from 105, 26 to equal 5 * pi / 3");
    });

    test("on yardline", () {
      expect(line25.calculateAngle(40, 70), equals(3 * pi / 2));
      expect(line50.calculateAngle(80, 70), equals(3 * pi / 2));
      expect(line75.calculateAngle(120, 70), equals(3 * pi / 2));
    });

    test("right of yardline", () {
      expect(line25.calculateAngle(58, 0), equals(pi),
          reason: "to 25 from 58, 0 to equal pi");
      expect(line25.calculateAngle(66, 15), closeTo(7 * pi / 6, 0.001),
          reason: "to 25 from 66, 15 to equal 7 * pi / 6");
      expect(line25.calculateAngle(58, 18), equals(5 * pi / 4),
          reason: "to 25 from 58, 18 to equal 5 * pi / 4");
      expect(line25.calculateAngle(55, 26), closeTo(4 * pi / 3, 0.001),
          reason: "to 25 from 55, 26 to equal 4 * pi / 3");

      expect(line50.calculateAngle(98, 0), equals(pi),
          reason: "to 50 from 98, 0 to equal pi");
      expect(line50.calculateAngle(106, 15), closeTo(7 * pi / 6, 0.0005),
          reason: "to 50 from 106, 15 to equal 7 * pi / 6");
      expect(line50.calculateAngle(98, 18), equals(5 * pi / 4),
          reason: "to 50 from 98, 18 to equal 5 * pi / 4");
      expect(line50.calculateAngle(95, 26), closeTo(4 * pi / 3, 0.0005),
          reason: "to 50 from 95, 26 to equal 4 * pi / 3");

      expect(line75.calculateAngle(138, 0), equals(pi),
          reason: "to 75 from 138, 0 to equal pi");
      expect(line75.calculateAngle(146, 15), closeTo(7 * pi / 6, 0.001),
          reason: "to 75 from 146, 15 to equal 7 * pi / 6");
      expect(line75.calculateAngle(138, 18), equals(5 * pi / 4),
          reason: "to 75 from 138, 18 to equal 5 * pi / 4");
      expect(line75.calculateAngle(135, 26), closeTo(4 * pi / 3, 0.001),
          reason: "to 75 from 135, 26 to equal 4 * pi / 3");
    });
  });

  group('test equality', () {
    Rotation dir = Rotation(dir: 1);
    Rotation home = Rotation(toHomeYardline: 40);
    Rotation away = Rotation(toAwayYardline: 60);

    test("between dir and itself", () => expect(dir, equals(dir)));
    test("between dir and copy", () => expect(dir, equals(dir.copy())));
    test("between home and itself", () => expect(home, equals(home)));
    test("between home and copy", () => expect(home, equals(home.copy())));
    test("between away and itself", () => expect(away, equals(away)));
    test("between away and copy", () => expect(away, equals(away.copy())));

    test("between dir and home", () => expect(dir, isNot(equals(home))));
    test("between dir and away", () => expect(dir, isNot(equals(away))));
    test("between home and away", () => expect(home, isNot(equals(away))));
  });
}

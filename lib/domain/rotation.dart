import 'dart:math';
import 'package:formation/domain/errors.dart';

class RotationValidationError extends ValidationError {
  RotationValidationError(String message, dynamic value)
      : super("rotation", message, value);
}

class Rotation {
  Rotation({this.toHomeYardline, this.toAwayYardline, this.dir}) {
    if (toHomeYardline == null && toAwayYardline == null && dir == null) {
      throw RotationValidationError(
          "Expected one of toHomeYardline, toAwayYardline, or dir", null);
    }
    if ((toHomeYardline != null && toAwayYardline != null) ||
        (toHomeYardline != null && dir != null) ||
        (toAwayYardline != null && dir != null)) {
      throw RotationValidationError(
          "Expected only one of toHomeYardline, toAwayYardline, or dir", null);
    }
    if (toHomeYardline != null &&
        (toHomeYardline! < 0 || toHomeYardline! > 100)) {
      throw RotationValidationError(
          "toHomeYardline must be between 0 and 100", toHomeYardline);
    }
    if (toAwayYardline != null &&
        (toAwayYardline! < 0 || toAwayYardline! > 100)) {
      throw RotationValidationError(
          "toAwayYardline must be between 0 and 100", toAwayYardline);
    }
    if (dir != null && (dir! < 0 || dir! >= 4)) {
      throw RotationValidationError("dir must be between 0 and 4", dir);
    }
  }

  final int? toHomeYardline;
  final int? toAwayYardline;
  final double? dir;

  double calculateAngle(double x, double y) {
    if (dir != null) {
      return dir! * pi / 2;
    }
    // math shenanigans
    if (toHomeYardline != null) {
      // https://www.desmos.com/calculator/ffu8na5lpc
      num yardlineX = toHomeYardline! * 8 / 5;

      if (x == yardlineX) {
        return pi / 2;
      }
      double tangent = atan((84 - y) / (yardlineX - x));
      if (x < yardlineX) {
        return tangent;
      }
      return pi + tangent;
    }

    if (toAwayYardline != null) {
      num yardlineX = toAwayYardline! * 8 / 5;

      if (x == yardlineX) {
        return 3 * pi / 2;
      }
      double tangent = atan((-y) / (yardlineX - x));
      if (x < yardlineX) {
        return 2 * pi + tangent;
      }
      return pi + tangent;
    }

    throw UnimplementedError("No direction to calculate!");
  }

  Rotation copy() {
    return Rotation(
      toHomeYardline: toHomeYardline,
      toAwayYardline: toAwayYardline,
      dir: dir,
    );
  }

  Map<String, dynamic> get serialized => {
        if (toHomeYardline != null) "toHomeYardline": toHomeYardline,
        if (toAwayYardline != null) "toAwayYardline": toAwayYardline,
        if (dir != null) "dir": dir,
      };

  factory Rotation.deserialize(Map<String, dynamic> data) {
    return Rotation(
      toHomeYardline: data["toHomeYardline"],
      toAwayYardline: data["toAwayYardline"],
      dir: data["dir"],
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! Rotation) {
      return false;
    }
    if (dir != null && other.dir == dir) {
      return true;
    }
    if (toHomeYardline != null && other.toHomeYardline == toHomeYardline) {
      return true;
    }
    if (toAwayYardline != null && other.toAwayYardline == toAwayYardline) {
      return true;
    }
    return false;
  }

  @override
  int get hashCode =>
      dir?.hashCode ?? toHomeYardline?.hashCode ?? toAwayYardline!.hashCode;

  @override
  String toString() {
    // TODO: implement toString
    if (dir != null) {
      return "Rotation(dir: $dir)";
    }
    if (toHomeYardline != null) {
      return "Rotation(home: $toHomeYardline)";
    }
    if (toAwayYardline != null) {
      return "Rotation(away: $toAwayYardline)";
    }
    throw UnimplementedError();
  }
}

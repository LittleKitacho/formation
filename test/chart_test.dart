import "package:flutter_test/flutter_test.dart";
import "package:formation/chart.dart";

void main() {
  test("test chart objects", () {
    Chart chart = Chart();
    expect(chart.sets, []);
    expect(chart._points, []);
    expect(chart.squads, []);
    expect(chart._groups, []);
    expect(chart.tempo, 120);
  });
}

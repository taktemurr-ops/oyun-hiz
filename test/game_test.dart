import 'package:flutter_test/flutter_test.dart';
import 'package:kart_motoru/kart_motoru.dart';
import 'package:oyun_hiz/oyun_hiz.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hizConfig.title.length, 33);
    expect(hizConfig.tagline.length, 33);
    for (final s in hizConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('hızlı bir oyuncu her bölümü kazanabilir', () {
    final planner = LevelPlanner(gameId: hizId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = hizRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
      expect(RealtimeRules.simulate(gl.puzzle), isTrue, reason: 'bölüm $lv');
    }
  });
}

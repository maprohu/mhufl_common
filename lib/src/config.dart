import 'package:logger/logger.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:shared_preferences/shared_preferences.dart';

final log = Logger();

Future<void> startPersistingSharedPreferences<T>(
  IRxVar<T> rxVar,
  String keyName,
  DisposeAsyncs disposers,
  T Function(String json) fromJson,
  String Function(T object) toJson,
) async {
  final prefs = await SharedPreferences.getInstance();

  final configString = prefs.getString(keyName);
  if (configString != null) {
    try {
      rxVar.value = fromJson(configString);
    } catch (e, st) {
      log.w('error loading value from shared preferences', e, st);
    }
  }

  final processing = rxVar.stream.skip(1).asyncForEach(
    (value) {
      final jsonString = toJson(value);
      log.d(() => value);
      return prefs.setString(
        keyName,
        jsonString,
      );
    },
  );

  await disposers.add(() async {
    log.i("waiting for config variable closing...");
    await processing;
    log.i("config variable closed.");
  });
}

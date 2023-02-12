import 'package:logger/logger.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:shared_preferences/shared_preferences.dart';

final log = Logger();

Future<void> startPersistingSharedPreferences<T>(
  RxVar<T> rxVar,
  String keyName,
  DisposeAsyncs disposers,
  T Function(String json) fromJson,
  String Function(T object) toJson,
) async {
  await rxVar.disposeBy(disposers);

  final prefs = await SharedPreferences.getInstance();

  final configString = prefs.getString(keyName);
  if (configString != null) {
    try {
      rxVar.value = fromJson(configString);
    } catch (e, st) {
      log.w('error loading value from shared preferences', e, st);
    }
  }

  rxVar.stream
      .skip(1)
      .asyncForEach(
        (value) => prefs.setString(
          keyName,
          toJson(value),
        ),
      )
      .awaitBy(disposers);
}

import 'package:background_service_android/background_service_android.dart';
import 'package:background_service_platform_interface/background_service_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BackgroundServiceAndroid', () {
    const kPlatformName = 'Android';
    late BackgroundServiceAndroid backgroundService;
    late List<MethodCall> log;

    setUp(() async {
      backgroundService = BackgroundServiceAndroid();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(backgroundService.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      BackgroundServiceAndroid.registerWith();
      expect(BackgroundServicePlatform.instance, isA<BackgroundServiceAndroid>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await backgroundService.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}

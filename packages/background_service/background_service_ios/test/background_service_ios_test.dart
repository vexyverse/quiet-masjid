import 'package:background_service_ios/background_service_ios.dart';
import 'package:background_service_platform_interface/background_service_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BackgroundServiceIOS', () {
    const kPlatformName = 'iOS';
    late BackgroundServiceIOS backgroundService;
    late List<MethodCall> log;

    setUp(() async {
      backgroundService = BackgroundServiceIOS();

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
      BackgroundServiceIOS.registerWith();
      expect(BackgroundServicePlatform.instance, isA<BackgroundServiceIOS>());
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

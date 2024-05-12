import 'package:background_service/background_service.dart';
import 'package:background_service_platform_interface/background_service_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBackgroundServicePlatform extends Mock
    with MockPlatformInterfaceMixin
    implements BackgroundServicePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BackgroundService', () {
    late BackgroundServicePlatform backgroundServicePlatform;

    setUp(() {
      backgroundServicePlatform = MockBackgroundServicePlatform();
      BackgroundServicePlatform.instance = backgroundServicePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => backgroundServicePlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => backgroundServicePlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}

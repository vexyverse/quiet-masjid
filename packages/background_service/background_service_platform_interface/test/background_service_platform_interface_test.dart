import 'package:background_service_platform_interface/background_service_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class BackgroundServiceMock extends BackgroundServicePlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('BackgroundServicePlatformInterface', () {
    late BackgroundServicePlatform backgroundServicePlatform;

    setUp(() {
      backgroundServicePlatform = BackgroundServiceMock();
      BackgroundServicePlatform.instance = backgroundServicePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await BackgroundServicePlatform.instance.getPlatformName(),
          equals(BackgroundServiceMock.mockPlatformName),
        );
      });
    });
  });
}

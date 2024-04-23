import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:quietmasjid/product/cache/product_cache.dart';
import 'package:quietmasjid/product/network/manager/product_network_manager.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt
      ..registerSingleton(ProductCache(cacheManager: HiveCacheManager()))
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base());
    // ..registerLazySingleton<ProductViewModel>(
    //   ProductViewModel.new,
    // );
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}

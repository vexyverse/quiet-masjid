import 'package:core/core.dart';
import 'package:quietmasjid/product/cache/model/location_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [LocationCacheModel()],
    );
  }

  late final HiveCacheOperation<LocationCacheModel> locationCacheOperation =
      HiveCacheOperation<LocationCacheModel>();
}

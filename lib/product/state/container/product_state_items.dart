import 'package:quietmasjid/features/location/bloc/location_bloc.dart';
import 'package:quietmasjid/features/location/service/location_service.dart';
import 'package:quietmasjid/product/cache/product_cache.dart';
import 'package:quietmasjid/product/network/manager/product_network_manager.dart';
import 'package:quietmasjid/product/state/container/product_state_container.dart';
import 'package:quietmasjid/product/state/viewmodel/product_viewmodel.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();
  static LocationBloc get locationBloc => ProductContainer.read<LocationBloc>();

  static LocationService get locationService =>
      ProductContainer.read<LocationService>();

  static ProductCache get productCache => ProductContainer.read<ProductCache>();
}

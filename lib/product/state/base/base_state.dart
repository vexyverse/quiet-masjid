import 'package:flutter/material.dart';
import 'package:quietmasjid/product/network/manager/product_network_manager.dart';
import 'package:quietmasjid/product/state/container/product_state_items.dart';
import 'package:quietmasjid/product/state/viewmodel/product_viewmodel.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
}

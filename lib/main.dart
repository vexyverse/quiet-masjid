import 'package:flutter/material.dart';
import 'package:quietmasjid/features/location/view/location_view.dart';
import 'package:quietmasjid/product/init/config/app_environment.dart';
import 'package:quietmasjid/product/state/container/product_state_container.dart';
import 'package:quietmasjid/product/state/container/product_state_items.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppEnvironment.general();
  ProductContainer.setup();
  await ProductStateItems.productCache.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LocationView(),
    );
  }
}

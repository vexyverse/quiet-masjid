import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quietmasjid/features/location/bloc/location_bloc.dart';
import 'package:quietmasjid/features/location/view/location_mixin.dart';
import 'package:quietmasjid/product/state/base/base_state.dart';
import 'package:quietmasjid/product/state/container/product_state_items.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends BaseState<LocationView>   with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: );
  }
}



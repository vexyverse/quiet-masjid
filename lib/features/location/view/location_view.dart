import 'package:flutter/material.dart';
import 'package:quietmasjid/features/location/view/location_mixin.dart';
import 'package:quietmasjid/product/state/base/base_state.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends BaseState<LocationView>
    with LocationViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(positionData?.latitude.toString() ?? " "),
          Text(positionData?.longitude.toString() ?? " "),
          Text(positionData?.altitude.toString() ?? ""),
          ElevatedButton(
              onPressed: () async {
                positionData = await determinePosition();
              },
              child: const Text('get location'))
        ],
      ),
    );
  }
}

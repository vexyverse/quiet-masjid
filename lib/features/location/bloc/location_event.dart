part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class LoadLocation extends LocationEvent {
  const LoadLocation();
}

class SaveLocation extends LocationEvent {
  final LocationData locationData;

  const SaveLocation(this.locationData);

  @override
  List<Object?> get props => [locationData];
}

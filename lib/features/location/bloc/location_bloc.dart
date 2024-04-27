import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:quietmasjid/features/location/service/location_service.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationService locationService;

  LocationBloc(this.locationService) : super(LocationInitial()) {
    on<LoadLocation>(_onLoadLocation);
    on<SaveLocation>(_onSaveLocation);
  }

  Future<void> _onLoadLocation(
      LoadLocation event, Emitter<LocationState> emit) async {
    try {
      emit(LocationLoading());
      final locationData = await locationService.readLocation();
      emit(LocationLoaded(locationData));
    } catch (error) {
      emit(LocationError(error.toString()));
    }
  }

  Future<void> _onSaveLocation(
      SaveLocation event, Emitter<LocationState> emit) async {
    try {
      await locationService.saveLocation(event.locationData);
      // Consider emitting a success state if necessary
    } catch (error) {
      emit(LocationError(error.toString()));
    }
  }
}

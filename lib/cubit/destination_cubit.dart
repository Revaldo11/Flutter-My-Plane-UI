import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_plane/models/destination_model.dart';
import 'package:my_plane/services/destination_service.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void getDestinations() async {
    try {
      emit(DestinationLoaded());
      List<DestinationModel> destinations =
          await DestinationSerivice().getDestinations();
      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}

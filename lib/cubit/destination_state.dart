part of 'destination_cubit.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoaded extends DestinationState {}

class DestinationSuccess extends DestinationState {
  final List<DestinationModel> destination;

  const DestinationSuccess(this.destination);

  @override
  List<Object> get props => [destination];
}

class DestinationFailed extends DestinationState {
  final String message;

  const DestinationFailed(this.message);

  @override
  List<Object> get props => [message];
}

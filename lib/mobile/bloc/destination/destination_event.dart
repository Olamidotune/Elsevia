part of 'destination_bloc.dart';

@freezed
class DestinationEvent with _$DestinationEvent {
  const factory init() = _Init;
  const factory fetchDestinationSummary() = _FetchDestinationSummary;
  const factory fetchDestinationSummarySuccessful(
    DestinationSummary destinationSummary,
  ) = _FetchDestinationSummarySuccessful;
  const factory fetchDestinationSummaryFailed() =
      _FetchDestinationSummaryFailed;
}

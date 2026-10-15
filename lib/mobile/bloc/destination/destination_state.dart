part of 'destination_bloc.dart';

@freezed
abstract class DestinationState with _$DestinationState {
  const factory({
    DestinationSummary? destinationSummary,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus fetchDestinationSummaryStatus,

    String? errorMessage,
  }) = _DestinationState;
}

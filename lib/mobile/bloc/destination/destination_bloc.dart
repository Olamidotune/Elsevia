import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_travel/api/clients/destination_client.dart';
import 'package:go_travel/api/models/destination_summary.dart';
import 'package:go_travel/services/service_locator.dart';

part 'destination_event.dart';
part 'destination_state.dart';
part 'destination_bloc.freezed.dart';

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  new() : super(const DestinationState()) {
    on<_FetchDestinationSummary>(_fetchDestinationSummary);
    on<_FetchDestinationSummarySuccessful>(_fetchDestinationSummarySuccessful);

    on<_FetchDestinationSummaryFailed>(_fetchDestinationSummaryFailed);
  }

  void _fetchDestinationSummary(
    _FetchDestinationSummary event,
    Emitter<DestinationState> emit,
  ) async {
    if (state.fetchDestinationSummaryStatus.isInProgress) return;

    emit(
      state.copyWith(
        fetchDestinationSummaryStatus: FormzSubmissionStatus.inProgress,
      ),
    );

    try {
      final destination = await locator<DestinationClient>().getSummary(
        'cityName',
      );

      add(_FetchDestinationSummarySuccessful(destination));
    } catch (e) {}
  }

  void _fetchDestinationSummarySuccessful(
    _FetchDestinationSummarySuccessful event,
    Emitter<DestinationState> emit,
  ) {
    emit(
      state.copyWith(
        fetchDestinationSummaryStatus: FormzSubmissionStatus.success,
        destinationSummary: event.destinationSummary,
        errorMessage: null,
      ),
    );
  }

  void _fetchDestinationSummaryFailed(
    _FetchDestinationSummaryFailed event,
    Emitter<DestinationState> emit,
  ) {}
}

part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {
  Stream<FeedState> handle();
}

class LoadFeedItems extends FeedEvent {
  final FeedState _prevState;

  LoadFeedItems({required FeedState currState}) : _prevState = currState;

  @override
  Stream<FeedState> handle() async* {
    yield _prevState.copyWith(isLoading: true);
    var adventures = await AdventureAPIService()
        .fetchAdventuresFromPrevAdventure(
            _prevState.getLastFetchedAdventureList);
    yield FeedLoadedState(
      lastFetchedAdventure: adventures,
      prevState: _prevState,
    );
  }
}

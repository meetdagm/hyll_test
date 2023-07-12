part of 'feed_bloc.dart';

@immutable
abstract class FeedState {
  bool get isLoading;
  int get getTotalFeedCount;
  bool get isEndOfFeed;
  AdventureList get getLastFetchedAdventureList => AdventureList.Empty();
  FeedState copyWith({bool isLoading = false}) => this;
}

class FeedInitial extends FeedState {
  @override
  bool get isLoading => true;

  @override
  int get getTotalFeedCount => 0;

  @override
  bool get isEndOfFeed => true;
}

class FeedLoadedState extends FeedState {
  late final bool _isEndOfFeed;
  late final AdventureList _lastFetchedAdventureCollection;
  late final List<Adventure> allFetchedAdventures;
  late final bool _isLoading;

  FeedLoadedState({
    bool isEndOfFeed = false,
    AdventureList? lastFetchedAdventure,
    FeedState? prevState,
    bool isLoading = false,
  }) {
    _isLoading = isLoading;
    _isEndOfFeed = isEndOfFeed;
    _lastFetchedAdventureCollection =
        lastFetchedAdventure ?? AdventureList.Empty();
    allFetchedAdventures = [];

    if (prevState is FeedLoadedState) {
      allFetchedAdventures.addAll(prevState.allFetchedAdventures);
    }
    allFetchedAdventures
        .addAll(_lastFetchedAdventureCollection.getAdventureList);
  }

  @override
  AdventureList get getLastFetchedAdventureList =>
      _lastFetchedAdventureCollection;

  @override
  bool get isLoading => _isLoading;

  @override
  bool get isEndOfFeed => _isEndOfFeed;

  @override
  int get getTotalFeedCount => allFetchedAdventures.length;

  FeedCard getCardForItemAtIndex(int index) {
    return FeedCard(
      title: allFetchedAdventures[index].title,
      description: allFetchedAdventures[index].primaryDescription,
      likeCount: allFetchedAdventures[index].bucketListCount,
      imageUrls: List.from(
        allFetchedAdventures[index]
            .contentCollection
            .map((content) => content.contentUrl),
      ),
    );
  }

  @override
  FeedState copyWith({bool isLoading = false}) {
    return FeedLoadedState(
      lastFetchedAdventure: _lastFetchedAdventureCollection,
      isLoading: isLoading,
    );
  }
}

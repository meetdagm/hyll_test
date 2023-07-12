import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/adventure.dart';
import '../../../data/model/adventure_list.dart';
import '../../../data/services/adventure_api_service.dart';
import '../../widgets/content_carousel.dart';
import '../../widgets/feed_card.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedInitial()) {
    on<FeedEvent>((event, emit) async {
      await emit.forEach(
        event.handle(),
        onData: (state) {
          return state;
        },
      );
    });
    add(LoadFeedItems(currState: state));
  }
}

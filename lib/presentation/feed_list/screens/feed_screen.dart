import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyll_test_project/presentation/feed_list/bloc/feed_bloc.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final ScrollController _scrollController = ScrollController();
  final _maxScrollLoadThreshold = 3000; // Halfway through

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => _triggerOnScroll());
  }

  _triggerOnScroll() {
    var currThreshold = _scrollController.position.maxScrollExtent -
        _scrollController.position.pixels;
    var blocProvider = BlocProvider.of<FeedBloc>(context);
    var hasfetchPreviouslyTriggered = blocProvider.state.isLoading;
    if (currThreshold <= _maxScrollLoadThreshold &&
        !hasfetchPreviouslyTriggered) {
      blocProvider.add(
        LoadFeedItems(
          currState: BlocProvider.of<FeedBloc>(context).state,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            return state.isLoading && state.runtimeType != FeedLoadedState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _scrollController,
                    itemCount: state.getTotalFeedCount,
                    itemBuilder: (context, index) {
                      return (state as FeedLoadedState)
                          .getCardForItemAtIndex(index);
                    },
                  );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_triggerOnScroll)
      ..dispose();
    super.dispose();
  }
}

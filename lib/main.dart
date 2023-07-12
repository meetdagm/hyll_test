import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyll_test_project/data/model/adventure_list.dart';
import 'package:hyll_test_project/presentation/feed_list/bloc/feed_bloc.dart';
import 'package:hyll_test_project/presentation/feed_list/screens/feed_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (context) => FeedBloc(),
        child: const FeedScreen(),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram/screens/feed/bloc/feed_bloc.dart';
import 'package:flutter_instagram/widgets/error_dialog.dart';

class FeedScreen extends StatelessWidget {
  static const String routeName = '/feed';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedBloc, FeedState>(
      listener: (context, state) {
        if (state.status == FeedStatus.error) {
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(content: state.failure.message),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Instagram'),
            actions: [
              if (state.posts.isEmpty && state.status == FeedStatus.loaded)
                {
                  IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () =>
                          context.read<FeedBloc>().add(FeedFetchPosts())),
                }
            ],
          ),
        );
      },
    );
  }
}

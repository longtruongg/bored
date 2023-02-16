import 'package:bored/compoments/compoments.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class FriendPostList extends StatelessWidget {
  final List<Post> friendPost;

  const FriendPostList({Key? key, required this.friendPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Social chef",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: friendPost.length,
            itemBuilder: (context, index) {
              final post = friendPost[index];
              return FriendPost(post: post);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16.0,
              );
            },
          ),
          const SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }
}

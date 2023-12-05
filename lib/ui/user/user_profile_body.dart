import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/Album.dart';
import 'package:flutter_first_app/model/post.dart';
import 'package:flutter_first_app/services/album_service.dart';
import 'package:flutter_first_app/services/posts_service.dart';
import 'package:flutter_first_app/ui/commons/custom_future_list_view.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({super.key, required this.userId});

  final int userId;
  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  late Future<List<Album>> futureAlbums;
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    futureAlbums = AlbumService().getAlbums(widget.userId.toString());
    futurePosts = PostService().getPosts(widget.userId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  toolbarHeight: 5,
                  title: Center(
                      child: Text(
                    '',
                    style: TextStyle(fontSize: 5),
                  )),
                  expandedHeight: 40,
                  pinned: true,
                  forceElevated: innerBoxIsScrolled,
                  automaticallyImplyLeading: false,
                  bottom: TabBar(tabs: [
                    Tab(
                      text: 'Album',
                    ),
                    Tab(
                      text: 'Photo',
                    )
                  ]),
                ),
              ],
          body: TabBarView(children: [
            FutureListView(
                futureData: futureAlbums,
                titleField: 'title',
                subtitleField: 'id'),
            FutureListView(
                futureData: futurePosts,
                titleField: 'title',
                subtitleField: 'id'),
          ])),
    );
  }
}

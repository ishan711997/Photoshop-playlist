import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photoshoptutorial/models/channel_info.dart';
import 'package:photoshoptutorial/screens/video_player.dart';
import 'package:photoshoptutorial/utils/services.dart';
import 'package:photoshoptutorial/models/beginner.dart';

class BeginnerScreen extends StatefulWidget {
  @override
  _BeginnerScreenState createState() => _BeginnerScreenState();
}

class _BeginnerScreenState extends State<BeginnerScreen> {
  ChannelInfo _channelInfo;
  VideosList _videosList;
  Item _item;
  bool _loading;
  String _playListId;
  String _nextPageToken;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _nextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList();
    _videosList.videos = List();
    _getChannelInfo();
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo.items[0];
    _playListId = "PLW-zSkCnZ-gA5Jn6gZtUa6-aG0OoRZyb6";

    await _loadVideos();
    setState(() {
      _loading = false;
    });
  }

  _loadVideos() async {
    VideosList tempVideosList = await Services.getVideosList(
      playListId: _playListId,
      pageToken: _nextPageToken,
    );
    _nextPageToken = tempVideosList.nextPageToken;
    _videosList.videos.addAll(tempVideosList.videos);
    // print('videos: ${_videosList.videos.length}');
    // print('_nextPageToken $_nextPageToken');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beginner"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueAccent[200], Colors.blue[900]],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Column(
          children: [
            // _buildInfoView(),
            Expanded(
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollNotification notification) {
                  if (_videosList.videos.length >=
                      int.parse(_item.statistics.videoCount)) {
                    return true;
                  }
                  if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                    _loadVideos();
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _videosList.videos.length,
                  itemBuilder: (context, index) {
                    VideoItem videoItem = _videosList.videos[index];
                    return InkWell(
                      onTap: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VideoPlayerScreen(
                            videoItem: videoItem,
                          );
                        }));
                      },
                      child: Container(
                        // padding: EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 210,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    videoItem.video.thumbnails.high.url),
                                fit: BoxFit.cover,
                              )),
                            ),

                            // Image.network(
                            //   videoItem.video.thumbnails.high.url,
                            //   fit: BoxFit.fitHeight,
                            // ),
                            // CachedNetworkImage(
                            //   imageUrl: videoItem.video.thumbnails.high.url,
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              videoItem.video.title,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[50],
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 38),
                            // Flexible(child: Text(videoItem.video.title)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _buildInfoView() {
  //   return _loading
  //       ? CircularProgressIndicator()
  //       : Container(
  //           // padding: EdgeInsets.all(20.0),
  //           child: Card(
  //             child: Row(
  //               children: [
  //                 CircleAvatar(
  //                   backgroundImage: CachedNetworkImageProvider(
  //                     _item.snippet.thumbnails.high.url,
  //                   ),
  //                 ),
  //                 SizedBox(width: 20),
  //                 Expanded(
  //                   child: Text(
  //                     _item.snippet.title,
  //                     style: TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.w400,
  //                     ),
  //                   ),
  //                 ),
  //                 Text(_item.statistics.videoCount),
  //                 SizedBox(width: 20),
  //               ],
  //             ),
  //           ),
  //         );
  // }
}

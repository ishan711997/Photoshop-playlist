import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:photoshoptutorial/models/channel_info.dart';
import 'package:photoshoptutorial/models/beginner.dart';

import 'constansts.dart';

class Services {
  static const CHANNEL_ID = 'UCP3AIk974-PeB9bg1Mc7wug';
  static const _baseUrl = 'www.googleapis.com';

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': CHANNEL_ID,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    // print(response.body);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  static Future<VideosList> getVideosList(
      {String playListId, String pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResult': '0',
      'pageToken': pageToken,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    // print(response.body);

    VideosList videosList = videosListFromJson(response.body);
    return videosList;
  }

// curl \
//   'https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLW-zSkCnZ-gA5Jn6gZtUa6-aG0OoRZyb6&access_token=AIzaSyDH09B9XQaXkcSKqHB3OAmHYb0wSqLJ9NE&key=[YOUR_API_KEY]' \
//   --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
//   --header 'Accept: application/json' \
//   --compressed
}

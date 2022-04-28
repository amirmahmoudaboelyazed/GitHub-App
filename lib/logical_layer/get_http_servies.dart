import 'package:github_app/constants/strings.dart';
import 'package:http/http.dart';
import '../models/github_models.dart';

class GetHttpServices{
  static Future<FilterChipData> getRepositories() async {

    String url = MyStrings.uri;

    Response res = await get(Uri.parse(url+"repositories?q=created:%3E2019-01-10&per_page=100&sort=star&order=desc"));

    if (res.statusCode == 200) {
      FilterChipData body = filterChipDataFromJson(res.body);
      return body;
    } else {
      throw Exception('Failed .');
    }
  }
  static Future<FilterChipData> getRepositoriesByDate(date) async {

    String url = MyStrings.uri;

    Response res = await get(Uri.parse(url+"repositories?q=created:${date}&&sort=star&order=desc"));

    if (res.statusCode == 200) {
      FilterChipData body = filterChipDataFromJson(res.body);
      return body;
    } else {
      throw Exception('Failed .');
    }
  }




}
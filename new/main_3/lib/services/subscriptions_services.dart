import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trackizer/model/SubscriptionItemModel.dart';

Future<List<SubscriptionItemModel>> fetchsubscription() async {
  final response = await http.get(
    Uri.parse('https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/user_subscriptions'),
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
      'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final List data = json.decode(response.body);

    if (data.isNotEmpty) {
      return data
          .map<SubscriptionItemModel>((item) => SubscriptionItemModel.fromJson(item))
          .toList();
    } else {
      throw Exception("البيانات فارغة");
    }
  } else {
    throw Exception("فشل في جلب البيانات");
  }
}

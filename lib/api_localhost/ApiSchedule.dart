import 'dart:convert';

List<ApiSchedule>? apiScheduleFromJson(String str) => List<ApiSchedule>.from(json.decode(str).map((x) => ApiSchedule.fromJson(x)));

String apiScheduleToJson(List<ApiSchedule> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiSchedule {
    String date;
    String fromTime;
    String toTime;
    String title;
    bool alaram;
    String id;

    ApiSchedule({
        required this.date,
        required this.fromTime,
        required this.toTime,
        required this.title,
        required this.alaram,
        required this.id,
    });

    factory ApiSchedule.fromJson(Map<String, dynamic> json) => ApiSchedule(
        date: json["date"],
        fromTime: json["fromTime"],
        toTime: json["toTime"],
        title: json["title"],
        alaram: json["alaram"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "fromTime": fromTime,
        "toTime": toTime,
        "title": title,
        "alaram": alaram,
        "id": id,
    };
}

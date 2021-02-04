// To parse this JSON data, do
//
//     final koseekerModelMultiple = koseekerModelMultipleFromJson(jsonString);

import 'dart:convert';

import 'package:Cekos/models/koseekerModelSingle.dart';

KoseekerModelMultiple koseekerModelMultipleFromJson(String str) =>
    KoseekerModelMultiple.fromJson(json.decode(str));

String koseekerModelMultipleToJson(KoseekerModelMultiple data) =>
    json.encode(data.toJson());

class KoseekerModelMultiple {
  KoseekerModelMultiple({
    this.data,
    this.error,
  });

  List<Datum> data;
  bool error;

  factory KoseekerModelMultiple.fromJson(Map<String, dynamic> json) =>
      KoseekerModelMultiple(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] == null ? null : json["error"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error == null ? null : error,
      };
}

class Datum {
  Datum({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.owner,
    this.author,
    this.dummyAgent,
    this.dummyAuthor,
    this.name,
    this.title,
    this.description,
    this.address,
    this.area,
    this.operational,
    this.statusProperty,
    this.type,
    this.roomType,
    this.totalRoom,
    this.totalBathRoom,
    this.bathRoomType,
    this.category,
    this.kind,
    this.videoUrl,
    this.facility,
    this.roomFacility,
    this.bathRoomFacility,
    this.environmentAccess,
    this.parkingFacility,
    this.monthlyPrice,
    this.detailHousePrice,
    this.detailDpPrice,
    this.additionalPrice,
    this.rules,
    this.mainImage,
    this.gallery,
    this.verified,
    this.isInstantPay,
    this.isCanDp,
    this.isCanBooking,
    this.isUseAgent,
    this.bookNowStayLater,
    this.cancellation,
    this.publish,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String owner;
  dynamic author;
  dynamic dummyAgent;
  DummyAuthor dummyAuthor;
  String name;
  String title;
  String description;
  Address address;
  List<String> area;
  List<String> operational;
  List<String> statusProperty;
  List<String> type;
  List<RoomType> roomType;
  int totalRoom;
  int totalBathRoom;
  List<String> bathRoomType;
  List<String> category;
  List<String> kind;
  String videoUrl;
  List<String> facility;
  List<String> roomFacility;
  List<String> bathRoomFacility;
  List<String> environmentAccess;
  List<String> parkingFacility;
  List<String> monthlyPrice;
  Price detailHousePrice;
  Price detailDpPrice;
  dynamic additionalPrice;
  List<String> rules;
  String mainImage;
  List<String> gallery;
  bool verified;
  bool isInstantPay;
  bool isCanDp;
  bool isCanBooking;
  bool isUseAgent;
  bool bookNowStayLater;
  String cancellation;
  bool publish;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"] == null ? null : json["created_by"],
        owner: json["owner"] == null ? null : json["owner"],
        author: json["author"],
        dummyAgent: json["dummy_agent"],
        dummyAuthor: json["dummy_author"] == null
            ? null
            : DummyAuthor.fromJson(json["dummy_author"]),
        name: json["name"] == null ? null : json["name"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        area: json["area"] == null
            ? null
            : List<String>.from(json["area"].map((x) => x)),
        operational: json["operational"] == null
            ? null
            : List<String>.from(json["operational"].map((x) => x)),
        statusProperty: json["status_property"] == null
            ? null
            : List<String>.from(json["status_property"].map((x) => x)),
        type: json["type"] == null
            ? null
            : List<String>.from(json["type"].map((x) => x)),
        roomType: json["room_type"] == null
            ? null
            : List<RoomType>.from(
                json["room_type"].map((x) => RoomType.fromJson(x))),
        totalRoom: json["total_room"] == null ? null : json["total_room"],
        totalBathRoom:
            json["total_bath_room"] == null ? null : json["total_bath_room"],
        bathRoomType: json["bath_room_type"] == null
            ? null
            : List<String>.from(json["bath_room_type"].map((x) => x)),
        category: json["category"] == null
            ? null
            : List<String>.from(json["category"].map((x) => x)),
        kind: json["kind"] == null
            ? null
            : List<String>.from(json["kind"].map((x) => x)),
        videoUrl: json["video_url"] == null ? null : json["video_url"],
        facility: json["facility"] == null
            ? null
            : List<String>.from(json["facility"].map((x) => x)),
        roomFacility: json["room_facility"] == null
            ? null
            : List<String>.from(json["room_facility"].map((x) => x)),
        bathRoomFacility: json["bath_room_facility"] == null
            ? null
            : List<String>.from(json["bath_room_facility"].map((x) => x)),
        environmentAccess: json["environment_access"] == null
            ? null
            : List<String>.from(json["environment_access"].map((x) => x)),
        parkingFacility: json["parking_facility"] == null
            ? null
            : List<String>.from(json["parking_facility"].map((x) => x)),
        monthlyPrice: json["monthly_price"] == null
            ? null
            : List<String>.from(json["monthly_price"].map((x) => x)),
        detailHousePrice: json["detail_house_price"] == null
            ? null
            : Price.fromJson(json["detail_house_price"]),
        detailDpPrice: json["detail_dp_price"] == null
            ? null
            : Price.fromJson(json["detail_dp_price"]),
        additionalPrice: json["additional_price"],
        rules: json["rules"] == null
            ? null
            : List<String>.from(json["rules"].map((x) => x)),
        mainImage: json["main_image"] == null ? null : json["main_image"],
        gallery: json["gallery"] == null
            ? null
            : List<String>.from(json["gallery"].map((x) => x)),
        verified: json["verified"] == null ? null : json["verified"],
        isInstantPay:
            json["is_instant_pay"] == null ? null : json["is_instant_pay"],
        isCanDp: json["is_can_dp"] == null ? null : json["is_can_dp"],
        isCanBooking:
            json["is_can_booking"] == null ? null : json["is_can_booking"],
        isUseAgent: json["is_use_agent"] == null ? null : json["is_use_agent"],
        bookNowStayLater: json["book_now_stay_later"] == null
            ? null
            : json["book_now_stay_later"],
        cancellation:
            json["cancellation"] == null ? null : json["cancellation"],
        publish: json["publish"] == null ? null : json["publish"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "created_by": createdBy == null ? null : createdBy,
        "owner": owner == null ? null : owner,
        "author": author,
        "dummy_agent": dummyAgent,
        "dummy_author": dummyAuthor == null ? null : dummyAuthor.toJson(),
        "name": name == null ? null : name,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "address": address == null ? null : address.toJson(),
        "area": area == null ? null : List<dynamic>.from(area.map((x) => x)),
        "operational": operational == null
            ? null
            : List<dynamic>.from(operational.map((x) => x)),
        "status_property": statusProperty == null
            ? null
            : List<dynamic>.from(statusProperty.map((x) => x)),
        "type": type == null ? null : List<dynamic>.from(type.map((x) => x)),
        "room_type": roomType == null
            ? null
            : List<dynamic>.from(roomType.map((x) => x.toJson())),
        "total_room": totalRoom == null ? null : totalRoom,
        "total_bath_room": totalBathRoom == null ? null : totalBathRoom,
        "bath_room_type": bathRoomType == null
            ? null
            : List<dynamic>.from(bathRoomType.map((x) => x)),
        "category": category == null
            ? null
            : List<dynamic>.from(category.map((x) => x)),
        "kind": kind == null ? null : List<dynamic>.from(kind.map((x) => x)),
        "video_url": videoUrl == null ? null : videoUrl,
        "facility": facility == null
            ? null
            : List<dynamic>.from(facility.map((x) => x)),
        "room_facility": roomFacility == null
            ? null
            : List<dynamic>.from(roomFacility.map((x) => x)),
        "bath_room_facility": bathRoomFacility == null
            ? null
            : List<dynamic>.from(bathRoomFacility.map((x) => x)),
        "environment_access": environmentAccess == null
            ? null
            : List<dynamic>.from(environmentAccess.map((x) => x)),
        "parking_facility": parkingFacility == null
            ? null
            : List<dynamic>.from(parkingFacility.map((x) => x)),
        "monthly_price": monthlyPrice == null
            ? null
            : List<dynamic>.from(monthlyPrice.map((x) => x)),
        "detail_house_price":
            detailHousePrice == null ? null : detailHousePrice.toJson(),
        "detail_dp_price":
            detailDpPrice == null ? null : detailDpPrice.toJson(),
        "additional_price": additionalPrice,
        "rules": rules == null ? null : List<dynamic>.from(rules.map((x) => x)),
        "main_image": mainImage == null ? null : mainImage,
        "gallery":
            gallery == null ? null : List<dynamic>.from(gallery.map((x) => x)),
        "verified": verified == null ? null : verified,
        "is_instant_pay": isInstantPay == null ? null : isInstantPay,
        "is_can_dp": isCanDp == null ? null : isCanDp,
        "is_can_booking": isCanBooking == null ? null : isCanBooking,
        "is_use_agent": isUseAgent == null ? null : isUseAgent,
        "book_now_stay_later":
            bookNowStayLater == null ? null : bookNowStayLater,
        "cancellation": cancellation == null ? null : cancellation,
        "publish": publish == null ? null : publish,
      };
}

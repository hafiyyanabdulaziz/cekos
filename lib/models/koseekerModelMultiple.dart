// To parse this JSON data, do
//
//     final koseekerModelMultiple = koseekerModelMultipleFromJson(jsonString);

import 'dart:convert';

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
  Owner owner;
  dynamic author;
  dynamic dummyAgent;
  DummyAuthor dummyAuthor;
  String name;
  String title;
  String description;
  Address address;
  List<Area> area;
  List<Operational> operational;
  List<StatusProperty> statusProperty;
  List<TypeElement> type;
  List<RoomType> roomType;
  int totalRoom;
  int totalBathRoom;
  List<BathRoomType> bathRoomType;
  List<Category> category;
  List<Kind> kind;
  String videoUrl;
  List<String> facility;
  List<String> roomFacility;
  List<String> bathRoomFacility;
  List<EnvironmentAccess> environmentAccess;
  List<ParkingFacility> parkingFacility;
  List<String> monthlyPrice;
  Price detailHousePrice;
  Price detailDpPrice;
  dynamic additionalPrice;
  List<Rule> rules;
  String mainImage;
  List<String> gallery;
  bool verified;
  bool isInstantPay;
  bool isCanDp;
  bool isCanBooking;
  bool isUseAgent;
  bool bookNowStayLater;
  Cancellation cancellation;
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
        owner: json["owner"] == null ? null : ownerValues.map[json["owner"]],
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
            : List<Area>.from(json["area"].map((x) => areaValues.map[x])),
        operational: json["operational"] == null
            ? null
            : List<Operational>.from(
                json["operational"].map((x) => operationalValues.map[x])),
        statusProperty: json["status_property"] == null
            ? null
            : List<StatusProperty>.from(json["status_property"]
                .map((x) => statusPropertyValues.map[x])),
        type: json["type"] == null
            ? null
            : List<TypeElement>.from(
                json["type"].map((x) => typeElementValues.map[x])),
        roomType: json["room_type"] == null
            ? null
            : List<RoomType>.from(
                json["room_type"].map((x) => RoomType.fromJson(x))),
        totalRoom: json["total_room"] == null ? null : json["total_room"],
        totalBathRoom:
            json["total_bath_room"] == null ? null : json["total_bath_room"],
        bathRoomType: json["bath_room_type"] == null
            ? null
            : List<BathRoomType>.from(
                json["bath_room_type"].map((x) => bathRoomTypeValues.map[x])),
        category: json["category"] == null
            ? null
            : List<Category>.from(
                json["category"].map((x) => categoryValues.map[x])),
        kind: json["kind"] == null
            ? null
            : List<Kind>.from(json["kind"].map((x) => kindValues.map[x])),
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
            : List<EnvironmentAccess>.from(json["environment_access"]
                .map((x) => environmentAccessValues.map[x])),
        parkingFacility: json["parking_facility"] == null
            ? null
            : List<ParkingFacility>.from(json["parking_facility"]
                .map((x) => parkingFacilityValues.map[x])),
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
            : List<Rule>.from(json["rules"].map((x) => ruleValues.map[x])),
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
        cancellation: json["cancellation"] == null
            ? null
            : cancellationValues.map[json["cancellation"]],
        publish: json["publish"] == null ? null : json["publish"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "created_by": createdBy == null ? null : createdBy,
        "owner": owner == null ? null : ownerValues.reverse[owner],
        "author": author,
        "dummy_agent": dummyAgent,
        "dummy_author": dummyAuthor == null ? null : dummyAuthor.toJson(),
        "name": name == null ? null : name,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "address": address == null ? null : address.toJson(),
        "area": area == null
            ? null
            : List<dynamic>.from(area.map((x) => areaValues.reverse[x])),
        "operational": operational == null
            ? null
            : List<dynamic>.from(
                operational.map((x) => operationalValues.reverse[x])),
        "status_property": statusProperty == null
            ? null
            : List<dynamic>.from(
                statusProperty.map((x) => statusPropertyValues.reverse[x])),
        "type": type == null
            ? null
            : List<dynamic>.from(type.map((x) => typeElementValues.reverse[x])),
        "room_type": roomType == null
            ? null
            : List<dynamic>.from(roomType.map((x) => x.toJson())),
        "total_room": totalRoom == null ? null : totalRoom,
        "total_bath_room": totalBathRoom == null ? null : totalBathRoom,
        "bath_room_type": bathRoomType == null
            ? null
            : List<dynamic>.from(
                bathRoomType.map((x) => bathRoomTypeValues.reverse[x])),
        "category": category == null
            ? null
            : List<dynamic>.from(
                category.map((x) => categoryValues.reverse[x])),
        "kind": kind == null
            ? null
            : List<dynamic>.from(kind.map((x) => kindValues.reverse[x])),
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
            : List<dynamic>.from(environmentAccess
                .map((x) => environmentAccessValues.reverse[x])),
        "parking_facility": parkingFacility == null
            ? null
            : List<dynamic>.from(
                parkingFacility.map((x) => parkingFacilityValues.reverse[x])),
        "monthly_price": monthlyPrice == null
            ? null
            : List<dynamic>.from(monthlyPrice.map((x) => x)),
        "detail_house_price":
            detailHousePrice == null ? null : detailHousePrice.toJson(),
        "detail_dp_price":
            detailDpPrice == null ? null : detailDpPrice.toJson(),
        "additional_price": additionalPrice,
        "rules": rules == null
            ? null
            : List<dynamic>.from(rules.map((x) => ruleValues.reverse[x])),
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
        "cancellation": cancellation == null
            ? null
            : cancellationValues.reverse[cancellation],
        "publish": publish == null ? null : publish,
      };
}

class Address {
  Address({
    this.location,
    this.city,
    this.province,
    this.district,
    this.village,
    this.region,
    this.address,
    this.additionalAddress,
    this.country,
    this.postalCode,
  });

  Location location;
  City city;
  Province province;
  District district;
  String village;
  City region;
  String address;
  String additionalAddress;
  Country country;
  String postalCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        city: json["city"] == null ? null : cityValues.map[json["city"]],
        province: json["province"] == null
            ? null
            : provinceValues.map[json["province"]],
        district: json["district"] == null
            ? null
            : districtValues.map[json["district"]],
        village: json["village"] == null ? null : json["village"],
        region: json["region"] == null ? null : cityValues.map[json["region"]],
        address: json["address"] == null ? null : json["address"],
        additionalAddress: json["additional_address"] == null
            ? null
            : json["additional_address"],
        country:
            json["country"] == null ? null : countryValues.map[json["country"]],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "location": location == null ? null : location.toJson(),
        "city": city == null ? null : cityValues.reverse[city],
        "province": province == null ? null : provinceValues.reverse[province],
        "district": district == null ? null : districtValues.reverse[district],
        "village": village == null ? null : village,
        "region": region == null ? null : cityValues.reverse[region],
        "address": address == null ? null : address,
        "additional_address":
            additionalAddress == null ? null : additionalAddress,
        "country": country == null ? null : countryValues.reverse[country],
        "postal_code": postalCode == null ? null : postalCode,
      };
}

enum City { BANDUNG, KOTA_BANDUNG, KECAMATAN_DAYEUHKOLOT }

final cityValues = EnumValues({
  "Bandung": City.BANDUNG,
  "Kecamatan Dayeuhkolot": City.KECAMATAN_DAYEUHKOLOT,
  "Kota Bandung": City.KOTA_BANDUNG
});

enum Country { INDONESIA }

final countryValues = EnumValues({"Indonesia": Country.INDONESIA});

enum District { CITEUREUP, DAYEUHKOLOT, BOJONGSOANG }

final districtValues = EnumValues({
  "Bojongsoang": District.BOJONGSOANG,
  "Citeureup": District.CITEUREUP,
  "Dayeuhkolot": District.DAYEUHKOLOT
});

class Location {
  Location({
    this.type,
    this.coordinates,
  });

  LocationType type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type:
            json["type"] == null ? null : locationTypeValues.map[json["type"]],
        coordinates: json["coordinates"] == null
            ? null
            : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : locationTypeValues.reverse[type],
        "coordinates": coordinates == null
            ? null
            : List<dynamic>.from(coordinates.map((x) => x)),
      };
}

enum LocationType { POINT }

final locationTypeValues = EnumValues({"Point": LocationType.POINT});

enum Province { JAWA_BARAT }

final provinceValues = EnumValues({"Jawa Barat": Province.JAWA_BARAT});

enum Area { TELKOM }

final areaValues = EnumValues({"telkom": Area.TELKOM});

enum BathRoomType { DALAM, LUAR }

final bathRoomTypeValues =
    EnumValues({"dalam": BathRoomType.DALAM, "luar": BathRoomType.LUAR});

enum Cancellation { CANNOT_CANCEL }

final cancellationValues =
    EnumValues({"cannot_cancel": Cancellation.CANNOT_CANCEL});

enum Category { MIX, MALE, FEMALE }

final categoryValues = EnumValues(
    {"female": Category.FEMALE, "male": Category.MALE, "mix": Category.MIX});

class Price {
  Price({
    this.yearly,
    this.monthly,
    this.weekly,
    this.daily,
  });

  int yearly;
  int monthly;
  int weekly;
  int daily;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        yearly: json["yearly"] == null ? null : json["yearly"],
        monthly: json["monthly"] == null ? null : json["monthly"],
        weekly: json["weekly"] == null ? null : json["weekly"],
        daily: json["daily"] == null ? null : json["daily"],
      );

  Map<String, dynamic> toJson() => {
        "yearly": yearly == null ? null : yearly,
        "monthly": monthly == null ? null : monthly,
        "weekly": weekly == null ? null : weekly,
        "daily": daily == null ? null : daily,
      };
}

class DummyAuthor {
  DummyAuthor({
    this.id,
    this.createdAt,
    this.name,
    this.avatarUrl,
    this.phoneNumber,
    this.verified,
    this.gender,
  });

  String id;
  DateTime createdAt;
  String name;
  String avatarUrl;
  PhoneNumber phoneNumber;
  bool verified;
  String gender;

  factory DummyAuthor.fromJson(Map<String, dynamic> json) => DummyAuthor(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        name: json["name"] == null ? null : json["name"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        phoneNumber: json["phone_number"] == null
            ? null
            : PhoneNumber.fromJson(json["phone_number"]),
        verified: json["verified"] == null ? null : json["verified"],
        gender: json["gender"] == null ? null : json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "name": name == null ? null : name,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "phone_number": phoneNumber == null ? null : phoneNumber.toJson(),
        "verified": verified == null ? null : verified,
        "gender": gender == null ? null : gender,
      };
}

class PhoneNumber {
  PhoneNumber({
    this.data,
    this.verified,
  });

  String data;
  bool verified;

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => PhoneNumber(
        data: json["data"] == null ? null : json["data"],
        verified: json["verified"] == null ? null : json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data,
        "verified": verified == null ? null : verified,
      };
}

enum EnvironmentAccess { WARUNG_MAKAN, APOTEK, MASJID, MINIMARKET, BANK, MALL }

final environmentAccessValues = EnumValues({
  "apotek": EnvironmentAccess.APOTEK,
  "bank": EnvironmentAccess.BANK,
  "mall": EnvironmentAccess.MALL,
  "masjid": EnvironmentAccess.MASJID,
  "minimarket": EnvironmentAccess.MINIMARKET,
  "warung_makan": EnvironmentAccess.WARUNG_MAKAN
});

enum Kind { YEARLY, MONTHLY, DAILY }

final kindValues = EnumValues(
    {"daily": Kind.DAILY, "monthly": Kind.MONTHLY, "yearly": Kind.YEARLY});

enum Operational { SUKABIRUS, BOJONGSOANG, SUKAPURA }

final operationalValues = EnumValues({
  "bojongsoang": Operational.BOJONGSOANG,
  "sukabirus": Operational.SUKABIRUS,
  "sukapura": Operational.SUKAPURA
});

enum Owner {
  THE_5_BFAED099_A291_D00012035_EB,
  THE_5_C43563_C3_BF2_A500013_BAFE2
}

final ownerValues = EnumValues({
  "5bfaed099a291d00012035eb": Owner.THE_5_BFAED099_A291_D00012035_EB,
  "5c43563c3bf2a500013bafe2": Owner.THE_5_C43563_C3_BF2_A500013_BAFE2
});

enum ParkingFacility { SEPEDA, MOBIL, MOTOR }

final parkingFacilityValues = EnumValues({
  "mobil": ParkingFacility.MOBIL,
  "motor": ParkingFacility.MOTOR,
  "sepeda": ParkingFacility.SEPEDA
});

class RoomType {
  RoomType({
    this.id,
    this.roomSize,
    this.facility,
    this.isFurnished,
    this.isBathRoomInside,
    this.price,
    this.dpPrice,
    this.maxGuess,
    this.bedType,
    this.about,
    this.totalRoom,
    this.totalAvailableRoom,
    this.name,
  });

  String id;
  String roomSize;
  List<String> facility;
  bool isFurnished;
  bool isBathRoomInside;
  Price price;
  Price dpPrice;
  int maxGuess;
  String bedType;
  String about;
  int totalRoom;
  int totalAvailableRoom;
  String name;

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
        id: json["id"] == null ? null : json["id"],
        roomSize: json["room_size"] == null ? null : json["room_size"],
        facility: json["facility"] == null
            ? null
            : List<String>.from(json["facility"].map((x) => x)),
        isFurnished: json["is_furnished"] == null ? null : json["is_furnished"],
        isBathRoomInside: json["is_bath_room_inside"] == null
            ? null
            : json["is_bath_room_inside"],
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        dpPrice:
            json["dp_price"] == null ? null : Price.fromJson(json["dp_price"]),
        maxGuess: json["max_guess"] == null ? null : json["max_guess"],
        bedType: json["bed_type"] == null ? null : json["bed_type"],
        about: json["about"] == null ? null : json["about"],
        totalRoom: json["total_room"] == null ? null : json["total_room"],
        totalAvailableRoom: json["total_available_room"] == null
            ? null
            : json["total_available_room"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "room_size": roomSize == null ? null : roomSize,
        "facility": facility == null
            ? null
            : List<dynamic>.from(facility.map((x) => x)),
        "is_furnished": isFurnished == null ? null : isFurnished,
        "is_bath_room_inside":
            isBathRoomInside == null ? null : isBathRoomInside,
        "price": price == null ? null : price.toJson(),
        "dp_price": dpPrice == null ? null : dpPrice.toJson(),
        "max_guess": maxGuess == null ? null : maxGuess,
        "bed_type": bedType == null ? null : bedType,
        "about": about == null ? null : about,
        "total_room": totalRoom == null ? null : totalRoom,
        "total_available_room":
            totalAvailableRoom == null ? null : totalAvailableRoom,
        "name": name == null ? null : name,
      };
}

enum Rule { FREE, PETS_BANNED, CURVEY }

final ruleValues = EnumValues({
  "curvey": Rule.CURVEY,
  "free": Rule.FREE,
  "pets_banned": Rule.PETS_BANNED
});

enum StatusProperty { RENT }

final statusPropertyValues = EnumValues({"rent": StatusProperty.RENT});

enum TypeElement { KOST }

final typeElementValues = EnumValues({"kost": TypeElement.KOST});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

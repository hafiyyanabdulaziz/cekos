import 'package:flutter/cupertino.dart';
import 'package:Cekos/models/koseekerModelMultiple.dart';
import 'package:Cekos/models/koseekerModelSingle.dart';

extension KoseekerModelMultipleExtension on KoseekerModelMultiple {
  KoseekerModelSingle convertToKoseekerModelSingle({@required int index}) {
    Data datumToData = Data();
    datumToData.id = this.data[index].id;
    datumToData.createdAt = this.data[index].createdAt;
    datumToData.updatedAt = this.data[index].updatedAt;
    datumToData.createdBy = this.data[index].createdBy;
    datumToData.owner = this.data[index].owner.toString();
    datumToData.author = this.data[index].author;
    datumToData.dummyAgent = this.data[index].dummyAgent;

    datumToData.dummyAuthor.id = this.data[index].dummyAuthor.id;
    datumToData.dummyAuthor.createdAt = this.data[index].dummyAuthor.createdAt;
    datumToData.dummyAuthor.name = this.data[index].dummyAuthor.name;
    datumToData.dummyAuthor.avatarUrl = this.data[index].dummyAuthor.avatarUrl;
    datumToData.dummyAuthor.phoneNumber.data =
        this.data[index].dummyAuthor.phoneNumber.data;
    datumToData.dummyAuthor.phoneNumber.verified =
        this.data[index].dummyAuthor.phoneNumber.verified;
    datumToData.dummyAuthor.verified = this.data[index].dummyAuthor.verified;
    datumToData.dummyAuthor.gender = this.data[index].dummyAuthor.gender;

    datumToData.name = this.data[index].name;
    datumToData.title = this.data[index].title;
    datumToData.description = this.data[index].description;

    datumToData.address.location.type = this.data[index].address.location.type;
    datumToData.address.location.coordinates =
        this.data[index].address.location.coordinates;
    datumToData.address.city = this.data[index].address.city;
    datumToData.address.province = this.data[index].address.province;
    datumToData.address.district = this.data[index].address.district;
    datumToData.address.village = this.data[index].address.village;
    datumToData.address.region = this.data[index].address.region;
    datumToData.address.address = this.data[index].address.address;
    datumToData.address.additionalAddress =
        this.data[index].address.additionalAddress;
    datumToData.address.country = this.data[index].address.country;
    datumToData.address.postalCode = this.data[index].address.postalCode;

    datumToData.area = this.data[index].area;
    datumToData.operational = this.data[index].operational;
    datumToData.statusProperty = this.data[index].statusProperty;
    datumToData.type = this.data[index].type;
    datumToData.roomType = this.data[index].roomType.cast<RoomType>();
    datumToData.totalRoom = this.data[index].totalRoom;
    datumToData.totalBathRoom = this.data[index].totalBathRoom;
    datumToData.bathRoomType = this.data[index].bathRoomType;

    datumToData.category = this.data[index].category;
    datumToData.kind = this.data[index].kind;
    datumToData.videoUrl = this.data[index].videoUrl;
    datumToData.facility = this.data[index].facility;
    datumToData.roomFacility = this.data[index].roomFacility;
    datumToData.bathRoomFacility = this.data[index].bathRoomFacility;
    datumToData.environmentAccess = this.data[index].environmentAccess;
    datumToData.parkingFacility = this.data[index].parkingFacility;
    datumToData.monthlyPrice = this.data[index].monthlyPrice;

    datumToData.detailHousePrice.yearly =
        this.data[index].detailHousePrice.yearly;
    datumToData.detailHousePrice.monthly =
        this.data[index].detailHousePrice.monthly;
    datumToData.detailHousePrice.weekly =
        this.data[index].detailHousePrice.weekly;
    datumToData.detailHousePrice.daily =
        this.data[index].detailHousePrice.daily;

    datumToData.detailDpPrice.yearly = this.data[index].detailDpPrice.yearly;
    datumToData.detailDpPrice.monthly = this.data[index].detailDpPrice.monthly;
    datumToData.detailDpPrice.weekly = this.data[index].detailDpPrice.weekly;
    datumToData.detailDpPrice.daily = this.data[index].detailDpPrice.daily;

    datumToData.additionalPrice = this.data[index].additionalPrice;
    datumToData.rules = this.data[index].rules;
    datumToData.mainImage = this.data[index].mainImage;
    datumToData.gallery = this.data[index].gallery;
    datumToData.verified = this.data[index].verified;
    datumToData.isInstantPay = this.data[index].isInstantPay;
    datumToData.isCanDp = this.data[index].isCanDp;
    datumToData.isCanBooking = this.data[index].isCanBooking;
    datumToData.isUseAgent = this.data[index].isUseAgent;
    datumToData.bookNowStayLater = this.data[index].bookNowStayLater;
    datumToData.cancellation = this.data[index].cancellation;
    datumToData.publish = this.data[index].publish;
    return KoseekerModelSingle(
      error: this.error,
      data: datumToData,
    );
  }
}

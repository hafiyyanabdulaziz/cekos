import 'package:flutter/cupertino.dart';
import 'package:Cekos/models/koseekerModelMultiple.dart';
import 'package:Cekos/models/koseekerModelSingle.dart';

extension KoseekerModelMultipleExtension on KoseekerModelMultiple {
  KoseekerModelSingle convertToKoseekerModelSingle({@required int index}) {
    print('Ini Index: ' + index.toString());
    Data datumToData = Data();
    datumToData.id = this.data[index].id;
    datumToData.createdAt = this.data[index].createdAt;
    datumToData.updatedAt = this.data[index].updatedAt;
    datumToData.createdBy = this.data[index].createdBy;
    datumToData.owner = this.data[index].owner;
    datumToData.author = this.data[index].author;
    datumToData.dummyAgent = this.data[index].dummyAgent;
    datumToData.dummyAuthor = this.data[index].dummyAuthor;
    datumToData.name = this.data[index].name;
    datumToData.title = this.data[index].title;
    datumToData.description = this.data[index].description;
    datumToData.address = this.data[index].address;
    datumToData.area = this.data[index].area;
    datumToData.operational = this.data[index].operational;
    datumToData.statusProperty = this.data[index].statusProperty;
    datumToData.type = this.data[index].type;
    datumToData.roomType = this.data[index].roomType;
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
    datumToData.detailHousePrice = this.data[index].detailHousePrice;
    datumToData.detailDpPrice = this.data[index].detailDpPrice;
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

    //print('INI HASIL JSON: ' + datumToData.toJson().toString());
    return KoseekerModelSingle(
      error: this.error,
      data: datumToData,
    );
  }
}

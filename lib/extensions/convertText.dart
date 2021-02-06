import 'package:Cekos/models/koseekerModelSingle.dart';
import 'package:Cekos/extensions/stringExtension.dart';

class ConvertText {
  static String convertToPenghuni(KoseekerModelSingle text) {
    if (text.data.category.length > 1) {
      return 'Campur';
    } else if (text.data.category[0] == 'male') {
      return 'Laki-laki';
    } else if (text.data.category[0] == 'mix') {
      return 'Campur';
    } else {
      return 'Perempuan';
    }
  }

  static List<String> facilityConvert(KoseekerModelSingle list) {
    List<String> facility = [];
    for (var item in list.data.facility) {
      switch (item) {
        case 'ruang_santai':
          facility.add('Ruang Santai');
          break;
        case 'garasi':
          facility.add('Garasi');
          break;
        case 'tempat_jemuran':
          facility.add('Tempat Jemuran');
          break;
        case 'dapur':
          facility.add('Dapur');
          break;
        case 'ruang_tamu':
          facility.add('Ruang Tamu');
          break;
        default:
          facility.add(item.replaceAll('_', ' ').capitalize());
      }
    }
    return facility;
  }

  static List<String> parkingFacilityConvert(KoseekerModelSingle list) {
    List<String> facility = [];
    for (var item in list.data.parkingFacility) {
      switch (item) {
        case 'sepeda':
          facility.add('Sepeda');
          break;
        case 'motor':
          facility.add('Motor');
          break;
        case 'mobil':
          facility.add('Mobil');
          break;
        default:
          facility.add(item.replaceAll('_', ' ').capitalize());
      }
    }
    return facility;
  }

  static List<String> rulesConvert(KoseekerModelSingle list) {
    List<String> facility = [];
    for (var item in list.data.rules) {
      switch (item) {
        case 'free':
          facility.add('Bebas');
          break;
        case 'pets_banned':
          facility.add('Tidak boleh membawa hewan peliharaan');
          break;
        case 'allow_pets':
          facility.add('Boleh membawa hewan peliharaan');
          break;
        default:
          facility.add(item.replaceAll('_', ' ').capitalize());
      }
    }
    return facility;
  }

  static List<String> categoryConvert(KoseekerModelSingle list) {
    List<String> facility = [];
    for (var item in list.data.category) {
      switch (item) {
        case 'male':
          facility.add('Laki-Laki');
          break;
        case 'female':
          facility.add('Perempuan');
          break;
        case 'mix':
          facility.add('Campur');
          break;
        default:
          facility.add(item.replaceAll('_', ' ').capitalize());
      }
    }
    return facility;
  }

  static List<String> environmentAccessConvert(KoseekerModelSingle list) {
    List<String> facility = [];
    for (var item in list.data.environmentAccess) {
      switch (item) {
        case 'warung_makan':
          facility.add('Warung Makan');
          break;
        case 'masjid':
          facility.add('Masjid');
          break;
        case 'minimarket':
          facility.add('Minimarket');
          break;
        case 'bank':
          facility.add('Bank');
          break;
        case 'apotek':
          facility.add('Apotek');
          break;
        default:
          facility.add(item.replaceAll('_', ' ').capitalize());
      }
    }
    return facility;
  }

  static List<String> roomFacilityConvert(List<String> list) {
    List<String> facility = [];
    for (var item in list) {
      switch (item) {
        case 'rak_buku':
          facility.add('Rak Buku');
          break;
        case 'include_listrik':
          facility.add('Sudah termasuk listrik');
          break;
        case 'include_internet':
          facility.add('Sudah termasuk internet');
          break;
        case 'Include loundry':
          facility.add('Sudah termasuk laundry');
          break;
        case 'listrik_token':
          facility.add('Listrik Token');
          break;
        default:
          facility.add(item.replaceAll('_', ' ').capitalize());
      }
    }
    return facility;
  }
}

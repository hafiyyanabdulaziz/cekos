import 'package:Cekos/models/koseekerModelSingle.dart';

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
}

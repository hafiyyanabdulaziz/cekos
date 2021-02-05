part of 'widgets.dart';

class Card extends StatelessWidget {
  // final String photo;
  // final String type;
  // final String penghuni;
  // final String nama;
  // final int harga;
  final KoseekerModelSingle koseekerModelSingle;

  Card(this.koseekerModelSingle);

  // Card({
  //   this.photo = 'https://picsum.photos/200/300',
  //   this.type = 'Kost',
  //   this.penghuni = 'Perempuan',
  //   this.nama = 'Kost Tulung Agung',
  //   this.harga = 1000000,
  // });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
        top: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: const Color(0xff23243b),
        boxShadow: [
          BoxShadow(
            color: const Color(0x80000000),
            offset: Offset(4, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(dataProperti[i].photo),
          //FOTO
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.0),
                topRight: Radius.circular(14.0),
              ),
              image: DecorationImage(
                image: NetworkImage(koseekerModelSingle.data.mainImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //TIPE
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Text(
              (koseekerModelSingle.data.type[0].capitalize() +
                  ' - ' +
                  ConvertText.convertToPenghuni(koseekerModelSingle)),
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 15,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //NAMA
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 10,
            ),
            child: Text(
              koseekerModelSingle.data.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 25,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //HARGA
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Text(
              (koseekerModelSingle.data.roomType[0].price.yearly == 0)
                  ? 'Maaf Sudah Penuh'
                  : displayHarga(),
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 15,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  String displayHarga() {
    return NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: 'Rp ',
        ).format(koseekerModelSingle.data.roomType[0].price.yearly) +
        ' /Tahun';
  }
}

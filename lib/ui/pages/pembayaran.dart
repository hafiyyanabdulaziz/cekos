part of 'pages.dart';

class Pembayaran extends StatelessWidget {
  final String propertyNama;
  final String propertyRoomTypeNama;
  final int propertyHarga;
  final String durasiMenginap;
  final String tanggal;

  const Pembayaran({
    @required this.propertyNama,
    @required this.propertyRoomTypeNama,
    @required this.propertyHarga,
    @required this.durasiMenginap,
    @required this.tanggal,
  });

  Widget _titlePesananAnda() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Center(
        child: Text(
          'Pesanan Anda',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _infoPembayaranProperty() => Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Property : ' + propertyNama,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Tipe Kamar : ' + propertyRoomTypeNama,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Durasi Menginap : ' + durasiMenginap,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mulai Menempati : ' + tanggal,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Harga : ' +
                  NumberFormat.currency(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: 'Rp ',
                  ).format(propertyHarga),
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

  Widget _btnTransfer() => Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Color(0xffaf8d19),
          onPressed: () {
            launch('https://wa.me/6281283793435?text=Saya ingin membayar ' +
                propertyNama +
                '. Tipe Property: ' +
                propertyRoomTypeNama +
                '. Durasi menginap: ' +
                durasiMenginap +
                '. Mulai menempati: ' +
                tanggal +
                '. Total: ' +
                propertyHarga.toString() +
                '. Berikut ini Saya lampirkan bukti transfernya.');
          },
          child: Text(
            'Konfirmasi Transfer',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((propertyNama != '' && propertyHarga != 0)
            ? 'Pembayaran'
            : 'Cara Pembayaran'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF23243B),
      ),
      body: ListView(
        children: [
          //title pesananan anda
          (propertyNama != '' && propertyHarga != 0)
              ? _titlePesananAnda()
              : Container(),
          //info pembayaran property
          (propertyNama != '' && propertyHarga != 0)
              ? _infoPembayaranProperty()
              : Container(),
          //text lakukan pembayaran
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Text(
              (propertyNama != '' && propertyHarga != 0)
                  ? 'Mohon lakukan pembayaran ke rekening:'
                  : 'Pembayaran hanya dapat dilakukan melalui transfer ke rekening berikut:',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bank : Bank DBS',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Kode Bank : 046',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'No. Rekening : 1701368600',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Nama : HAFIYYAN ABDUL AZIZ',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  (propertyNama != '' && propertyHarga != 0)
                      ? 'Jumlah : ' +
                          NumberFormat.currency(
                            locale: 'id',
                            decimalDigits: 0,
                            symbol: 'Rp ',
                          ).format(propertyHarga)
                      : '',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          (propertyNama != '' && propertyHarga != 0)
              ? _btnTransfer()
              : Container(),
        ],
      ),
    );
  }
}

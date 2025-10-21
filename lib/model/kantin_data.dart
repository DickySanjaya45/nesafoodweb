import 'menu.dart';

class Kantin {
  final String name;
  final String image;
  final List<Menu> menus;

  const Kantin({required this.name, required this.image, required this.menus});
}

// Gunakan asset placeholder jika tidak ada gambar spesifik
const _ph = 'assets/placeholder_food.png';

// Kantin A - 20 menu
final List<Menu> _kantinA = [
  Makanan(
    name: 'Nasi Goreng Spesial',
    image: 'assets/Nasi Goreng (Indonesian Fried Rice).jpg',
    price: 15000,
    description: 'Nasi goreng ala Kantin A, lengkap dengan telur dan ayam.',
  ),
  Makanan(
    name: 'Mie Ayam Pangsit',
    image: 'assets/Mie Ayam Pangsit.jpg',
    price: 14000,
    description: 'Mie ayam lezat disajikan dengan pangsit.',
  ),
  Makanan(
    name: 'Ayam Geprek Sambal Matah',
    image: 'assets/Ayam Geprek.jpg',
    price: 18000,
    description: 'Ayam geprek pedas sambal matah.',
  ),
  Makanan(
    name: 'Sate Ayam Madura',
    image: 'assets/Sate Ayam.jpg',
    price: 20000,
    description: 'Sate bumbu kacang, porsinya pas.',
  ),
  Makanan(
    name: 'Ikan Bakar Rica',
    image: 'assets/ikan bakar.jpg',
    price: 22000,
    description: 'Ikan bakar pedas rica-rica.',
  ),
  Makanan(
    name: 'Bakso Kuah',
    image: 'assets/bakso.jpg',
    price: 12000,
    description: 'Bakso sapi dengan kuah kaldu.',
  ),
  Makanan(
    name: 'Pecel Komplit',
    image: 'assets/pecel.jpg',
    price: 13000,
    description: 'Sayur segar dan bumbu kacang.',
  ),
  Minuman(
    name: 'Es Teh Manis',
    image: 'assets/es teh.jpg',
    price: 5000,
    description: 'Teh manis dingin.',
  ),
  Minuman(
    name: 'Kopi Susu Kekinian',
    image: 'assets/kopi susu.jpg',
    price: 12000,
    description: 'Kopi susu creamy.',
  ),
  Minuman(
    name: 'Jus Alpukat',
    image: _ph,
    price: 13000,
    description: 'Alpukat segar dilumat.',
  ),
  Minuman(
    name: 'Es Lemon Tea',
    image: _ph,
    price: 9000,
    description: 'Perpaduan lemon & teh.',
  ),
  SnackMenu(
    name: 'Donat Gulung',
    image: _ph,
    price: 6000,
    description: 'Donat lembut.',
  ),
  SnackMenu(
    name: 'Risoles Isi Daging',
    image: _ph,
    price: 8000,
    description: 'Risoles renyah isi daging.',
  ),
  SnackMenu(
    name: 'Pisang Goreng Keju',
    image: _ph,
    price: 7000,
    description: 'Pisang goreng manis dengan keju.',
  ),
  SnackMenu(
    name: 'Bakwan Jagung',
    image: _ph,
    price: 5000,
    description: 'Cemilan goreng favorit.',
  ),
  SnackMenu(
    name: 'Martabak Mini Cokelat',
    image: _ph,
    price: 12000,
    description: 'Martabak mini isi cokelat.',
  ),
  SnackMenu(
    name: 'Kue Lapis',
    image: _ph,
    price: 9000,
    description: 'Kue lapis legit.',
  ),
];

// Kantin B - 15 menu
final List<Menu> _kantinB = [
  Makanan(
    name: 'Nasi Campur Spesial',
    image: _ph,
    price: 17000,
    description: 'Pilihan lauk beragam.',
  ),
  Makanan(
    name: 'Mie Goreng Jawa',
    image: _ph,
    price: 14000,
    description: 'Mie goreng bumbu Jawa.',
  ),
  Makanan(
    name: 'Ayam Bakar Taliwang',
    image: _ph,
    price: 20000,
    description: 'Ayam bakar pedas khas Lombok.',
  ),
  Makanan(
    name: 'Sop Iga',
    image: _ph,
    price: 24000,
    description: 'Sop iga kuah bening gurih.',
  ),
  Makanan(
    name: 'Tahu Tek',
    image: _ph,
    price: 11000,
    description: 'Tahu goreng bumbu kacang.',
  ),
  Minuman(
    name: 'Teh Tubruk',
    image: _ph,
    price: 6000,
    description: 'Teh tubruk hangat.',
  ),
  Minuman(
    name: 'Es Jeruk Segar',
    image: _ph,
    price: 9000,
    description: 'Jeruk peras dingin.',
  ),
  Minuman(
    name: 'Air Mineral',
    image: _ph,
    price: 4000,
    description: 'Air mineral kemasan.',
  ),
  SnackMenu(
    name: 'Pisang Goreng Original',
    image: _ph,
    price: 6000,
    description: 'Pisang goreng klasik.',
  ),
  SnackMenu(
    name: 'Kue Cubit',
    image: _ph,
    price: 7000,
    description: 'Kue cubit manis lembut.',
  ),
  SnackMenu(
    name: 'Croissant Isi Cokelat',
    image: _ph,
    price: 15000,
    description: 'Croissant renyah.',
  ),
  Makanan(
    name: 'Nasi Pecel',
    image: _ph,
    price: 12000,
    description: 'Nasi dengan pecel sedap.',
  ),
  Makanan(
    name: 'Ikan Goreng Sambal',
    image: _ph,
    price: 21000,
    description: 'Ikan goreng pedas.',
  ),
  Minuman(
    name: 'Bandrek Hangat',
    image: _ph,
    price: 8000,
    description: 'Minuman rempah hangat.',
  ),
  SnackMenu(
    name: 'Singkong Keju',
    image: _ph,
    price: 7000,
    description: 'Singkong goreng topping keju.',
  ),
];

// Kantin C - 18 menu
final List<Menu> _kantinC = [
  Makanan(
    name: 'Nasi Goreng Seafood',
    image: _ph,
    price: 20000,
    description: 'Nasi goreng campur seafood.',
  ),
  Makanan(
    name: 'Mie Rebus Spesial',
    image: _ph,
    price: 15000,
    description: 'Mie rebus dengan kuah kaya rasa.',
  ),
  Makanan(
    name: 'Ayam Bumbu Rujak',
    image: _ph,
    price: 19000,
    description: 'Ayam bumbu rujak manis pedas.',
  ),
  Makanan(
    name: 'Tongseng Daging',
    image: _ph,
    price: 22000,
    description: 'Tongseng daging empuk.',
  ),
  Makanan(
    name: 'Nasi Kuning Komplit',
    image: _ph,
    price: 18000,
    description: 'Nasi kuning lengkap.',
  ),
  Minuman(
    name: 'Es Cincau',
    image: _ph,
    price: 8000,
    description: 'Es cincau penyegar.',
  ),
  Minuman(
    name: 'Jus Mangga',
    image: _ph,
    price: 13000,
    description: 'Mangga segar.',
  ),
  Minuman(
    name: 'Kopi Hitam',
    image: _ph,
    price: 7000,
    description: 'Kopi hitam pekat.',
  ),
  SnackMenu(
    name: 'Poffertjes Mini',
    image: _ph,
    price: 9000,
    description: 'Poffertjes manis.',
  ),
  SnackMenu(
    name: 'Risoles Sayur',
    image: _ph,
    price: 7000,
    description: 'Risoles isi sayur.',
  ),
  SnackMenu(
    name: 'Donat Isi Selai',
    image: _ph,
    price: 8000,
    description: 'Donat dengan selai.',
  ),
  Makanan(
    name: 'Ikan Asam Manis',
    image: _ph,
    price: 21000,
    description: 'Ikan saus asam manis.',
  ),
  Makanan(
    name: 'Soto Betawi',
    image: _ph,
    price: 16000,
    description: 'Soto daging santan.',
  ),
  Minuman(
    name: 'Es Kopi Susu',
    image: _ph,
    price: 12000,
    description: 'Es kopi susu segar.',
  ),
  Minuman(
    name: 'Jus Alpukat Cokelat',
    image: _ph,
    price: 14000,
    description: 'Alpukat dengan cokelat.',
  ),
  SnackMenu(
    name: 'Martabak Mini Keju',
    image: _ph,
    price: 12000,
    description: 'Martabak mini dengan keju.',
  ),
  SnackMenu(
    name: 'Bakwan Sayur',
    image: _ph,
    price: 5000,
    description: 'Bakwan goreng renyah.',
  ),
  SnackMenu(
    name: 'Kue Lapis Pandan',
    image: _ph,
    price: 9000,
    description: 'Kue lapis pandan wangi.',
  ),
];

// Kantin D - 12 menu
final List<Menu> _kantinD = [
  Makanan(
    name: 'Nasi Timbel',
    image: _ph,
    price: 16000,
    description: 'Nasi timbel lengkap.',
  ),
  Makanan(
    name: 'Ayam Kecap',
    image: _ph,
    price: 17000,
    description: 'Ayam masak kecap manis.',
  ),
  Makanan(
    name: 'Sop Buntut',
    image: _ph,
    price: 28000,
    description: 'Sop buntut gurih.',
  ),
  Makanan(
    name: 'Tahu Tempe Bacem',
    image: _ph,
    price: 11000,
    description: 'Tahu tempe manis legit.',
  ),
  Minuman(
    name: 'Es Soda Gembira',
    image: _ph,
    price: 10000,
    description: 'Soda manis dan segar.',
  ),
  Minuman(
    name: 'Teh Panas',
    image: _ph,
    price: 5000,
    description: 'Teh panas sederhana.',
  ),
  SnackMenu(
    name: 'Pisang Cokelat',
    image: _ph,
    price: 8000,
    description: 'Pisang goreng isi cokelat.',
  ),
  SnackMenu(
    name: 'Kroket Kentang',
    image: _ph,
    price: 9000,
    description: 'Kroket kentang renyah.',
  ),
  Makanan(
    name: 'Ikan Goreng Sambal Matah',
    image: _ph,
    price: 20000,
    description: 'Ikan goreng + sambal matah.',
  ),
  Minuman(
    name: 'Es Kelapa Muda',
    image: _ph,
    price: 12000,
    description: 'Kelapa muda segar.',
  ),
  SnackMenu(
    name: 'Roti Bakar Cokelat',
    image: _ph,
    price: 10000,
    description: 'Roti bakar manis.',
  ),
  SnackMenu(
    name: 'Kue Putu',
    image: _ph,
    price: 7000,
    description: 'Kue putu wangi.',
  ),
];

// Kantin E - 20 menu
final List<Menu> _kantinE = [
  Makanan(
    name: 'Nasi Padang Mini',
    image: _ph,
    price: 20000,
    description: 'Porsi kecil berbagai lauk padang.',
  ),
  Makanan(
    name: 'Gulai Ayam',
    image: _ph,
    price: 19000,
    description: 'Gulai ayam berempah.',
  ),
  Makanan(
    name: 'Ikan Gulai',
    image: _ph,
    price: 23000,
    description: 'Ikan dengan kuah gulai.',
  ),
  Makanan(
    name: 'Sate Padang',
    image: _ph,
    price: 22000,
    description: 'Sate khas padang.',
  ),
  Makanan(
    name: 'Sayur Lodeh',
    image: _ph,
    price: 11000,
    description: 'Sayur lodeh santan.',
  ),
  Makanan(
    name: 'Nasi Lemak',
    image: _ph,
    price: 17000,
    description: 'Nasi lemak ala kantin.',
  ),
  Minuman(
    name: 'Teh Tarik',
    image: _ph,
    price: 10000,
    description: 'Teh tarik manis.',
  ),
  Minuman(
    name: 'Kopi Tubruk',
    image: _ph,
    price: 8000,
    description: 'Kopi tubruk pekat.',
  ),
  Minuman(
    name: 'Jus Mangga Segar',
    image: _ph,
    price: 13000,
    description: 'Mangga segar saja.',
  ),
  Minuman(
    name: 'Es Cendol',
    image: _ph,
    price: 12000,
    description: 'Cendol manis legit.',
  ),
  SnackMenu(
    name: 'Onde-onde',
    image: _ph,
    price: 8000,
    description: 'Onde-onde isi kacang hijau.',
  ),
  SnackMenu(
    name: 'Pisang Keju Cokelat',
    image: _ph,
    price: 9000,
    description: 'Pisang goreng double topping.',
  ),
  SnackMenu(
    name: 'Kue Nastar',
    image: _ph,
    price: 10000,
    description: 'Kue kering manis.',
  ),
  SnackMenu(
    name: 'Roti Srikaya',
    image: _ph,
    price: 9000,
    description: 'Roti isi srikaya.',
  ),
  Makanan(
    name: 'Sop Kambing',
    image: _ph,
    price: 25000,
    description: 'Sop kambing gurih.',
  ),
  Makanan(
    name: 'Ikan Asam Manis',
    image: _ph,
    price: 21000,
    description: 'Ikan saus asam manis.',
  ),
  Makanan(
    name: 'Nasi Bakar Ayam',
    image: _ph,
    price: 19000,
    description: 'Nasi bakar aroma wangi.',
  ),
  Minuman(
    name: 'Es Kopi Gula Aren',
    image: _ph,
    price: 14000,
    description: 'Kopi dengan gula aren.',
  ),
  SnackMenu(
    name: 'Tahu Crispy',
    image: _ph,
    price: 8000,
    description: 'Tahu goreng renyah.',
  ),
  SnackMenu(
    name: 'Kue Lumpur',
    image: _ph,
    price: 9000,
    description: 'Kue lumpur legit.',
  ),
];

// Kantin F - 15 menu
final List<Menu> _kantinF = [
  Makanan(
    name: 'Nasi Goreng Kampung',
    image: _ph,
    price: 15000,
    description: 'Nasi goreng sederhana.',
  ),
  Makanan(
    name: 'Mie Aceh',
    image: _ph,
    price: 18000,
    description: 'Mie berkuah pedas.',
  ),
  Makanan(
    name: 'Ikan Paprika',
    image: _ph,
    price: 22000,
    description: 'Ikan tumis paprika.',
  ),
  Makanan(
    name: 'Ayam Rica-rica',
    image: _ph,
    price: 20000,
    description: 'Ayam pedas rica.',
  ),
  Minuman(
    name: 'Teh Manis Dingin',
    image: _ph,
    price: 5000,
    description: 'Teh dingin sederhana.',
  ),
  Minuman(
    name: 'Jus Jeruk',
    image: _ph,
    price: 9000,
    description: 'Jeruk segar.',
  ),
  Minuman(
    name: 'Soda',
    image: _ph,
    price: 8000,
    description: 'Minuman bersoda.',
  ),
  SnackMenu(
    name: 'Tahu Isi',
    image: _ph,
    price: 7000,
    description: 'Tahu goreng isi.',
  ),
  SnackMenu(
    name: 'Donat Cokelat',
    image: _ph,
    price: 7000,
    description: 'Donat isi cokelat.',
  ),
  SnackMenu(
    name: 'Poffertjes',
    image: _ph,
    price: 9000,
    description: 'Poffertjes mini.',
  ),
  Makanan(
    name: 'Lontong Sayur',
    image: _ph,
    price: 12000,
    description: 'Lontong sayur hangat.',
  ),
  Makanan(
    name: 'Gado-Gado',
    image: _ph,
    price: 13000,
    description: 'Gado-gado saus kacang.',
  ),
  Minuman(
    name: 'Air Kelapa',
    image: _ph,
    price: 12000,
    description: 'Kelapa muda segar.',
  ),
  SnackMenu(
    name: 'Risoles Daging',
    image: _ph,
    price: 8000,
    description: 'Risoles isi daging.',
  ),
  SnackMenu(
    name: 'Singkong Keju',
    image: _ph,
    price: 7000,
    description: 'Singkong goreng dengan keju.',
  ),
];

// Kantin G - 16 menu
final List<Menu> _kantinG = [
  Makanan(
    name: 'Nasi Lemak Rendang',
    image: _ph,
    price: 22000,
    description: 'Nasi lemak plus rendang.',
  ),
  Makanan(
    name: 'Mee Goreng',
    image: _ph,
    price: 15000,
    description: 'Mee goreng penuh rasa.',
  ),
  Makanan(
    name: 'Ayam Penyet',
    image: _ph,
    price: 17000,
    description: 'Ayam penyet sambal uleg.',
  ),
  Makanan(
    name: 'Ikan Bumbu Kuning',
    image: _ph,
    price: 21000,
    description: 'Ikan dengan bumbu kuning.',
  ),
  Minuman(
    name: 'Es Milo',
    image: _ph,
    price: 12000,
    description: 'Minuman cokelat susu.',
  ),
  Minuman(
    name: 'Jus Tomat',
    image: _ph,
    price: 9000,
    description: 'Jus tomat segar.',
  ),
  Minuman(
    name: 'Kopi Latte',
    image: _ph,
    price: 14000,
    description: 'Kopi susu susu.',
  ),
  SnackMenu(
    name: 'Croissant Isi Keju',
    image: _ph,
    price: 15000,
    description: 'Croissant renyah.',
  ),
  SnackMenu(
    name: 'Kue Nastar',
    image: _ph,
    price: 10000,
    description: 'Kue kering.',
  ),
  SnackMenu(
    name: 'Pisang Cokelat Keju',
    image: _ph,
    price: 9000,
    description: 'Pisang goreng dengan topping.',
  ),
  Makanan(
    name: 'Tahu Gejrot',
    image: _ph,
    price: 11000,
    description: 'Tahu dengan bumbu manis pedas.',
  ),
  Makanan(
    name: 'Sop Kepala Ikan',
    image: _ph,
    price: 24000,
    description: 'Sop kepala ikan sedap.',
  ),
  Minuman(
    name: 'Es Kopi Vietnam',
    image: _ph,
    price: 15000,
    description: 'Kopi pekat dengan susu.',
  ),
  SnackMenu(
    name: 'Kue Putu',
    image: _ph,
    price: 7000,
    description: 'Kue tradisional.',
  ),
  SnackMenu(
    name: 'Roti Kukus',
    image: _ph,
    price: 8000,
    description: 'Roti kukus empuk.',
  ),
  SnackMenu(
    name: 'Jamur Goreng',
    image: _ph,
    price: 10000,
    description: 'Jamur crispy.',
  ),
];

// Kantin H - 14 menu
final List<Menu> _kantinH = [
  Makanan(
    name: 'Nasi Kuning Ayam Suwir',
    image: _ph,
    price: 17000,
    description: 'Nasi kuning dengan ayam suwir.',
  ),
  Makanan(
    name: 'Mie Tek-tek',
    image: _ph,
    price: 14000,
    description: 'Mie tek-tek tradisional.',
  ),
  Makanan(
    name: 'Ayam Goreng Kremes',
    image: _ph,
    price: 19000,
    description: 'Ayam goreng dengan kremes renyah.',
  ),
  Makanan(
    name: 'Gulai Kambing',
    image: _ph,
    price: 26000,
    description: 'Gulai kambing nikmat.',
  ),
  Minuman(
    name: 'Teh Jahe',
    image: _ph,
    price: 9000,
    description: 'Teh jahe hangat.',
  ),
  Minuman(
    name: 'Es Kopi Gula Aren',
    image: _ph,
    price: 14000,
    description: 'Kopi dengan gula aren.',
  ),
  SnackMenu(
    name: 'Onde-onde Wijen',
    image: _ph,
    price: 8000,
    description: 'Onde-onde manis.',
  ),
  SnackMenu(
    name: 'Roti Bakar Keju',
    image: _ph,
    price: 10000,
    description: 'Roti bakar gurih.',
  ),
  SnackMenu(
    name: 'Kue Lumpur',
    image: _ph,
    price: 9000,
    description: 'Kue lumpur enak.',
  ),
  Makanan(
    name: 'Lalapan Komplit',
    image: _ph,
    price: 15000,
    description: 'Lalapan + sambal.',
  ),
  Makanan(
    name: 'Pepes Tahu',
    image: _ph,
    price: 12000,
    description: 'Pepes tahu wangi.',
  ),
  Minuman(
    name: 'Es Cincau Susu',
    image: _ph,
    price: 10000,
    description: 'Cincau segar manis.',
  ),
  SnackMenu(
    name: 'Bakpia Mini',
    image: _ph,
    price: 11000,
    description: 'Bakpia isi kacang.',
  ),
  SnackMenu(
    name: 'Kue Lumpur Cokelat',
    image: _ph,
    price: 9000,
    description: 'Varian cokelat.',
  ),
];

// Kantin I - 20 menu
final List<Menu> _kantinI = [
  Makanan(
    name: 'Nasi Goreng Kambing',
    image: _ph,
    price: 22000,
    description: 'Nasi goreng dengan daging kambing.',
  ),
  Makanan(
    name: 'Mie Kocok',
    image: _ph,
    price: 15000,
    description: 'Mie kocok Bandung.',
  ),
  Makanan(
    name: 'Ikan Bakar Sambal Dabu',
    image: _ph,
    price: 23000,
    description: 'Ikan sambal dabu.',
  ),
  Makanan(
    name: 'Ayam Taliwang Spesial',
    image: _ph,
    price: 21000,
    description: 'Ayam taliwang pedas.',
  ),
  Makanan(
    name: 'Soto Kudus',
    image: _ph,
    price: 14000,
    description: 'Soto khas Kudus.',
  ),
  Minuman(
    name: 'Es Jeruk Nipis',
    image: _ph,
    price: 9000,
    description: 'Jeruk nipis segar.',
  ),
  Minuman(
    name: 'Jus Wortel',
    image: _ph,
    price: 11000,
    description: 'Jus wortel sehat.',
  ),
  Minuman(
    name: 'Kopi Arabika',
    image: _ph,
    price: 16000,
    description: 'Kopi arabika pilihan.',
  ),
  SnackMenu(
    name: 'Poffertjes Cokelat',
    image: _ph,
    price: 10000,
    description: 'Poffertjes manis.',
  ),
  SnackMenu(
    name: 'Donat Keju',
    image: _ph,
    price: 8000,
    description: 'Donat topping keju.',
  ),
  SnackMenu(
    name: 'Risoles Ayam',
    image: _ph,
    price: 8000,
    description: 'Risoles isi ayam.',
  ),
  Makanan(
    name: 'Nasi Pecel Lele',
    image: _ph,
    price: 16000,
    description: 'Pecel + lele goreng.',
  ),
  Makanan(
    name: 'Gulai Ikan',
    image: _ph,
    price: 22000,
    description: 'Ikan dengan kuah gulai.',
  ),
  Makanan(
    name: 'Tengkleng',
    image: _ph,
    price: 24000,
    description: 'Tengkleng kambing empuk.',
  ),
  Minuman(
    name: 'Bandrek Rempah',
    image: _ph,
    price: 9000,
    description: 'Minuman rempah hangat.',
  ),
  Minuman(
    name: 'Es Milo Special',
    image: _ph,
    price: 15000,
    description: 'Es Milo dengan topping.',
  ),
  SnackMenu(
    name: 'Martabak Manis Mini',
    image: _ph,
    price: 13000,
    description: 'Martabak mini varian manis.',
  ),
  SnackMenu(
    name: 'Kue Lapis Legit',
    image: _ph,
    price: 12000,
    description: 'Kue lapis legit.',
  ),
  SnackMenu(
    name: 'Singkong Thailand',
    image: _ph,
    price: 11000,
    description: 'Singkong dengan topping.',
  ),
  SnackMenu(
    name: 'Pisang Nugget',
    image: _ph,
    price: 10000,
    description: 'Pisang nugget crunchy.',
  ),
];

// Kantin J - 10 menu
final List<Menu> _kantinJ = [
  Makanan(
    name: 'Nasi Rawon',
    image: _ph,
    price: 18000,
    description: 'Rawon daging hitam khas Jawa Timur.',
  ),
  Makanan(
    name: 'Tahu Telur',
    image: _ph,
    price: 12000,
    description: 'Tahu telur favorit.',
  ),
  Makanan(
    name: 'Pecel Lele Sambal Terasi',
    image: _ph,
    price: 15000,
    description: 'Lele + sambal terasi.',
  ),
  Minuman(
    name: 'Es Teh Lemon',
    image: _ph,
    price: 8000,
    description: 'Es teh dengan lemon.',
  ),
  Minuman(
    name: 'Kopi Tubruk Manis',
    image: _ph,
    price: 8000,
    description: 'Kopi tubruk gula.',
  ),
  Minuman(
    name: 'Air Mineral',
    image: _ph,
    price: 4000,
    description: 'Air mineral kemasan.',
  ),
  SnackMenu(
    name: 'Roti Bakar Selai',
    image: _ph,
    price: 9000,
    description: 'Roti bakar pilihan selai.',
  ),
  SnackMenu(
    name: 'Kue Lumpur Mini',
    image: _ph,
    price: 8000,
    description: 'Kue lumpur porsi kecil.',
  ),
  SnackMenu(
    name: 'Donat Isi',
    image: _ph,
    price: 7000,
    description: 'Donat berbagai isi.',
  ),
  SnackMenu(
    name: 'Bakwan Mini',
    image: _ph,
    price: 6000,
    description: 'Bakwan renyah.',
  ),
];

// Gabungkan menjadi list kantin statis
final List<Kantin> kantinList = [
  Kantin(name: 'Kantin Bu Dar', image: 'assets/foodcourt.jpg', menus: _kantinA),
  Kantin(
    name: 'Kantin Bu Slamet',
    image: 'assets/kantin1.jpg',
    menus: _kantinB,
  ),
  Kantin(
    name: 'Kantin Pak Harjo',
    image: 'assets/kantin2.jpg',
    menus: _kantinC,
  ),
  Kantin(name: 'Kantin Dina', image: 'assets/kantin3.jpg', menus: _kantinD),
  Kantin(name: 'Kantin Paijo', image: 'assets/kantin4.jpg', menus: _kantinE),
  Kantin(name: 'Kantin F', image: 'assets/kantin5.jpg', menus: _kantinF),
  Kantin(name: 'Kantin G', image: 'assets/kantin6.jpg', menus: _kantinG),
  Kantin(name: 'Kantin H', image: 'assets/kantin7.jpg', menus: _kantinH),
  Kantin(name: 'Kantin I', image: 'assets/kantin8.jpg', menus: _kantinI),
  Kantin(name: 'Kantin J', image: 'assets/kantin9.jpg', menus: _kantinJ),
];

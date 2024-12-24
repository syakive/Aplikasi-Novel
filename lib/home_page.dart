import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NovelList'),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Novel',
                  hintStyle: const TextStyle(color: Colors.black38),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return bookReader(context, book['title']!, book['imagePath']!,
                  book['detail']!, book['synopsis']!);
            },
          ),
        ),
      ),
    );
  }

  Widget bookReader(BuildContext context, String title, String imagePath,
      String detail, String synopsis) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(imagePath,
                width: double.infinity, height: 220, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            title: title,
                            imagePath: imagePath,
                            synopsis: synopsis,
                            recommendedBooks: books,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:
                        const Text('Read Now', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> books = [
  {
    'title': 'Light Novel My Happy Marriage 2',
    'imagePath': '1.jfif',
    'detail': 'Chapter 12',
    'synopsis':
        'Miyo yang dibesarkan dalam penindasan ibu dan adik tirinya, dijodohkan dengan Kiyoka—seorang prajurit yang terkenal dingin dan kejam. Ketika semua orang memperkirakan akhir yang tidak bahagia dari perjodohan mereka, Kiyoka dan Miyo justru tertarik karena kebaikan hati satu sama lain.',
  },
  {
    'title': 'Light Novel: Aku Dimanjakan Tetanggaku yang Seperti Malaikat 1',
    'imagePath': '2.png',
    'detail': 'Chapter 5',
    'synopsis':
        'Ini adalah kisah tentang seorang pemuda yang melangkah maju dan seorang Dewi yang menulis petualangan itu—Familia Myth.',
  },
  {
    'title': 'Light Novel: Apa Salahnya Mencari Cinta di Dungeon?',
    'imagePath': '3.jfif',
    'detail': 'Chapter 8',
    'synopsis':
        'Amane Fujimiya tinggal di sebuah apartemen, tepat di sebelah kamar Mahiru Shiina, gadis tercantik di sekolahnya. Awalnya, mereka tidak pernah berinteraksi. Namun, sejak Amane meminjamkan payungnya kepada Mahiru yang basah kuyup di tengah hujan, hubungan tidak biasa di antara mereka pun dimulai.',
  },
  {
    'title': 'Light Novel The Eminence in Shadow 2',
    'imagePath': '4.jfif',
    'detail': 'chapter 53',
    'synopsis':
        'Cid Kagenou memiliki mimpi yang berbeda dengan protagonis biasa. Ia bertekad untuk menjadi seorang mastermind yang bergerak diam-diam dari balik layar.',
  },
  {
    'title': 'Light Novel Goblin Slayer 1',
    'imagePath': '5.jfif',
    'detail': 'Chapter 93',
    'synopsis':
        'Desas-desus mengenai sosok unik yang meraih peringkat silver dengan hanya menghabisi goblin, terdengar dari sebuah guild di wilayah terpencil.',
  },
  {
    'title': 'Light Novel My Happy Marriage 1',
    'imagePath': '6.jfif',
    'detail': 'Chapter 20',
    'synopsis':
        'My Happy Marriage: Novel ringan ini menjadi karya yang paling terkenal dari Akumi Agitogi. Ceritanya berfokus pada seorang gadis muda yang diperlakukan buruk oleh keluarganya dan kemudian dijodohkan dengan seorang perwira militer yang ternyata memiliki kepribadian yang sangat berbeda dari apa yang ia bayangkan. Novel ini telah diadaptasi menjadi manga dan anime, serta mendapatkan banyak pujian karena plot yang menarik, karakter yang kompleks, dan tema-tema seperti cinta, keluarga, dan penemuan jati diri.',
  },
  {
    'title': 'Light Novel The Rising Shield Hero 01',
    'imagePath': '7.jpg',
    'detail': 'Chapter 76',
    'synopsis':
        'Aneko Yusagi dikenal sebagai penulis light novel Jepang, terutama dikenal sebagai penulis seri "The Rising of the Shield Hero" atau "Tate no Yūsha no Nariagari" yang sangat populer. Karya ini telah mendapatkan popularitas yang sangat besar, baik dalam bentuk novel ringan, manga, maupun anime. Ceritanya yang unik tentang pahlawan perisai yang dianaktirikan dan perjuangannya di dunia lain telah memikat banyak pembaca dan penonton.',
  },
  {
    'title': 'SimvlacrvmA Political-Thriller Novel',
    'imagePath': '8.jpg',
    'detail': 'Chapter 98',
    'synopsis':
        'Simvlacrvm adalah novel thriller politik yang ditulis oleh Cassandra Massardi dan Noorca M. Massardi. Novel ini pertama kali diterbitkan pada tahun 2009 oleh Penerbit Gramedia Pustaka Utama.',
  },
  {
    'title': 'Novel Grafis: Tidak Jatuh Cinta',
    'imagePath': '9.jpg',
    'detail': 'Chapter 542',
    'synopsis':
        'Demas manusia Bumi. Ia punya usaha jualan pernak-pernik unik futuristik. Tiba-tiba ia kedatangan tamu dari planet luar bernama Karmen. Karmen yang jatuh cinta pada Demas kemudian mengajaknya travelling ke luar angkasa. Sementara Demas merasa kebingungan. Ia mengira dirinya sedang halu atau tengah bermimpi atau bahkan sudah mati.',
  },
  {
    'title': 'Novel Watersong',
    'imagePath': '10.jpg',
    'detail': 'Chapter 85',
    'synopsis':
        'Souji Arai melanggar kesepakatan saat menangani klien paling berpengaruh di kedai teh eksklusif tempatnya bekerja. Dia harus meninggalkan Akakawa secepat mungkin demi menyelamatkan hidupnya. Namun, dia tak bisa mengajak Youko bersamanya. Kekasihnya itu tiba-tiba menghilang. Souji melarikan diri ke Tokyo. Dia mencoba memulai hidup baru. Namun, dia kembali dihantui mimpi tentang dirinya yang tenggelam. Dia juga terngiang-ngiang ucapan seorang peramal.',
  },
];

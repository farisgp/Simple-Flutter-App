class FoodData {
  String name;
  String imageAsset;
  String category;
  String description;
  String price;
  double discount;
  double ratings;
  List<String> imageUrls;

  FoodData({
    required this.name,
    required this.imageAsset,
    required this.category,
    required this.price,
    required this.discount,
    required this.ratings,
    required this.description,
    required this.imageUrls,
  });
}

var foodDataList = [
  FoodData(
    name: "Capcay",
    imageAsset: "images/capcay.jpg",
    category: "Dishes",
    description:
        "Capcai or capcay is the name of a typical Chinese-Indonesian dish in the form of many kinds of vegetables cooked by boiling or frying. Capcai was originally a variation of a typical Fujian dish. The name capcai is taken from the Hokkien dialect which literally means \"various vegetables\".",
    price: "Rp. 7000",
    discount: 12.0,
    ratings: 4.2,
    imageUrls: [
      'https://www.masakapahariini.com/wp-content/uploads/2020/10/cap-cay_edited-780x440.jpg',
      'https://asset.kompas.com/crops/D4uBmDZXClMaQKA1X4eTc3Nft4g=/3x0:700x465/750x500/data/photo/2021/04/19/607d551fb3198.jpg',
    ],
  ),
  FoodData(
    name: "Gudeg",
    imageAsset: "images/gudeg.png",
    category: "Dishes",
    description:
        "Gudeg is a special dish from Yogyakarta and Central Java Province made from young jackfruit cooked with coconut milk. It takes hours to make this dish. The brown color is usually produced by teak leaves that are cooked together.",
    price: "Rp. 10000",
    discount: 20.0,
    ratings: 4.9,
    imageUrls: [
      'https://cdns.klimg.com/merdeka.com/i/w/news/2020/11/12/1241924/content_images/670x335/20201112171327-1-ilustrasi-gudeg-004-tantri-setyorini.jpg',
      'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1644823082/uq7svlxmnxcxcitzjkzn.jpg',
    ],
  ),
  FoodData(
    name: "Gulai",
    imageAsset: "images/gulai.jpg",
    category: "Dishes",
    description:
        "Gulai, also known as Gule, is a dish made from chicken meat, various fish, goat, beef, offal, or vegetables such as young jackfruit and cassava leaves, which are processed in a savory spiced sauce.",
    price: "Rp. 15000",
    discount: 15.0,
    ratings: 4.5,
    imageUrls: [
      'https://img-global.cpcdn.com/recipes/b17fa1f033770175/751x532cq70/gulai-ayam-foto-resep-utama.jpg',
      'https://awsimages.detik.net.id/community/media/visual/2021/09/07/resep-gulai-ayam-nanas_43.jpeg?w=1200',
      'https://www.ruparupa.com/blog/wp-content/uploads/2022/02/resep-gulai-ayam-lezat.jpeg'
    ],
  ),
  FoodData(
    name: "Kwetiau",
    imageAsset: "images/kwetiau.jpg",
    category: "Dishes",
    description:
        "Kwetiau is a kind of white Chinese noodles made from rice. Kwetiau is a food that is quite popular in Indonesia, especially in Jakarta and other places where many people of Chinese descent are inhabited. Kwetiau is generally synonymous with ethnic Hokkien Chinese and Tio Ciu",
    price: "Rp. 12000",
    discount: 15.0,
    ratings: 4.3,
    imageUrls: [
      'https://img.inews.co.id/media/822/files/inews_new/2022/01/24/Resep_Kwetiau_Goreng.jpg',
      'https://asset.kompas.com/crops/cDFJALgskhntLiRpX_mscOC9wF8=/0x0:698x465/780x390/data/photo/2020/12/07/5fce3837c4f6d.jpg'
    ],
  ),
  FoodData(
    name: "Nasi Goreng",
    imageAsset: "images/nasi_goreng.jpg",
    category: "Main Course",
    description:
        "Fried rice is a food in the form of fried rice and stirred in cooking oil, margarine, or butter. Usually, sweet soy sauce, shallots, garlic, tamarind, pepper and other spices are added; such as eggs, chicken, and crackers.",
    price: "Rp. 13000",
    discount: 15.0,
    ratings: 4.7,
    imageUrls: [
      'https://asset.kompas.com/crops/riPGK5eD7amHKtv3dFNqioI6IqI=/13x7:700x465/780x390/data/photo/2021/09/24/614dc6865eb24.jpg',
      'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2020/10/07/21656846.jpg'
    ],
  ),
  FoodData(
    name: "Nasi Uduk",
    imageAsset: "images/nasi_uduk.jpg",
    category: "Main Course",
    description:
        "Nasi uduk is a dish made from steamed steamed white rice with coconut milk and seasoned with nutmeg, cinnamon, ginger, lemon grass and pepper. This dish began to be made by residents of the island of Java around 1910-1924 and was popularized by the Dutch East Indies after that.",
    price: "Rp. 15000",
    discount: 15.0,
    ratings: 4.2,
    imageUrls: [
      'https://asset.kompas.com/crops/UAJklFFzp6OLWaRpyllh5H-Jq0A=/0x0:1000x667/780x390/data/photo/2021/02/21/6032066dc88e0.jpg',
      'https://static.promediateknologi.id/crop/0x628:1079x1476/0x0/webp/photo/p2/74/2025/04/24/Screenshot_20250424_225146-2183641739.jpg',
    ],
  ),
  FoodData(
    name: "Pempek",
    imageAsset: "images/pempek.png",
    category: "Snacking",
    description:
        "Pempek or empek-empek is a food made from soft ground fish meat mixed with starch or sago flour, as well as a composition of several other ingredients such as eggs, mashed garlic, flavoring, and salt.",
    price: "Rp. 10000",
    discount: 3.0,
    ratings: 4.3,
    imageUrls: [
      'https://asset.kompas.com/crops/UlNzTgTGP7jQqHkUpgyyGnRAtVE=/92x0:938x564/750x500/data/photo/2020/02/25/5e552581b5371.jpg',
      'https://s2.bukalapak.com/uploads/content_attachment/c93b36cda4399a22fc48ada5/w-740/foto_thumbnail_pempek_2.jpg'
    ],
  ),
  FoodData(
    name: "Rendang",
    imageAsset: "images/rendang.jpg",
    category: "Side Dish",
    description:
        "Rendang or randang in the Minangkabau language is a dish made from native Indonesian meat originating from Minangkabau. This dish is produced from a long low temperature cooking process using various spices and coconut milk.",
    price: "Rp. 17000",
    discount: 3.0,
    ratings: 4.9,
    imageUrls: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9kNnw7DwmWazfEMynhyqfKhxAyWcXI6kwfoN2Gg9U25LgvJPam9Xyg484w4tIiqSXs2M&usqp=CAU',
      'https://img.inews.co.id/media/822/files/inews_new/2021/05/10/IMG_10052021_175604__822_x_430_piksel_.jpg',
      'https://awsimages.detik.net.id/community/media/visual/2021/09/13/rendang.jpeg?w=700&q=90'
    ],
  ),
  FoodData(
    name: "Sate",
    imageAsset: "images/sate.jpg",
    category: "Side Dish",
    description:
        "Sate or satai is a food made from meat that is cut into small pieces and stabbed in such a way with a stick of coconut or bamboo leaf bone, then grilled using wood charcoal coals. Satay is served with a variety of spices depending on the variation of the satay recipe.",
    price: "Rp. 25000",
    discount: 3.0,
    ratings: 4.6,
    imageUrls: [
      'https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/02/Resep-Sate-Ayam-Madura.jpg?fit=1920%2C1804&ssl=1',
      'https://d1sag4ddilekf6.azureedge.net/compressed/merchants/6-C2DHJZJZGLMBTE/hero/f6e6c41bf8eb472489599dae45c781b4_1606745916352654339.jpg'
    ],
  ),
  FoodData(
    name: "Soto Ayam",
    imageAsset: "images/soto_ayam.jpg",
    category: "Dishes",
    description:
        "Soto ayam is a typical Indonesian food in the form of a kind of chicken soup with a yellowish gravy. The yellow color is due to turmeric which is used as a spice. Soto ayam can be found in many areas in Indonesia and Singapore.",
    price: "Rp. 17000",
    discount: 3.0,
    ratings: 4.1,
    imageUrls: [
      'https://asset.kompas.com/crops/p88KvOKRwg7WpvHA1bgtYQ2rOQ8=/0x0:698x465/780x390/data/photo/2022/01/10/61dbc4076c2b3.jpg',
      'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2023/08/03063114/Ini-Resep-Bumbu-Soto-Ayam-Tanpa-Santan-yang-Gurih-dan-Lezat-.jpg.webp'
    ],
  ),
];
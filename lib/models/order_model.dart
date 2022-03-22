class OrderModel {
  final String title;
  final String desc;
  final int ratingStart;
  final String price;
  final String imgUrl;

  OrderModel(
      {required this.title,
      required this.desc,
      required this.ratingStart,
      required this.price,
      required this.imgUrl});
}

List<OrderModel> orders = [
  OrderModel(
    ratingStart: 2,
    desc:
        'The classic Vietnamese pick-me-up combo of rich black coffee and condensed milk is made ready for happy hour with a drop of liqueur.',
    imgUrl:
        'https://img.taste.com.au/CMKReV3_/w720-h480-cfill-q80/taste/2020/05/jun20_vietnamese-iced-coffee-161761-1.jpg',
    price: "\$22",
    title: 'Vietnamese-style iced coffee',
  ),
  OrderModel(
    ratingStart: 3,
    desc:
        'SUZY Anti-Cafe is a novel concept in the crowded cafe scene in the capital and one of the few great choices in BKK3. The cafe offers customers the chance to pay for unlimited snacks and coffees for the time spent in the cafe and is a popular choice among remote workers and digital nomads..',
    imgUrl:
        'https://img.taste.com.au/CMKReV3_/w720-h480-cfill-q80/taste/2020/05/jun20_vietnamese-iced-coffee-161761-1.jpg',
    price: "\$2",
    title: 'Vietnamese-style iced coffee',
  ),
  OrderModel(
    ratingStart: 2,
    desc:
        'The classic Vietnamese pick-me-up combo of rich black coffee and condensed milk is made ready for happy hour with a drop of liqueur.',
    imgUrl:
        'https://img.taste.com.au/CMKReV3_/w720-h480-cfill-q80/taste/2020/05/jun20_vietnamese-iced-coffee-161761-1.jpg',
    price: "\$2",
    title: 'Vietnamese-style iced coffee',
  ),
  OrderModel(
    ratingStart: 3,
    desc:
        'The classic Vietnamese pick-me-up combo of rich black coffee and condensed milk is made ready for happy hour with a drop of liqueur.',
    imgUrl:
        'https://img.taste.com.au/CMKReV3_/w720-h480-cfill-q80/taste/2020/05/jun20_vietnamese-iced-coffee-161761-1.jpg',
    price: "\$2",
    title: 'Vietnamese-style iced coffee',
  ),
  OrderModel(
    ratingStart: 1,
    desc:
        'The classic Vietnamese pick-me-up combo of rich black coffee and condensed milk is made ready for happy hour with a drop of liqueur.',
    imgUrl:
        'https://img.taste.com.au/CMKReV3_/w720-h480-cfill-q80/taste/2020/05/jun20_vietnamese-iced-coffee-161761-1.jpg',
    price: "\$22",
    title: 'Vietnamese-style iced coffee',
  ),
  OrderModel(
    ratingStart: 4,
    desc:
        'The classic Vietnamese pick-me-up combo of rich black coffee and condensed milk is made ready for happy hour with a drop of liqueur.',
    imgUrl:
        'https://img.taste.com.au/CMKReV3_/w720-h480-cfill-q80/taste/2020/05/jun20_vietnamese-iced-coffee-161761-1.jpg',
    price: "\$22",
    title: 'Vietnamese-style iced coffee',
  ),
  OrderModel(
    ratingStart: 3,
    desc:
        'The classic Vietnamese pick-me-up combo of rich black coffee and condensed milk is made ready for happy hour with a drop of liqueur.',
    imgUrl:
        'https://img.taste.com.au/CMKReV3_/w720-h480-cfill-q80/taste/2020/05/jun20_vietnamese-iced-coffee-161761-1.jpg',
    price: "\$22",
    title: 'Vietnamese-style iced coffee',
  ),
  OrderModel(
    ratingStart: 3,
    desc:
        'The classic Vietnamese pick-me-up combo of rich black coffee and condensed milk is made ready for happy hour with a drop of liqueur.',
    imgUrl:
        'https://img.taste.com.au/CMKReV3_/w720-h480-cfill-q80/taste/2020/05/jun20_vietnamese-iced-coffee-161761-1.jpg',
    price: "\$3",
    title: 'Vietnamese-style iced coffee',
  ),
];

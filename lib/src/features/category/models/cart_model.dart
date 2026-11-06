class Cartmodel {
  final String image;
  final String title;
  final double price;
  final String id;
   int qty;
   Cartmodel({
    required this.image,
    required this.price,
    required this.title,
    required this.id,
    this.qty= 1,

  });
  double get lineTotal =>price * qty;
}
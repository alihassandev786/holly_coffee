class Toreviewmodel {
  final String id;
  final String title;
  final String category;
  final int qty;
  final String image;
  const Toreviewmodel({
    required this.image,
    required this.id,
    required this.title,
    this.category = "",
    this.qty = 1,
  });
}

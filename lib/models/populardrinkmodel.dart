class Populardrinkmodel {
  final String name;
  final String image;
  final double price;
  final String categoryId;
  final double? divinePrice;
  const Populardrinkmodel({
    required this.image,
    this.divinePrice,
    required this.name,
    this.categoryId = "",
    required this.price,
  });
}

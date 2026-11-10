enum Ordertype {delivery, pickup}
enum OrderStatus{ontheway, readytopickup, completed}
class OrderModel {
  final String id;
  final String title;
  final double price;
  final int itemscount;
  final Ordertype type;
  final OrderStatus status;
  final String? estimatedtime;
  final String imageUrl;
  OrderModel({
    required this.title,
    required this.id,
    required this.price,
    required this.itemscount,
    required this.type,
    required this.status,
    required this.imageUrl,
    this.estimatedtime

  });
}
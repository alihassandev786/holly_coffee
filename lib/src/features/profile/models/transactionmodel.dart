class Transactionmodel {
  final String title;
  final String date;
  final double amount;
  final bool isIncoming;
  const Transactionmodel({
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncoming
  });
}
class ItemsOrdered {
  final String itemName;
  final int itemQuantity;
  final double itemRate;
  bool? isRefund;

  ItemsOrdered({
    required this.itemName,
    required this.itemQuantity,
    required this.itemRate,
    this.isRefund = false,
  });
}

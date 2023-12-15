class Ordermodel{
  final String useId,orderdate;
  final String orderId,paymetId;
  final List<dynamic> items;
  final int orderprice;
  final bool status;
  Ordermodel( {
    required this.orderId,
    required this.useId,
    required this.items,
    required this.orderprice,
    required this.orderdate,
    required this.paymetId,
    required this.status,
  });
}
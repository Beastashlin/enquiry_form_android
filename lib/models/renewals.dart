// ignore_for_file: file_names

class Renewals {
  final int id;
  final int adminId;
  final int categoryId;
  final int productId;
  final String dtRegister;
  final String dtExpiry;
  final int partyId;
  final int quantity;
  final int rate;
  final int tax;
  final String taxType;
  final int totalAmount;
  final int accountId;
  final int dealerId;
  final String remarks;
  final String status;
  final String type;
  final String isDeleted;

  Renewals({
    required this.id,
    required this.adminId,
    required this.categoryId,
    required this.productId,
    required this.dtRegister,
    required this.dtExpiry,
    required this.partyId,
    required this.quantity,
    required this.rate,
    required this.tax,
    required this.taxType,
    required this.totalAmount,
    required this.accountId,
    required this.dealerId,
    required this.remarks,
    required this.status,
    required this.type,
    required this.isDeleted,
  });
}

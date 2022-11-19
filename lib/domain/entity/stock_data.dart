import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_data.freezed.dart';
part 'stock_data.g.dart';

@freezed
class StockData with _$StockData {
  const factory StockData({
    required String name,
    required String pricePerStock,
    required String price,
    required double change,
    required String imageURL,
  }) = _StockData;

  factory StockData.fromJson(Map<String, Object?> json) =>
      _$StockDataFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StockData _$$_StockDataFromJson(Map<String, dynamic> json) => _$_StockData(
      name: json['name'] as String,
      pricePerStock: json['pricePerStock'] as String,
      price: json['price'] as String,
      change: (json['change'] as num).toDouble(),
      imageURL: json['imageURL'] as String,
    );

Map<String, dynamic> _$$_StockDataToJson(_$_StockData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pricePerStock': instance.pricePerStock,
      'price': instance.price,
      'change': instance.change,
      'imageURL': instance.imageURL,
    };

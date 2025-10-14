import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';
@JsonSerializable()
class ApiEorrModel{
final String meesage;
final int statusCode;
ApiEorrModel({required this.meesage,required this.statusCode});
factory ApiEorrModel.fromJson(Map<String,dynamic>json)=>_$ApiEorrModelFromJson(json);
Map<String,dynamic>toJson()=>_$ApiEorrModelToJson(this);
}
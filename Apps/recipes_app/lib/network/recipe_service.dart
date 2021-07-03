// import 'package:http/http.dart'
import 'package:chopper/chopper.dart';
import 'model_converter.dart';
import 'model_response.dart';
import 'recipe_model.dart';
import 'service_interface.dart';

part 'recipe_service.chopper.dart';

const String APIKEY = '26cb653a262cf31d8a3cd40a1fa695cc';
const String APIID = '54f70d26';
const String APIURL = 'https://api.edamam.com';

@ChopperApi()
abstract class RecipeService extends ChopperService
    implements ServiceInterface {
  static RecipeService create() {
    final client = ChopperClient(
        baseUrl: APIURL,
        interceptors: [_addQuery, HttpLoggingInterceptor()],
        converter: ModelConverter(),
        errorConverter: const JsonConverter(),
        services: [
          _$RecipeService(),
        ]);
    return _$RecipeService(client);
  }

  @override
  @Get(path: 'search')
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      @Query('q') String query, @Query('from') int from, @Query('to') int to);
}

Request _addQuery(Request request) {
  final params = Map<String, dynamic>.from(request.parameters);
  params['app_id'] = APIID;
  params['app_key'] = APIKEY;
  return request.copyWith(parameters: params);
}

// Future getData(String url) async {
//   print('Calling url : $url');
//   final response = await get(url);
//   if (response.statusCode == 200)
//     return response.body;
//   else
//     print(response.statusCode);
// }

// class RecipeService {
//   Future<dynamic> getRecipes(String query, int from, int to) async {
//     final recipeData = await getData(
//         '$APIURL?app_id=$APIID&app_key=$APIKEY&q=$query&from=$from&to=$to');
//     return recipeData;
//   }
// }

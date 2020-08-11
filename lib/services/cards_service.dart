import 'dart:convert';
import 'package:appcards/models/Card.dart';
import 'package:dio/dio.dart';


class CardsService {

Future<List<AppCard>> getAll() async {
List<AppCard> retorno;
try{
    var dio = Dio(BaseOptions(baseUrl:'https://api-cards-growdev.herokuapp.com'));
    var resposta  = await dio.get('/cards');
    if(resposta.statusCode >= 200 && resposta.statusCode < 300){
      List lista = resposta.data;
      retorno = <AppCard>[];
      lista.forEach((element) => retorno.add(AppCard.fromMap(element)));     
    }
  } on DioError catch(e){
    print('***Não foi possível chegar ao servidor.');
  }catch (e){
    print('***Houve um problema no processamento.'); 
  }
  return retorno;
}

Future<List<AppCard>> getById(int id) async {
List<AppCard> retorno;
 try{ 
  var dio = Dio(BaseOptions(baseUrl:'https://api-cards-growdev.herokuapp.com'));
  var resposta  = await dio.get('/cards/$id');
  if(resposta.statusCode >= 200 && resposta.statusCode < 300){
    if(resposta.data['error'] == null){
      retorno = <AppCard>[];
      retorno.add(AppCard.fromMap(resposta.data));
    }
  }
 }on DioError {
    print('***Não foi possível chegar ao servidor.');
  } catch (e){
    print('***Houve um problema no processamento.'); 
  }
  return retorno;
}

Future<List<AppCard>> delete(int id) async {
  List<AppCard> retorno;
 try{ 
  var dio = Dio(BaseOptions(baseUrl:'https://api-cards-growdev.herokuapp.com'));
  var resposta  = await dio.delete('/cards/$id');
  if(resposta.statusCode >= 200 && resposta.statusCode < 300){
    if(resposta.data is List){
       retorno = <AppCard>[];
    }
   }
    }on DioError {
    print('***Não foi possível chegar ao servidor.');
  } catch (e){
    print('***Houve um problema no processamento.'); 
  }
    return retorno;
  }

Future<List<AppCard>> insert(AppCard card) async{
    List<AppCard> retorno;
    
    try{
    var dados = jsonEncode(card.toMap());
    var dio = Dio(BaseOptions(baseUrl:'https://api-cards-growdev.herokuapp.com'));
    var resposta  = await dio.post('/cards',data: dados);
      if(resposta.statusCode >= 200 && resposta.statusCode < 300){
        if(resposta.data['error'] == null){
           retorno = <AppCard>[];
           retorno.add(AppCard.fromMap(resposta.data));
        }
      }
    }on DioError {
    print('***Não foi possível chegar ao servidor.');
  } catch (e){
    print('***Houve um problema no processamento.'); 
  }  
      return retorno;
  }


Future<List<AppCard>> update(AppCard card) async{
    List<AppCard> retorno;
 try{   
    var dados = jsonEncode(card.toMap());
    var dio = Dio(BaseOptions(baseUrl:'https://api-cards-growdev.herokuapp.com'));
    var resposta  = await dio.put('/cards/${card.id}',data: dados);
    if(resposta.statusCode >= 200 && resposta.statusCode < 300){
       retorno = <AppCard>[];
       retorno.add(AppCard.fromMap(resposta.data));
      }
    }on DioError {
    print('***Não foi possível chegar ao servidor.');
  } catch (e){
    print('***Houve um problema no processamento.'); 
  }
  return retorno;
}

    
 }





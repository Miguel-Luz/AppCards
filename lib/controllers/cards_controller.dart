import 'package:appcards/services/cards_service.dart';
import 'package:appcards/models/card.dart';
import 'package:mobx/mobx.dart';
part 'cards_controller.g.dart';

class CardsController = _CardsControllerBase with _$CardsController;

abstract class _CardsControllerBase with Store {
  final _cardsService = CardsService();
  
    
  
  @observable
  List<AppCard> _cards = [];
  
  @action
  void setCards(){
     _cardsService.getAll().then((value) => _cards = value);
   }

  @computed
  get cards =>_cards ;
}
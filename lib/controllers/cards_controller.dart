import 'package:appcards/services/cards_service.dart';
import 'package:appcards/models/card.dart';
import 'package:mobx/mobx.dart';
part 'cards_controller.g.dart';

class CardsController = _CardsControllerBase with _$CardsController;

abstract class _CardsControllerBase with Store {
  final _cardsService = CardsService();
   
  @observable
  ObservableList<AppCard> _cards = ObservableList.of([]);
  
  @action
  void setListCards(){
     _cardsService.getAll().then((value) => _cards = value.asObservable());
   }

  @computed
  get cards =>_cards ;


void deleteCard(int id){
  _cardsService.delete(id).then((value) => setListCards());
}

void updateCard(AppCard card){
  _cardsService.update(card).then((value) => setListCards());
}

void insertCard(AppCard card){
   _cardsService.insert(card).then((value) => setListCards());
 }
}
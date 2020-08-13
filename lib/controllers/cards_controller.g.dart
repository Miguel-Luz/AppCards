// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardsController on _CardsControllerBase, Store {
  Computed<dynamic> _$cardsComputed;

  @override
  dynamic get cards => (_$cardsComputed ??= Computed<dynamic>(() => super.cards,
          name: '_CardsControllerBase.cards'))
      .value;

  final _$_cardsAtom = Atom(name: '_CardsControllerBase._cards');

  @override
  List<AppCard> get _cards {
    _$_cardsAtom.reportRead();
    return super._cards;
  }

  @override
  set _cards(List<AppCard> value) {
    _$_cardsAtom.reportWrite(value, super._cards, () {
      super._cards = value;
    });
  }

  final _$_CardsControllerBaseActionController =
      ActionController(name: '_CardsControllerBase');

  @override
  void setCards() {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.setCards');
    try {
      return super.setCards();
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cards: ${cards}
    ''';
  }
}

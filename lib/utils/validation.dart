class  Validation {

  static String isRequired(String value){
  String returnValue;
  if(value.trim().length == 0){
    returnValue = 'Este campo é obrigatório'; 
  }
   return returnValue;
 } 
}




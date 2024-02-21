mixin FormMixins{
  String? validateTextField(String? text){
    if(text!=null && text.isNotEmpty){
      return null;
    }else{
      return "This field cannot be empty";
    }
  }

  String? validateEmailTextField(String? text){
    if(text!=null && text.isNotEmpty){
      return null;
    }else{
      return "This field cannot be empty";
    }
  }

  String? validateMobileTextField(String? text){
    if(text!=null && text.isNotEmpty){
      return null;
    }else{
      return "This field cannot be empty";
    }
  }

}
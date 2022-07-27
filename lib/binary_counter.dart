library binary_counter;

import 'dart:math';

String generateRandomBinaryNumber({
  required int length,
}){
  if(length < 1){
    throw "Length must be greater than 0";
  }else{
    String binaryResult = "";
    for(int i = 0; i < length; i++){
      Random random = Random();
      binaryResult += random.nextInt(2).toString();
    }
    return binaryResult;
  }
}
//Binary addition
String binaryAddition({
  required String binaryNumber1,
  required String binaryNumber2,
}){
  String result = "";
  if(binaryNumber1.length == binaryNumber2.length){
    //Do nothing
  }else if(binaryNumber1.length < binaryNumber2.length){
    int difference = binaryNumber2.length - binaryNumber1.length;
    for(int i = 0; i < difference; i++){
      binaryNumber1 = "0$binaryNumber1";
    }
  }else if(binaryNumber1.length > binaryNumber2.length){
    int difference = binaryNumber1.length - binaryNumber2.length;
    for(int i = 0; i < difference; i++){
      binaryNumber2 = "0$binaryNumber2";
    }
  }else{
    //Nothing goes here
  }
  bool carryOne = false;
  //Add the two numbers
  for(int i = binaryNumber1.length - 1; 0 <= i; i--){
    String bin1 = binaryNumber1.substring(i,i+1);
    String bin2 = binaryNumber2.substring(i,i+1);
    if(bin1 == "1" && bin2 == "1" && carryOne){
      result = "1$result";
      carryOne = true;
    }else if(bin1 == "1" && bin2 == "1" && carryOne == false){
      result = "0$result";
      carryOne = true;
    }else if(((bin1 == "1" && bin2 == "0") || (bin2 == "1" && bin1 == "0")) && carryOne == false){
      result = "1$result";
      carryOne = false;
    }else if(((bin1 == "1" && bin2 == "0") || (bin2 == "1" && bin1 == "0")) && carryOne){
      result = "0$result";
      carryOne = true;
    }else{
      //Both are 0
      result = "0$result";
      carryOne = false;
    }
  }
  //If there is a carry one on the end add 1
  if(carryOne){
    result = "1$result";
  }
  //return the result
  return result;
}
//TODO: Binary Subtraction
String binarySubtraction({
  required String binaryNumber,
  required String binaryAmountToSubtract,
}){
  String result = "";
  if(binaryAmountToSubtract.length > binaryNumber.length){
    throw "Binary amount to subtract cannot be greater than the binary number";
  }else{
    //Fill in with zeroes
    int difference = binaryNumber.length - binaryAmountToSubtract.length;
    for(int i = 0; i < difference; i++){
      binaryAmountToSubtract = "0$binaryAmountToSubtract";
    }
    if(binaryNumber.indexOf("1") > binaryAmountToSubtract.indexOf("1")){
      throw "Binary amount to subtract cannot be greater than the binary number";
    }
  }
  //TODO: Perform the binary subtraction
  for(int i = binaryNumber.length - 1; 0 <= i; i--){
    String bin1 = binaryNumber.substring(i,i+1);
    String bin2 = binaryAmountToSubtract.substring(i,i+1);
    if(int.parse(bin1) >= int.parse(bin2)){
      int operationResult = int.parse(bin1) - int.parse(bin2);
      result = "$operationResult$result";
    }else{
      //TODO: Borrow from the left
      int indexOf1 = i;
      bool foundA1 = false;
      List<String> allValues = binaryNumber.split("");
      do{
        foundA1 = allValues[indexOf1] == "1";
        if(foundA1 == false){
          indexOf1--;
        }
      }while(foundA1 == false);
      //TODO: Make all values to the right 1
      allValues[indexOf1] = "0";
      for(int o = indexOf1 + 1; o <= i; o++){
        allValues[o] = "1";
      }
      binaryNumber = allValues.join("");
      result = "1$result";
    }
  }
  return result;
}
//TODO: Binary Multiplication

//TODO: Binary Division

//TODO: Binary to DEC
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
//TODO: Fix Binary addition
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
    int parsedBin1 = int.parse(bin1);
    int parsedBin2 = int.parse(bin2);
    int sum = parsedBin1 + parsedBin2;
    if(sum == 0 && carryOne == false){
      result = "0$result";
    }else if(sum == 0 && carryOne == true){
      result = "1$result";
      carryOne = false;
    }else if(sum == 1 && carryOne == false){
      result = "1$result";
      carryOne = false;
    }else if(sum == 1 && carryOne == true){
      result = "0$result";
      carryOne = true;
    }else if(sum == 2 && carryOne == false){
      result = "0$result";
      carryOne = true;
    }else if(sum == 2 && carryOne == true){
      result = "1$result";
      carryOne = true;
    }else{
      print("This wasn't catched: $sum");
      print(carryOne);
      print("-----------------------");
    }
  }
  //If there is a carry one on the end add 1
  if(carryOne){
    result = "1$result";
  }
  //return the result
  return result;
}
//Binary Subtraction
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
  //Perform the binary subtraction
  for(int i = binaryNumber.length - 1; 0 <= i; i--){
    String bin1 = binaryNumber.substring(i,i+1);
    String bin2 = binaryAmountToSubtract.substring(i,i+1);
    if(int.parse(bin1) >= int.parse(bin2)){
      int operationResult = int.parse(bin1) - int.parse(bin2);
      result = "$operationResult$result";
    }else{
      //Borrow from the left
      int indexOf1 = i;
      bool foundA1 = false;
      List<String> allValues = binaryNumber.split("");
      do{
        foundA1 = allValues[indexOf1] == "1";
        if(foundA1 == false && indexOf1 != 0){
          indexOf1--;
        }
      }while(foundA1 == false && indexOf1 != 0);
      //Make all values to the right 1
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
String binaryMultiplication({
  ///Number to multiply
  required String binaryNumber,
  ///Times it will be multiplied by
  required String times,
}){
  String result = "";
  for(int i = times.length - 1; 0 <= i; i--){
    String thisStepsResult = "";
    String bin1 = times.substring(i,i+1);
    int parsedBin1 = int.parse(bin1);
    //Add the necessary zeroes to the right of the number
    for(int p = 0; p <= i; p++){
      thisStepsResult += "0";
    }
    //Multiply
    for(int e = binaryNumber.length - 1; 0 <= e; e--){
      String bin2 = binaryNumber.substring(e,e+1);
      int parsedBin2 = int.parse(bin2);
      //print("$parsedBin1 * $parsedBin2 = ${parsedBin1 * parsedBin2}");
      if(parsedBin1 * parsedBin2 == 1){
        thisStepsResult = "1$thisStepsResult";
      }else{
        thisStepsResult = "0$thisStepsResult";
      }
    }
    //print(thisStepsResult);
    //Add the result
    result = binaryAddition(
      binaryNumber1: result, 
      binaryNumber2: thisStepsResult,
    );
  }
  //Remove unecessary zeroes
  if(result.startsWith("0") && result.length > 1){
    result = result.substring(1);
  }
  return result;
}
//TODO: Binary Division

//TODO: Binary to DEC
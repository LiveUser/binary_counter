import 'package:binary_counter/binary_counter.dart';
import 'package:test/test.dart';
import 'package:number_system/number_system.dart';

void main() {
  test("Random binary number", (){
    print(generateRandomBinaryNumber(
      length: 128,
    ));
  });
  test("Binary addition", (){
    String binaryNumber = "0";
    for(int i = 0; i < 10; i++){
      binaryNumber = binaryAddition(
        binaryNumber1: binaryNumber, 
        binaryNumber2: "1",
      );
      print(binaryNumber.binaryToDec());
    }
  });
  test("Binary subtraction", (){
    String binaryNumber = "1100100";
    for(int i = 0; i < 20; i++){
      binaryNumber = binarySubtraction(
        binaryNumber: binaryNumber, 
        binaryAmountToSubtract: "101",
      );
      print(binaryNumber.binaryToDec());
    }
  });
  test("Binary multiplication", ((){
    String result = binaryMultiplication(binaryNumber: "10", times: "10");
    print(result);
  }));
}
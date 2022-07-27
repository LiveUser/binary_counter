import 'package:binary_counter/binary_counter.dart';
import 'package:test/test.dart';

void main() {
  test("Random binary number", (){
    print(generateRandomBinaryNumber(
      length: 128,
    ));
  });
  test("Binary addition", (){
    print(binaryAddition(
      binaryNumber1: "0101", 
      binaryNumber2: "1111",
    ));
  });
  test("Binary subtraction", (){
    print(binarySubtraction(
      binaryNumber: "11001010", 
      binaryAmountToSubtract: "10011011",
    ));
  });
}

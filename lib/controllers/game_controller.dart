import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  var isGameOwn = false.obs;
  var isDarkTheme = false.obs;
  var randomPattern = <String>["5", "×", "2", "+", "9"].obs;
  var result = 0.obs;
  var userPattern = <String?>[null, null, null, null, null].obs;
  var roun1UserPattern = <String?>[null, null, null, null, null].obs;
  var roun2UserPattern = <String?>[null, null, null, null, null].obs;
  var roun3UserPattern = <String?>[null, null, null, null, null].obs;
  var roun4UserPattern = <String?>[null, null, null, null, null].obs;
  var round1Color = <Color>[
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ].obs;
  var round2Color = <Color>[
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ].obs;
  var round3Color = <Color>[
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ].obs;
  var round4Color = <Color>[
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ].obs;
  var round = 1.obs;

  int isPartOfPattern(List<String> pattern, List<String?> myStrings) {
    for (int i = 0; i < pattern.length; i++) {
      if (myStrings[i] == null) return -1;
      if (pattern[i] == myStrings[i]) {
        return i;
      }
    }
    return -1;
  }

  bool isCorrectPosition(String myString1, String myString2) {
    return myString1 == myString2;
  }

  Color selectColor(bool isCorrectPosition, bool isPartOfPattern) {
    if (isCorrectPosition) return Colors.green;
    if (isPartOfPattern) return Colors.orange;
    return Colors.red;
  }

  enterNumber(int currentRound, String userInput) {
    if (currentRound == 1) {
      for (int i = 0; i < roun1UserPattern.length; i++) {
        if (roun1UserPattern[i] == null) {
          roun1UserPattern[i] = userInput;
          break;
        }
      }
    } else if (currentRound == 2) {
      for (int i = 0; i < roun2UserPattern.length; i++) {
        if (roun2UserPattern[i] == null) {
          roun2UserPattern[i] = userInput;
          break;
        }
      }
    } else if (currentRound == 3) {
      for (int i = 0; i < roun3UserPattern.length; i++) {
        if (roun3UserPattern[i] == null) {
          roun3UserPattern[i] = userInput;
          break;
        }
      }
    } else if (currentRound == 4) {
      for (int i = 0; i < roun4UserPattern.length; i++) {
        if (roun4UserPattern[i] == null) {
          roun4UserPattern[i] = userInput;
          break;
        }
      }
    }
  }

  removeNumber(int currentRound) {
    if (currentRound == 1) {
      for (int i = roun1UserPattern.length - 1; i >= 0; i--) {
        if (roun1UserPattern[i] != null) {
          roun1UserPattern[i] = null;
          break;
        }
      }
    } else if (currentRound == 2) {
      for (int i = roun2UserPattern.length - 1; i >= 0; i--) {
        if (roun2UserPattern[i] != null) {
          roun2UserPattern[i] = null;
          break;
        }
      }
    } else if (currentRound == 3) {
      for (int i = roun3UserPattern.length - 1; i >= 0; i--) {
        if (roun3UserPattern[i] != null) {
          roun3UserPattern[i] = null;
          break;
        }
      }
    } else if (currentRound == 4) {
      for (int i = roun4UserPattern.length - 1; i >= 0; i--) {
        if (roun4UserPattern[i] != null) {
          roun4UserPattern[i] = null;
          break;
        }
      }
    }
  }

  bool isMathGenius(
      List<String?> userEnteredPattern, List<String> myGeneratedPattern) {
    for (int i = 0; i < userEnteredPattern.length; i++) {
      if (userEnteredPattern[i] != myGeneratedPattern[i]) {
        return false;
      }
    }
    isGameOwn.value = true;
    return true;
  }

  void giveResult(
      int gameRound, List<String> gamePattern, List<String?> publicPattern) {
    if (gameRound == 1) {
      List<bool> isOnceCalculated =
          List.generate(gamePattern.length, (index) => false);
      for (int i = 0; i < gamePattern.length; i++) {
        if (gamePattern[i] == publicPattern[i]) {
          round1Color[i] = Colors.green;
          isOnceCalculated[i] = true;
        }
      }
      for (int i = 0; i < publicPattern.length; i++) {
        for (int j = 0; j < gamePattern.length; j++) {
          if (publicPattern[i] == gamePattern[j] &&
              i != j &&
              !isOnceCalculated[j]) {
            round1Color[i] = Colors.orange;
          }
        }
      }
    } else if (gameRound == 2) {
      List<bool> isOnceCalculated =
          List.generate(gamePattern.length, (index) => false);
      for (int i = 0; i < gamePattern.length; i++) {
        if (gamePattern[i] == publicPattern[i]) {
          round2Color[i] = Colors.green;
          isOnceCalculated[i] = true;
        }
      }
      for (int i = 0; i < publicPattern.length; i++) {
        for (int j = 0; j < gamePattern.length; j++) {
          if (publicPattern[i] == gamePattern[j] &&
              i != j &&
              !isOnceCalculated[j]) {
            round2Color[i] = Colors.orange;
          }
        }
      }
    } else if (gameRound == 3) {
      List<bool> isOnceCalculated =
          List.generate(gamePattern.length, (index) => false);
      for (int i = 0; i < gamePattern.length; i++) {
        if (gamePattern[i] == publicPattern[i]) {
          round3Color[i] = Colors.green;
          isOnceCalculated[i] = true;
        }
      }
      for (int i = 0; i < publicPattern.length; i++) {
        for (int j = 0; j < gamePattern.length; j++) {
          if (publicPattern[i] == gamePattern[j] &&
              i != j &&
              !isOnceCalculated[j]) {
            round3Color[i] = Colors.orange;
          }
        }
      }
    }
  }

  bool isValidPattern(List<String?> myEnterPattern) {
    for (int i = 0; i < myEnterPattern.length; i++) {
      if (myEnterPattern[i] == null) return false;
    }
    return true;
  }

  @override
  void onInit() {
    var r = Random();
    List<String> mathSigns = [
      "+",
      "×",
      "-",
      "÷",
    ];
    var rs = Random();
    randomPattern.value = [
      r.nextInt(9).toString(),
      mathSigns[rs.nextInt(3)],
      r.nextInt(9).toString(),
      mathSigns[rs.nextInt(3)],
      r.nextInt(9).toString()
    ];

    super.onInit();
  }
}


/*

 if (gameController.round.value == 1) {
                        } else if (gameController.round.value == 1) {
                          gameController.enterNumber(2, "1");
                        } else if (gameController.round.value == 3) {
                          gameController.enterNumber(3, "1");
                        } else if (gameController.round.value == 4) {
                          gameController.enterNumber(4, "1");
                        }

                        1. eqation correct position
                        2. !equation 
                        3. equation wrong position
 */




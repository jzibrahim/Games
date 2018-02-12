import 'dart:math';

class WordsService {
  Random random = new Random();

  Map<Level, List<String>> words = {
    Level.LEVEL_1: ["bat", "cat", "fat", "hat", "mat", "pat", "rat", "sat"],
    Level.LEVEL_2: [
      "cap",
      "gap",
      "hap",
      "lap",
      "map",
      "nap",
      "rap",
      "sap",
      "tap",
      "zap"
    ],
    Level.LEVEL_3: [
      "bet",
      "get",
      "jet",
      "let",
      "met",
      "net",
      "pet",
      "set",
      "vet"
    ],
    Level.LEVEL_4: ["bit", "hit", "kit", "lit", "nit", "pit", "sit", "zit"],
    Level.LEVEL_5: [
      "bat",
      "cat",
      "fat",
      "hat",
      "mat",
      "pat",
      "rat",
      "sat",
      "cap",
      "gap",
      "hap",
      "lap",
      "map",
      "nap",
      "rap",
      "sap",
      "tap",
      "zap",
      "bet",
      "get",
      "jet",
      "cab",
      "let",
      "met",
      "net",
      "pet",
      "set",
      "vet",
      "vet",
      "bit",
      "hit",
      "sip",
      "nip",
      "not",
      "mop",
      "nut",
      "cut",
      "put",
      "but",
      "sut",
      "rut",
      "dot",
      "got",
      "pot",
      "bot",
      "cot",
      "hot",
      "zip",
      "jot",
      "lot",
      "rot",
      "tot",
      "kit",
      "lit",
      "nit",
      "pit",
      "sit",
      "dip",
      "eat",
      "pop",
      "zit",
      "wet",
      "wed"
    ]
  };

  String getRandomWord(Level level) =>
      words[level][random.nextInt(words[level].length)];

  String getRandomWordGivenPreviousWord(
      Level level, int letterPosition, String previousWord) {
    List<String> levelWords = words[level];
    String randomWord;
    int numTries = 0;
    if (letterPosition == 0) {
      String unchangingLetters = previousWord.substring(1, 3);
      do {
        numTries++;
        randomWord = levelWords[random.nextInt(levelWords.length)];
        if (randomWord != previousWord &&
            randomWord.endsWith(unchangingLetters)) {
          return randomWord;
        }
      } while (randomWord != previousWord && numTries < levelWords.length * 2);
      return previousWord;
    } else if (letterPosition == 1) {
      String unchangingLetterBefore = previousWord.substring(0, 1);
      String unchangingLetterAfter = previousWord.substring(2, 3);
      do {
        randomWord = levelWords[random.nextInt(levelWords.length)];
        if (randomWord != previousWord &&
            randomWord.startsWith(unchangingLetterBefore) &&
            randomWord.endsWith(unchangingLetterAfter)) {
          return randomWord;
        }
      } while (randomWord != previousWord && numTries < levelWords.length * 2);
      return previousWord;
    } else {
      String unchangingLetters = previousWord.substring(0, 2);
      do {
        randomWord = levelWords[random.nextInt(levelWords.length)];
        if (randomWord != previousWord &&
            randomWord.startsWith(unchangingLetters)) {
          return randomWord;
        }
      } while (randomWord != previousWord && numTries < levelWords.length * 2);
      return previousWord;
    }
  }
}

enum Level { LEVEL_1, LEVEL_2, LEVEL_3, LEVEL_4, LEVEL_5 }

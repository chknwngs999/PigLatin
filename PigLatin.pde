public void setup() 
{
  String[] lines = loadStrings("LowellHymn.txt");
  System.out.println("there are " + lines.length + " lines");
  /*
        part 1
   for (int i = 0 ; i < lines.length; i++) {
   System.out.println(pigLatin(lines[i]));
   }*/
  for (int i = 0; i < lines.length; i++) {
    String printline = "";
    lines[i] = lines[i].trim();
    char lastchr = lines[i].charAt(lines[i].length()-1);

    if (!(Character.isLetter(lastchr))) {
      lines[i] = lines[i].substring(0, lines[i].length()-1);
    }

    String[] words = lines[i].split(" ");
    for (int j = 0; j < words.length; j++) {
      printline = printline + pigLatin(words[j]) + " ";
    }

    printline = printline.trim();
    if (!(Character.isAlphabetic(lastchr))) {
      printline = printline + lastchr;
    }
    System.out.println(printline);
  }
}

public void draw()
{
  //not used
}

public int findFirstVowel(String sWord)
  //precondition: sWord is a valid String of length greater than 0.
  //postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  for (int i = 0; i < sWord.length(); i++) {
    if (sWord.charAt(i) == 'a' || sWord.charAt(i) == 'e' || sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o' || sWord.charAt(i) == 'u')
      return i;
  }
  return -1;
}

public String pigLatin(String sWord)
  //precondition: sWord is a valid String of length greater than 0
  //postcondition: returns the pig latin equivalent of sWord
{
  String result = "";
  int vowelindex = findFirstVowel(sWord.toLowerCase());
  boolean isupper = Character.isUpperCase(sWord.charAt(0));

  if (vowelindex == -1) {
    result = sWord + "ay";
  } else if (vowelindex == 0) {
    result = sWord + "way";
  } else if (sWord.substring(0, 2).equals("qu")) {
    result = sWord.substring(2) + sWord.substring(0, 2).toLowerCase() + "ay";
  } else {
    result = sWord.substring(vowelindex) + sWord.substring(0, vowelindex).toLowerCase() + "ay";
  }
  if (isupper)
    result = result.substring(0, 1).toUpperCase() + result.substring(1);
  return result;
}

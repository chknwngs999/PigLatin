public void setup() 
{
  String[] lines = loadStrings("words.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) 
  {
    System.out.println(pigLatin(lines[i]));
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
  if (vowelindex == -1) {
    result = sWord + "ay";
  } else if (vowelindex == 0) {
    result = sWord + "way";
  } else if (sWord.substring(0, 2).equals("qu")) {
    result = sWord.substring(2) + sWord.substring(0, 2).toLowerCase() + "ay";
  } else {
    result = sWord.substring(vowelindex) + sWord.substring(0, vowelindex).toLowerCase() + "ay";
  }
  return result;
}

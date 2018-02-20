/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * setting the colors  * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// choose color by choosing a bird
String chooseColor(float n) {
  String result = "";
  if (n < 25) {
    result = "cardinal";
  } else if (n >= 25 && n < 50) {
    result = "bluejay";
  } else if (n >= 50 && n < 75) {
    result = "crow";
  } else {
    result = "parrot";
  }
  return result;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// create color scheme according to which bird
void setColor(String str) {
  if (str.equals("cardinal")) {
    createCardinalColors();
  } else if (str.equals("bluejay")) {
    createBluejayColors();
  } else if (str.equals("crow")) {
    createCrowColors();
  } else {
    createParrotColors();
  }
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// create rgb
void createRGB(String str) {
  int[] value = colorMap.get(str);
  int r = value[0];
  int g = value[1];
  int b = value[2];
  fill(r, g, b);
}
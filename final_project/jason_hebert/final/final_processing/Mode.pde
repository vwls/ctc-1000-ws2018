public class Mode {

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  // variables for colors
  public HashMap<Integer, color[]> map = new HashMap<Integer, color[]>();
  public int modeNum;
  public int numberOfModes = 5;
  public int currentColor;

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  /**
   * color mode arrays
   */

  public color[] defaultC = {
    color(255), 
    color(191), 
    color(127), 
    color(64), 
    color(0)
  };

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  public color[] cMode1 = {
    color(41, 44, 68), 
    color(255, 83, 73), 
    color(240, 240, 241), 
    color(24, 205, 202), 
    color(79, 128, 225)
  };

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  public color[] cMode2 = {
    color(142, 185, 168), 
    color(254, 251, 208), 
    color(253, 207, 183), 
    color(244, 130, 140), 
    color(119, 93, 106)
  };

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  public color[] cMode3 = {
    color(255, 188, 103), 
    color(218, 114, 126), 
    color(172, 108, 130), 
    color(104, 92, 121), 
    color(69, 92, 123)
  };

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  public color[] cMode4 = {
    color(97, 99, 137), 
    color(180, 100, 134), 
    color(253, 107, 120), 
    color(253, 132, 111), 
    color(252, 145, 104)
  };

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  public color[] cMode5 = {
    color(255, 129, 171), 
    color(169, 129, 245), 
    color(102, 203, 255), 
    color(92, 232, 134), 
    color(246, 255, 113)
  };

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  // the constructor
  public Mode() {
    this.modeNum = 0;
    this.currentColor = 0;
    map.put(0, defaultC);
    map.put(1, cMode1);
    map.put(2, cMode2);
    map.put(3, cMode3);
    map.put(4, cMode4);
    map.put(5, cMode5);
  }

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  public color getColor() {
    color[] tempColor = map.get(modeNum);
    return tempColor[this.currentColor];
  }
  
  public color getColorFromNum(int n) {
    color[] tempColor = map.get(modeNum);
    return tempColor[n];
  }

}
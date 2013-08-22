public class Info  //encapsulates a Name and a realated Information. This can be extended for any use.
{
  protected String name, info;
  
  public Info(String name, String info)
  {
    this.name = name; this.info = info;
  }
  public String getName(){  return name;}
  public String getInfo(){  return info;}
  public void setName(String theName)  {name = theName;}
  public void setInfo(String theInfo)  {info = theInfo;}
  
  @Override
  public String toString()
  {
    return name;
  }
}
  

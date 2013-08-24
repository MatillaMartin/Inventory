class Product extends Info
{
  protected int quantity, price;  //quantity = number of products in stock, price = price of the product
  protected String imgUrl;  //img = product image url
  protected String url;  //product at shop url;
  
  public Product(String name, String info)
  {
    super(name, info);
  }
  public Product(String name, String info, String url, int quantity, int price, String imgUrl)
  {
    this(name, info);
    this.url = url;
    this.quantity = quantity;
    this.price = price;
    this.imgUrl = imgUrl;
  }
  public Product(String name, String info, String url, String quantity, String price, String imgUrl)
  {
    this(name, info, url, Integer.parseInt(quantity),Integer.parseInt(price), imgUrl);
  }
  
  public int increase(){ return ++quantity;}
  public int decrease(){ return --quantity;}
  public void setQuantity(int theQuantity){ quantity = theQuantity;}
  public int getQuantity(){ return quantity;}
  
  public void setPrice(int thePrice){ price = thePrice;}
  public int getPrice(){ return price;}
  
  public void setUrl(String theUrl){ url = theUrl;}
  public String getUrl(){ return url;}
  
  public void setImageUrl(String theImg){ imgUrl = theImg;}
  public String getImageUrl(){ return imgUrl;}
  
  public String getSplitForm(String splitter)
  {
    return name + splitter + info + splitter + url + splitter + quantity + splitter + price + splitter + imgUrl;
  }
}

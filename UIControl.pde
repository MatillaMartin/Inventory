class UIControl  //controls the User Interface. Everything is encapsulated here. Should implement an interface!
{
  private ControlP5 cp5;
  private InventorySkeleton system;
  private ButtonMatrix bm;
  private int buttonMatrixValue = 2;  //asign value 2 to all buttons in buttonmatrix
  private Product currentProduct;
  private Textfield searchName;
  private Button createProduct, modifyProduct, deleteProduct;
  private Textarea info, price, quantity, url;
  private Button showName, priceLabel, quantityLabel, urlLabel, imageButton;
  private boolean modifyingInfo = false;
  private boolean buttonMatrixVisible = false;
  public UIControl(PApplet app, InventorySkeleton system)
  {
    cp5 = new ControlP5(app);
    this.system = system;
    initUI();
  }
  private int w(float coeff) {
    return int(coeff*width);
  }
  private int h(float coeff) {
    return int(coeff*height);
  }
  private void initUI()
  {
    float searchnamex = .2, searchnamey = .05, searchnamew = .3, searchnameh = .05;
    float createx = searchnamex + searchnamew + 0.1/*margin*/, createy = searchnamey, createw = searchnamew/2, createh = searchnameh;
    float areax = .05, areay = .5, areaw = .4, areah = .4;
    
    float matrixx = .01, matrixy = .2, matrixcm = .01, matrixrm = .01, matrixw = .3, matrixh = .05;
    float deletew = .15, deleteh = .025, deletex = areax+areaw-deletew, deletey = areay+areah;
    float modifyw = deletew, modifyh = deleteh, modifyx = areax+areaw-modifyw-deletew-.005/*margin*/, modifyy = areay+areah;
    float shownamew = deletew, shownameh = deleteh, shownamex = areax, shownamey = areay-shownameh;

        // price, quantity, url
    float pricex = areax+areaw+.05, pricey = .5, pricew = deletew, priceh = .1;
    float quantityx = pricex, quantityy = pricey+priceh+.04, quantityw = deletew, quantityh = .1;
    float urlx = areax+areaw+.05, urly = .8, urlw = deletew, urlh = .1;

    float priceLabelw = deletew, priceLabelh = deleteh, priceLabelx = pricex, priceLabely = pricey-priceLabelh;
    float quantityLabelw = deletew, quantityLabelh = deleteh, quantityLabelx = pricex, quantityLabely = quantityy-priceLabelh;
    float urlLabelw = deletew, urlLabelh = deleteh, urlLabelx = pricex, urlLabely = urly-priceLabelh;
    
    float imagex = pricex+pricew+.05, imagey = pricey, imagew = 1-imagex-.05, imageh = 1-imagey-quantityh;
    
    ///////
    
    int snx = w(searchnamex), sny = h(searchnamey), snw = w(searchnamew), snh = h(searchnameh);
    int cx = w(createx), cy = h(createy), cw = w(createw), ch = h(createh);
    int ax = w(areax), ay = h(areay), aw = w(areaw), ah = h(areah);

    int px = w(pricex), py = h(pricey), pw = w(pricew), ph = h(priceh);
    int qx = w(quantityx), qy = h(quantityy), qw = w(quantityw), qh = h(quantityh);
    int ux = w(urlx), uy = h(urly), uw = w(urlw), uh = h(urlh);

    int ix = w(imagex), iy = h(imagey), iw = w(imagew), ih = h(imageh);
    
    int pLabelx = w(priceLabelx), pLabely = h(priceLabely), pLabelw = w(priceLabelw), pLabelh = h(priceLabelh);
    int qLabelx = w(quantityLabelx), qLabely = h(quantityLabely), qLabelw = w(quantityLabelw), qLabelh = h(quantityLabelh);
    int uLabelx = w(urlLabelx), uLabely = h(urlLabely), uLabelw = w(urlLabelw), uLabelh = h(urlLabelh);
    
    int mx = w(matrixx), my = h(matrixy), mcm = w(matrixcm), mrm = h(matrixrm), mw = w(matrixw), mh = h(matrixh), mc = int(width/(mcm+mw));
    int dx = w(deletex), dy = h(deletey), dw = w(deletew), dh = h(deleteh);
    int modx = w(modifyx), mody = h(modifyy), modw = w(modifyw), modh = h(modifyh);
    int shx = w(shownamex), shy = h(shownamey), shw = w(shownamew), shh = h(shownameh);



    PFont font = createFont("calibri", 20);

    searchName = cp5.addTextfield("searchName")
      .setPosition(snx, sny)
        .setSize(snw, snh)
          .setFont(font)
            .setAutoClear(false)
              .setFocus(true)
                .setCaptionLabel("SEARCH NAME")
                  .setColorCaptionLabel(0)
                    ;

    info = cp5.addTextarea("info")
      .setPosition(ax, ay)
        .setSize(aw, ah)
          .setFont(font)
            .setColor(0)  
              .setLineHeight(14)
                .setColorBackground(color(255, 100))
                  .setColorForeground(color(255, 100))
                    .setLineHeight(20)
                      .setVisible(false)
                        ;
    price = cp5.addTextarea("price")
      .setPosition(px, py)
        .setSize(pw, ph)
          .setFont(font)
            .setColor(0)  
              .setLineHeight(14)
                .setColorBackground(color(255, 100))
                  .setColorForeground(color(255, 100))
                    .setLineHeight(20)
                      .setVisible(false)
                        ;
    quantity = cp5.addTextarea("quantity")
      .setPosition(qx, qy)
        .setSize(qw, qh)
          .setFont(font)
            .setColor(0)  
              .setLineHeight(14)
                .setColorBackground(color(255, 100))
                  .setColorForeground(color(255, 100))
                    .setLineHeight(20)
                      .setVisible(false)
                        ;
    url = cp5.addTextarea("url")
      .setPosition(ux, uy)
        .setSize(uw, uh)
          .setFont(font)
            .setColor(0)  
              .setLineHeight(14)
                .setColorBackground(color(255, 100))
                  .setColorForeground(color(255, 100))
                    .setLineHeight(20)
                      .setVisible(false)
                        ;
    
    priceLabel = cp5.addButton("Price")
       .setPosition(pLabelx, pLabely)
         .setSize(pLabelw, pLabelh)
           .setId(0)
            .setVisible(false)
            ;
     quantityLabel = cp5.addButton("Quantity")
       .setPosition(qLabelx, qLabely)
         .setSize(uLabelw, uLabelh)
           .setId(0)
            .setVisible(false)
            ;
     urlLabel = cp5.addButton("URL")
       .setPosition(uLabelx, uLabely)
         .setSize(uLabelw, uLabelh)
           .setId(0)
            .setVisible(false)
            ;
    imageButton = cp5.addButton("image")
       .setPosition(ix, iy)
         .setSize(iw, ih)
           .setId(0)
            .setVisible(false)
            ;
    createProduct = cp5.addButton("createProduct")
      .setPosition(cx, cy)
        .setSize(cw, ch)
          .setId(0)
            .setVisible(false)
              ;
    showName = cp5.addButton("showName")
      .setPosition(shx, shy)
        .setSize(shw, shh)
          .setId(0)  //ID 0 represents system operations
            .setVisible(false)
              ;
    deleteProduct = cp5.addButton("deleteProduct")
      .setPosition(dx, dy)
        .setSize(dw, dh)
          .setId(0) //ID 0 represents system operations to distinguish from selection buttons
            .setVisible(false)
              ;
    modifyProduct = cp5.addButton("modifyProduct")
      .setPosition(modx, mody)
        .setSize(modw, modh)
          .setId(0)  //ID 0 represents system operations
            .setSwitch(true)
              .setVisible(false)
                ;
    bm = new ButtonMatrix(cp5, "bm", buttonMatrixValue, mc, mx, my, mcm, mrm, mw, mh);  
    textFont(font);
  }

  public void keyPressed()
  {
    if (modifyingInfo)
    {
      String infoString = currentProduct.getInfo();
      if (keyCode == BACKSPACE)
      {
        currentProduct.setInfo(infoString.substring(0, infoString.length()-1));
      }
      else currentProduct.setInfo(""+infoString+key);
      info.setText(currentProduct.getInfo());
    }
  }
  public void controlEvent(ControlEvent theEvent)
  {
    if (theEvent.controller().name().equals("searchName"))
    {
      system.onSearch(theEvent.controller().stringValue()); // tell the system there has been a search
    }
    else if (theEvent.controller().name().equals("modifyProduct"))
    {
      system.onModify(currentProduct);  // tell the system that the product is going to be modified
    }
    else if (theEvent.controller().name().equals("deleteProduct"))
    {
      system.onDelete(currentProduct);  // tell the system that the product is going to be deleted
    }
    else if (theEvent.controller().name().equals("createProduct"))
    {
      system.onCreate(searchName.getText());  // tell the system that the product is going to be deleted
    }
    else if (theEvent.controller().value() == buttonMatrixValue)
    {
      println("Controller Id: " + theEvent.controller().getId());
      system.onResultSelect(theEvent.controller().getId());
    }
  }
  public void showSearchResults(ArrayList results)
  {
    bm.clear();
    bm.addButtonList(results);
  }
  public void showProduct(Product product)
  {
    currentProduct = product;
    info.setText(product.getInfo());
    price.setText(""+product.getPrice());
    quantity.setText(""+product.getQuantity());
    url.setText(product.getUrl());
    
    showName.setLabel(product.getName());
    setProductButtonsVisible(true);
    
  }
  private void setProductButtonsVisible(boolean state)
  {
    showName.setVisible(state);
    modifyProduct.setVisible(state);
    deleteProduct.setVisible(state);
    priceLabel.setVisible(state);
    quantityLabel.setVisible(state);
    urlLabel.setVisible(state);
    info.setVisible(state);
    price.setVisible(state);
    quantity.setVisible(state);
    url.setVisible(state);
    imageButton.setVisible(state);
  }
  public void setCreateProductVisible(boolean state)
  {
    createProduct.setVisible(state);
  }
  public void toggleModify()
  {
    modifyingInfo = !modifyingInfo;
  }
}


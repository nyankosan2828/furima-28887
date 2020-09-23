function calculation() {
  const itemPrice = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById('profit') ;

  const inputPrice = function() {
    const priceContent = itemPrice.value;

    if(priceContent >= 300 && priceContent <= 9999999){
      let tax = priceContent * 0.1
      let taxContent = Math.round(tax);
      let profitContent = priceContent - taxContent
      let afterTaxContent = taxContent.toLocaleString();
      let afterprofitContent = profitContent.toLocaleString();
      addTax.textContent = afterTaxContent;
      profit.textContent = afterprofitContent;

    } else {
      let taxContent = '0';
      let profitContent = '0';
      addTax.textContent = taxContent;
      profit.textContent = profitContent;
    } 
  }

  value =  inputPrice.innerHTML

  itemPrice.addEventListener('click', inputPrice);
}
window.addEventListener('click', calculation);

// innerHTMLどこに何を追加するか
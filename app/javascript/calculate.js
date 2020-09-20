function calculation() {
  const price = document.getElementById('item-price');
  const fee = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  price.addEventListener('input', function() {
    const inputPrice = price.value;
    fee.innerHTML = `${Math.floor(inputPrice * 0.1)}`;
    profit.innerHTML = `${inputPrice - fee.innerHTML}`;
  });
};

setInterval(calculation, 1000);
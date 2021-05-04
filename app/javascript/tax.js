function calculation () {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener("keyup", () => {
    let tax = parseInt(itemPrice.value * 0.1, 10)
    addTaxPrice.innerHTML = (tax).toLocaleString();
    profit.innerHTML = (itemPrice.value - tax).toLocaleString();
  });
}

window.addEventListener('load', calculation);

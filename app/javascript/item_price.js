const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    //この下は手数料の計算
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    //この下は純利益
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(priceInput.value * 0.9);
  })
 };

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
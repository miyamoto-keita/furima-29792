function inputPrice() {
  const inputPrice = document.getElementById("item-price");
  // 販売手数料・販売利益のidを取得して変数に代入しましょう
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  inputPrice.addEventListener("input", () => {
    const price = inputPrice.value;
  
    // 取得した変数を使って手数料と利益を計算し、計算結果を変数に入れる Math.floor
    const tax = Math.floor(price * 0.1)
    const profitPrice = price - tax
    addTaxPrice.innerHTML= tax;
    profit.innerHTML=profitPrice;


  })
};
window.addEventListener('load', inputPrice)
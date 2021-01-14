window.addEventListener('load', () => {
const price_input = document.getElementById("item-price")
price_input.addEventListener("input", () => {
  const input_value = price_input.value;

  const Tax = document.getElementById("add-tax-price")
  Tax.innerHTML = Math.floor(input_value * 0.1)

  const Profit = document.getElementById("profit")
  Profit.innerHTML = Math.floor(input_value - (input_value * 0.1))

})
});
// window.addEventListener('load', post);
window.addEventListener("load",()=>{
// window.addEventListener('load', calc)

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);//1000
  
  const addTaxDom = document.getElementById("add-tax-price")
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
  console.log(addTaxDom);//要素全体
  
  const profitNumber = document.getElementById("profit")
  
  console.log(addTaxDom.innerHTML) 
  profitNumber.innerHTML = (Math.floor(inputValue - addTaxDom.innerHTML));
  console.log(profitNumber);
})
})

// const profitNumber = document.getElementById("profit")
//     const value_result = inputValue * 0.1
//     console.log(value_result)
//     profitNumber.innerHTML = (Math.floor(inputValue - value_result));
//       console.log(profitNumber);


// const addTaxValue=(Math.floor(inputValue * 0.1));
//       addTaxDom.innerHTML = addTaxValue;
//       ・・・
//       profitNumber.innerHTML = (Math.floor(inputValue - addTaxValue));

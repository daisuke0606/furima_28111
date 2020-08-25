window.addEventListener('load', function(){
console.log(123)
  const input = document.getElementById('item-price');
    input.addEventListener('input', function(){
      const price = document.getElementById('item-price').value;
      const fee = price * 0.1
      const result = price - fee;
      document.getElementById('add-tax-price').innerHTML = Math.floor(fee);
      document.getElementById('profit').innerHTML = Math.floor(result);
    })
  
})  
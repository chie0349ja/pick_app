document.addEventListener("DOMContentLoaded", function() {
  var barcodeInput = document.getElementById("barcodeInput");

  barcodeInput.addEventListener("input", function(event) {
    // フォームを送信
    event.target.form.submit();
  });
});
function post (){
  const contentField = document.getElementById("content");
  contentField.addEventListener("input", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();

    XHR.onreadystatechange = function() {
      if (XHR.readyState === XMLHttpRequest.DONE) {
        if (XHR.status === 200) {
          // レスポンスを受け取り、画面に表示する
          document.body.innerHTML = XHR.responseText;
        } else {
          // エラー処理
          console.error('Request failed');
        }
      }
    };

    XHR.open("POST", "/pickitems/show_by_jan", true);
    XHR.responseType = "text";
    XHR.send(formData);
    console.log('イベント発火');
  });
};

window.addEventListener('DOMContentLoaded', post);
//window.onload = function() {
//  post();
//};
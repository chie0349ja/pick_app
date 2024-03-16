function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/pickitems/show_by_jan", true);
    //XHR.responseType = "json";
    XHR.send(formData);
    console.log('イベント発火');
  });
};

window.addEventListener('load', post);
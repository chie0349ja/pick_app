window.addEventListener("DOMContentLoaded", () => {
  const submit_btn = document.getElementById("submit_btn");
  const sounds = document.getElementById("sounds");

  submit_btn.addEventListener('click', function(){
    sounds.currentTime = 0;
    sounds.play();
  });
});
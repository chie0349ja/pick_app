window.addEventListener('beforeunload', function(event) {
  // 再生位置をローカルストレージに保存
  localStorage.setItem('audioPlaybackPosition', sounds.currentTime);
});

window.addEventListener("DOMContentLoaded", () => {
  const sounds = document.getElementById("sounds");

  // ページ読み込み時にローカルストレージから再生位置を取得し、設定
  const savedPlaybackPosition = localStorage.getItem('audioPlaybackPosition');
  if (savedPlaybackPosition) {
    sounds.currentTime = parseFloat(savedPlaybackPosition);
  }

  // ボタンクリック時の再生処理
  const submit_btn = document.getElementById("submit_btn");
  submit_btn.addEventListener('click', function(){
    sounds.play();
  });
});
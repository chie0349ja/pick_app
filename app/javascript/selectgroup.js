document.addEventListener("DOMContentLoaded", () => {
  console.log("DOMContentLoadedイベントが発火しました");
  const selectNouhinbi = document.getElementById("nouhinbi");
  const selectPickgroup = document.getElementById("pickgroup");

  selectNouhinbi.addEventListener("change", () => {
    const nouhinbi = selectNouhinbi.value;
    console.log("納品日が選択された");
    fetch(`/pickitems/pickgroups?nouhinbi=${nouhinbi}`)
    .then(response => response.json())
    .then(data => {
      selectPickgroup.innerHTML = "";
      data.forEach(option => {
        const opt = document.createElement("option");
        opt.value = option[1];
        opt.innerHTML = option[0];
        selectPickgroup.appendChild(opt);
      });
    })
    .catch(error => {
      console.error("ピッキンググループデータの取得エラー:", error);
    });
  });
});
document.addEventListener("DOMContentLoaded", () => {
  console.log("DOMContentLoadedイベントが発火しました");
  const selectNouhinbi = document.getElementById("nouhinbi");
  const selectPickgroup = document.getElementById("pickgroup");
  const hiddenPickgroup = document.getElementById("picked_group");

  selectNouhinbi.addEventListener("change", () => {
    const nouhinbi = selectNouhinbi.value;
    console.log("納品日が選択された");
    fetch(`/pickitems/pickgroups?nouhinbi=${nouhinbi}`)
    .then(response => response.json())
    .then(data => {
      selectPickgroup.innerHTML = "";
      data.forEach(option => {
        const opt = document.createElement("option");
        opt.value = option[0];
        opt.innerHTML = option[0];
        selectPickgroup.appendChild(opt);
      });
      //pickgroupが変更された際にhiddenフィールドの値を設定する
      selectPickgroup.addEventListener("change", () => {
        hiddenPickgroup.value = selectPickgroup.value;
        console.log("picked_groupの値:", hiddenPickgroup.value);
      });
    })
    .catch(error => {
      console.error("ピッキンググループデータの取得エラー:", error);
    });
  });
});
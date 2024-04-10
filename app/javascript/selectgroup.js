document.addEventListener("DOMContentLoaded", () => {
  const selectNouhinbi = document.getElementById("pickitem_nouhinnbi");
  const selectPickgroup = document.getElementById("pickitem_pickgroup");

  selectNouhinbi.addEventListener("change", () => {
    const nouhinbi = selectNouhinbi.value;
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
    });
  });
});
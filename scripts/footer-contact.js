function contact_hp(){
    navigator.clipboard.writeText("harcipan15@gmail.com");
    var tooltip = document.getElementById("myTooltip");
    tooltip.innerHTML = "Copied: harcipan15@gmail.com";
}
function contact_kb(){
    navigator.clipboard.writeText("playforwin15@gmail.com");            
    var tooltip = document.getElementById("myTooltip2");
    tooltip.innerHTML = "Copied: playforwin15@gmail.com";
}

function outFunc_hp() {
  var tooltip = document.getElementById("myTooltip");
  tooltip.innerHTML = "Copy to clipboard";
}
function outFunc_kb() {
  var tooltip = document.getElementById("myTooltip2");
  tooltip.innerHTML = "Copy to clipboard";
}
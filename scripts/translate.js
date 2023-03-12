function angolul(){
  let containeren = document.getElementById(`en`);
  containeren.className = 'lang-match';
  let containerhu = document.getElementById(`hu`);
  containerhu.className = containerhu.className.replace(/\blang-match\b/g, "");
}
function magyarul(){
  let containerhu = document.getElementById(`hu`);
  containerhu.className = 'lang-match';
  let containeren = document.getElementById(`en`);
  containeren.className = containerhu.className.replace(/\blang-match\b/g, "");
}

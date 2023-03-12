const menuContainer = document.querySelector(".navbar-cont-mobile-list");
const lineContainer = document.querySelector(".line-container");

lineContainer.addEventListener("click", ()=>{
    lineContainer.classList.toggle("active")
    menuContainer.classList.toggle("active")
})
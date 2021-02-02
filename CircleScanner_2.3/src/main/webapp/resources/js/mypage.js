/* mypage */
const targetLink = document.querySelectorAll(".user-info a");
const tabContent = document.querySelectorAll(".user-contents__wrap > div");

targetLink.forEach(function (tabLink) {
  tabLink.addEventListener("click", (e) => {
    
    e.preventDefault();
    let orgTarget = e.currentTarget.getAttribute("href");
    const tabTarget = orgTarget.replace("#", "");

    tabContent.forEach((x) => {
      x.style.display = "none";
    });
    document.getElementById(tabTarget).style.display = "block";

    targetLink.forEach((z) => {
      z.classList.remove("current");
      e.currentTarget.classList.add("current");
    });
  });
});
document.getElementById("tab1").style.display = "block";

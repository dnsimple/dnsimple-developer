import { createApp } from 'vue';
import Tabs from "./components/tabs.vue"

createApp(Tabs).mount('.component')

function toggleColorMode (e) {
  // Switch to Light Mode
  if (e.currentTarget.classList.contains("light--hidden")) {
    document.documentElement.setAttribute("color-mode", "light");
    localStorage.setItem("color-mode", "light")
    return;
  }

  // Switch to Dark Mode
  document.documentElement.setAttribute("color-mode", "dark");
  localStorage.setItem("color-mode", "dark");
};

const toggleColorButtons = document.querySelectorAll(".color-mode__btn");

toggleColorButtons.forEach(btn => {
  btn.addEventListener("click", toggleColorMode);
});

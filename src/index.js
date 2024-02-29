import { createApp } from 'vue';
import Tabs from "./components/tabs.vue"
import { Search } from "./search.js"

createApp(Tabs).mount('.component')

// Search
const container = document.getElementById('main');
const input = document.getElementById('input-search');
const search = Search(container, input);

search.init();

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
console.log(toggleColorButtons);

toggleColorButtons.forEach(btn => {
  btn.addEventListener("click", toggleColorMode);
});

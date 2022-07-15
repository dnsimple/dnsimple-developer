import Vue from "vue/dist/vue.esm.js"
import Tabs from "./components/tabs.vue"
import { Search } from "./search.js"

var app = new Vue({
  el: '.component',
  components: {
    Tabs,
  },
})

// Search
const container = document.getElementById('main');
const input = document.getElementById('input-search');
const search = Search(container, input);

search.init();

import Vue from "vue/dist/vue.esm.js"
import Tabs from "./components/tabs.vue"

// Troubleshoot with this
Vue.config.debug = true
Vue.config.devtools = true

var app = new Vue({
  el: '.component',
  components: {
    Tabs,
  },
})

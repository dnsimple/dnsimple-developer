<template>
  <div class="pv3">
    <div v-for="tab in tabs" v-bind:key="'tab-top-' + tab" @click="currentTab = tab" v-bind:class="{ 'b bg-moon-gray': currentTab === tab }" class="dib pv1 ph2 bt bl br b--moon-gray pointer ttc">
      {{ tab }}
    </div>
    <div class="tab-content ba pa3 b--moon-gray">
      <div v-for="(tab, index) in tabs" :key="`tab${index}`" v-if="currentTab === tab">
        <div v-html="contents[index]"></div>
      </div>
    </div>
  </div>
</template>

<script>
  import { marked } from 'marked';
  import hljs from 'highlightjs/highlight.pack.min.js';

  export default {
    data () {
      return {
        tabs: [],
        contents: [],
        currentTab: ""
      }
    },
    mounted () {
      this.tabs = Object.keys(this.$slots);
      const codeHighlightOptions = {
        highlight: (code) => hljs.highlightAuto(code).value,
      };
      this.contents = Object.values(this.$slots).map(content => marked(content[0].text, codeHighlightOptions));
      this.currentTab = this.tabs[0];
    },
  }
</script>

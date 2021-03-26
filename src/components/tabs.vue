<template>
  <div class="tabs" v-bind:style="{ width: width, height: height }" >
    <div class="tabs-top">
      <div class="tab" v-for="tab in tabs" v-bind:key="'tab-top-' + tab" v-bind:class="{ tabActive: currentTab === tab }" @click="currentTab = tab">
        {{tab}}
      </div>
      <div class="tab-buffer"></div>
    </div>
    <div class="tab-content">
      <div v-for="tab in tabs" v-bind:key="'tab-content-' + tab" v-if="currentTab === tab">
        <slot :name="tab" />
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      width: String,
      height: String
    },
    data () {
      const tabs = Object.keys(this.$slots)

      return {
        tabs: tabs,
        currentTab: tabs[0]
      }
    }
  }
</script>

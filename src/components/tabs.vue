<template>
  <div class="tabs" v-bind:style="{ width: width, height: height }" >
    <div class="tabs-top">
      <div class="tab" v-bind:class="{ tabActive: tabIndex==`${index}` }" v-for="(name, index) in names" @click="tabIndex=`${index}`">{{name}}</div>
      <div class="tab-buffer"></div>
    </div>
    <div class="tab-content">
      <div v-for="(name, index) in names" :key="`tab${index}`" v-if="tabIndex==`${index}`">
        <slot :name="`tab${index}`" ></slot>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      width: String,
      height: String,
      names: Array
    },
    mounted: function() {
      console.log("in tabs");
    },
    data () {
      return {
        tabIndex: 0
      }
    },
  }
</script>

<template>
  <div class="app-container home">
    <el-result icon="info" title="欢迎" :subTitle="userName.toString()"/>
  </div>
</template>

<script>

export default {
  name: "Index",
  data() {
    return {
      userName: this.$store.state.user.name,
    }
  },
};
</script>

<template>
  <v-layout>
    <v-flex>
      <v-list>
          <v-list-item-content>
            {{ user.email }}
          </v-list-item-content>
      </v-list>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  // これを仕様すると、ページをレンダリングする前に実行できる。つまり認証を必ず前に行うということ。
  middleware: ['auth'],
  data () {
    return {
      user: ""
    }
  },
  methods: {
    async updateUser() {
      this.user = await this.$axios.$get('/users/current')
    }
  },
  mounted () {
    this.updateUser()
  }
}
</script>

<template>
  <v-layout>
    <v-flex>
      <v-list>
        <v-list-item v-for="example in examples" :key="example.id" :class="example.colour">
          <v-list-item-content>
            {{ example.name }}
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  // これを仕様すると、ページをレンダリングする前に実行できる。つまり認証を必ず前に行うということ。
  // 認証がなかった場合、ログインページにリダイレクトされる
  // middleware: ['auth'],
  data () {
    return {
      examples: []
    }
  },
  methods: {
    async updateExamples() {
      this.examples = await this.$axios.$get('/examples')
    }
  },
  mounted () {
    this.updateExamples()
  }
}
</script>

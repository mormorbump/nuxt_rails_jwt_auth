module.exports = {
  /*
  ** Headers of the page
  */
  head: {
    title: 'nuxt_frontend',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Nuxt.js project' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress bar color
  */
  loading: { color: '#3B8070' },
  /*
  ** Build configuration
  */
  build: {
    /*
    ** Run ESLint on save
    */
    extend (config, { isDev, isClient }) {
      if (isDev && isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  },

  modules: [
    '@nuxtjs/vuetify',
    '@nuxtjs/axios',
    '@nuxtjs/auth'
  ],
    // 行き先をrailsに設定。
  axios: {
    host: 'localhost',
    port: 8080,
    prefix: '/api'
  },
  auth: {
    // https://auth.nuxtjs.org/schemes/local.html#endpoints
    // axiosで送られる。
    // ver4.00ぐらいでこうかくと、api/が一個増えてまう。
    strategies: {
      local: {
        endpoints: {
          login:  { url: '/users/sign_in', method: 'post' },
          logout: { url: '/users/sign_out', method: 'delete' },
          user:   { url: '/users/current', propertyName: false }
        },
        // tokenRequired: true,
        // tokenType: false,
      },
      token: {
        name: 'token'
      }
      // cookie: {
      //   name: 'token'
      // },
    },
    // redirect: {
    //   login: '/login',
    //   home: '/'
    // }
    mode: 'spa',
    cookie: false,
  },
  router: {
    middleware: ['auth']
  }
  // }
}




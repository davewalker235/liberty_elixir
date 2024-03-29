// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"
import 'vuetify/dist/vuetify.min.css'

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import Vue from 'vue';
import VueRouter from 'vue-router';
import Vuetify from 'vuetify';
import VueApollo from 'vue-apollo';
import App from './src/App.vue';

Vue.use(VueApollo);
Vue.use(VueRouter);
Vue.use(Vuetify);

new Vue(App).$mount('#app');

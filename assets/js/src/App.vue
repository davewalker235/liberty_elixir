<template>
  <v-app id="inspire">
    <v-navigation-drawer v-model="drawer" fixed app>
      <v-list dense>
        <v-list-tile v-for="item in nav" :to="item.uri">
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              {{ item.label }}
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar dark fixed app>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Liberty Sailing Club Tools</v-toolbar-title>
    </v-toolbar>
    <v-content>
      <v-container fluid fill-height>
        <v-layout>
          <v-flex>
            <router-view></router-view>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
    <v-footer app>
      &copy; {{ year }}
    </v-footer>
  </v-app>
</template>

<script>
  import VueRouter from 'vue-router';
  import VueApollo from 'vue-apollo';
  import gql from 'graphql-tag';

  import Home from './components/Home.vue';
  import Scoring from './components/Scoring.vue';
  import ApolloClient from 'apollo-boost'


  const apolloClient = new ApolloClient({
    uri: '//' + document.location.host + '/api'
  });

  const apolloProvider = new VueApollo({
    defaultClient: apolloClient,
  })

  console.log(apolloClient);

  const router = new VueRouter({
    mode: 'history',
    base: __dirname,
    routes: [
      { path: '/', component: Home },
      { path: '/scoring', component: Scoring },
    ],
  });

  // export default {
  //   data: () => ({
  //     drawer: null
  //   }),
  //
  //   props: {
  //     source: String
  //   }
  // }

  export default {
    name: 'App',
    router: router,
    apolloProvider: apolloProvider,
    apollo: {
    // Simple query that will update the 'hello' vue property
      seasons: gql`query {
        seasons {
          id,
          title,
          dates
        }
      }`,
    },
    data: () => ({
      drawer: null,
      year: '2019',
      nav: [
        {icon: "home", uri: "/", label: "Home"},
        {icon: "assessment", uri: "/scoring", label: "Scoring"},
      ]
    })
  }
</script>

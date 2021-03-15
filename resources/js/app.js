/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

/*Clients*/
Vue.component('create-client', require('./components/client/Create.vue').default);
Vue.component('list-client', require('./components/client/List.vue').default);
Vue.component('edit-client', require('./components/client/EditModal.vue').default);
Vue.component('client-location', require('./components/client/ClientLocation.vue').default);

/*Concessionaires */
Vue.component('create-concessionaire', require('./components/concessionaire/Create.vue').default);
Vue.component('list-concessionaire', require('./components/concessionaire/List.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});

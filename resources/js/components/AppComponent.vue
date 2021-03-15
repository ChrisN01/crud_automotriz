<template>
    <div>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="#">Sector Automotriz</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <!--<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>-->
            <router-link :to="{name: 'home'}">Home</router-link>
          </li>
          <li class="nav-item">
            <!--<a class="nav-link" href="#">Link</a>-->
            <router-link :to="{name: 'clients'}">Clientes</router-link>
          </li>
          <li class="nav-item">
            <!--<a class="nav-link disabled" href="#">Disabled</a>-->
            <router-link :to="{name: 'concessionaires'}">Concesionarios</router-link>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!--Contenido editable-->
    <transition name="slide-fade" mode="out-in">
        <router-view></router-view>
    </transition>
    </div>
</template>

<script>

export default {
   
}
</script>

<style scoped>

</style>

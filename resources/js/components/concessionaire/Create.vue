<template>
    <div class="container">
        <div class="row">
                    <div class="col-md-12">
                                    <a :href="`/concessionaires`" class="btn btn-success float-right m-3">Ver todos los Concesionarios</a>
                    </div>
        </div>
        <div class="alert alert-success" v-show="success">
             <strong>¡Concesionario registrado con éxito!</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            
        </div>
         <div class="alert alert-danger" v-if="errors && errors.found">
                {{ errors.found}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
        </div>
        <form class="form-group" @submit.prevent="addconcesionarie">
            <input type="text" class="form-control mb-2" placeholder="Nombre" v-model="concesionarie.name">
            <div class="alert alert-danger" v-if="errors && errors.name">
                {{ errors.name[0]}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <input type="text" class="form-control mb-2" placeholder="Dirección" v-model="concesionarie.address">
            <div class="alert alert-danger" v-if="errors && errors.address">
                {{ errors.address[0]}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <select class="form-control mb-2" v-model="selectedLocation" required>
                        <option value="0">Seleccione la ubicación</option>
                        <option v-for="location in locations" :value="location.id" :key="location.id">{{location.name}}</option>

            </select>
             <button class="btn btn-info float-right">Registrar</button>
        </form>

    </div>
</template>

<script>

export default {
    name:'Create',
    data(){
        return{
            locations:[],
            concessionaires:[],
            concesionarie: {name:'',  address:'',  concessionaire_id:'', location_id:''},
            selectedLocation: 0,
            errors:{},
            success:false,

        }
       
    },
    methods:{
        addconcesionarie(){
            console.log(this.concesionarie.name,  this.concesionarie.address,  this.selectedLocation);
            /*Se valida que no se esten recibiendo campos vacios*/
            if(!this.concesionarie.name.trim() ||  !this.concesionarie.address.trim() ||  this.selectedLocation=== 0){
                alert('Debes completar todos los campos antes de guardar');
                return;
            }
            console.log(this.selectedLocation);
            
            const params = {
                    name:this.concesionarie.name,
                    address:this.concesionarie.address,
                    location_id:this.selectedLocation,
                }
          
           /*Se limpian los campos*/
           this.concesionarie.name= '';
           this.concesionarie.address= '';
           this.concesionarie.location_id= '';
           this.selectedLocation= 0,
           /*Envio de datos al controlador*/
            axios.post('/concessionaires', params)
            .then( response =>{
                console.log(response);
                this.concessionaires.push(response.data)//Se almacena la informacion en el array
                this.success = true;
            })
            .catch(e => {
                if(e.response.status == 422){
                    this.errors = e.response.data.errors;
                    console.log(e.response.data);
                }
                
                });
        }
    },

    mounted(){
          //Se obtienen las ubicaciones
        axios.get('/locations')
        .then( (response) => 
            {
                this.locations = response.data
            }
        )


    }
}
</script>

<style scoped>

</style>

<template>
    <div class="container">
        <div class="row">
                    <div class="col-md-12">
                                    <a :href="`/home`" class="btn btn-success float-right m-3">Ver todos los clientes</a>
                    </div>
        </div>
        <div class="alert alert-success" v-show="success">
             <strong>¡Cliente registrado con éxito!</strong>
            
        </div>
         <div class="alert alert-danger" v-if="errors && errors.found">
                {{ errors.found}}
        </div>
        <form class="form-group" @submit.prevent="addClient">
            <input type="text" class="form-control mb-2" placeholder="Nombre" v-model="client.name">
            <div class="alert alert-danger" v-if="errors && errors.name">
                {{ errors.name[0]}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <input type="text" class="form-control mb-2" placeholder="DNI" v-model="client.dni">
            <div class="alert alert-danger" v-if="errors && errors.dni">
                {{ errors.dni[0]}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <input type="text" class="form-control mb-2" placeholder="Dirección" v-model="client.address">
            <div class="alert alert-danger" v-if="errors && errors.address">
                {{ errors.address[0]}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <input type="phone" class="form-control mb-2" placeholder="Teléfono" v-model="client.phone">
            <div class="alert alert-danger" v-if="errors && errors.phone">
                {{ errors.phone[0]}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <select class="form-control mb-2" v-model="selectedConcessionaire" required>
                <option value="0">Seleccione el Concesionario</option>
                <option v-for="concessionaire in concessionaires" :value="concessionaire.id" :key="concessionaire.id">{{concessionaire.name}} - {{concessionaire.location.name}}</option>

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
            clients:[],
            client: {name:'', dni:'', address:'',  phone:'', concessionaire_id:'', location_id:''},
            concessionaires:[],
            selectedConcessionaire: 0,
            errors:{},
            success:false,

        }
       
    },
    methods:{
        addClient(){
            this.success = false;
            console.log(this.client.name, this.client.dni, this.client.address, this.client.phone, this.selectedConcessionaire);
            /*Se valida que no se esten recibiendo campos vacios*/
            if(!this.client.name.trim() || !this.client.dni.trim() || !this.client.address.trim() || !this.client.phone.trim() || this.selectedConcessionaire=== 0){
                alert('Debes completar todos los campos antes de guardar');
                return;
            }
            console.log(this.selectedLocation);
            
            const params = {
                    name:this.client.name,
                    dni:this.client.dni,
                    address:this.client.address,
                    phone:this.client.phone,
                    concessionaire_id:this.selectedConcessionaire,
                }
          
           /*Se limpian los campos*/
           this.client.name= '';
           this.client.dni= '';
           this.client.address= '';
           this.client.phone= '';
           this.client.concessionaire_id= '';
           this.selectedConcessionaire= 0,
           /*Envio de datos al controlador*/
            axios.post('/clients', params)
            .then( response =>{
                console.log(response);
                this.clients.push(response.data)//Se almacena la informacion en el array
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
        //Se obtienen los concesionarios desde la BD
        axios.get('/concessionaires/list')
        .then( (response) => 
            {
                this.concessionaires = response.data
            }
        )

    }
}
</script>

<style scoped>

</style>

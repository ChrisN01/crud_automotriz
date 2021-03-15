<template>
    <div>
        <div class="row">
            <div class="col-md-8 mb-3">
                <form @submit.prevent="getConcessionaires" class="form-inline">
                <select class="form-control m-2 col-md-6" required v-model="location_id">
                    <option value="">Seleccione la ubicación</option>
                    <option v-for="location in locations" :value="location.id" :key="location.id">{{location.name}}</option>
                 </select>
                 <button class="btn btn-success float-right mr-2">Buscar</button>
                  <button class="btn btn-primary float-right" v-show="shown" @click="exportPDF">Generar reporte</button>

                </form>

            </div>

        </div>

        <div class="alert alert-danger" v-if="error_one && error_one.found" v-show="nofound">
                {{ error_one.found}}
        </div>
        
            <div class="table-responsive" v-show="shown">
            <table class="table table-striped table-bordered" id="concessionaires_table">
                <thead>
                    <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>DNI</th>
                    <th>Dirección</th>
                    <th>Estatus</th>
                    <th>Concesionario</th>
                    <th>Ubicación</th>
                    <th class="text-center disappear">Editar</th>
                    <th class="text-center disappear">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(list_concessionaire, index) in list_concessionaires" :key="index">
                    <td>{{list_concessionaire.id}}</td>
                    <td>{{list_concessionaire.name}}</td>
                    <td>{{list_concessionaire.dni}}</td>
                    <td>{{list_concessionaire.address}}</td>
                    <td>{{list_concessionaire.status}}</td>
                    <td>{{list_concessionaire.concessionaire.name}}</td>
                    <td>{{list_concessionaire.location.name}}</td>
                    <td class="disappear"><button id="editModal" @click="editModal(list_concessionaire)"  class="btn btn-info">Editar</button></td>
                    <td class="disappear"><button class="btn btn-danger" @click="deleteClient(list_concessionaire, index)">Eliminar</button></td>
                    
                    </tr>
                    
                    </tbody>
                </table>

        </div>

                <!--Edit Modal-->
        <div class="modal" tabindex="-1" role="dialog" id="ModalEdit">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Cliente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-success" v-show="success">
                    <strong>¡Cliente actualizado con éxito!</strong>
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

                <form class="form-group" @submit.prevent="editClient(form)">
                    <input type="text" class="form-control mb-2" placeholder="Nombre" v-model="form.name">
                    <div class="alert alert-danger" v-if="errors && errors.name">
                        {{ errors.name[0]}}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <input type="text" class="form-control mb-2" placeholder="DNI" v-model="form.dni">
                    <div class="alert alert-danger" v-if="errors && errors.dni">
                        {{ errors.dni[0]}}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <input type="text" class="form-control mb-2" placeholder="Dirección" v-model="form.address">
                    <div class="alert alert-danger" v-if="errors && errors.address">
                        {{ errors.address[0]}}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <input type="phone" class="form-control mb-2" placeholder="Teléfono" v-model="form.phone">
                    <div class="alert alert-danger" v-if="errors && errors.phone">
                        {{ errors.phone[0]}}
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <select class="form-control mb-2" required v-model="form.status">
                        <option value="">Seleccione el Estatus</option>
                        <option value="activo">Activo</option>
                        <option value="inactivo">Inactivo</option>

                    </select>
                    <select class="form-control mb-2" required v-model="form.concessionaire_id">
                        <option value="0">Seleccione el Concesionario</option>
                        <option v-for="concessionaire in concessionaires" :value="concessionaire.id" :key="concessionaire.id">{{concessionaire.name}}-{{concessionaire.location.name}}</option>

                    </select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" @click="editClient(form)">Editar</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
            </div>
        </div>
        </div>
        <!--Edit Modal end-->



    </div>
</template>
<script>
import { jsPDF } from "jspdf";
import 'jspdf-autotable'
export default {
    name:'ClientLocation',
    data(){
        return{
             locations:[],
             location_id:'',
             list_concessionaires:[],
             shown:false,
             nofound:false,
             error_one:[],
             errors:[],
             success:false,
             concessionaires:[],
             selectedConcessionaire: 0,
                form: {
                    id:'',
                    name: '',
                    dni: '',
                    address: '',
                    status: '',
                    concessionaire_id: 0,
                },

        }
       
    },
    methods:{
        editModal(client){
            this.success = false;
            this.form.name= '';
            this.form.dni= '';
            this.form.address= '';
            this.form.phone= '';
            this.form.status = '';
            this.form.concessionaire_id= 0;
            /*Desplega el modal */
            $('#ModalEdit').modal('show');
            /*Muestra los valores*/
            this.form.name = client.name;
            this.form.dni = client.dni;
            this.form.address = client.address;
            this.form.name = client.name;
            this.form.phone = client.phone;
            this.form.status = client.status;
            this.form.concessionaire_id = client.concessionaire_id;     
            this.form.id = client.id;
        },
        getConcessionaires(){
            console.log(this.location_id);
           axios.get(`/clients/location/${this.location_id}`)
           .then( response => {
               console.log(response);
               this.list_concessionaires= response.data
               this.shown= true;
               this.nofound = false;

               $( function(){

                    $('#concessionaires_table').DataTable({
                        language: {
                        "decimal": "",
                        "emptyTable": "No hay información",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Mostrar _MENU_ Entradas",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "zeroRecords": "Sin resultados encontrados",
                        "paginate": {
                            "first": "Primero",
                            "last": "Ultimo",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    },
                     retrieve: true,
                        
                    });
                        
                    });
                    

           })
           .catch(e => {
                if(e.response.status == 422){
                    this.error_one = e.response.data.errors;
                    this.shown = false;
                    this.nofound = true;
                    console.log(e.response.data);
                }
                
                });            

        },
        editClient(client){

             console.log(this.form.name, this.form.dni, this.form.address, this.form.phone, this.form.status ,this.form.concessionaire_id, 'Estoy dentro del edit');
            /*Se valida que no se esten recibiendo campos vacios*/
            if(!this.form.name.trim() || !this.form.dni.trim() || !this.form.address.trim() || !this.form.phone.trim() || !this.form.status.trim() || this.form.concessionaire_id=== 0){
                alert('Debes completar todos los campos');
                return;
            }

             const params = {
                    name:this.form.name,
                    dni:this.form.dni,
                    address:this.form.address,
                    phone:this.form.phone,
                    status:this.form.status,
                    concessionaire_id:this.form.concessionaire_id,
                    id:this.form.id,
                }

                /*Envio de datos al controlador*/
                axios.put(`/clients/${client.id}`, params)
                .then( response =>{
                    console.log(response);
                    this.getConcessionaires();
                    this.success = true;
                    $('.concessionaires_table').DataTable().draw();
                    
                })
                .catch(e => {
                    if(e.response.status == 422){
                        this.errors = e.response.data.errors;
                    }
                    
                    });
                    


        },
        deleteClient(client, index)
        {
            axios.post(`/clients/delete/${client.id}/${client.concessionaire_id}`)
            .then( () =>
            {
                this.list_concessionaires.splice(index,1);

            })

        },

        exportPDF() {
        $(".disappear").css("display","none");
        let doc = new jsPDF('l', 'pt' , 'a4');
        doc.text('Listado de usuarios por ubicación', 40, 40);
        doc.autoTable({ html: '#concessionaires_table',margin: {top: 60},
        
        });
        doc.save('client_table.pdf');
        $(".disappear").css("display","");
        },
        
    },

    mounted(){
        //Se obtienen los concesionarios desde la BD
        axios.get('/locations')
        .then( (response) => 
            {
                this.locations = response.data
            }
        )

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

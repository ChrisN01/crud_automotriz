<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a :href="`/clients/create`" class="btn btn-success float-right m-3">Registrar Cliente</a>
                <button class="btn btn-primary float-right m-3" @click="exportPDF">Generar reporte</button>
            </div>
            

        </div>
        <div class="table-responsive">
            <table class="table table-striped table-bordered" id="clients_table">
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
                    <tr v-for="(client, index) in clients" :key="index">
                    <td>{{client.id}}</td>
                    <td>{{client.name}}</td>
                    <td>{{client.dni}}</td>
                    <td>{{client.address}}</td>
                    <td>{{client.status}}</td>
                    <td>{{client.concessionaire.name}}</td>
                    <td>{{client.location.name}}</td>
                    <td class="disappear"><button id="editModal" @click="editModal(client)"  class="btn btn-info">Editar</button></td>
                    <td class="disappear"><button class="btn btn-danger" @click="deleteClient(client, index)">Eliminar</button></td>
                    
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
import datatables from 'datatables';
import { jsPDF } from "jspdf";
import 'jspdf-autotable'
export default {
    name:'List',
    data(){
        return{
            clients: [],
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
            errors:{},
            success:false,

            
        }

    },
    methods:{
        editModal(client){
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
                    axios.get('/clients')
                    .then( (response) => 
                        {
                            console.log (response.data);
                            this.clients = response.data
                            this.success = true;
                        }
                    )
                    
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
                this.clients.splice(index,1);

            })

        },

        exportPDF() {
        $(".disappear").css("display","none");
        let doc = new jsPDF('l', 'pt' , 'a4');
        doc.text('Listado de clientes', 40, 40);
        doc.autoTable({ html: '#clients_table',margin: {top: 60},
        
        });
        doc.save('client_table.pdf');
        $(".disappear").css("display","");
        },


    },
    mounted(){
        //Se obtienen los clientes desde la BD
        axios.get('/clients')
        .then( (response) => 
            {
                console.log (response.data);
                this.clients = response.data;
                $( function(){

                    $('#clients_table').DataTable({
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
                        
                    });
                        
                    });
               
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

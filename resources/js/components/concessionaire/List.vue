<template>
  <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a :href="`/concessionaires/create`" class="btn btn-success float-right m-3">Registrar Concesionario</a>
                    <button class="btn btn-primary float-right m-3" @click="exportPDF">Generar reporte</button>
                </div>
            </div>
            <div class="table-responsive">
            <table class="table table-striped table-bordered" id="list_concessionaires_table">
                <thead>
                    <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Ubicación</th>
                    <th class="text-center disappear">Editar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(concessionaire, index) in concessionaires" :key="index">
                    <td>{{concessionaire.id}}</td>
                    <td>{{concessionaire.name}}</td>
                    <td>{{concessionaire.address}}</td>
                    <td>{{concessionaire.location.name}}</td>
                    <td class="disappear"><button id="editModalConcessionaire" @click="editConcessionaireModal(concessionaire)"  class="btn btn-info">Editar</button></td>
                    
                    </tr>
                    
                    </tbody>
                </table>

        </div>

        <!--Edit Modal-->
        <div class="modal" tabindex="-1" role="dialog" id="ModalConcessionaireEdit">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Concessionario</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-success" v-show="success">
                    <strong>¡Concessionario actualizado con éxito!</strong>
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

                <form class="form-group" @submit.prevent="editConcessionaire(form)">
                    <input type="text" class="form-control mb-2" placeholder="Nombre" v-model="form.name">
                    <div class="alert alert-danger" v-if="errors && errors.name">
                        {{ errors.name[0]}}
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
                    <select class="form-control mb-2" v-model="form.location_id" required>
                        <option value="0">Seleccione la ubicación</option>
                        <option v-for="location in locations" :value="location.id" :key="location.id">{{location.name}}</option>

                    </select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" @click="editConcessionaire(form)">Editar</button>
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
            concessionaires:[],
            locations:[],
            selectedLocation: 0,
            form: {
                id:'',
                name: '',
                address: '',
                location_id: 0,
            },
            errors:{},
            success:false,
            
        }

    },
    methods:{
        editConcessionaireModal(concessionaire){
            this.success = false;
            this.form.name= '';
            this.form.address= '';
            this.form.location_id= 0;
            /*Desplega el modal */
            $('#ModalConcessionaireEdit').modal('show');
            /*Muestra los valores*/
            this.form.name = concessionaire.name;
            this.form.address = concessionaire.address;
            this.form.location_id = concessionaire.location_id;
            this.form.id = concessionaire.id;     

        },
        editConcessionaire(concessionaire){

             console.log(this.form.name, this.form.address, this.form.location_id, this.form.id);
            /*Se valida que no se esten recibiendo campos vacios*/
            if(!this.form.name.trim() || !this.form.address.trim() || this.form.location_id=== 0){
                alert('Debes completar todos los campos');
                return;
            }

             const params = {
                    name:this.form.name,
                    address:this.form.address,
                    location_id:this.form.location_id,
                    id:this.form.id,
                }

                /*Envio de datos al controlador*/
                axios.put(`/concessionaires/${concessionaire.id}`, params)
                .then( response =>{
                    console.log(response);
                    axios.get('/concessionaires/list')
                    .then( (response) => 
                        {
                            console.log (response.data);
                            this.concessionaires = response.data
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



        exportPDF() {
        $(".disappear").css("display","none");
        let doc = new jsPDF('l', 'pt' , 'a4');
        doc.text('Listado de Concesionarios', 40, 40);
        doc.autoTable({ html: '#list_concessionaires_table',margin: {top: 60},
        
        });
        doc.save('concessionaires_list.pdf');
        $(".disappear").css("display","");
        },
        
    },
    mounted(){

        //Se obtienen los concessionairees desde la BD
        axios.get('/concessionaires/list')
        .then( (response) => 
            {
                console.log (response.data);
                this.concessionaires = response.data;
                $( function(){

                    $('#list_concessionaires_table').DataTable({
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

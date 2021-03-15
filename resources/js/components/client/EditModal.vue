<template>
<div>


</div>
    
</template>

<script>


export default {
    name:'EditModal',
    data(){
        return{
             concessionaires:[],
             selectedConcessionaire: 0,
        }
       

    },
      mounted(){
        //Se obtienen los concesionarios desde la BD
        axios.get('/concessionaires')
        .then( (response) => 
            {
                this.concessionaires = response.data
            }
        )

    }

}
</script>

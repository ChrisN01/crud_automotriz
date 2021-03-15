@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header"> <h4>Generar Listado de Clientes por ubicación</h4></div>
                <div class="card-body">
                   <client-location></client-location>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


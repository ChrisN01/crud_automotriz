@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header"><h4>Listado de Concesionarios</h4></div>
                <div class="card-body">
                
                    <list-concessionaire></list-concessionaire>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


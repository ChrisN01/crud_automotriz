<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        /*Table for storing information associated with customers - Tabla para almacenar información asociada a clientes*/
        Schema::create('clients', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('dni');
            $table->string('address');
            $table->string('phone');
            $table->string('status')->default('activo');
            $table->unsignedBigInteger('concessionaire_id');
            $table->unsignedBigInteger('location_id');
            /*Defining foreign key - Definicion de llave foranea*/
            $table->foreign('concessionaire_id')->references('id')->on('concessionaires');
            $table->foreign('location_id')->references('id')->on('locations');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('clients');
    }
}

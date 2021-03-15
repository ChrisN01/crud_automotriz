<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Client;
use App\Models\Location;
use App\Models\Concessionaire;
use App\Models\Client_Concessionaire;
class ClientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return view('client.create');
    }
    public function get_clients()
    {
        $clients = Client::where('status', 'activo')->with('concessionaire')->with('location')->get();
        return $clients;
    }

    public function get_concessionaires()
    {
        $concessionaires = Concessionaire::with('location')->get();
        return $concessionaires;
    }

    public function get_locations()
    {
        $locations = Location::all();
        return $locations;
    }

    public function client_location(Request $request)
    {
        
        return view('client.client_by_location');
    }

    public function search_clients_by_location($location_id)
    {
        $clients = Client::where('location_id',$location_id)->with('concessionaire')->with('location')->get();
        if(count($clients))
        {
            return $clients;

        }
        else{
            return response()->json([
                'errors' => [
                    'found' => 'No se han encontrado clientes en esta ubicación',
                ]
            ], 422);

        }
        
    }
    public function create(Request $request)
    {
        return view('client.create');
    }
    public function store(Request $request)
    {
          
        $request->validate([
            'name' => 'required',
            'dni' => 'required|alpha_num',
            'address' => 'required|',
            'phone' => 'required',
        ]);

        $client_saved = Client::where('dni',$request->dni)->get();
        
        //Verifico si ya esta registrado el cliente
        $no_found = true;
        foreach ($client_saved as $c) {
            if($c->concessionaire_id != $request->concessionaire_id)
            {
                $no_found = true;

            }
            else{
                $no_found = false;

            }
        }
        if($no_found == true){
            $client = new Client($request->all());
            $client->status = 'activo';
            $client->concessionaire_id= $request->concessionaire_id;
            /*Se busca el concesionario y se toma la ubicacion*/
            $concessionaire = Concessionaire::find($request->concessionaire_id);
            $client->location_id= $concessionaire->location_id;
            $client->save();
            return $client;
        }
        else{
            return response()->json([
                'errors' => [
                    'found' => 'El cliente ya ha sido registrado en este concesionario',
                ]
            ], 422);
        }
        
        
    }

    public function get_clients_by_location(Request $request)
    {


        return view('client.client_by_location');



    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'dni' => 'required|alpha_num',
            'address' => 'required|',
            'phone' => 'required',
        ]);

        $client_saved = Client::where('dni',$request->dni)->get();
        $client = Client::find($id);
        
        $no_found = false;
        foreach ($client_saved as $c) {
            
            if($c->concessionaire_id == $request->concessionaire_id)
            {
                $no_found = true;

            }
            
        }/*Si encuentra un cliente registrado con el mismo concesionario en la BD*/
        if($no_found == true){
            
            return response()->json([
                'errors' => [
                    'found' => 'Concesionario duplicado. El cliente ya ha sido registrado en este concesionario',
                ]
            ], 422);
        }
        else{
            $client->name = $request->name;
            $client->dni = $request->dni;
            $client->address = $request->address;
            $client->phone = $request->phone;
            $client->status = $request->status;
            $client->concessionaire_id = $request->concessionaire_id;
            /*Se busca el concesionario y se toma la ubicacion*/
            $concessionaire = Concessionaire::find($request->concessionaire_id);
            $client->location_id= $concessionaire->location_id;
            $client->save();
            return $client;
            
        }



    }




    public function delete($id, $concessionaire_id)
    {
        $client = Client::where('id', $id)
                    ->where('concessionaire_id', $concessionaire_id)->first();
        //Verifica si el usuario esta guardado y si lo encuentra cambia el estado
        if(empty($client_saved))
        {
        $client->status = 'inactivo';
        $client->save();
        }

    }
}

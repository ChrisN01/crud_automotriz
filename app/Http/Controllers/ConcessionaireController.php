<?php

namespace App\Http\Controllers;
use App\Models\Concessionaire;
use Illuminate\Http\Request;

class ConcessionaireController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view ('concessionaire.show');
    }

    public function list(){
        $concessionaires = Concessionaire::with('location')->get();
        return $concessionaires;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view ('concessionaire.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'address' => 'required|',
        ]);

        $concessionarie = new Concessionaire($request->all());
        $concessionarie_location_id = $request->location_id;
        $concessionarie->save();
        return $concessionarie;

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'address' => 'required|',
        ]);

        $concessionaire = Concessionaire::find($id);
        $concessionaire->address = $request->address;
        $concessionaire->location_id = $request->location_id;
        $concessionaire->save();
        return $concessionaire;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

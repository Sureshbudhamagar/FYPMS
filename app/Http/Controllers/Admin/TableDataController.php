<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\TableHeader;
use App\Models\TableData;

class TableDataController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tableheader = TableHeader::orderBy('display_order', 'asc')->get();

        $tabledata = TableData::paginate(10);

        return view('tabledata/list', compact('tableheader', 'tabledata'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // get table header for form labels
        $tableheader = TableHeader::orderBy('display_order', 'asc')->get();
        // dd($tableheader);

        return view('tabledata/form', compact('tableheader'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $tabledata = new TableData();

        $tableheader = TableHeader::orderBy('display_order', 'asc')->get();

        $data = [];

        foreach($tableheader as $header) {
            // echo $header->name;
            // $field = $header->name;
            // if(is_array($request->$field)) {
            //     $tabledata->$field = json_encode($request->$field);
            // } else {
            //     $tabledata->$field = $request->$field;    
            // }

            $field = $header->name;
            if(is_array($request->$field)) {
                $data[$field] = json_encode($request->$field);
            } else {
                $data[$field] = $request->$field;    
            }


            // handle if image
            
        }

        $tabledata->table_data_values = json_encode($data);



        // dd($tabledata);


        // dd($tableheader);
        // $gender = 'gender';
        // echo $request->$gender;
        // dd($request);

        $tabledata->save();

        return redirect()->back();
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
        //
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

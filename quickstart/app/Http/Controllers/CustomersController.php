<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CustomersController extends Controller
{
    //
    public function on_get(){
        //
        $c_all = Customer::all();
        return response()->json($c_all, 200);
    }

    public function on_post(){
        //
    }

    public function on_put(){
        //
    }

    public function on_delete(){
        //
    }

}

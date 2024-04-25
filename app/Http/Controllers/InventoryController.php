<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use App\Models\Item;

use Illuminate\Http\Request;

class InventoryController extends Controller
{

    //create Inventory functionality.....
    public function inventoryAdd(Request $req)
    {
        $data = new Inventory();
        $data->userId = auth()->user()->id;
        $data->invName = $req->invName;
        $data->description = $req->description;
        $data->items = json_encode($req->items);
        $result = $data->save();
        if ($result) {
            return response([
                'message' => 'Item is added successfully',
                'status' => '201'
            ]);
        } else {
            return response([
                'message' => 'failed, Something Went Wrong',
                'status' => '202'
            ]);
        }
    }
    // inventory detail.....
    public function inventoryDetail(){
        $data = Inventory::first();
        $itemList = json_decode($data['items']);
        
        unset($data['items']);
        $data['itm'] = $itemList;
        return response([
            'inventory'=> $data
            // 'item'=> $itemlist
        ]);
    }
}

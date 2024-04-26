<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use App\Models\Item;

use Illuminate\Http\Request;

class InventoryController extends Controller
{
    //Inventory List....

    public function inventoryList(){
        $data = Inventory::where('userID',auth()->user()->id)->get();
        return response([
            'inventory'=> $data
        ]);
    }

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
                'message' => 'Inventory is added successfully',
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
    public function inventoryDetail($id){
        // $itemDet = Item::all();
        $data = Inventory::where('id',$id)->first();
        $itemList = json_decode($data['items']);
        $itemnum =[];
        foreach($itemList as $itmlst){
            $itemDet = Item::where('id',$itmlst->itemId)->first();
            // $itmlst['itemId'] = $itemDet->name;
            // $itemnum[] = $itemDet;
            // $itemnum[]['quantity'] = $itmlst->quantity;
               $itmlst->name = $itemDet->name;
               $itmlst->description = $itemDet->description;
               $fileName = $itemDet->image;
               $path = asset('/image/upload/'. $fileName );   
               $itmlst->imgLink = $path;
            // $itemName = $itemDet->name;
            // $itemnum[] =$itemName;
            $itemnum[] = $itmlst;
        }



        unset($data['items']);
        $data['itm'] = $itemnum;
        return response([
            'inventory'=> $data
            // 'item'=> $itemlist
        ]);
    }

    //Inventory Delete
    public function inventoryDelete($id)
    {
        $data = Inventory::find($id);
        if(!$data){
            return response([
                "message"=>'Inventory doesnt exist',
                "status"=> 202
            ]);
        }else{
            $data->delete();
            return response([
                "message"=>'Inventory deleted successfuly',
                "status"=> 201
            ]);
        }
    }
    //Inventory Update

    public function inventoryUpdate(Request $req){
        $data = Inventory::find($req->id);
        $data->userId = auth()->user()->id;
        $data->invName = $req->invName;
        $data->description = $req->description;
        $data->items = json_encode($req->items);
        $result = $data->save();
        if ($result) {
            return response([
                'message' => 'Inventory is updated successfully',
                'status' => '201'
            ]);
        } else {
            return response([
                'message' => 'failed, Something Went Wrong',
                'status' => '202'
            ]);
        }

    }
}
    
    

    
    
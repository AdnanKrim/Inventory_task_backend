<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item;

class ItemController extends Controller
{
    // Add Item functionality....

    public function itemAdd(Request $req)
    {
        $data = new Item();
        $data->name = $req->name;
        $data->description = $req->description;
        if ($file = $req->file('image')) {
            $extension = $file->getClientOriginalExtension();
            $fileName = time() . '.' . $extension;
            $file->move('image/upload', $fileName);
            $data->image = $fileName;
        } else {
            unset($user['image']);
        }
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


    //Item list......
    public function itemList(){
        $data = Item:: all();
        $itemList=[];

        foreach($data as $item){
        $fileName = $item->image;
        $path = asset('/image/upload/'. $fileName );   
         $item->imgLink = $path;
         unset($item->image); 
         $itemList[]= $item;
    }
        return response([
            'items' => $itemList
        ]);
    }
    
}

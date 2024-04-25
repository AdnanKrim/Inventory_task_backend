<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    //login functionality............

    function userLogin(Request $request)
    {
        $user = User::where('email', $request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response([
                'message' => ['These credentials do not match our records.'],
                'status' => '404'
            ], 404);
        }

        $token = $user->createToken('my-app-token')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token,
            'status' => '201'

        ];

        return response($response, 201);
    }



    //logout functionality.....
    public function userLogout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response([
            'message' => ['logged out successfully'],
            'status' => '405'
        ]);
    }



    
    //user registration functionality....

    public function userReg(Request $req)
    {

        $validator = Validator::make($req->all(), [
            'email' => 'required|email|unique:users'
        ]);

        if ($validator->fails()) {
            $errorMessage = $validator->errors()->first();
            $response = [
                'status'  => '203',
                'message' => $errorMessage,
            ];
            return response()->json($response, 401);
        } else {
            $data = new User();
            $data->name = $req->name;
            $data->email = $req->email;
            $data->password = Hash::make($req->password);
            $result = $data->save();
            if ($result) {
                return response([
                    'message' => 'you are registered successfully',
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
}

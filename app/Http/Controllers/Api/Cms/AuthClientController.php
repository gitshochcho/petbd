<?php

namespace App\Http\Controllers\Api\Cms;

use App\Http\Controllers\Controller;
use App\Http\Requests\Cms\Auth\AuthClientRequest;
use App\Interfaces\Cms\AuthClientRepositoryInterface;
use App\Models\AuthClient;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthClientController extends Controller
{
    protected $client;

    public function __construct(AuthClientRepositoryInterface $client)
    {
        $this->client = $client;
    }

    public function login(AuthClient $obj, AuthClientRequest $request)
    {
        return $this->client->login($obj, $request);
    }

    public function refreshToken(Request $request)
    {
        return $this->client->refreshToken($request);
    }

    public function getUser(Request $request)
    {
        return $this->client->getUser($request);
    }

    public function docReg(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
            'password_confirmation' => 'required|string|min:8',
            'mobile' => 'required',
            // 'country_code' => 'required', // changed from 'ccode' to 'country_code'
            'bvc_reg_no' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        DB::transaction(function () use ($request) {
            $insert = [
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'status' => 1,
                'ccode' => $request->ccode,
                'mobile' => $request->mobile,
                'mobile_verified_at' => Carbon::now(),
                'email_verified_at' => Carbon::now(),
                'is_verify' => 1,
                'user_type' => 3,
            ];

            $userDetail = User::create($insert);
            $userDetail->UserInfo()->create([
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
            ]);

            $userDetail->doctorProfile()->create([
                'organization_id' => 1,
                'medical_license_number' => $request->bvc_reg_no,
                'status' => 0,
            ]);
        });

        return response()->json(['message' => 'Doctor registered successfully'], 201);
    }
}

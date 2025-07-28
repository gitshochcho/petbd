<?php

namespace App\Http\Controllers\Api\Cms;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class PetOwnerController extends Controller
{
    public function register(Request $request)
    {
        // Validate the request data
        $request->validate([
            'mobile' => 'required|string|max:255',
            'password' => 'required|string|min:8',
            'confirm_password' => 'required|string|same:password',
        ]);

        $data = DB::transaction(function () use ($request) {

            $full_name = $request->input('first_name', '') . ' ' . $request->input('middle_name', '') . ' ' . $request->input('last_name', '');

            $petOwner = User::create([
                'uid' => bin2hex(random_bytes(18)),
                'mobile' => $request->mobile,
                'ccode' => $request->ccode ?? '880',
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'full_name' => $full_name,
                'user_type' => '2',
                'is_verify' => 1,
                'status' => $request->status ?? 1

            ]);
            // dd($petOwner->id);
            // Check if user creation was successful
            if (!$petOwner || !$petOwner->id) {
                throw new \Exception('Failed to create user');
            }

            $petOwnerDetails = UserInfo::create([
                'user_id' => $petOwner->id,
                'first_name' => $request->input('first_name', ''),
                'middle_name' => $request->input('middle_name', ''),
                'last_name' => $request->input('last_name', ''),

            ]);

            return $petOwnerDetails;
        });

        if ($data) {
            return response()->json(['message' => 'Pet owner registered successfully.']);
        } else {
            return response()->json(['error' => 'Registration failed.'], 500);
        }
    }
}

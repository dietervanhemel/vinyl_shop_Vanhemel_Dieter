<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProfileController extends Controller
{
    // Edit user profile
    public function edit()
    {
        return view('user.profile');
    }

    // Update user profile
    public function update(Request $request)
    {
        // Validate $request
        $this->validate($request,[
            'name' => 'required',
            'email' => 'required|email|unique:users,email,' . auth()->id()
        ]);

        // Update user in the database and redirect to previous page
        session()->flash('success', 'Your profile has been updated');
        return back();
    }
}


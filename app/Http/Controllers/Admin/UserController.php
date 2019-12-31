<?php

namespace App\Http\Controllers\Admin;

use App\User;
use Facades\App\Helpers\Json;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sort_by_value = $request->input('sort_by');
        if ($sort_by_value == 1) {
            $sort_by = 'name';
            $altitude = 'desc';
        } elseif ($sort_by_value == 2) {
            $sort_by = 'email';
            $altitude = 'asc';
        } elseif ($sort_by_value == 3) {
            $sort_by = 'email';
            $altitude = 'desc';
        } elseif ($sort_by_value == 4) {
            $sort_by = 'active';
            $altitude = 'asc';
        } elseif ($sort_by_value == 5) {
            $sort_by = 'admin';
            $altitude = 'desc';
        } else {
            $sort_by = 'name';
            $altitude = 'asc';
        }
        $name_email = '%' . $request->input('user_name') . '%';
        $users = User::orderBy($sort_by, $altitude)
            ->where(function ($query) use ($name_email) {
                $query->where('name', 'like', $name_email);
            })
            ->orWhere(function ($query) use ($name_email) {
                $query->where('email', 'like', $name_email);
            })
            ->paginate(10)
            ->appends(['user_name' => $request->user_name, 'sort_by' => $request->sort_by]);
        $result = compact('users');
        Json::dump($result);
        return view('admin.users.index', $result);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return redirect('admin/users');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        return redirect('admin/users');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        $result = compact('user');
        Json::dump($result);
        return view('admin.users.edit', $result);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $this->validate($request,[
            'name' => 'required|unique:users,name,' . $user->id,
            'email' => 'required|unique:users,email,' . $user->id,
        ]);
        $user->name = $request->name;
        $user->email = $request->email;
        if($request->active == 'on') {$user->active = 1;}
        else {$user->active = 0;}
        if($request->admin) {$user->admin = 1;}
        else {$user->admin = 0;}
        $user->save();
        session()->flash('success', 'The User has been updated');
        return redirect('admin/users');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();
        session()->flash('success', "The genre <b>$user->name</b> has been deleted");
        return redirect('admin/users');
    }
}


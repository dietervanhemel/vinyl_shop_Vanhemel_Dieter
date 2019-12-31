@extends('layouts.template')

@section('title', 'Edit user')

@section('main')
    <h1>Edit User: {{ $user->name }}</h1>
    <form action="/admin/users/{{ $user->id }}" method="post">
        @method('put')
        @csrf
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" id="name"
                   class="form-control @error('name') is-invalid @enderror"
                   placeholder="Name"
                   minlength="3"
                   required
                   value="{{ old('name', $user->name) }}">
            @error('name')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" name="email" id="email"
                   class="form-control @error('email') is-invalid @enderror"
                   placeholder="Email"
                   minlength="3"
                   required
                   value="{{ old('email', $user->email) }}">
            @error('email')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <div class="form-check form-check-inline">
            <input type="checkbox" name="active" id="active" class="form-check-input"
                   @if ($user->active) checked @endif>
            <label for="active" class="form-check-label">Active</label>
        </div>
        <div class="form-check form-check-inline">
            <input type="checkbox" name="admin" id="admin" class="form-check-input"
                   @if ($user->admin) checked @endif>
            <label for="admin" class="form-check-label">Admin</label>
        </div>
        <button type="submit" class="btn btn-success mt-2">Save user</button>
    </form>
@endsection

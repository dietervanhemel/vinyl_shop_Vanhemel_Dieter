@extends('layouts.template')

@section('title', 'Users')

@section('main')
    <h1>Users</h1>
    @include('shared.alert')
    <form method="get" action="/admin/users" id="searchForm">
        <div class="row">
            <div class="col-sm-8 mb-2">
                <label for="user_name">Filter Name or Email</label>
                <input type="text" class="form-control" name="user_name" id="user_name"
                       value="{{ request()->user_name }}"
                       placeholder="Filter Name Or Email">
            </div>
            <div class="col-sm-4 mb-2">
                <label for="sort_by">Sort by</label>
                <select class="form-control" name="sort_by" id="sort_by">
                    <option value="0"
                        {{ (request()->sort_by ==  0? 'selected' : '') }}>Name (A => Z)
                    </option>
                    <option value="1"
                        {{ (request()->sort_by ==  1? 'selected' : '') }}>Name (Z => A)
                    </option>
                    <option value="2"
                        {{ (request()->sort_by ==  2? 'selected' : '') }}>Email (A => Z)
                    </option>
                    <option value="3"
                        {{ (request()->sort_by ==  3? 'selected' : '') }}>Email (Z => A)
                    </option>
                    <option value="4"
                        {{ (request()->sort_by ==  4? 'selected' : '') }}>Not active
                    </option>
                    <option value="5"
                        {{ (request()->sort_by ==  5? 'selected' : '') }}>Admin
                    </option>
                </select>
            </div>
        </div>
    </form>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Active</th>
                <th>Admin</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            @foreach($users as $user)
                <tr>
                    <td>{{ $user->id }}</td>
                    <td>{{ $user->name }}</td>
                    <td>{{ $user->email }}</td>
                    <td>@if ($user->active) <i class="fas fa-check"></i> @endif</td>
                    <td>@if ($user->admin) <i class="fas fa-check"></i> @endif</td>
                    <td data-name="{{$user->name}}">
                        <form action="/admin/users/{{ $user->id }}" method="post" id="delete_form">
                            @method('delete')
                            @csrf
                            <div class="btn-group btn-group-sm ">
                                <a href="/admin/users/{{ $user->id }}/edit" class="btn btn-outline-success @if(Auth::user()->name == $user->name) disabled @endif"
                                   data-toggle="tooltip"
                                   title="Edit {{ $user->name }}">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <button type="button" class="btn btn-outline-danger btn-delete"
                                        data-toggle="tooltip"
                                        title="Delete {{ $user->name }}"
                                        data-user="{{$user->name}}"
                                        @if(Auth::user()->name == $user->name) disabled @endif>
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </form>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
    @if ($users->count() == 0)
        <div class="alert alert-danger alert-dismissible fade show">
            Can't find any user with <b>'{{ request()->user_name }}'</b>
            <button type="button" class="close" data-dismiss="alert">
                <span>&times;</span>
            </button>
        </div>
    @endif
    {{ $users->links() }}
@endsection

@section('script_after')
    <script>
        $(function () {
            // submit form when leaving text field 'artist'
            $('#user_name').blur(function () {
                $('#searchForm').submit();
            });
            // submit form when changing dropdown list 'genre_id'
            $('#sort_by').change(function () {
                $('#searchForm').submit();
            });

            $('tbody').on('click', '.btn-delete', function () {
                // Get data attributes from td tag
                let name = $(this).closest('td').data('name');

                // Set some values for Noty
                let text = `<p>Delete the user <b>${name}</b>?</p>`;
                let type = 'warning';
                let btnText = 'Delete user';
                let btnClass = 'btn-success';

                // Show Noty
                let modal = new Noty({
                    timeout: false,
                    layout: 'center',
                    modal: true,
                    type: type,
                    text: text,
                    buttons: [
                        Noty.button(btnText, `btn ${btnClass}`, function () {
                            // Delete user and close modal
                            $('#delete_form').submit();
                            modal.close();
                        }),
                        Noty.button('Cancel', 'btn btn-secondary ml-2', function () {
                            modal.close();
                        })
                    ]
                }).show();
            });
        });
    </script>
@endsection


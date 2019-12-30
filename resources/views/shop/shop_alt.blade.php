@extends('layouts.template')

@section('Shop - Alternative listening')
@section('main')
    <h1>Shop - Alternative listening</h1>
<div class="container">
    @foreach($genres as $genre)
        <h2>{{$genre->name}}</h2>
    <ul>
        @foreach ($records as $record)
           @if($genre->id == $record->genre_id)
               <li><a href="#">{{$record->artist}} - {{$record->title}}</a> | Price: € {{$record->price}} | Stock: {{$record->stock}}</li>
           @endif
        @endforeach
    </ul>
    @endforeach
</div>
@endsection

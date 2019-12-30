<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">
    <link rel="shortcut icon" href="<?php echo asset('assets/icons/favicon.ico'); ?>">
    <title>@yield('title', 'The Vinyl Shop')</title>
    @yield('css_after')
    <script src="{{ mix('js/app.js') }}"></script>
    @yield('script_after')
</head>
<body>
@include('shared.navigation')
<main class="container mt-3">
    @yield('main', 'Page under construction ...')
</main>
@include('shared.footer')
<script src="{{ mix('js/app.js') }}"></script>
@yield('script_after')
@if(env('APP_DEBUG'))
    <script>
        $('form').attr('novalidate', 'true');
    </script>
@endif
</body>
</html>

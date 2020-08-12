@extends('layouts.app')
  
@section('content')
<div class="container">
<div class="row">
    <div class="col-md-12 margin-tb">
        <div class="float-left">
            <h2>Add New Blog</h2>
        </div>
        <div class="float-right">
            <a class="btn btn-primary" href="{{ route('blog.index') }}"> Back</a>
        </div>
    </div>
</div>
   
@if ($errors->any())
    <div class="alert alert-danger">
        <strong>Whoops!</strong> There were some problems with your input.<br><br>
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
   
<form action="{{ route('blog.store') }}" method="POST">
    @csrf
  
     <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Title:</strong>
                <input type="text" name="title" class="form-control" placeholder="Name">
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Body:</strong>
                <textarea class="form-control" style="height:150px" name="body" placeholder="Body"></textarea>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                <strong>Category:</strong>
                <div class="">
                                
                <select class="selectpicker form-control" multiple data-live-search="true" name="categories[]">
                  @foreach ($categories as $category)  
                    <option value="{{$category->id}}">{{$category->name}}</option>
                  @endforeach
                </select>
            </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
   
</form>
</div>
@endsection
	@foreach ($blogs as $blog)
	<div class="card">
	<div class="card-header"><span class="text-left">{{$blog->title}}</span> <small class="float-right">{{ $blog->created_at->toDayDateTimeString() }}</small></div>

	<div class="card-body">
	    {{$blog->body}}
	    <br><br>
	    Category : 
	    @foreach($blog->categories as $category)
	    <button type="button" class="btn btn-sm btn-info">{{$category->name}}</button>
	    @endforeach
	</div>
	</div><div class="clearfix"></div><br>
	@endforeach
	{!! $blogs->render() !!}


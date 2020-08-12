@extends('layouts.app')

@section('content')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-12 margin-tb">
            <div class="float-left">
                <a class="btn btn-primary pull-right" href="{{ route('blog.create') }}"><span class="glyphicon glyphicon-plus"></span> Create Blog</a>
            </div>
            <div class="float-right">
                <input type="text" id="search_date" placeholder="Please select date" data-input> <button type="button" class="btn btn-sm btn-info search_btn">Search</button>
            </div>
            <div class="clearfix"></div><br>
        </div><div class="clearfix"></div><br>

        <div class="col-md-12">
            <div id="blog-lists">
                @include('blogs.data')
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script type="text/javascript">

$("#search_date").flatpickr({
    enableTime: true,
    dateFormat: "d-m-Y"
});


$(window).on('hashchange', function() {
    if (window.location.hash) {
        var page = window.location.hash.replace('#', '');
        if (page == Number.NaN || page <= 0) {
            return false;
        }else{
            var search_date=$('#search_date').val();
            getData(page,search_date);
        }
    }
});


$(document).ready(function()
{
    $(document).on('click', '.pagination a',function(event)
    {
        $('li').removeClass('active');
        $(this).parent('li').addClass('active');
        event.preventDefault();


        var myurl = $(this).attr('href');
        var page=$(this).attr('href').split('page=')[1];

        var search_date=$('#search_date').val();

        getData(page,search_date);
    });

    $('.search_btn').click(function() {
        var search_date=$('#search_date').val();
        if(search_date==''){
            alert('Please enter search date.');    
        }
        
        var page = window.location.hash.replace('#', '');
        if (page == Number.NaN || page <= 0) {
            page=0;
        }
        var search_date=$('#search_date').val();
        getData(page,search_date);
    })
});


function getData(page,search_date){
        $.ajax(
        {
            url: '?page='+page+'&search_date='+search_date,
            type: "get",
            datatype: "html",
        })
        .done(function(data)
        {   
            if(data==''){
                data='<p>No blog found.</p>';
            }
            $("#blog-lists").empty().html(data);
            location.hash = page;
        })
        .fail(function(jqXHR, ajaxOptions, thrownError)
        {
              alert('No response from server');
        });
}
</script>
@endsection

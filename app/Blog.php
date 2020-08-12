<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{	
	protected $fillable = [
        'title','body','user_id'
    ];
    public function categories()
    {
        return $this->belongsToMany(Category::class, 'blog_category');
    }
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Post extends Model
{

    use Sluggable;
    public function sluggable() {
        return ['post_slug'=>[
            'source'=>'post_title',
            'onUpdate'=>true
        ]];
    }

    protected $fillable = array('user_id', 'post_title','post_slug','post_content');


}

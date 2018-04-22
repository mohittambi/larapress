<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Category extends Model
{

    use Sluggable;
    public function sluggable() {
        return ['category_slug'=>[
            'source'=>'category_title',
            'onUpdate'=>true
        ]];
    }

    protected $fillable = array('user_id', 'category_title','category_slug', 'parent_categories');


}

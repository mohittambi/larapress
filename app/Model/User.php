<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class User extends Model
{
    //
    use Sluggable;
     public function sluggable() {
        return ['slug'=>[
            'source'=>'full_name',
            'onUpdate'=>true
        ]];
    }


   
}

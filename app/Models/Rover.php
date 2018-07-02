<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Rover extends Model
{
    protected $table = 'rover';

    public function camera()
    {
        return $this->hasMany(Camera::class);
    }

}

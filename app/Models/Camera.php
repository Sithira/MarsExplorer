<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Camera extends Model
{
    protected $table = 'camera';

    /**
     * Get all images of a camera
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function images()
    {
        return $this->hasMany(Images::class);
    }

    /**
     * Get the instruments of a camera, if has any.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function instruments()
    {
        return $this->hasMany(Instrument::class);
    }

}

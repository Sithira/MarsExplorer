<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Orbiter extends Model
{
    protected $table = 'orbiter';

    /**
     * Get all the communications for a orbiter
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function communications()
    {
        return $this->hasMany(Communication::class);
    }
}

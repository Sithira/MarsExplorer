<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Computer extends Model
{
    protected $table = 'computer';

    /**
     * Get the rover of the computer
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rover()
    {
        return $this->belongsTo(Rover::class);
    }

    /**
     * Get all the coordinates in the computer
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function coordinates()
    {
        return $this->hasMany(Coordinate::class);
    }

    /**
     * Get all the coordinate copies
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function copies()
    {
        return $this->hasMany(Copy::class);
    }

}

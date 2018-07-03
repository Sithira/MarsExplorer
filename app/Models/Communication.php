<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Communication extends Model
{
    protected $table = 'communication';

    /**
     * Get the Orbiter that does the communication
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function orbiter()
    {
        return $this->belongsTo(Orbiter::class);
    }

    /**
     * Get the rover that the communication belong to
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rover()
    {
        return $this->belongsTo(Rover::class);
    }



}

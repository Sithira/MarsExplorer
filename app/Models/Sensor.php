<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sensor extends Model
{
    protected $table = 'sensor';

    /**
     * Get the rover that has the sensor attached on
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rover()
    {
        return $this->belongsTo(Rover::class);
    }

}

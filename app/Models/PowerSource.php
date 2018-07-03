<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PowerSource extends Model
{
    protected $table = 'powersource';

    /**
     * Get the rover that has the power source.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rover()
    {
        return $this->belongsTo(Rover::class);
    }

}

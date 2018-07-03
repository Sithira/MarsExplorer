<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Spacecraft extends Model
{
    protected $table = 'spacecraft';

    /**
     * Get all the missions for a spacecraft
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function missions()
    {
        return $this->belongsTo(Mission::class);
    }
}

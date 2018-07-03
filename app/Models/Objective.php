<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Objective
 *
 * @property-read \App\Models\Mission $mission
 * @mixin \Eloquent
 */
class Objective extends Model
{
    protected $table = 'objective';

    /**
     * Get the mission of the objective
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function mission()
    {
        return $this->belongsTo(Mission::class);
    }



}

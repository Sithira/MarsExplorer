<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mission extends Model
{
    protected $table = 'mission';

    /**
     * Get the objectives for a mission
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function objectives()
    {
        return $this->hasMany(Objective::class);
    }

    /**
     * Get the space-craft that belongs to the mission
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function spacecraft()
    {
        return $this->belongsTo(Spacecraft::class);
    }
}

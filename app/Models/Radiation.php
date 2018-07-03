<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Radiation extends Model
{
    protected $table = 'radiation';

    /**
     * Get the coordination that the coordinates belongs to
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function coordinate()
    {
        return $this->belongsTo(Coordinate::class);
    }

    /**
     * Get the interiors for the radiation.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function interiors()
    {
        return $this->hasMany(Interior::class);
    }

    /**
     * Get the surface of the radiation
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function surface()
    {
        return $this->belongsTo(Surface::class);
    }
}

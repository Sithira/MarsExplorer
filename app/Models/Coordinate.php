<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Coordinate
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Radiation[] $radiations
 * @mixin \Eloquent
 */
class Coordinate extends Model
{
    protected $table = 'coordinate';

    /**
     * Get all the radiation in a particular coordinate
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function radiations()
    {
        return $this->hasMany(Radiation::class);
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Radiation
 *
 * @property int $ID
 * @property int|null $COORDINATE_ID
 * @property string|null $RADLEVEL
 * @property string|null $TYPE
 * @property-read \App\Models\Coordinate $coordinate
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Interior[] $interiors
 * @property-read \App\Models\Surface $surface
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Radiation whereCOORDINATEID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Radiation whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Radiation whereRADLEVEL($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Radiation whereTYPE($value)
 * @mixin \Eloquent
 */
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

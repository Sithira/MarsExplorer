<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Spacecraft
 *
 * @property int $ID
 * @property string|null $NAME
 * @property string|null $COUNTRY
 * @property-read \App\Models\Mission $missions
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Spacecraft whereCOUNTRY($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Spacecraft whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Spacecraft whereNAME($value)
 * @mixin \Eloquent
 */
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

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Mission
 *
 * @property int $ID
 * @property int|null $SPACECRAFT_ID
 * @property string|null $NAME
 * @property string|null $PLANET
 * @property string|null $YEAR
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Objective[] $objectives
 * @property-read \App\Models\Spacecraft $spacecraft
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Mission whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Mission whereNAME($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Mission wherePLANET($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Mission whereSPACECRAFTID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Mission whereYEAR($value)
 * @mixin \Eloquent
 */
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

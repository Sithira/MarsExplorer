<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Orbiter
 *
 * @property int $ID
 * @property string|null $CMODE
 * @property string|null $TYPE
 * @property string|null $BAND
 * @property string|null $PLANET
 * @property int|null $ISMALFUNCTIONING
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Communication[] $communications
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Orbiter whereBAND($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Orbiter whereCMODE($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Orbiter whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Orbiter whereISMALFUNCTIONING($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Orbiter wherePLANET($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Orbiter whereTYPE($value)
 * @mixin \Eloquent
 */
class Orbiter extends Model
{
    protected $table = 'orbiter';

    /**
     * Get all the communications for a orbiter
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function communications()
    {
        return $this->hasMany(Communication::class);
    }
}

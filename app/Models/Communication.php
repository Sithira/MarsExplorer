<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Communication
 *
 * @property int $ID
 * @property int|null $ROVER_ID
 * @property int|null $ORBITER_ID
 * @property string|null $CMODE
 * @property string|null $TYPE
 * @property string|null $BAND
 * @property-read \App\Models\Orbiter $orbiter
 * @property-read \App\Models\Rover $rover
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Communication whereBAND($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Communication whereCMODE($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Communication whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Communication whereORBITERID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Communication whereROVERID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Communication whereTYPE($value)
 * @mixin \Eloquent
 */
class Communication extends Model
{
    protected $table = 'communication';

    /**
     * Get the Orbiter that does the communication
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function orbiter()
    {
        return $this->belongsTo(Orbiter::class);
    }

    /**
     * Get the rover that the communication belong to
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rover()
    {
        return $this->belongsTo(Rover::class);
    }



}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\PowerSource
 *
 * @property int $ID
 * @property int|null $ROVER_ID
 * @property string|null $NAME
 * @property-read \App\Models\Rover $rover
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\PowerSource whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\PowerSource whereNAME($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\PowerSource whereROVERID($value)
 * @mixin \Eloquent
 * @property float|null $CURRENT_LEVEL
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\PowerSource whereCURRENTLEVEL($value)
 */
class PowerSource extends Model
{
    protected $table = 'powersource';

    /**
     * Get the rover that has the power source.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rover()
    {
        return $this->belongsTo(Rover::class);
    }

}

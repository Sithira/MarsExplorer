<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Sensor
 *
 * @property int $ID
 * @property int|null $ROVER_ID
 * @property string|null $NAME
 * @property string|null $TYPE
 * @property-read \App\Models\Rover $rover
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Sensor whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Sensor whereNAME($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Sensor whereROVERID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Sensor whereTYPE($value)
 * @mixin \Eloquent
 * @property int|null $PARENT_ID
 * @property int|null $CAMERA_ID
 * @property int|null $SENSOR_TYPE_ID
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Sensor whereCAMERAID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Sensor wherePARENTID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Sensor whereSENSORTYPEID($value)
 */
class Sensor extends Model
{
    protected $table = 'sensor';

    /**
     * Get the rover that has the sensor attached on
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rover()
    {
        return $this->belongsTo(Rover::class);
    }

}

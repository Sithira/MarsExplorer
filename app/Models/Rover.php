<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Rover
 *
 * @property int $ID
 * @property int|null $MISSION_ID
 * @property string|null $NAME
 * @property string|null $WIDTH
 * @property string|null $HEIGHT
 * @property string|null $LENGTH
 * @property int|null $WHEEL_COUNT
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Camera[] $cameras
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Communication[] $communications
 * @property-read \App\Models\Computer $computer
 * @property-read \App\Models\Mission $mission
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\PowerSource[] $power_sources
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Sensor[] $sensors
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Rover whereHEIGHT($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Rover whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Rover whereLENGTH($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Rover whereMISSIONID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Rover whereNAME($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Rover whereWHEELCOUNT($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Rover whereWIDTH($value)
 * @mixin \Eloquent
 */
class Rover extends Model
{
    protected $table = 'rover';

    /**
     * Get all the camera in the rover
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function cameras()
    {
        return $this->hasMany(Camera::class);
    }

    /**
     * Get all the missions for the rover
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function mission() // Todo: Check this
    {
        return $this->belongsTo(Mission::class);
    }

    /**
     * Get all the power sources of the rover
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function power_sources()
    {
        return $this->hasMany(PowerSource::class);
    }

    /**
     * Get all the mode of communication of a rover.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function communications()
    {
        return $this->hasMany(Communication::class);
    }

    /**
     * Get the computer has on the rover
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function computer()
    {
        return $this->belongsTo(Computer::class);
    }

    /**
     * Get all the sensors in a rover
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function sensors()
    {
        return $this->hasMany(Sensor::class);
    }
}

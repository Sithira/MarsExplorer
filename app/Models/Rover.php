<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function missions()
    {
        return $this->hasMany(Mission::class);
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

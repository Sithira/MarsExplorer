<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Computer
 *
 * @property int $ID
 * @property int|null $ROVER_ID
 * @property string|null $EEPROM
 * @property string|null $DRAM
 * @property string|null $FLASH
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Coordinate[] $coordinates
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Copy[] $copies
 * @property-read \App\Models\Rover $rover
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Computer whereDRAM($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Computer whereEEPROM($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Computer whereFLASH($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Computer whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Computer whereROVERID($value)
 * @mixin \Eloquent
 */
class Computer extends Model
{
    protected $table = 'computer';

    /**
     * Get the rover of the computer
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rover()
    {
        return $this->belongsTo(Rover::class);
    }

    /**
     * Get all the coordinates in the computer
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function coordinates()
    {
        return $this->hasMany(Coordinate::class);
    }

    /**
     * Get all the coordinate copies
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function copies()
    {
        return $this->hasMany(Copy::class);
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Surface
 *
 * @property int $ID
 * @property int|null $RADIATION_ID
 * @property string|null $LANDINGSITE
 * @property-read \App\Models\Radiation $radiation
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Surface whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Surface whereLANDINGSITE($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Surface whereRADIATIONID($value)
 * @mixin \Eloquent
 */
class Surface extends Model
{
    protected $table = 'surface';

    /**
     * Get the radiation of the surface
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function radiation()
    {
        return $this->belongsTo(Radiation::class);
    }
}

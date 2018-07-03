<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Instrument
 *
 * @property int $ID
 * @property int|null $CHEMCAM_ID
 * @property string|null $NAME
 * @property string|null $PURPOSE
 * @property-read \App\Models\Camera $camera
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Instrument whereCHEMCAMID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Instrument whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Instrument whereNAME($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Instrument wherePURPOSE($value)
 * @mixin \Eloquent
 */
class Instrument extends Model
{
    protected $table = 'instrument';

    /**
     * Get the camera of the instrument
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function camera()
    {
        return $this->belongsTo(Camera::class);
    }

}

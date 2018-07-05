<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Camera
 *
 * @property int $ID
 * @property int|null $ROVER_ID
 * @property int|null $ISMAINCAM
 * @property string|null $NAME
 * @property string|null $FOCAL_LENGTH
 * @property string|null $FIELD_OF_VIEW
 * @property string|null $RESOLUTION
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Images[] $images
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Instrument[] $instruments
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Camera whereFIELDOFVIEW($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Camera whereFOCALLENGTH($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Camera whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Camera whereISMAINCAM($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Camera whereNAME($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Camera whereRESOLUTION($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Camera whereROVERID($value)
 * @mixin \Eloquent
 * @property int|null $CAMERA_TYPE_ID
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Camera whereCAMERATYPEID($value)
 */
class Camera extends Model
{
    protected $table = 'camera';

    /**
     * Get all images of a camera
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function images()
    {
        return $this->hasMany(Images::class);
    }

    /**
     * Get the instruments of a camera, if has any.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function instruments()
    {
        return $this->hasMany(Instrument::class);
    }

}

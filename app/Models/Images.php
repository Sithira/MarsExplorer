<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Images
 *
 * @property int $ID
 * @property int|null $CAMERA_ID
 * @property int|null $STORAGE_ID
 * @property float|null $SIGNIFICANCE
 * @property string|null $RESOLUTION
 * @property-read \App\Models\Camera $camera
 * @property-read \App\Models\Storage $storage
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Images whereCAMERAID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Images whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Images whereRESOLUTION($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Images whereSIGNIFICANCE($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Images whereSTORAGEID($value)
 * @mixin \Eloquent
 */
class Images extends Model
{
    protected $table = 'images';

    /**
     * Get the camera that the image was taken
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function camera()
    {
        return $this->belongsTo(Camera::class);
    }

    /**
     * Get the storage belongs to the image.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function storage()
    {
        return $this->belongsTo(Storage::class);
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Storage
 *
 * @property int $ID
 * @property string|null $TYPE
 * @property string|null $CAPACITY
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Images[] $images
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Storage whereCAPACITY($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Storage whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Storage whereTYPE($value)
 * @mixin \Eloquent
 */
class Storage extends Model
{
    protected $table = 'storage';

    /**
     * Get all the images in the storage
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function images()
    {
        return $this->hasMany(Images::class);
    }

}

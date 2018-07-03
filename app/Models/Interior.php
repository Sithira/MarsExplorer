<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Interior
 *
 * @property int $ID
 * @property int|null $RADIATION_ID
 * @property float|null $DISTANCE
 * @property-read \App\Models\Interior $radiation
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Interior whereDISTANCE($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Interior whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Interior whereRADIATIONID($value)
 * @mixin \Eloquent
 */
class Interior extends Model
{
    protected $table = 'interior';

    /**
     * Get the radiation that the interior belongs to
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function radiation()
    {
        return $this->belongsTo(Interior::class);
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Copy
 *
 * @property int $ID
 * @property int|null $COMPUTER_ID
 * @property int|null $COORDINATE_ID
 * @property-read \App\Models\Computer $computer
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Copy whereCOMPUTERID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Copy whereCOORDINATEID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Copy whereID($value)
 * @mixin \Eloquent
 */
class Copy extends Model
{
    protected $table = 'copy';

    /**
     * Get the computer belongs to the copy
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function computer()
    {
        return $this->belongsTo(Computer::class);
    }

}

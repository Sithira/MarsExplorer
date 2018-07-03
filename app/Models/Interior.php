<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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

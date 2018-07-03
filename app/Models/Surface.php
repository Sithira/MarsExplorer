<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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

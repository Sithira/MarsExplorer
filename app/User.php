<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * App\User
 *
 * @property int $ID
 * @property string $USERNAME
 * @property string $PASSWORD
 * @property string|null $REMEMBER_TOKEN
 * @property string|null $CREATED_AT
 * @property string|null $UPDATED_AT
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection|\Illuminate\Notifications\DatabaseNotification[] $notifications
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereCREATEDAT($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereID($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User wherePASSWORD($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereREMEMBERTOKEN($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereUPDATEDAT($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\User whereUSERNAME($value)
 * @mixin \Eloquent
 */
class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Post
 * @package App\Models
 *
 * @property int $id
 * @property int $user_id
 * @property string $caption
 * @property string $image
 * @property int|null $created_at
 * @property int|null $updated_at
 *
 * @property User $user
 */

class Post extends Model
{

    use HasFactory;

    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}

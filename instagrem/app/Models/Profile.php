<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Profile
 * @package App\Models
 *
 * @property int $id
 * @property int $user_id
 * @property string $title
 * @property string $url
 * @property string $description
 * @property string $image
 * @property int|null $created_at
 * @property int|null $updated_at
 *
 * @property User $user
 * @property User $followers
 */

class Profile extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function profileImage()
    {
        $imagePath = $this->image ?? 'defaults/profileImage.jpg';

        return '/storage/' . $imagePath;
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function followers()
    {
        return $this->belongsToMany(User::class);
    }
}

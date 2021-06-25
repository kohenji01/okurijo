<?php

namespace App\Models;

use CodeIgniter\Model;

class OkurijoData extends Model{
    protected $table = 'okurijo_data';
    protected $allowedFields = [
        'last_name',
        'first_name',
        'zipcode',
        'prefectures',
        'add01',
        'add02',
        'company',
        'department',
        'katagaki',
        'tel',
        'fax',
        'print',
    ];
    protected $primaryKey = 'id';
}
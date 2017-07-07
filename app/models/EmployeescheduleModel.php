<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeescheduleModel extends Model
{
    protected $table      = 'employee_schedule';   // it's always better to specify it
    protected $primaryKey = 'emsc_id';     // must be defined if different from 'id'
    public    $timestamps = false;     // to get rid of created_at and updated_at

    public static function getAll()
    {
        return EmployeescheduleModel::all();
    }

    public static function getAllNonVoid()
    {
      $res = EmployeescheduleModel::where('emsc_void', 0)->get();
      return $res;
    }

    public static function getAllNonVoidWhereIn($data = null)
    {
      if(!is_array($data)) return 0;

      $res = EmployeescheduleModel::join('schedule', 'emsc_schd_id', '=', 'schd_id')->where('emsc_void', 0)->whereIn('emsc_emp_id', $data)->get();
      return $res;
    }

    public static function getByUniqCode($uniqCode)
    {
      $res = EmployeescheduleModel::where('emsc_uniq_code', $uniqCode)->first();
      return $res;
    }
}
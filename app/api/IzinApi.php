<?php

namespace App\Api;

use Interop\Container\ContainerInterface;
use App\Models\IzinModel as Izin;
use App\Helper;

class IzinApi
{
    protected $ci;

    public function __construct(ContainerInterface $ci)
    {
        $this->ci = $ci;
    }

    public function lists($request, $response, $args)
    {
        $arrData = array(
          'data' => array()
        );

        $result = Izin::getAllNonVoid();
        if(!empty($result)) {
          foreach ($result as $key => $value) {
            $arrData['data'][] = array(
              ($key + 1),
              $value->emcu_id,
              $value->sta_name,
              $value->emp_name,
              $value->emcu_tanggal_awal,
              $value->emcu_tanggal_akhir,
              $value->emcu_keterangan,
            );
          }
        }

        return $response->withJson($arrData);
    }

    public function doAdd($request, $response, $args)
    {
      $arrData = array(
          'message' => '',
          'success' => false,
      );

      $emcu_emp_id = $request->getParam('emcu_emp_id');
      $emcu_sta_id = $request->getParam('emcu_sta_id');
      $emcu_tanggal_awal = $request->getParam('emcu_tanggal_awal');
      $emcu_tanggal_akhir = $request->getParam('emcu_tanggal_akhir');
      $emcu_keterangan = $request->getParam('emcu_keterangan');
      $emcu_flag_cuti = !empty($request->getParam('emcu_flag_cuti')) ? $request->getParam('emcu_flag_cuti') : 0;

      if(!empty($emcu_tanggal_awal)) $emcu_tanggal_awal = Helper::formatDBDate($emcu_tanggal_awal);
      if(!empty($emcu_tanggal_akhir)) $emcu_tanggal_akhir = Helper::formatDBDate($emcu_tanggal_akhir);

      $obj = new Izin;
      $obj->emcu_emp_id = $emcu_emp_id;
      $obj->emcu_sta_id = $emcu_sta_id;
      $obj->emcu_tanggal_awal = $emcu_tanggal_awal;
      $obj->emcu_tanggal_akhir = $emcu_tanggal_akhir;
      $obj->emcu_keterangan = $emcu_keterangan;
      $obj->emcu_created_at = Helper::dateNowDB();
      $obj->emcu_flag_cuti = $emcu_flag_cuti;

      if($obj->save()) {
        $arrData['success'] = true;
        $arrData['message'] = 'Insert data success';
      } else {
        $arrData['message'] = 'Oops.. please try again!';
      }

      return $response->withJson($arrData);
    }

    public function doEdit($request, $response, $args)
    {
      $arrData = array(
          'message' => '',
          'success' => false,
      );

      $emcu_id = $request->getParam('emcu_id');
      $emcu_emp_id = $request->getParam('emcu_emp_id');
      $emcu_sta_id = $request->getParam('emcu_sta_id');
      $emcu_tanggal_awal = $request->getParam('emcu_tanggal_awal');
      $emcu_tanggal_akhir = $request->getParam('emcu_tanggal_akhir');
      $emcu_keterangan = $request->getParam('emcu_keterangan');
      $emcu_flag_cuti = !empty($request->getParam('emcu_flag_cuti')) ? $request->getParam('emcu_flag_cuti') : 0;

      if(!empty($emcu_tanggal_awal)) $emcu_tanggal_awal = Helper::formatDBDate($emcu_tanggal_awal);
      if(!empty($emcu_tanggal_akhir)) $emcu_tanggal_akhir = Helper::formatDBDate($emcu_tanggal_akhir);

      $obj = Izin::find($emcu_id);
      $obj->emcu_emp_id = $emcu_emp_id;
      $obj->emcu_sta_id = $emcu_sta_id;
      $obj->emcu_tanggal_awal = $emcu_tanggal_awal;
      $obj->emcu_tanggal_akhir = $emcu_tanggal_akhir;
      $obj->emcu_keterangan = $emcu_keterangan;
      $obj->emcu_updated_at = Helper::dateNowDB();
      $obj->emcu_flag_cuti = $emcu_flag_cuti;

      if($obj->save()) {
        $arrData['success'] = true;
        $arrData['message'] = 'Update data success';
      } else {
        $arrData['message'] = 'Oops.. please try again!';
      }

      return $response->withJson($arrData);
    }

    public function edit($request, $response, $args)
    {
      $arrData = array();

      $emcu_id = $request->getParam('emcu_id');
      $obj = Izin::find($emcu_id);
      if(!empty($obj)) {
        if(isset($obj->emcu_tanggal_awal)) $obj->emcu_tanggal_awal = Helper::formatDate($obj->emcu_tanggal_awal);
        if(isset($obj->emcu_tanggal_akhir)) $obj->emcu_tanggal_akhir = Helper::formatDate($obj->emcu_tanggal_akhir);

        $arrData['emcu_id'] = $obj->emcu_id;
        $arrData['emcu_emp_id'] = $obj->emcu_emp_id;
        $arrData['emcu_sta_id'] = $obj->emcu_sta_id;
        $arrData['emcu_tanggal_awal'] = $obj->emcu_tanggal_awal;
        $arrData['emcu_tanggal_akhir'] = $obj->emcu_tanggal_akhir;
        $arrData['emcu_keterangan'] = $obj->emcu_keterangan;
        $arrData['emcu_flag_cuti'] = $obj->emcu_flag_cuti;
      }

      return $response->withJson($arrData);
    }

    public function doDelete($request, $response, $args)
    {
      $arrData = array(
          'message' => '',
          'success' => false,
      );

      $emcu_id = $request->getParam('emcu_id');
      $obj = Izin::find($emcu_id);
      $obj->emcu_void = 1;

      if($obj->save()) {
        $arrData['success'] = true;
        $arrData['message'] = 'Delete data success';
      } else {
        $arrData['message'] = 'Oops.. please try again!';
      }

      return $response->withJson($arrData);
    }
}

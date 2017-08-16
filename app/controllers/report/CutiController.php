<?php

namespace App\Controllers\Report;

use Interop\Container\ContainerInterface;
use Gettext\Translator;

class CutiController extends \App\Controllers\BaseController
{
    protected $ci;
    protected $data;

    public function __construct(ContainerInterface $ci)
    {
        parent::__construct();
        $this->ci = $ci;

        $this->data['primaryKey'] = 'cut_id';
        $this->data['inputFocus'] = 'cut_name';
        $this->data['baseUrl'] = $this->ci->get('settings')['baseUrl'];

        $this->data['myRoleAccess'] = $this->getRoleAccess($_SESSION['USERID']);
    }

    public function lists($request, $response, $args)
    {
        $this->ci->get('logger')->info("Slim-Skeleton 'GET /report/cuti/list' route");

        $this->data['menuActived'] = 'report';
        $this->data['sideMenu'] = $this->ci->get('renderer')->fetch('sidemenu.phtml', $this->data);

        $this->data['selectedYear'] = !empty($request->getParam('slYear')) ? $request->getParam('slYear') : date('Y');
        $this->data['yearFilterRange'] = $this->getYearFilterRange();

        return $this->ci->get('renderer')->render($response, 'report/cuti/list.phtml', $this->data);
    }
}

<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
include 'extend.php';

/**
 * 获取树级目录
 * @param $a
 * @param $pid
 * @param $col
 * @return array
 */
function getTree($a, $pid, $col='parent_id')
{
    $tree = array();                                //每次都声明一个新数组用来放子元素
    foreach ($a as $v) {
        if (!$v['name']) {
            $v['name'] = "";
        }
        if ($v["$col"] == $pid) {                      //匹配子记录
            $v['children'] = getTree($a, $v['id'], $col); //递归获取子记录
            if ($v['children'] == null) {
//                unset($v['children']);             //如果子元素为空则unset()进行删除，说明已经到该分支的最后一个元素了（可选）
            }
            $tree[] = $v;                           //将记录存入新数组
        }
    }
    return $tree;                                  //返回新数组
}


/**
 * 格式化返回数据
 * @param int $code
 * @param string $msg
 * @param object $data
 */
function exit_json($code = 1, $msg = "操作成功", $data = null)
{
    if (is_null($data)) {
        $data = new stdClass();
    }
    header('content-Type:application/json');
    exit(json_encode(['code' => $code, 'msg' => $msg, 'data' => $data]));
}

/**
 * 校验手机号合法性
 * @param $telephone
 * @return false|int
 */
function test_tel($telephone)
{
    return preg_match('/^1[34578]\d{9}$/', $telephone);
}

/**
 * 获取指定经纬度之间距离
 * @param $lat1
 * @param $lng1
 * @param $lat2
 * @param $lng2
 * @param int $len_type
 * @param int $decimal
 * @return float
 */
function GetDistance($lat1, $lng1, $lat2, $lng2, $len_type = 1, $decimal = 2)
{

    $earth = 6378.137;
    $radLat1 = $lat1 * PI() / 180.0;   //PI()圆周率
    $radLat2 = $lat2 * PI() / 180.0;
    $a = $radLat1 - $radLat2;
    $b = ($lng1 * PI() / 180.0) - ($lng2 * PI() / 180.0);
    $s = 2 * asin(sqrt(pow(sin($a / 2), 2) + cos($radLat1) * cos($radLat2) * pow(sin($b / 2), 2)));
    $s = $s * $earth;
    $s = round($s * 1000);
    if ($len_type > 1) {
        $s /= 1000;
    }
    return round($s, $decimal);
}

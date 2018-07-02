<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/26
 * Time: 16:04
 */
$leftmenu = [
    [
        'navName'=>'司机管理',
        'navChild'=>[
            [
                'navName'=>'司机列表',
                'url'=>'Drivers/index'
            ],
            [
                'navName'=>'待审核司机列表',
                'url'=>'Drivers/verify'
            ],
        ]
    ],
    [
        'navName'=>'用户管理',
        'navChild'=>[
            [
                'navName'=>'用户列表',
                'url'=>'User/index'
            ]
        ]
    ]
];
<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018.5.5
 * Time: 21:02
 */

namespace app\shop\controller;


class User extends Base
{
    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    public function index()
    {
        $userList = model('user')->select();
        $this->assign('userList', $userList);
        return $this->fetch();
    }
    /**
     * 删除用户信息
     */
    public function delData()
    {
        $res = model('user')->where('id', input('post.id'))->delete();
        if($res){
            exit_json();
        }else{
            exit_json(-1, '删除失败');
        }
    }

}
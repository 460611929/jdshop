<?php

namespace Admin\Model;

/**
 * Created by PhpStorm.
 * User: zhangbing1
 * Date: 2015/9/16
 * Time: 14:22
 */
class UserModel extends \Think\Model
{

    public $_login_validate = array(
        array('username', 'require', '用户名不能为空',1),
        array('password', 'require', '密码不能为空',1),
    );

    public function login()
    {
        $username = $this->username;
        $password = $this->password;
        $user = $this->where(array('username' => array('eq', $username)))->find();

        if ($user) {
            if ($user['is_use'] == 1) {
                if ($user['password'] == md5($password . C('MD5_SECRET_KEY'))) {
                    session('username', $username);
                    session('id', $user['id']);
                    return true;

                } else {
                    $this->error = '密码不正确';
                    return false;
                }
            } else {
                $this->error = '账号已被禁用';
                return false;
            }
        } else {
            $this->error = '账号不存在';
            return false;
        }


    }

}
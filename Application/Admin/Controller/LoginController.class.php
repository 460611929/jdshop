<?php
/**
 * Created by PhpStorm.
 * User: zhangbing1
 * Date: 2015/9/16
 * Time: 10:48
 */

namespace Admin\Controller;


use Think\Controller;

class LoginController extends Controller
{

    public function login()
    {
        if (IS_POST) {

            $model = D('User');
            // 使用validate方法来指定使用模型中的哪个数组做为验证规则，默认是使用$_validate
            // 我这里把登录的规则和添加修改管理员的规则分成了两个，所以这里要指定使用哪个
            if ($model->validate($model->_login_validate)->create()) {
                if (TRUE === $model->login()) {
                    redirect(U('Admin/Index/index'));
                    return true;
                }
            }
            $this->error($model->getError());
        }
        $this->display();
    }

    public function  sign()
    {

    }

}
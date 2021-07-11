window.onload = function () {
    // 1.给表单绑定onsubmit事件
    document.getElementById("form").onsubmit = function () {
        //调用用户名校验方法  checkUsername（）
        //return checkUsername() &&checkPassword();
        //调用密码校验方法  checkPassword（）
        return checkUsername() && checkPassword();
    }
    //添加失去焦点事件
    document.getElementById("username").onblur = checkUsername;
    document.getElementById("password").onblur = checkPassword;
}

//校验密码
function checkPassword() {
    //1.获取用户名的值
    var password = document.getElementById('password').value;
    //2.定义正则表达式
    var reg_password = /^\w{6,12}$/;
    //3.判断值是否符合正则的规则
    var flag = reg_password.test(password);
    //4.提示信息
    var s_password = document.getElementById("s_password");
    if (flag) {
        //提示红色对勾
        s_password.innerHTML = "<img width='35' height='25' src='../img/gou.jpg'  alt='error'/>";
    } else {
        //提示红色用户名有误
        s_password.innerHTML = "6-12位的英文和数字的组合";
    }
    return flag;
}

//校验用户名
function checkUsername() {
    //1.获取密码的值
    var username = document.getElementById("username").value;
    //2.定义正则表达式
    var reg_username = /^\w{6,12}$/;
    //3.判断值是否符合正则的规则
    var flag = reg_username.test(username);
    //4.提示信息
    var s_username = document.getElementById("s_username");
    if (flag) {
        //提示红色对勾
        s_username.innerHTML = "<img width='35' height='25' src='../img/gou.jpg' alt='error'/>";
    } else {
        //提示红色用户名有误
        s_username.innerHTML = "6-12位的英文和数字的组合";
    }
    return flag;
}


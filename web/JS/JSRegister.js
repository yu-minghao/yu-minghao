window.onload = function () {
    // 1.������onsubmit�¼�
    document.getElementById("form").onsubmit = function () {
        //�����û���У�鷽��  checkUsername����
        //return checkUsername() &&checkPassword();
        //��������У�鷽��  checkPassword����
        return checkUsername() && checkPassword();
    }
    //���ʧȥ�����¼�
    document.getElementById("username").onblur = checkUsername;
    document.getElementById("password").onblur = checkPassword;
}

//У������
function checkPassword() {
    //1.��ȡ�û�����ֵ
    var password = document.getElementById('password').value;
    //2.����������ʽ
    var reg_password = /^\w{6,12}$/;
    //3.�ж�ֵ�Ƿ��������Ĺ���
    var flag = reg_password.test(password);
    //4.��ʾ��Ϣ
    var s_password = document.getElementById("s_password");
    if (flag) {
        //��ʾ��ɫ�Թ�
        s_password.innerHTML = "<img width='35' height='25' src='../img/gou.jpg'  alt='error'/>";
    } else {
        //��ʾ��ɫ�û�������
        s_password.innerHTML = "6-12λ��Ӣ�ĺ����ֵ����";
    }
    return flag;
}

//У���û���
function checkUsername() {
    //1.��ȡ�����ֵ
    var username = document.getElementById("username").value;
    //2.����������ʽ
    var reg_username = /^\w{6,12}$/;
    //3.�ж�ֵ�Ƿ��������Ĺ���
    var flag = reg_username.test(username);
    //4.��ʾ��Ϣ
    var s_username = document.getElementById("s_username");
    if (flag) {
        //��ʾ��ɫ�Թ�
        s_username.innerHTML = "<img width='35' height='25' src='../img/gou.jpg' alt='error'/>";
    } else {
        //��ʾ��ɫ�û�������
        s_username.innerHTML = "6-12λ��Ӣ�ĺ����ֵ����";
    }
    return flag;
}


<?php
require_once '../../models/UserModel.php';


if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    
  
    $userModel = new UserModel();
    $user = $userModel->authenticate($username, $password);
    
  
    if ($user['role'] === 0) {
        header('Location: ../../views/admin/admin.php');
        exit;
    } elseif ($user['role'] === 1) {
        header('Location: ../../views/student/student.php');
        exit;
    } else {
        $error = 'Tên người dùng hoặc mật khẩu không chính xác';
    }
}


require_once '../../views/loginpage/loginPage.php';
?>

<?php
require_once 'sql_connect.php';

class CourseModel {
    

    public function getCourseById($courseId) {
        $db = Database::getInstance();
        $conn = $db->getConnection();

        $query = "SELECT * FROM course WHERE id_Course = :courseId";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':courseId', $courseId);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>

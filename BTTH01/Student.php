<?php
class student{
    private $id;
    private $name;
    private $age;

    public function __construct($id , $name , $age){
        $this->id = $id;
        $this->name = $name;
        $this->age = $age;
    }
    function getID(){
        return $this->id;
    }
    function getName(){
        return $this->name;
    }
    function getAge(){
        return $this->age;
    }
    function setID($id){
        $this->id = $id;
    }
    function setName($name){
        $this->name = $name;
    }
    function setAge($age){
        $this->age = $age;
    }
} 
?>
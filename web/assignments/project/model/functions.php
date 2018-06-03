<?php

function is_valid_admin_login($username, $password) {
    try {
        global $db;
        $query = 'SELECT id
                  FROM project.user
                  WHERE username = :username AND password = :password';
        $statement = $db->prepare($query);
        $statement->bindValue(':username', $username);
        $statement->bindValue(':password', $password);
        $statement->execute();
        $valid = ($statement->rowCount() == 1);
        $statement->closeCursor();
        return $valid;
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
        exit;
    }
}

function userID($username) {
    global $db;
    $query = 'SELECT id
              FROM project.user
              WHERE username=:username
              ';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('username', $username);
        $statement->execute();
        $result = $statement->fetch();
        $statement->closeCursor();
        return $result[0];
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

// SCHOOLS

function getSchools() {
    global $db;
    $query = 'SELECT * FROM project.school';
    try {
        $statement = $db->prepare($query);
        $statement->execute();
        $result = $statement->fetchAll();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

function getSchool($idSchool) {
    global $db;
    $query = 'SELECT *
              FROM project.school
              WHERE id = :idSchool';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('idSchool', $idSchool);
        $statement->execute();
        $result = $statement->fetch();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

function addSchool($school, $email, $website) {
    global $db;
    $query = 'INSERT INTO project.school (school, email, website)
              VALUES (:school, :email, :website)';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('school', $school);
        $statement->bindValue('email', $email);
        $statement->bindValue('website', $website);
        $statement->execute();
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

function editSchool($idSchool, $school, $email, $website) {
    global $db;
    $query = 'UPDATE project.school
              SET school=:school, email=:email, website=:website
              WHERE id=:idSchool';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('idSchool', $idSchool);
        $statement->bindValue('school', $school);
        $statement->bindValue('email', $email);
        $statement->bindValue('website', $website);
        $statement->execute();
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}
// CENTERS

function getCenters($idSchool) {
    global $db;
    $query = 'SELECT *
              FROM project.center
              WHERE school_id = :idSchool
              ORDER BY country ASC';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('idSchool', $idSchool);
        $statement->execute();
        $result = $statement->fetchAll();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

function getCenter($idCenter) {
    global $db;
    $query = 'SELECT *
              FROM project.center
              WHERE id = :idCenter';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('idCenter', $idCenter);
        $statement->execute();
        $result = $statement->fetch();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

function addCenter($center, $address, $email, $phone, $city, $country, $school_id) {
    global $db;
    $query = 'INSERT INTO project.center (center, address, email, phone, city, country, school_id)
              VALUES (:center, :address, :email, :phone, :city, :country, :school_id)';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('center', $center);
        $statement->bindValue('address', $address);
        $statement->bindValue('email', $email);
        $statement->bindValue('phone', $phone);
        $statement->bindValue('city', $city);
        $statement->bindValue('country', $country);
        $statement->bindValue('school_id', $school_id);
        $statement->execute();
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

function editCenter($idCenter, $center, $address, $email, $phone, $city, $country) {
    global $db;
    $query = 'UPDATE project.center
              SET center=:center, address=:address, email=:email, phone=:phone, city=:city, country=:country
              WHERE id=:idCenter';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('idCenter', $idCenter);
        $statement->bindValue('center', $center);
        $statement->bindValue('address', $address);
        $statement->bindValue('email', $email);
        $statement->bindValue('phone', $phone);
        $statement->bindValue('city', $city);
        $statement->bindValue('country', $country);
        $statement->execute();
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

// PROGRAMS

function getPrograms($idCenter) {
    global $db;
    $query = 'SELECT *
              FROM project.program
              WHERE center_id = :idCenter';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('idCenter', $idCenter);
        $statement->execute();
        $result = $statement->fetchAll();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

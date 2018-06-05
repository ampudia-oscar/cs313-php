<?php

function validateLogin($username, $password)
{
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

function user($username) {
    global $db;
    $query = 'SELECT *
              FROM project.user
              WHERE username = :username';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('username', $username);
        $statement->execute();
        $result = $statement->fetch();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

function addUser($username,$password)
{
    global $db;
    $query = 'INSERT INTO project.user (username,password) VALUES (:username,:password)';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue('username', $username);
        $statement->bindValue('password',$password);
        $statement->execute();
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
}


<?php
$dsn = 'pgsql:host=127.0.0.1;dbname=ampudia';
$username = 'ampudia';
$password = '.rinoa.4';
$options = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);

try {
    $db = new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
    exit;
}

function getScriptures() {
    global $db;
    $query = 'SELECT *
              FROM topic_scripture ts
              INNER JOIN scriptures s ON s.id = ts.scripture_id
              INNER JOIN topic t ON t.id = ts.topic_id
              ';
    try {
        $statement = $db->prepare($query);
        $statement->execute();
        $result = $statement->fetchAll();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        $e->getMessage();
        echo $e;
    }
}

function getTopics() {
    global $db;
    $query = 'SELECT * FROM topic';
    try {
        $statement = $db->prepare($query);
        $statement->execute();
        $result = $statement->fetchAll();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        $e->getMessage();
        echo $e;
    }
}

function setTopicScripture($topic_id, $scripture_id) {
    global $db;
    try {
        $query = "INSERT INTO topic_scripture (topic_id, scripture_id)
                 VALUES ('$topic_id','$scripture_id')";
        $db->exec($query);
    } catch (PDOException $e) {
        $e->getMessage();
        echo $e;
    }
}

function setScripture($book, $chapter, $verse, $content) {
    global $db;
    try {
        $query = "INSERT INTO scriptures (book, chapter, verse, content)
                 VALUES ('$book','$chapter','$verse','$content')";
        $db->exec($query);
    } catch (PDOException $e) {
        $e->getMessage();
        echo $e;
    }
}


$scriptures = getScriptures();
$topics = getTopics();

$book = $_POST['book'];
$chapter = $_POST['chapter'];
$verse = $_POST['verse'];
$content = $_POST['content'];
$topic = $_POST['topic'];

//echo "<pre>";
//print_r(($scriptures));
//echo "</pre>";

if (empty($book) || empty($chapter) || empty($verse) || empty($content)) {
    $message = "All fields are required.";
} else {
    setScripture($book, $chapter, $verse, $content);
    setTopicScripture($topic, count($scriptures)+1);
    $scriptures = getScriptures();
}
?>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Teach 06</title>
    </head>
    <body>
        <h1>Scripture Topics</h1>
        <h2>Add a scripture</h2>
        <section>
            <p><?php echo $message ?></p>
        </section>
        <form action="index.php" method="post">
            <input type="text" value="<?php echo $book ?>" id="book" name="book" placeholder="Insert the name of the book">
            <input type="text" value="<?php echo $chapter ?>" id="chapter" name="chapter" placeholder="Insert the chapter number">
            <input type="text" value="<?php echo $verse ?>" id="verse" name="verse" placeholder="Insert the verse number">
            <input type="text" value="<?php echo $content ?>" id="content" name="content" placeholder="Insert the scripture">
            
            <?php foreach ($topics as $topic): ?>
                    <input type="checkbox" name="topic" value="<?php echo $topic['id'] ?>"><?php echo $topic['name'] ?><br>
            <?php endforeach; ?>
            
            
             <input type="checkbox" name="topic" value="<?php echo $topic ?>"><?php echo $topic ?><br>
             
            <input type="submit" value="Save">
        </form>
        <table>
            <tr>
                <th>Reference</th>
                <th>Content</th>
                <th>Topic</th>
            </tr>
<?php foreach ($scriptures as $scripture): ?>
                <tr>
                    <td nowrap><?php echo $scripture['book'] ?> <?php echo $scripture['chapter'] ?>:<?php echo $scripture['verse'] ?></td>
                    <td><?php echo $scripture['content'] ?></td>
                    <td><?php echo $scripture['name'] ?></td>
                </tr>
<?php endforeach; ?>
        </table>
    </body>
</html>
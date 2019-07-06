<?php

$blogPath = __DIR__ . DIRECTORY_SEPARATOR . 'source' . DIRECTORY_SEPARATOR . '_posts' . DIRECTORY_SEPARATOR;

if (isset($argv[1]) && isset($argv[2])) {
    $blogName = $argv[2];
    $blogNamespace = $argv[1];
} else if (isset($argv[1])) {
    $blogName = $argv[1];
    $blogNamespace = 'other';
} else {
    $blogName = date('Y_m_d') . "杂谈";
    $blogNamespace = 'other';
}

$createTime = date('Y-m-d H:i:s');



$content = "---\n";
$content .= "title: " . $blogName . "\n";
$content .= "date: " . $createTime . "\n";
$content .= "tags: " . 'other' . "\n";
$content .= "categories: " . 'other' . "\n";
$content .= "---\n";
$content .= "

<!--more-->

";
$newBlogFilePath =  $blogPath . DIRECTORY_SEPARATOR . $blogNamespace . DIRECTORY_SEPARATOR . 'z_' . $blogName . '.md';
if (file_exists($newBlogFilePath) == 1) {
    $newBlogFilePath =  $blogPath . DIRECTORY_SEPARATOR . $blogNamespace . DIRECTORY_SEPARATOR . 'z_' . $blogName . time() . '.md';
}



file_put_contents($newBlogFilePath, $content, 8);
echo realpath($newBlogFilePath);
echo PHP_EOL;

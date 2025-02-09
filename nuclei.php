<?php
$command = escapeshellcmd($_POST['command']);
$command = preg_replace('/(-o\s+[^\s]+|--output\s+[^\s]+|-sresp\s+[^\s]+|--store-resp\s+[^\s]+|-srd\s+[^\s]+|--store-resp-dir\s+[^\s]+|-silent\s+[^\s]+|-nc\s+[^\s]+|--no-color\s+[^\s]+|-j\s+[^\s]+|--jsonl\s+[^\s]+|--irr\s+[^\s]+|--include-rr\s+[^\s]+|--omit-raw\s+[^\s]+|-or\s+[^\s]+|--omit-raw\s+[^\s]+|-ot\s+[^\s]+|--omit-template\s+[^\s]+|-nm\s+[^\s]+|--no-meta\s+[^\s]+|-ts\s+[^\s]+|--timestamp\s+[^\s]+|-rdb\s+[^\s]+|--report-db\s+[^\s]+|-ms\s+[^\s]+|--matcher-status\s+[^\s]+|-me\s+[^\s]+|--markdown-export\s+[^\s]+|-se\s+[^\s]+|--sarif-export\s+[^\s]+|-je\s+[^\s]+|--json-export\s+[^\s]+|-jle\s+[^\s]+|--jsonl-export\s+[^\s]+)/', '', $command);
$output = shell_exec($command);
if ($output === null) {
    http_response_code(500);
    echo "Error executing command: $command";
} else {
    echo $output;
}
?>
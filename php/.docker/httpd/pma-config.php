<?php
declare(strict_types=1);
$i = 0;
$i++;
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['host'] = 'mysql:3306';
$cfg['Servers'][$i]['username'] = 'root';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
$cfg['Servers'][$i]['hide_db'] = 'information_schema|performance_schema|mysql|sys';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

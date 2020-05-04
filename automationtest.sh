1. EC2 Installation
#!/bin/bash
yum update -y
yum install httpd -y
amazon-linux-extras install epel
yum install epel-release
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum install -y php70 php70-php php70-php-fpm php70-php-pecl-memcached php70-php-mysqlnd php70-php-xml php70-php-opcache php70-php-devel php70-php-mbstring php70-php-mcrypt php70-php-pecl-xdebug php70-php-cli php70-php-common
ln -s /usr/bin/php70 /usr/bin/php
service httpd start
chkconfig httpd on

2. Composer installation
$ cd /var/www/html
$ mkdir tinhocthatladongian
$ curl -sS https://getcomposer.org/installer | php
$ mv composer.phar /usr/local/bin/composer
$ composer require --dev phpunit/phpunit

3. phpunit configuration
$ vi /etc/profile
alias phpunit="/var/www/html/tinhocthatladongian/vendor/phpunit/phpunit/phpunit"
$ source /etc/profile
$ phpunit --version

4. Creating a Test Project
- Create file

tinhocthatladongian/phpunit.xml
tinhocthatladongian/Staff.php
tinhocthatladongian/tests/StaffTest.php

phpunit.xml
<?xml version="1.0" encoding="UTF-8" ?>
<phpunit colors="true">
    <testsuites>
        <testsuite name="Test suite">
            <!-- test file d -->
            <directory>tests</directory>
        </testsuite>
    </testsuites>
</phpunit>


Staff.php
<?php

class Staff
{
    public $first_name;
    public $last_name;

    public function getFullName()
    {
        return trim("$this->first_name $this->last_name");
    }
}


StaffTest.php
<?php

use PHPUnit\Framework\TestCase;

class StaffTest extends TestCase
{
    public function testReturnsFullName()
    {
        require('Staff.php');

        $staff = new Staff;

        $staff->first_name = "Nguyen";
        $staff->last_name = "Bao";

        $this->assertEquals('Nguyen Bao', $staff->getFullName());
    }
    public function testFullNameIsEmptyByDefault()
    {
        $staff = new Staff;
        $this->assertEquals('', $staff->getFullName());
    }

    /**
     * @test
     */
    public function only_first_name()
    {
        $staff = new Staff;
        $staff->first_name = "Nguyen";
        $this->assertEquals('Nguyen', $staff->getFullName());
    }
}



5. Execute test 
$ phpunit tests/

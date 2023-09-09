<?php

use PHPUnit\Framework\TestCase;

require_once 'Hello.php';

class HelloTest extends TestCase {
    public function testSayHello() {
        $hello = new Hello(); 
        $result = $hello->sayHello('Serhat');
        $this->assertEquals('Hello Serhat', $result);
    }
}

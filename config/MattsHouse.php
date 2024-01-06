<?php
use FullControl\FullControl;
use FullControl\Entities;
use Monolog\Logger;

/**
 * @var FullControl $fc
 * @var Logger $logger
 */

$logger->info("yay!");
\Kint::dump(get_class($fc));

$matt = new Entities\Person();

$ha = new Entities\HomeAssistant(
    name: "Matt's House"
);




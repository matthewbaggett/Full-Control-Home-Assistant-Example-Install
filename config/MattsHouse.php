<?php
use FullControl\FullControl;
use FullControl\Entities;
use Monolog\Logger;

/**
 * @var FullControl $fc
 * @var Logger $logger
 */

$logger->info("yay!");

$matt = new Entities\Person();

$ha = new Entities\HomeAssistant(
    name: "Matt's House",
    latitude: 52.39985453619066,
    longitude: 5.219327542468169,
    timezone: 'Europe/Amsterdam',
    currency: 'EUR', // @todo turn these into consts somewhere
    country: 'NL',
    language: 'en'
);



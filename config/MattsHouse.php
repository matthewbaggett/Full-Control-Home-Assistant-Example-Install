<?php
use FullControl\FullControl;
use FullControl\Entities;
use Monolog\Logger;

/**
 * @var FullControl $fc
 * @var Logger $logger
 */
// Create the Home Assistant entity
$ha = new Entities\HomeAssistant(
    logger: $logger,
    name: "Matt's House",
    latitude: 52.39985453619066,
    longitude: 5.219327542468169,
    timezone: 'Europe/Amsterdam',
    currency: 'EUR', // @todo turn these into consts somewhere
    country: 'NL',
    language: 'en'
);

// Add some people
$matt = new Entities\Person(name: "Matt");
$kyle = new Entities\Person(name: "Kyle");
$ha->addEntities($matt, $kyle);

// Add some rooms
$livingRoom = new Entities\Area("Living Room");
$mattsRoom = new Entities\Area("Matt's Bed Room");
$kylesRoom = new Entities\Area("Kyle's Bed Room");
$hallwayRoom = new Entities\Area("Hallway");

$ha->addAreas($livingRoom, $mattsRoom, $kylesRoom, $hallwayRoom);





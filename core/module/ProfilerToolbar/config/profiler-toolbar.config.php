<?php

return array(
    'profiler-toolbar' => array(
        'metrics' => array(
            'inclusive-memory' => array(
                'limit' => 5,
            ),
            'exclusive-time' => array(
                'skipNamespace' => array('Zend', 'Composer'),
                'limit' => 5,
            ),
            'calls' => array(
                'skipPattern'   => '/zend\\\\|composer\\\\|call_user_func/i',
                'skipInternal'  => true,
            ),
        ),
    )
);
<?php

namespace ProfilerToolbar;

return array(
    'zenddevelopertools' => array(
        'profiler' => array(
            'collectors' => array(
                'profiler' => 'ProfilerToolbar\ProfilerCollector',
            ),
        ),
        'toolbar' => array(
            'entries' => array(
                'profiler' => 'profiler-toolbar/xhprof',
            ),
        )
    )
);
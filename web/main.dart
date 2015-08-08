// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular2/change_detection.dart';
import 'package:angular2/bootstrap.dart';
import 'package:angular2/di.dart';
import 'package:angular2/router.dart';

import 'package:ng2_hackernews/ng2_hackernews.dart';
import 'package:ng2_hackernews/pipes/domain_pipe.dart';

main() {
  var pipeMap = {
    'domain': [ new DomainPipe(), const NullPipeFactory()],
    "iterableDiff": defaultPipes.config['iterableDiff'] //temporaly needed
  };
  Pipes pipes = new Pipes(pipeMap);

  bootstrap(App, [
    routerInjectables,
    bind(appBaseHrefToken).toValue('/'),
    bind(LocationStrategy).toClass(HashLocationStrategy),
    bind(Pipes).toValue(pipes)
  ]);
}
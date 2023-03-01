// TODO example stream, sink broadcast
import 'dart:async';

import 'ica/ica_client.dart';

void main() {
   signIn().then((value) => print(value));
}

class Order {}

class Cook {
  preToOrder(newOrder) {
    print("order's coming $newOrder");
  }
}

class Bugger {
  Cook cook = Cook();
  StreamController<Order> _controller = StreamController.broadcast();

  Stream get orderToBuggerPotato =>
      _controller.stream.where((event) => event is BuggerPotato);

  Stream get orderFries => _controller.stream.where((event) => event is Fry);

  deliveryToOrder() {
    orderToBuggerPotato.listen((event) {
      cook.preToOrder(event);
    });
    orderFries.listen((event) {
      cook.preToOrder(event);
    });
  }

  addToOrder(Order order) {
    _controller.add(order);
  }
}

class BuggerPotato extends Order {}

class Fry extends Order {}

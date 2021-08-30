mixin A12 {
  void method12() {
    print("method12");
  }
}

mixin A13 {
  void method13() {
    print("method13");
  }
}

mixin A23 {
  void method23() {
    print("method23");
  }
}

class A {}

class A1 extends A with A12, A13 {}

class A2 extends A with A12, A23 {}

class A3 extends A with A13, A23 {}

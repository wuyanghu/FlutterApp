class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

extension ListExt on List<int> {
  ListNode? createLink() {
    List<int> list = this;
    final newHead = ListNode();

    ListNode? cur = newHead;
    for (int val in list) {
      cur?.next = ListNode(val);
      cur = cur?.next;
    }
    return newHead.next;
  }
}

extension ListNodeExt on ListNode {
  void printH() {
    print("start ------");
    ListNode? h = this;
    while (h != null) {
      print(h.val);
      h = h.next;
    }
  }
}

abstract class ModulesMain{
  void main();
}

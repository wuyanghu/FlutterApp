import 'link_util.dart';

//2.两数相加
ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  ListNode newHeader = ListNode();

  ListNode? h1 = l1;
  ListNode? h2 = l2;
  ListNode? cur = newHeader;

  int carry = 0;
  while (h1 != null || h2 != null) {
    int val = (h1?.val ?? 0) + (h2?.val ?? 0) + carry;
    carry = val > 9 ? 1 : 0;
    cur?.next = ListNode(val % 10);
    cur = cur?.next;

    h1 = h1?.next;
    h2 = h2?.next;
  }

  if (carry == 1) cur?.next = ListNode(1);

  return newHeader.next;
}

//206. 反转链表
ListNode? reverseList(ListNode? head) {

  ListNode? curNode = head;
  ListNode? preNode;
  while (curNode != null) {
    ListNode? postNode = curNode.next;

    curNode.next = preNode;
    preNode = curNode;

    curNode = postNode;
  }
  return preNode;
}

//876. 链表的中间结点
ListNode? middleNode(ListNode? head) {
  ListNode? slow = head;
  ListNode? fast = head?.next;

  while (fast != null) {
    slow = slow?.next;
    fast = fast.next?.next;
  }
  return slow;
}

//19. 删除链表的倒数第 N 个结点
ListNode? removeNthFromEnd(ListNode? head, int n) {}

class LinkLeetcode implements ModulesMain {

  @override
  void main() {
    reverseList([1,2,3,4,5].createLink())?.printH();

  }
}

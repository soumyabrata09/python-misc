from typing import Optional
from list_node import ListNode

class DetectCycle:
    
    @staticmethod
    def has_cycle(head: Optional[ListNode]) -> bool:
        if not head:
            return False
        slow_pointer: ListNode = head
        fast_pointer: ListNode = head
        
        while fast_pointer and fast_pointer.next:
            slow_pointer = slow_pointer.next
            fast_pointer = fast_pointer.next.next
            if fast_pointer == slow_pointer:
                return True
        return False
    
node = ListNode.from_list([8, 13, 2, 5, 7])
cycle_node = node.create_cycle(node, 3)
print(cycle_node)
print(f'Has Cycle: {DetectCycle.has_cycle(cycle_node)}')
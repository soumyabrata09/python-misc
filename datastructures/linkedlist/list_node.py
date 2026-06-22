from typing import List, Optional

"""
This class creates a singly linked list
"""
class ListNode:
    def __init__(self, value: int = 0, next: Optional['ListNode'] = None) -> None:
        self.value = value
        self.next = next
    
    """
    Builds ListNode object from the given array values of type int
    Args:
        arr: List of int values
    Returns:
        head node of the linked list
    Example:
        build_list([2,4,7])
        2 -> 4 -> 7
    """
    # def build_list(self, arr: List[int]) -> Optional['ListNode']:
    #     if not arr:
    #         return None
    #     head: 'ListNode' = ListNode()
    #     current_node: 'ListNode' = head

    #     for i in range(len(arr)):
    #         current_node.next = ListNode(arr[i])
    #         current_node = current_node.next
        
    #     return head.next
    
    """
    Usage:
        ListNode.from_list([2, 1, 3, 5]) etc.
    """
    @classmethod
    def from_list(cls, arr: List[int]) -> Optional['ListNode']:
        if not arr:
            return None
        head = cls()
        current_node = head

        for value in arr:
            current_node.next = cls(value)
            current_node = current_node.next
        return head.next

    """
    Creates a cycle within a linked list
    Attributes:
            head: ListNode object
            position_from_head: int positional value from the head of the linked list
    Returns:
        circular ListNode object
    """
    def create_cycle(self, head: Optional['ListNode'], position_from_head: int) -> Optional['ListNode']:
        if not head:
            return None
        
        current_index: int = 0
        cycle_node: 'ListNode' = None
        current_node = head

        while current_node.next:
            if position_from_head == current_index:
                cycle_node = current_node
            current_node = current_node.next
            current_index += 1
        
        if cycle_node:
            current_node.next = cycle_node
        
        return head
    
    """
    Used for string representation
    Usage:
        print(node) i.e, 2, 1, 3, 5
        output: 2->1->3->5 
    """
    def __repr__(self):
        result: List[str] = []
        current = self
        visited = set()

        while current:
            if id(current) in visited:
                result.append(f'({current.value})')
                result.append('...')
                break;
            """
            id() ? It returns the identity of an object
            similar to Java's System.identityHashCode(node)
            """
            visited.add(id(current)) 
            result.append(str(current.value))
            current = current.next
        return '->'.join(result)
    
    @staticmethod
    def has_cycle(head: Optional['ListNode']) -> bool:
        if not head:
            return False
        slow_ptr = head
        fast_ptr = head

        while fast_ptr and fast_ptr.next:
            slow_ptr = slow_ptr.next
            fast_ptr = fast_ptr.next.next
            if id(fast_ptr) == id(slow_ptr): # id() ? returns the memory reference of an object
                return True
        return False


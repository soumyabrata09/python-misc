from list_node import ListNode

arr = [8, 13, 2, 5, 7]
linked_list = ListNode.from_list(arr)
print(f'Linked list: {linked_list}')
reversed_list = linked_list.reverse(linked_list)
print(f'Reversed list: {reversed_list}')
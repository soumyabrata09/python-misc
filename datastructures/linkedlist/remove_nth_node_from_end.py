from list_node import ListNode

arr = [8, 13, 2, 5, 7]
position = 3
node = ListNode.from_list(arr)
print(f'Generated list: {node}\n')
print(f'Current size of the list[Before removal]: {ListNode.get_size()}\n')

current_node = node.remove_nth_from_end(node, position)
print(f'Current size of the list[Ater removal]: {ListNode.get_size()}\n')
print(f'\nCurrent node after removing node={position} is {current_node} and the removed node is {ListNode.get_removed_node()}')
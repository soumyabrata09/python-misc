from list_node import ListNode
    
node = ListNode.from_list([8, 13, 2, 5, 7])
cycle_node = node.create_cycle(node, 2)
print(cycle_node)
print(f'Has Cycle: {ListNode.has_cycle(cycle_node)}')
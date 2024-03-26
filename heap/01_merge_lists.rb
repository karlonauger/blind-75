# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  # O(log n)
  min_heap = Containers::MinHeap.new
  lists.each do |node|
      while node
          min_heap.push(node.val)
          node = node.next
      end
  end

  root_node = node = ListNode.new(min_heap.pop)

  while min_heap.min
      node.next = ListNode.new(min_heap.pop)
      node = node.next
  end

  root_node
end

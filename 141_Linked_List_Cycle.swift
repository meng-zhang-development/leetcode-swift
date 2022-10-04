enum LC_141_Linked_List_Cycle {

    class Solution {

        func hasCycle(_ head: ListNode?) -> Bool {
            var slowPtr = head
            var fastPtr = head

            while slowPtr?.next != nil && fastPtr?.next?.next != nil {
                slowPtr = slowPtr?.next
                fastPtr = fastPtr?.next?.next

                if slowPtr === fastPtr {
                    return true
                }
            }

            return false
        }

    }

}

extension LC_141_Linked_List_Cycle {

    // Definition for singly-linked list.
    class ListNode {

        public var val: Int
        public var next: ListNode?

        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }

    }

}
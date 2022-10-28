<img width="226" alt="image" src="https://user-images.githubusercontent.com/26731448/188519846-a027234f-8008-40cb-8b22-87a233650de0.png">

# binary search tree

This repository complements the [Custom Enumerables Project](https://www.theodinproject.com/lessons/ruby-binary-search-trees) in the Ruby Course for The Odin Project. You’ll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.

In this solution, we implement four classes, in classname called Tree. Each of thes are:

### Tree::BST

This is the tree, a Binary Search Tree. It has a root node; the root node has a reader attr_accessor. 
This class has a list of methods:
#### Methods

The following table has the methods you will need to implement along with their associated specs, as outlined in the project instructions.

| Method | Spec File | Spec* | Notes |
| --- | --- | ---|--- |
| `Tree::BST.new` | spec/lib/tree/bst_spec.rb | ⚠️ | parameters: arr (mandatory) |
| `Tree::BST#build_tree` | spec/lib/tree/bst_spec.rb | ⚠️ | returns nil if @sorted_arr is empty<br> build the tree, and returns the root node |
| `Tree::BST#find` | spec/lib/tree/bst_spec.rb | ⚠️ | parameters: value (mandatory)<br><br> returns nil if the root node is nil<br> returns nil if value is not found<br> returns the node with the value at data field |
| `Tree::BST#delete` | spec/lib/tree/bst_spec.rb | ⚠️ | parameters: value (mandatory)<br><br> returns nil if value is not found<br> deletes the node with value at data, and returns deleted node |
| `Tree::BST#insert` | spec/lib/tree/bst_spec.rb | ⚠️ | parameters: value (mandatory)<br><br> returns nil if the root is nil<br> returns nil if value already exists in the tree<br> adds a node with value at data, at the tree, and returns inserted node |
| `Tree::BST#level_order` | spec/lib/tree/bst_spec.rb | ⚠️ | breadth-first<br><br> returns nil if the root is nil<br> accepts a block<br> it traverse the tree in level order<br><br> if a block is passed, it yields each node to the block<br> if a block is not passed, it returns an array with each node |
| `Tree::BST#preorder` | spec/lib/tree/bst_spec.rb | ⚠️ | depth-first<br><br> returns nil if the root is nil<br> accepts a block<br> it traverse the tree in `<root><left><right>` order<br><br> if a block is passed, it yields each node to the block<br> if a block is not passed, it returns an array with each node |
| `Tree::BST#inorder` | spec/lib/tree/bst_spec.rb | ⚠️ | depth-first<br><br> returns nil if the root is nil<br> accepts a block<br> it traverse the tree in `<left><root><right>` order<br><br> if a block is passed, it yields each node to the block<br> if a block is not passed, it returns an array with each node |
| `Tree::BST#postorder` | spec/lib/tree/bst_spec.rb | ⚠️ | depth-first<br><br> returns nil if the root is nil<br> accepts a block<br> it traverse the tree in `<left><right><root>` order<br><br> if a block is passed, it yields each node to the block<br> if a block is not passed, it returns an array with each node |
| `Tree::BST#height` | spec/lib/tree/bst_spec.rb | ⚠️ | parameters: value (node)<br><br> returns nil if node nil<br> it returns the height of the passed node<br><br> "Height is defined as the number of edges in longest path from a given node to a leaf node." - [TOP](https://www.theodinproject.com/)|
| `Tree::BST#depth` | spec/lib/tree/bst_spec.rb | ⚠️ | parameters: value (node)<br><br> returns nil if node nil<br> it returns the depth of the passed node<br><br> "Depth is defined as the number of edges in path from a given node to the tree’s root node." - [TOP](https://www.theodinproject.com/)|
| `Tree::BST#balanced?` | spec/lib/tree/bst_spec.rb | ⚠️ | returns `false` if the root node is nil<br> it returns `true` if the tree is balanced, `false` otherwhise<br><br> "A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1." - [TOP](https://www.theodinproject.com/)|
| `Tree::BST#rebalance` | spec/lib/tree/bst_spec.rb | ⚠️ | returns `false` if the root node is nil<br> it rebuild the tree, and return the root of the rebuilded tree<br><br> It use order depth-first traversal to give new array to the tree, and based on it, rebuild the tree and upgrade the root |


*Symbols:
  - ✓ tested: ok
  - ✕ tested:  fails
  - ⚠️ Is not done


### Tree::Node

Each of nodes on the tree, green at the image:

<img width="445" alt="image" src="https://user-images.githubusercontent.com/26731448/198444446-0336b25d-71bb-4acb-8f5a-3dd5e322fdad.png">

#### Methods

The following table has the methods you will need to implement along with their associated specs, as outlined in the project instructions.

| Method | Spec File | Spec* | Notes |
| --- | --- | ---|--- |
| `Tree::Node.new` | spec/lib/tree/node_spec.rb | ⚠️ | parameters: data (mandatory), left_child, right_child |
| `Tree::Nod#children_case` | spec/lib/tree/node_spec.rb | ⚠️ | returns children case for node: `:no_child`, `:one_child` or `:two_children` |
| `Tree::Nod#linked_to?` | spec/lib/tree/node_spec.rb | ⚠️ | parameters: node (mandatory)<br> returns if node is linked to the node passed as parameter |
| `Tree::Nod#to_h` | spec/lib/tree/node_spec.rb | ⚠️ | returns a hash of the node with it's children |
| `Tree::Nod#children` | spec/lib/tree/node_spec.rb | ⚠️ | returns an array of node's children<br> `[ left_child(if not nil), right_child(if not nil) ]` |


*Symbols:
  - ⚠️ tested: ok
  - ✕ tested: fails
  - ⚠️ Is not done


### Tree::FakeQueue

This is an emulate queue, is fake because in the back is working with an array: @data
#### Methods

The following table has the methods you will need to implement along with their associated specs, as outlined in the project instructions.

| Method | Spec File | Spec* | Notes |
| --- | --- | ---|--- |
| `Tree::FakeQueue.new` | spec/lib/tree/fake_queue_spec.rb | ⚠️ | parameters: fist_data |
| `Tree::FakeQueue#add` | spec/lib/tree/fake_queue_spec.rb | ⚠️ | parameters: value (mandatory)<br><br> push value to @data<br> returns @data |
| `Tree::FakeQueue#remove` | spec/lib/tree/fake_queue_spec.rb | ⚠️ | removes the value at index 0 of @data<br><br> returns nil if @data is empty<br> returns removed value|
| `Tree::FakeQueue#empty?` | spec/lib/tree/fake_queue_spec.rb | ⚠️ | returns @data.empty? |
| `Tree::FakeQueue#size` | spec/lib/tree/fake_queue_spec.rb | ⚠️ | returns @data.size |


*Symbols:
  - ✓ tested: ok
  - ✕ tested:  fails
  - ⚠️ Is not done


### Tree::FakeStack

This is an emulate stack, is fake because in the back is working with an array: @data
#### Methods

The following table has the methods you will need to implement along with their associated specs, as outlined in the project instructions.

| Method | Spec File | Spec* | Notes |
| --- | --- | ---|--- |
| `Tree::FakeStack.new` | spec/lib/tree/fake_stack_spec.rb | ⚠️ | parameters: fist_data |
| `Tree::FakeStack#add` | spec/lib/tree/fake_stack_spec.rb | ⚠️ | parameters: value (mandatory)<br><br> push value to @data<br> returns @data |
| `Tree::FakeStack##pop` | spec/lib/tree/fake_stack_spec.rb | ⚠️ | removes the last element of @data<br><br> returns nil if @data is empty<br> returns removed value|
| `Tree::FakeStack#empty?` | spec/lib/tree/fake_stack_spec.rb | ⚠️ | returns @data.empty? |
| `Tree::FakeStack##size` | spec/lib/tree/fake_stack_spec.rb | ⚠️ | returns @data.size |
| `Tree::FakeStack#to_s` | spec/lib/tree/fake_stack_spec.rb | ⚠️ | returns an array `stack: #{@data}` |


*Symbols:
  - ✓ tested: ok
  - ✕ tested:  fails
  - ⚠️ Is not done

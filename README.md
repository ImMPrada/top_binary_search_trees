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
| `Tree::BST.new` | spec/lib/tree/bst_spec.rb | ✓ | parameters: arr (mandatory) |
| `Tree::BST#build_tree` | spec/lib/tree/bst_spec.rb | ✓ | returns nil if @sorted_arr is empty<br> build the tree, and returns the root node |
| `Tree::BST#find` | spec/lib/tree/bst_spec.rb | ✓ | parameters: value (mandatory)<br><br> returns nil if the root node is nil<br> returns nil if value is not found<br> returns the node with the value at data field |
| `Tree::BST#delete` | spec/lib/tree/bst_spec.rb | ✓ | parameters: value (mandatory)<br><br> returns nil if value is not found<br> deletes the node with value at data, and returns deleted node |
| `Tree::BST#insert` | spec/lib/tree/bst_spec.rb | ✓ | parameters: value (mandatory)<br><br> returns nil if the root is nil<br> returns nil if value already exists in the tree<br> adds a node with value at data, at the tree, and returns inserted node |


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
| `Tree::Node.new` | spec/lib/tree/node_spec.rb | ✓ | parameters: data (mandatory), left_child, right_child |
| `Tree::Nod#children_case` | spec/lib/tree/node_spec.rb | ⚠️ | returns children case for node: `:no_child`, `:one_child` or `:two_children` |
| `Tree::Nod#linked_to?` | spec/lib/tree/node_spec.rb | ✕ | parameters: node (mandatory)<br> returns if node is linked to the node passed as parameter |
| `Tree::Nod#to_h` | spec/lib/tree/node_spec.rb | ✕ | returns a hash of the node with it's children |
| `Tree::Nod#children` | spec/lib/tree/node_spec.rb | ✕ | returns an array of node's children<br> `[ left_child(if not nil), right_child(if not nil) ]` |


*Symbols:
  - ✓ tested: ok
  - ✕ tested: fails
  - ⚠️ Is not done

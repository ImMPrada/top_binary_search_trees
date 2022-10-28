# binary search tree

This repository complements the [Custom Enumerables Project](https://www.theodinproject.com/lessons/ruby-binary-search-trees) in the Ruby Course for The Odin Project. You’ll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.

In this solution, we implement four classes, in classname called Tree. Each of thes are:

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


^*Symbols:
  - ✓ runs ok
  - ✕ It fails
  - ⚠️ Is not done

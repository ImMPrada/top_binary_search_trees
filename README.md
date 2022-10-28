# binary search tree

This repository complements the [Custom Enumerables Project](https://www.theodinproject.com/lessons/ruby-binary-search-trees) in the Ruby Course for The Odin Project. You’ll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.

### Methods

The following table has the methods you will need to implement along with their associated specs, as outlined in the project instructions.

| Method | Spec File | Spec | Notes |
| --- | --- | ---|--- |
| `Tree::Node.new` | lib/tree/node.rb | ✅ | parameters: data (mandatory), left_child, right_child |
| `Tree::Nod#children_case` | lib/tree/node.rb | ✅ | returns children case for node: `:no_child`, `:one_child` or `:two_children` |
| `Tree::Nod#linked_to?` | lib/tree/node.rb | ✅ | parameters: node (mandatory)<br> returns if node is linked to the node passed as parameter |
| `Tree::Nod#to_h` | lib/tree/node.rb | ✅ | returns a hash of the node with it's children |
| `Tree::Nod#children` | lib/tree/node.rb | ✅ | returns an array of node's children<br> `[ left_child(if not nil), right_child(if not nil) ]` |
| `Enumerable#my_none?`           | spec/my_none_spec.rb            | Done                                 |                                |
| `Enumerable#my_count`           | spec/my_count_spec.rb           | Done                                 |                                |
| `Enumerable#my_map`             | spec/my_map_spec.rb             | Done                                 |                                |
| `Enumerable#my_inject`          | spec/my_inject_spec.rb          | Done                                 |                                |

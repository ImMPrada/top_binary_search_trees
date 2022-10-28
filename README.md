# binary search tree

This repository complements the [Custom Enumerables Project](https://www.theodinproject.com/lessons/ruby-binary-search-trees) in the Ruby Course for The Odin Project. You’ll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.

### Methods

The following table has the methods you will need to implement along with their associated specs, as outlined in the project instructions.

| Method | Spec File | Spec | Notes |
| --- | --- | ---|--- |
| `Tree::Node.new` | lib/tree/node.rb | Done| parameters: data (mandatory), left_child, right_child |
| `Tree::Nod#children_case` | lib/tree/node.rb | Done| this will return children case for node: `:no_child`, `:one_child` or `:two_children` |
| `Enumerable#my_select`          | spec/my_select_spec.rb          | Done                                 |                                |
| `Enumerable#my_all?`            | spec/my_all_spec.rb             | Done                                 |                                |
| `Enumerable#my_any?`            | spec/my_any_spec.rb             | Done                                 |                                |
| `Enumerable#my_none?`           | spec/my_none_spec.rb            | Done                                 |                                |
| `Enumerable#my_count`           | spec/my_count_spec.rb           | Done                                 |                                |
| `Enumerable#my_map`             | spec/my_map_spec.rb             | Done                                 |                                |
| `Enumerable#my_inject`          | spec/my_inject_spec.rb          | Done                                 |                                |

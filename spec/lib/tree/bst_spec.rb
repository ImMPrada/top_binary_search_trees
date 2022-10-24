require './spec/spec_helper'

RSpec.describe Tree::BST do
  let(:test_array) { [1, 6435, 4, 324, 6, 7, 8, 9, 23, 67, 5, 3, 6, 8, 7] }
  let(:bst) { described_class.new(test_array) }

  describe '#initialize' do
    it 'has an array attribute with test array, sorted and no duplicates' do
      expect(bst.instance_variable_get(:@sorted_arr)).to eq(test_array.sort.uniq)
    end

    it 'has a root nill attribute' do
      expect(bst.root).to be_nil
    end
  end

  describe '#build_tree' do
    before { bst.build_tree }

    it 'stores a Node element at the root of the tree' do
      expect(bst.root.class).to eq(Tree::Node)
    end

    it 'builds assigns the root node to the tree' do
      expect(bst.root.data).not_to be_nil
    end

    describe 'evaluate data stored at each side of the root' do
      it 'stores the data value less than the root at left side' do
        expect(bst.root.left_child.data < bst.root.data).to be(true)
      end

      it 'stores the data value grate than the root at right side' do
        expect(bst.root.right_child.data > bst.root.data).to be(true)
      end
    end
  end

  describe '#find_path_to' do
    let(:a_value_in_the_test_array) { test_array.sample }
    let(:a_value_not_in_the_test_array) { 100 }

    before { bst.build_tree }

    describe 'when the value is present in the tree' do
      it 'returns an array' do
        expect(bst.find_path_to(a_value_in_the_test_array).class).to eq(Array)
      end

      it 'returns the node with searched value, at the end of the path' do
        last_item = bst.find_path_to(a_value_in_the_test_array).last
        class_of_last_item_is_node = last_item.instance_of?(Tree::Node)
        value_of_last_item_is_the_searched_value = last_item.data == a_value_in_the_test_array

        expect(class_of_last_item_is_node && value_of_last_item_is_the_searched_value).to be(true)
      end
    end

    describe 'when the value is not present in the tree' do
      it 'returns nil' do
        expect(bst.find_path_to(a_value_not_in_the_test_array)).to be_nil
      end
    end
  end

  describe '#delete' do
    let(:a_value_not_in_the_test_array) { 100 }

    before { bst.build_tree }

    describe 'when the value is not present in the tree' do
      it 'returns nil' do
        expect(bst.delete(a_value_not_in_the_test_array)).to be_nil
      end
    end

    describe 'when the value is present in the tree' do
      describe 'when the node to delete has no children (CASE_1)' do
        let(:a_value_in_a_node_no_children) { 6435 }

        it 'returns the parent node of the deleted node' do
          path_to_tested_value = bst.find_path_to(a_value_in_a_node_no_children)
          prev_node = path_to_tested_value[-2]

          expect(bst.delete(a_value_in_a_node_no_children)).to eq(prev_node)
        end

        it 'unlinks the node of previus node' do
          path_to_tested_value = bst.find_path_to(a_value_in_a_node_no_children)
          node_to_delete = path_to_tested_value.last
          prev_node = path_to_tested_value[-2]

          before_deleting = prev_node.linked_to?(node_to_delete)
          bst.delete(a_value_in_a_node_no_children)
          after_deleting = !prev_node.linked_to?(node_to_delete)

          expect(before_deleting && after_deleting).to be(true)
        end
      end

      describe 'when the node to delete has one child (CASE_2)' do
        let(:a_value_in_a_node_no_children) { 9 }

        it 'returns the parent node of the deleted node' do
          path_to_tested_value = bst.find_path_to(a_value_in_a_node_no_children)
          prev_node = path_to_tested_value[-2]

          expect(bst.delete(a_value_in_a_node_no_children)).to eq(prev_node)
        end

        it 'unlinks the node of previus node' do
          path_to_tested_value = bst.find_path_to(a_value_in_a_node_no_children)
          node_to_delete = path_to_tested_value.last

          new_node_linked_to_prev_node = node_to_delete.left_child || node_to_delete.right_child

          prev_node = path_to_tested_value[-2]

          before_deleting = prev_node.linked_to?(node_to_delete)
          bst.delete(a_value_in_a_node_no_children)
          after_deleting = prev_node.linked_to?(new_node_linked_to_prev_node)

          expect(before_deleting && after_deleting).to be(true)
        end
      end
    end
  end
end

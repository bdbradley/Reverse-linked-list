class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
    attr_reader :data

    def initialize
        @data = nil
    end
 
    # Push a value onto the stack
    def push(value)
      @data = LinkedListNode.new(value, @data)
    end

    # Pop an item off the stack.
    # Remove the last item that was pushed onto the
    # stack and return the value to the user

    def pop
      value_to_return = @data.value 
      #Returns a value
      @data = @data.next_node

      value_to_return
    end

end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    #Arguement defined within method
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end


stack = Stack.new
stack.push(22)
stack.push(8)  
stack.push(35)
#print_values(stack.data)

#Probably a way to loop this code 'n' number of times
last_element = stack.pop
#puts last_element
#print_values(stack.data)

last_element1 = stack.pop
#puts last_element1
#print_values(stack.data)

last_element2 = stack.pop
#puts last_element2
#print_values(stack.data)
  
puts "-------------------"

stack.push(last_element)
#print_values(stack.data)

stack.push(last_element1)
#print_values(stack.data)

stack.push(last_element2)
#print_values(stack.data)


def reverse_list(list)
    stack = Stack.new
    current_node = list

    while current_node 
      stack.push(current_node.value)
      current_node = current_node.next_node
    end
    
    list_return = nil
      #while stack.data != nil
      while stack.data
        last_element = stack.pop
        new_node  = LinkedListNode.new(last_element)

        
        if list_return.nil?
          list_return = new_node
        else
        #Find a node of list_return whos next node is nil
          last_node = list_return
          while last_node.next_node != nil
            last_node = last_node.next_node
          end
          last_node.next_node = new_node
        end
        #Assign it's next node as our new node
          
      end
      list_return
end

  
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

#puts "-------"

revlist = reverse_list(node3)
print_values revlist
#print_values(revlist)
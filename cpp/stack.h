#include <stdexcept>
#include <string>
#include <memory>
#include <algorithm> // for std::copy
using namespace std;

#define MAX_CAPACITY 32768
#define INITIAL_CAPACITY 16

template <typename T>
class Stack {
  unique_ptr<T[]> elements; // smart pointer to array of elements
  int capacity;             // current capacity of the stack array
  int top;                  // index of the next available slot

  // Prohibit copying and assignment
  Stack(const Stack<T>&) = delete;
  Stack<T>& operator=(const Stack<T>&) = delete;
  
public:
  // Constructor initializes stack with initial capacity
  Stack()
    : top(0),
      capacity(INITIAL_CAPACITY),
      elements(make_unique<T[]>(INITIAL_CAPACITY)) {
  }

  // Returns the number of elements in the stack
  int size() const {
    return top;
  }

  // Checks if the stack is empty
  bool is_empty() const {
    return top == 0;
  }

  // Checks if the stack is full (used for resizing logic)
  bool is_full() const {
    return top == capacity;
  }

  // Adds a new element to the stack
  void push(T item) {
    if (top == MAX_CAPACITY) {
      throw overflow_error("Stack has reached maximum capacity");
    }
    if (top == capacity) {
      reallocate(2 * capacity); // double the capacity when full
    }
    elements[top++] = item; // place the item in the next available slot
  }

  // Removes and returns the top element from the stack
  T pop() {
    if (is_empty()) {
      throw underflow_error("Cannot pop from an empty stack");
    }
    
    T item = move(elements[--top]); // get the top item and decrease the index
    
    // Clear the value for security reasons
    elements[top] = T(); 

    // If the stack size is less than a quarter of the capacity, shrink the capacity
    if (top <= capacity / 4 && capacity > INITIAL_CAPACITY) {
      reallocate(capacity / 2);
    }
    
    return item;
  }

private:
  // Resizes the stack array to a new capacity
  void reallocate(int new_capacity) {
    // Ensure the new capacity is within the allowed limits
    new_capacity = max(INITIAL_CAPACITY, min(new_capacity, MAX_CAPACITY));

    // Create a new array with the new capacity
    unique_ptr<T[]> new_elements = make_unique<T[]>(new_capacity);

    // Copy elements from the old array to the new array
    copy(&elements[0], &elements[top], &new_elements[0]);

    // Transfer ownership of the new array to the stack
    elements = move(new_elements);
    capacity = new_capacity;
  }
};

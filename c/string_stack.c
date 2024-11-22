#include "string_stack.h"

#include <stdlib.h>
#include <string.h>

#define INITIAL_CAPACITY 16

// Complete your string stack implementation in this file.

struct _Stack {
    char** elements;
    int top;
    int capacity;
};

stack_response create() {
    stack s = malloc(sizeof(struct _Stack));
    if (s == NULL) {
        return (stack_response){out_of_memory, NULL};
    }
    s->top = 0;
    s->capacity = INITIAL_CAPACITY;
    s->elements = malloc(INITIAL_CAPACITY * sizeof(char*));
    //check for out of memory
    //YOU DO THIS
    if (s->elements == NULL) {
        free(s);
        return (stack_response){out_of_memory, NULL};
    }

    return (stack_response){success,s};


}

int size(const stack s) {
    return s->top;
}
bool is_empty(const stack s) {
    return size(s) == 0;
}

bool is_full(const stack s) {
    return s->top >= MAX_CAPACITY;
}          

response_code push(stack s, char* item) {
    if (is_full(s)) {
        return stack_full;
    }

    // Check if the string is too large
    if (strlen(item) >= MAX_ELEMENT_BYTE_SIZE) {
        return stack_element_too_large;
    }

    if (s->top == s->capacity) {
        // We need to resize; double the capacity
        int new_capacity = s->capacity * 2;
        if (new_capacity > MAX_CAPACITY) {
            new_capacity = MAX_CAPACITY;
        }
        char** new_elements = realloc(s->elements, new_capacity * sizeof(char*));
        if (new_elements == NULL) {
            return out_of_memory;
        }
        s->elements = new_elements;
        s->capacity = new_capacity;
    }

    // Copy the string into the stack and increment the top index
    s->elements[s->top] = strdup(item);  // Store the copy of the string
    if (s->elements[s->top] == NULL) {  // Check if strdup failed
        return out_of_memory;
    }
    s->top++;  // Move the top pointer to the next empty slot

    return success;
}

string_response pop(stack s) {
    // First thing to check: is the stack empty?
    if (is_empty(s)) {
        return (string_response){stack_empty, NULL};
    }
    char* popped = s->elements[--s->top];
    //
    //Hey if the capacity went below 1/4, we should shrink it
    if (s->top < s->capacity / 4 && s->capacity > INITIAL_CAPACITY) {
        int new_capacity = s->capacity / 2;
        if (new_capacity < INITIAL_CAPACITY) {
            new_capacity = INITIAL_CAPACITY;
        }
        char** new_elements = realloc(s->elements, new_capacity * sizeof(char*));
        if (new_elements == NULL) {
            return (string_response){out_of_memory, NULL};
        }
        s->elements = new_elements;
        s->capacity = new_capacity;
    }

    return (string_response){success, popped};
}

void destroy(stack* s) {
    if (s == NULL || *s == NULL) {
        return;
    }

    // Free all the strings stored in the stack
    for (int i = 0; i < (*s)->top; i++) {
        free((*s)->elements[i]);
    }

    // Free the array holding the strings
    free((*s)->elements);

    // Free the stack structure itself
    free(*s);
    *s = NULL;
}
#include "string_stack.h"
#include <stdlib.h>
#include <string.h>

#define INITIAL_CAPACITY 16

struct _Stack
{
    char **elements;
    int top;
    int capacity;
};

stack_response create()
{
    stack stack_instance = malloc(sizeof(struct _Stack));
    if (stack_instance == NULL)
    {
        return (stack_response){out_of_memory, NULL};
    }

    stack_instance->top = 0;
    stack_instance->capacity = INITIAL_CAPACITY;
    stack_instance->elements = malloc(INITIAL_CAPACITY * sizeof(char *));
    if (stack_instance->elements == NULL)
    {
        free(stack_instance);
        return (stack_response){out_of_memory, NULL};
    }

    return (stack_response){success, stack_instance};
}

int size(const stack stack_instance)
{
    return stack_instance->top;
}

bool is_empty(const stack stack_instance)
{
    return size(stack_instance) == 0;
}

bool is_full(const stack stack_instance)
{
    return stack_instance->top >= MAX_CAPACITY;
}

response_code push(stack stack_instance, char *item)
{
    if (is_full(stack_instance))
    {
        return stack_full;
    }

    if (strlen(item) >= MAX_ELEMENT_BYTE_SIZE)
    {
        return stack_element_too_large;
    }

    if (stack_instance->top == stack_instance->capacity)
    {
        int new_capacity = stack_instance->capacity * 2;
        if (new_capacity > MAX_CAPACITY)
        {
            new_capacity = MAX_CAPACITY;
        }

        char **new_elements = realloc(stack_instance->elements, new_capacity * sizeof(char *));
        if (new_elements == NULL)
        {
            return out_of_memory;
        }

        stack_instance->elements = new_elements;
        stack_instance->capacity = new_capacity;
    }

    stack_instance->elements[stack_instance->top] = strdup(item);
    if (stack_instance->elements[stack_instance->top] == NULL)
    {
        return out_of_memory;
    }

    stack_instance->top++;
    return success;
}

string_response pop(stack stack_instance)
{
    if (is_empty(stack_instance))
    {
        return (string_response){stack_empty, NULL};
    }

    char *popped = stack_instance->elements[--stack_instance->top];

    if (stack_instance->top < stack_instance->capacity / 4 && stack_instance->capacity > INITIAL_CAPACITY)
    {
        int new_capacity = stack_instance->capacity / 2;
        if (new_capacity < INITIAL_CAPACITY)
        {
            new_capacity = INITIAL_CAPACITY;
        }

        char **new_elements = realloc(stack_instance->elements, new_capacity * sizeof(char *));
        if (new_elements != NULL)
        {
            stack_instance->elements = new_elements;
            stack_instance->capacity = new_capacity;
        }
    }

    return (string_response){success, popped};
}

void destroy(stack *stack_instance)
{
    if (stack_instance == NULL || *stack_instance == NULL)
    {
        return;
    }

    for (int i = 0; i < (*stack_instance)->top; i++)
    {
        free((*stack_instance)->elements[i]);
    }

    free((*stack_instance)->elements);
    free(*stack_instance);
    *stack_instance = NULL;
}

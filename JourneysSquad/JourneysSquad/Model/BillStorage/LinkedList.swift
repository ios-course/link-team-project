/// Represents a linked list data structure.
struct LinkedList<T: Comparable> {
    /// Adds a new node with the specified value to the end of the linked list.
    /// - Parameter value: The value to be added to the linked list.
    mutating func append(value: T) {
        let newNode = LinkedListNode(value: value)
        tail?.next = newNode
        tail = newNode
    }
    
    mutating func add(value: T) {
        let newNode = LinkedListNode(value: value)
        
        if head == nil || newNode.value < head?.value ?? newNode.value {
            newNode.next = head
            head = newNode
            return
        }

        var current = head
        while let nextNode = current?.next, nextNode.value > newNode.value {
            current = nextNode
        }

        if let nextNode = current?.next, nextNode.value >= newNode.value {
            nextNode.value = newNode.value
            return
        }

        newNode.next = current?.next
        current?.next = newNode
    }
    
    // MARK: - Private
    
    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?
}

// найти ноду в которой дата больше и перед ней  вставить нужную ноду
// одна нода - это одна секция, секция - это дата и массив счетов с этой датой
// 01.06.2023 - [Bill1, Bill2, Bill3]
// 25.05.2023 - [Bill5, Bill4]
//
// Небоходимый интерфейс
// добавить после конкретной ноды
// как забрать все счета ? сделать интерфейс где мы делаем из списка sequence (array ?)
// изменять значение в конкретной ноде ,т.е. добавлять туда новый счет (если уже есть такая дата, то нам нужно доавить новый счет в этой дате)

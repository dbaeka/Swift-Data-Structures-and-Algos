import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Chapter 3

class Animal: CustomStringConvertible {
    enum Breed: String {
        case cat = "Cat", dog = "Dog"
    }
    
    var description: String {
        return breed.rawValue + " " + name
    }
    
    var name: String
    var breed: Breed
    var tag = 0
    
    init(name: String, breed: Breed) {
        self.name = name
        self.breed = breed
    }
}


class AnimalShelter {
    private var cats = Queue<Animal>()
    private var dogs = Queue<Animal>()
    private var count = 0
    
    public func enqueue(animal: Animal) {
        switch animal.breed {
        case .cat:
            cats.add(value: animal)
        case .dog:
            dogs.add(value: animal)
        }
        animal.tag = count
        count += 1
    }
    
    public func dequeueAny() -> Animal? {
        guard let cat = cats.peek(), let dog = dogs.peek() else {
            if cats.isEmpty && dogs.isEmpty {
                return nil
            } else {
                count -= 1
                return [cats.remove(), dogs.remove()].compactMap { $0 }.first
            }
        }
        count -= 1
        return (cat.tag < dog.tag) ? cats.remove() : dogs.remove()
    }
    
    public func dequeueDog() -> Animal? {
        if dogs.isEmpty { return nil }
        count -= 1
        return dogs.remove()
    }
    
    public func dequeueCat() -> Animal? {
        if cats.isEmpty { return nil }
        count -= 1
        return cats.remove()
    }
}

extension AnimalShelter: CustomStringConvertible {
    public var description: String {
        return "Cats\n\(self.cats)\n\nDogs\n\(self.dogs)"
    }
}

var test = AnimalShelter()
test.enqueue(animal: Animal(name: "Toby", breed: .cat))
test.enqueue(animal: Animal(name: "Joy", breed: .dog))
test.enqueue(animal: Animal(name: "Kobby", breed: .dog))
test.enqueue(animal: Animal(name: "Lee", breed: .dog))
print(test)
test.dequeueDog()
test.dequeueAny()


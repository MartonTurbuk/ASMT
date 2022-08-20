# D3 assessment preparation

## Inversion of Control

What is Inversion of Control?
Inversion of Control is a principle that transfers the control of an object or portions of a program to a container or framework. IoC enables a framework to take control of the flow of a program and make calls to our custom code. To enable this, frameworks use abstractions with additional behavior built in. **If we want to add our behavior, we need to extend the classes of the framework or plugin our classes.**

The advantages of this architecture are:

- decoupling the execution of a task from its implementation
- making it easier to switch between different implementations
- greater modularity of a program
- easier testing, by making the isolation of components easier
- allowing the components to communicate through contracts

We can achieve Inversion of Control through various mechanisms such as Strategy design pattern, Service Locator pattern, and Dependency Injection(DI).

So Dependency Injection by itself is just a method to achieve Inversion of Control.

### Inversion of Control in my take

It is a principle that wants us to write code that can be used, by the framework, and not the code calling the framework.

## Dependency Injection / Dependency inversion

It is one of the many ways to achieve Inversion of Control, but one of the most commonly used ones. The main idea is to introduce abstraction, between the high-level modules, where the business logic resides, and the low-level classes, where are entities, and utility classes lie. So high-level modules should not depend on low-level modules. Both should depend on abstractions. And the abstractions should not depend on details. Details should depend on abstractions.

For dependency injection in Spring we can use:

- Constructor based
- Setter-based
- Field-based injections

## SOLID Principles

- **S: Single responsibility principle.**
  - A class should have one, and only one reason to change.
- **O: Open-Closed principle**
  - A software entity should be open for extension and closed for modification. This is achieved by the use of interfaces. The main benefit is that the interface introduces a new layer of abstraction, which enables loose coupling.
- **L: Liskov Substitution principle**
  - The principle defines that objects of a superclass shall be replaceable with objects of its subclasses without breaking the application. That requires the objects of our subclasses to behave in the same way as the objects of your superclass. This means we can enforce less restrictive validation rules, but we are not allowed to enforce stricter ones in our subclass. Similar rules apply to the return values of the method. The return values of a method of the subclass need to comply with the same rules as the return values of the method of the superclass.
- **I: Interface segregation principle**
  - In my take, this principle aims to fix the problem where interfaces lose their single responsibility, and become bloated. This should be avoided by creating new interfaces when needed, and those interfaces should have only one responsibility.
- **D: Dependency Inversion principle**
  - It is one of the many ways to achieve Inversion of Control, but one of the most commonly used ones. The main idea is to introduce abstraction, between the high-level modules, where the business logic resides, and the low-level classes, where are entities, and utility classes lie. So high-level modules should not depend on low-level modules. Both should depend on abstractions. And the abstractions should not depend on details. Details should depend on abstractions.

## Spring containers

The container will create the objects, wire them together, configure them, and manage their complete life cycle from creation to destruction. The Spring container uses Dependency Injection, to manage the components that make up the application. These objects are called Spring Beans. The container gets its instructions by reading the configuration metadata. The metadata can be XML, java annotations or java code.

Spring provides two types of container

- Spring BeanFactory Container
- Spring ApplicationContext Container

The ApplicationContext container includes all functionality of the Bean Factorycontainer, so it's generally recommended over BeanFactory.

## Spring Beans

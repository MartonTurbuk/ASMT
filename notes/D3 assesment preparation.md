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

## Brooks law

Brooks's law is an observation about software project management according to which "adding manpower to a late software project makes it later".

The main factors that explain why it works this way:

1. It takes some time for the people added to a project to become productive. Brooks calls this the "ramp-up" time. Software projects are complex engineering endeavors, and new workers on the project must first become educated about the work that has preceded them; this education requires diverting resources already working on the project, temporarily diminishing their productivity while the new workers are not yet contributing meaningfully. Each new worker also needs to integrate with a team composed of several engineers who must educate the new worker in their area of expertise in the code base, day by day. In addition to reducing the contribution of experienced workers (because of the need to train), new workers may even make negative contributions, for example, if they introduce bugs that move the project further from completion.
2. Communication overhead increases as the number of people increases. Due to the combinatorial explosion, the number of different communication channels increases rapidly with the number of people. Everyone working on the same task needs to keep in sync, so as more people are added they spend more time trying to find out what everyone else is doing.
3. Adding more people to a highly divisible task, such as cleaning rooms in a hotel, decreases the overall task duration (up to the point where additional workers get in each other's way). However, other tasks including many specialties in software projects are less divisible; Brooks points out this limited divisibility with another example: while it takes one woman nine months to make one baby, "nine women can't make a baby in one month".

## Spring containers

The container will create the objects, wire them together, configure them, and manage their complete life cycle from creation to destruction. The Spring container uses Dependency Injection, to manage the components that make up the application. These objects are called Spring Beans. The container gets its instructions by reading the configuration metadata. The metadata can be XML, java annotations or java code.

Spring provides two types of container

- Spring BeanFactory Container
- Spring ApplicationContext Container (Its a sub-interface of the BeanFactory)

The ApplicationContext container includes all functionality of the Bean Factorycontainer, so it's generally recommended over BeanFactory. The basis of the IoC container is the org.springframework.beans and org.springframework.context packages.

## Spring Beans

In Spring, the object that forms the backbone of the application and that are managed by the Spring IoC container are called beans. A bean is an object that is instantiated, assembled, and otherwise managed by a Spring IoC container. Beans, and the dependencies among them, are reflected in the configuration metadata (XML, java annotations, or java code) used by a container.

> **The interface org.springframework.context.ApplicationContext represents the Spring IoC container and is responsible for instantiating, configuring, and assembling the spring beans.**

The following diagram is a high-level view of how Spring works. The application classes are combined with configuration metadata so that after the ApplicationContext is created and initialized, we have a fully configured application.

&nbsp;
![Containers](/images/container-magic.jpg)
&nbsp;

The bean definitions correspond to the actual object that makes up the application. Typically we define service layer objects, data access objects, presentation objects, JSM  and so forth. It's now recommended to configure fine-grained domain objects in the container because it's not its responsibility.

### Instantiating a spring container

Instantiating a Spring IoC container is straightforward. The location path or paths supplied to an ApplicationContext constructor are resource strings that allow the container to load configuration metadata from a variety of external resources such as the local file system, the Java CLASSPATH, and so on.

```java
ApplicationContext context =
    new ClassPathXmlApplicationContext(new String[] {"services.xml", "daos.xml"});
```

### Bean overview

Within the container, these bean definitions are represented as ```BeanDefinition``` objects, which contain the following metadata:

- class
- name
- scope
- constructor arguments
- properties
- auto wiring mode
- lazy-initialization mode
- initialization method
- destruction method

In addition to bean definitions that contain information on how to create a specific bean, the ```ApplicationContext``` implementations also permit the registration of existing objects that are created outside the container, by users. This is done by accessing the ApplicationContext's BeanFactory via the method getBeanFactory() which returns the BeanFactory implementation DefaultListableBeanFactory. ```DefaultListableBeanFactory``` supports this registration through the methods ```registerSingleton(..)``` and ```registerBeanDefinition(..)```. However, typical applications work solely with beans defined through metadata bean definitions.

### Naming beans

Every bean has one or more identifiers. These identifiers must be unique within the container that hosts the bean. A bean usually has only one identifier, but if it requires more than one, the extra ones can be considered aliases.

> Bean naming conventions
>
> The convention is to use the standard Java convention for instance field names when naming beans.

### Aliasing a bean outside the bean definition

In a bean definition itself, you can supply more than one name for the bean, by using a combination of up to one name specified ```id``` attribute, and any number of other names in the ```name``` attribute.

Examples:

```xml
  <alias name="subsystemA-dataSource" alias="subsystemB-dataSource"/>
  <alias name="subsystemA-dataSource" alias="myApp-dataSource" />
```

## Instantiating beans

## Enterprise Bean overview

Enterprise beans are Java EE components that implement Enterprise JavaBeans (EJB) technology. Enterprise beans run in the EJB container, a runtime environment within the GlassFish server. (The GlassFish server is a Java EE 6 platform implementation. It includes a number of Java EE tools that are not part of the Java EE 6 platform, but are provided as a convenience to the developer.)

The EJB container provides system-level services, such as transactions, and security, to its enterprise beans.

### What is an Enterprise Bean

The enterprise bean is a server-side component that encapsulates the business logic of an application.

### Benefits of Enterprise Beans

Enterprise beans simplify the development of large distributes applications. EJB provides system-level services to enterprise beans, the bean developer can concentrate on solving business problems. EJB are portable components, the application assembler can build new applications from existing beans. Provided that they use the standard APIs, these applications can run on any compliant Java EE server.

Table of enterprise bean types
| Enterprise Bean Type | Purpose                                                                                  |   |   |   |
|----------------------|------------------------------------------------------------------------------------------|---|---|---|
| Session              | Performs a task for a client; optionally, may implement a web service                    |   |   |   |
| Message-driven       | Acts as a listener for a particular messaging type, such as the Java Message Service API |   |   |   |
|                      |                                                                                          |   |   |   |

### What is a session bean

A session bean encapsulates business logic that can be invoked programmatically by a client over local, remote, or web service client views. The session bean performs work for its client, shielding it from complexity by executing business tasks inside the server.

### Types of session beans

**There are three types of session beans:**

1. stateful
2. stateless
3. singleton

### Stateful session beans

The state of an object consists of the values of its instance variables. In a **stateful session bean**, the instance variables represent the state of a unique client/bean session. Because of the client's interactions with its bean, this state is often called the **conversational state**.

A session bean is similar to an interactive session. A session bean is not shared; it can have only one client, in the same way, that an interactive session can have only one user. When the client is terminated, its session bean appears to terminate and is no longer associated with the client.

### Stateless session beans

A **stateless session bean** does not maintain a conversational state with the client. When a client invokes the methods of a stateless bean, the bean's instance variables may contain a state specific to that client but only for the duration of the invocation. When the method is finished, the client-specific state should not be retained. Clients may change the state of instance variables in pooled stateless beans, and this state is held over to the next innovation of the pooled stateless beans.
> A stateless session bean can implement a web service, but a stateful session bean cannot.

### Singleton session beans

A **singleton session bean** is instantiated once per application and exists for the lifecycle of the application. Singleton session beans are designed for circumstances in which a single enterprise bean instance is shared concurrently accessed by clients.
> Like stateless session beans, singleton session beans can implement web service endpoints.

Singleton session beans maintain their state between client invocations but are not required to maintain their state across server crashes or shutdowns.

### When to use session beans

Stateful session beans are appropriate if any of the following conditions are true.

1. The bean's state represents the interaction between the bean and a specific client.
2. The bean needs to hold information about the client across method invocations.
3. The bean mediated between the client and the other components of the application, presenting a simplified view to the client.
4. Behind the scenes, the bean manages the workflow of several enterprise beans.

To improve performance, you might choose a stateless session bean if it has any of the traits.

1. The bean's state has no data for a specific client.
2. In a single method invocation, the bean performs a generic task for all clients. For example, you might use a stateless session bean to send an email that confirms an online order.
3. The bean implements a web service.

Singleton session beans are appropriate in the following circumstances. The state needs to be shared across the application.

1. A single enterprise bean needs to be accessed by multiple threads concurrently.
2. The application needs an enterprise bean to perform tasks up to application startup and shutdown.
3. The bean implements a web service.

## Spring bean scopes

The scope of a bean defines the life cycle and visibility of that bean in the contexts we use it.

The latest version of the Spring framework defines 6 types of scopes:

1. [Singleton](###Singleton)
2. [Prototype](###Prototype)
3. [Request](###Request)
4. [Session](###Session)
5. [Application](###Application)
6. [Websocket](###Websocket)

### Singleton

When we define a bean with the singleton scope, the container creates a single instance of that bean, and all requests for that bean name will return the same object, which is cached. Any modifications to the object will be reflected in all references to the bean. This scope is the default value if no other scope is specified.

### Prototype

A bean with the prototype scope will return a different instance every time it is requested from the container. It is defined by setting the value prototype to the @Scope annotation in the bean definition.

### Request

The request scope creates a bean instance for a single HTTP request, while the session scope creates a bean instance for an HTTP session. The application scope creates the bean instance for the lifecycle of a ServletContext, and the WebSocket scope creates it for a particular WebSocket session.

How to define a request scope:

```java
@Bean
@Scope(value = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
public HelloMessageGenerator requestScopedBean() {
    return new HelloMessageGenerator();
}
```

The proxy mode attribute is necessary because, at the moment of the instantiation of the web application context, there is no active request. Spring creates a proxy to be injected as a dependency and instantiates the target bean when it is needed in a request.

### Session

How to define a bean with session scope:

```java
@Bean
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public HelloMessageGenerator sessionScopedBean() {
    return new HelloMessageGenerator();
}

// There's also a dedicated composed annotation we can use to simplify the bean definition:

@Bean
@SessionScope
public HelloMessageGenerator sessionScopedBean() {
    return new HelloMessageGenerator();
}
```

Next, we define a controller with a reference to the session scoped bean. Again, we need to run two requests to show that the value of the message field is the same for the session.

In that case, when the request is made for the first time, the value message is null. However, once it is changed, that value is retained for subsequent requests as the same instance of the bean is returned for the entire session.

```java
@Controller
public class ScopesController {
    @Resource(name = "sessionScopedBean")
    HelloMessageGenerator sessionScopedBean;

    @RequestMapping("/scopes/session")
    public String getSessionScopeMessage(final Model model) {
        model.addAttribute("previousMessage", sessionScopedBean.getMessage());
        sessionScopedBean.setMessage("Good afternoon!");
        model.addAttribute("currentMessage", sessionScopedBean.getMessage());
        return "scopesExample";
    }
}
```

### Application

The application scope creates the bean instance for the lifecycle of a ServletContext. This is similar to the singleton scope, but there is a very important difference with regard to the scope of the bean. When beans are application scoped, the same instance of the bean is shared across multiple servlet-based applications running in the same ServletContext, while singleton scoped beans are scoped to a single application context only.

```java
@Bean
@Scope(
  value = WebApplicationContext.SCOPE_APPLICATION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public HelloMessageGenerator applicationScopedBean() {
    return new HelloMessageGenerator();
}

// Analogous to the request and session scopes, we can use a shorter version:

@Bean
@ApplicationScope
public HelloMessageGenerator applicationScopedBean() {
    return new HelloMessageGenerator();
}

// Now let's create a controller that references this bean:

@Controller
public class ScopesController {
    @Resource(name = "applicationScopedBean")
    HelloMessageGenerator applicationScopedBean;

    @RequestMapping("/scopes/application")
    public String getApplicationScopeMessage(final Model model) {
        model.addAttribute("previousMessage", applicationScopedBean.getMessage());
        applicationScopedBean.setMessage("Good afternoon!");
        model.addAttribute("currentMessage", applicationScopedBean.getMessage());
        return "scopesExample";
    }
}
```

### WebSocket

When first accessed, WebSocket scoped beans are stored in the WebSocket session attributes. The same instance of the bean is then returned whenever that bean is accessed during the entire WebSocket session. We can also say that it exhibits singleton behavior, but is limited to a WebSocket session only.

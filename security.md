# Security

These are some good practices to ensure the security of our system.

#### 1. HTML Escape
Always escape before inserting untrusted data into html files. The `<s:property>` tag escapes html by default, so it is good to use this tag throughout the system.

#### 2. Implement Access Control
To avoid broken access control, implement the [Access Control] properly.

#### 3. HTTP Headers
The HTTP headers can be set in `AuthorizationInterceptor.intercept()`.

#### 4. Hibernate
Never contruct queries with untrusted data without using bound parameters. Use the model to create or update data, or use queries with bound parameters.

[Access Control]: config/access-control.md
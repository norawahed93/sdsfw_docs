# Security

These are some good practices to ensure the security of our system.

#### 1. Escape String
Always escape before outputting untrusted data. The `<s:property value="value">` tag escapes html by default, so it is good to use this tag throughout the system.
For javascript, use `<s:property value="value" escapeJavaScript="true"/>`.

#### 2. Implement Access Control
To avoid broken access control, implement the [Access Control] properly.

#### 3. HTTP Headers
The HTTP headers can be set in `AuthorizationInterceptor.intercept()`.

#### 4. Hibernate
Never construct queries with untrusted data without using bound parameters. Use the model to create or update data, or use queries with bound parameters.

#### 5. CSRF Protection
Insert `<s:hidden name="antiCsrf" value="%{#session.antiCsrf}"/>` in every form that triggers Create / Update / Delete functions.

[Access Control]: config/access-control.md
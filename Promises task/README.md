Day 1: Introduction to Node.js
What is Node.js?
Node.js is a JavaScript runtime built on Chrome’s V8 engine that enables running JavaScript on the server side instead of the browser. It is open-source, cross-platform, and ideal for creating scalable network applications.

Core Concepts
Runtime Environment:
Provides the necessary context to execute JavaScript code outside the browser, exposing APIs for files, networks, processes, etc.

V8 Engine:
Google’s high-performance JavaScript and WebAssembly engine that compiles JS to machine code for fast execution.

Architecture Highlights:

Single-threaded event loop efficiently manages asynchronous tasks like I/O.

Uses libuv for handling background asynchronous work with thread pools.

Running JavaScript:
Use the Node REPL by running node command in your terminal to write and test JavaScript interactively.

Installation and Setup
Download and install Node.js from nodejs.org, which includes npm.

Verify installations with:

bash
node -v
npm -v
Use nvm (Node Version Manager) for managing multiple Node versions.

Node.js Modules
Core modules: Immutable modules built into Node.js like fs, path, os.

Local modules: Custom modules created inside your project.

Third-party modules: Installed via npm, such as Express, Lodash.

Starting a Node.js Project
Initialize your project to create a package.json file:

bash
npm init
package.json stores metadata, dependencies, and scripts.

package-lock.json locks dependency versions for consistent installs.

node_modules/ holds all installed packages.

Day 2: Basics of Express.js
What is Express.js?
Express.js is a lightweight web framework for Node.js that simplifies building web servers and APIs with easy routing and middleware capabilities.

Setting Up Express
Install Express in your project:

bash
npm install express
Middleware in Express
Middleware functions process requests before sending responses:

Built-in middleware:

express.json() parses JSON request bodies.

express.urlencoded({ extended: true }) parses URL-encoded form data.

Custom middleware example:

js
app.use((req, res, next) => {
  console.log('Incoming request');
  next();
});
Routing Basics
Handle different HTTP methods easily:

js
app.get('/', (req, res) => res.send('GET Request'));
app.post('/', (req, res) => res.send('POST Request'));
app.put('/', (req, res) => res.send('PUT Request'));
app.delete('/', (req, res) => res.send('DELETE Request'));
Route and Query Parameters
Route (Path) Parameters: Capture dynamic URL parts:

js
app.get('/users/:id', (req, res) => {
  res.send(`User ID: ${req.params.id}`);
});
Query Parameters: Pass data after ?:

js
app.get('/search', (req, res) => {
  res.send(`Searched for: ${req.query.q}`);
});
Day 3: Advanced Express.js
Organizing Routes using express.Router()
Modularize routes for better maintainability:

js
const router = express.Router();

router.get('/products/:id', (req, res) => {
  res.send(`Product ID: ${req.params.id}`);
});

app.use('/api', router);
HTTP Methods in REST
Use HTTP methods to correspond to CRUD operations:

GET → Read

POST → Create

PUT → Update

DELETE → Delete

Handling Errors Gracefully
Catch 404 and server errors:

js
// 404 handler
app.use((req, res) => {
  res.status(404).send('Sorry, page not found');
});

// Error handler
app.use((err, req, res, next) => {
  console.error(err.message);
  res.status(500).json({ error: 'Internal Server Error' });
});
Serving Static Files
Serve files such as HTML, CSS, images from a folder named public:

js
app.use(express.static('public'));
Access files via browser like:
http://localhost:3000/index.html

Processing Form and JSON Requests
Enable parsing of incoming data:

js
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
Example: Form Submission Handler

xml
<form action="/submit" method="POST">
  <input name="username" />
  <button type="submit">Send</button>
</form>
js
app.post('/submit', (req, res) => {
  res.send(`Received username: ${req.body.username}`);
});
Additional: Async/Await and Promises
Why Asynchronous?
Node.js is non-blocking; using Promises and async/await keeps your code clean while handling async operations like database calls and API requests.

Basic Promise Example
js
const fetchData = () => new Promise(resolve => {
  setTimeout(() => resolve('Data loaded!'), 1000);
});

fetchData()
  .then(data => console.log(data))
  .catch(err => console.error(err));
Async/Await Example in Express
js
app.get('/async', async (req, res) => {
  try {
    const data = await fetchData();
    res.send(data);
  } catch (err) {
    res.status(500).send('Something went wrong');
  }
});
Useful Promise Methods
Method	Description
Promise.all()	Waits for all promises to resolve; rejects if any fails.
Promise.race()	Resolves/rejects as soon as the first promise settles.
Promise.allSettled()	Returns results for all promises regardless of success/fail.
Promise.any()	Resolves as soon as any promise fulfills; rejects if all fail.
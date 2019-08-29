# Shifts Management #

<p>This is a simple app to track and display employees worked hours, is an API build with Ruby on Rails and will have front-end API with ReactJS. 

This app allows you to sign_in as a new employee and check your worked hours and the existing employee roles as a regular employee, and Admin can however, perform all the CRUD operations in every model.</p>

## Dependencies and libraries

<ul>
  <li>PostgreSQL</li>
  <li>ruby 2.5.0 </li>
  <li>Devise for authentication</li>
  <li>devise-jwt for JWTokens generation</li>
  <li>simple_token_authentication</li>
  <li>Cancancan to manage permissions </li>
  <li>rack-cors for handling Cross-Origin Resource Sharing</li>
  <li>rspec-rails for testing</li>
</ul>

## Note 

You will have to generate your own secret key, just write rake secret and store it somewhere safe, NEVER COMMIT YOUR SECRET KEYS OR .env files


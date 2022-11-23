describe("User Registration & Login", () => {
  it("should visit the login page", () => {
    cy.visit("/login");
    cy.contains("Jungle");
  });

  it("should log a user in and redirect to home page", () => {
    // fill login form
    cy.get("#email").type("user@test.ca");
    cy.get("#password").type("password");

    // click Submit button
    cy.contains("Submit").click();

    // assert redirection to home page
    cy.location("pathname").should("eq", "/");

    // confirm logged in
    cy.contains("Hello, Jane");
  });

  it("should visit the registration page", () => {
    cy.visit("/users/new");
    cy.contains("Jungle");
  });

  // user registration test only passes the first time
  // likely missing db cleanup configuration
  it("should register a new user and redirect to home page", () => {
    // fill registration form
    cy.get("#user_first_name").type("Joe");
    cy.get("#user_last_name").type("Jo");
    cy.get("#user_email").type("joe@jo.ca");
    cy.get("#user_password").type("password1");
    cy.get("#user_password_confirmation").type("password1");

    // click Submit button
    cy.contains("Submit").click();

    // assert redirection to home page
    cy.location("pathname").should("eq", "/");

    // confirm logged in
    cy.contains("Hello, Joe");
  });
});

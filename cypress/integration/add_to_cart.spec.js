describe("Add to cart", () => {
  it("should visit home page", () => {
    cy.visit("/");
  });

  it("adds product to cart and counter increments", () => {
    cy.contains(".btn", "Add").first().click({ force: true });
    cy.contains("My Cart").should("contain", "1");
  });
});

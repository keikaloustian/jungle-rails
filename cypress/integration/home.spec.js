describe("Home Page", () => {
  it("should visit home page", () => {
    cy.visit("/");
  });

  it("should show products on home page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});

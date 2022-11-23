describe("Product Details", () => {
  it("should visit home page", () => {
    cy.visit("/");
  });

  it("should click on a product", () => {
    cy.get(".products article").first().click();
    cy.get(".product-detail").should("exist");
  });
});

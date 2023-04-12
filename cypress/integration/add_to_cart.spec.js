describe("example to-do app", () => {
  beforeEach(() => {
    cy.visit("localhost:3000");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

  it("Should click on the cart and cart number will increase by one", () => {
    cy.get(".btn").contains("Add").first().click({ force: true });
    cy.contains("My Cart (1)").should("exist");
  })
});
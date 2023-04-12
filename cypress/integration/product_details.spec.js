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

  it("should navigate to product datails", () => {
    cy.get("[alt='Cliff Collard']").click();
    cy.contains("23 in stock at").should("exist");
    cy.contains("button", "Add").should("exist");
  });
});
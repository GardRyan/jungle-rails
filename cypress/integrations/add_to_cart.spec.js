describe("add_to_cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("displays the home page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Navigates from the home page to a product and adds it to cart, cart count increases by 1", () => {
    cy.contains("Scented Blade").click();
    cy.get(".btn").should("be.visible");
    cy.get(".btn").click();
    cy.get(".cart-count").should("have.text", "1");
  });

  it("Adds product to cart from home page", () => {
    cy.contains("Add to Cart").click();
    cy.get("form").first().submit();
    cy.contains("My Cart (1)").should("be.visible");
  });
});

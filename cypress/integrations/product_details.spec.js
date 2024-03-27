describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('displays the home page', () => {
    cy.get(".products article").should("be.visible");
  })

  it("Navigates from the home page to a product", async () => {
    cy.contains("Scented Blade").click()
    cy.get('.btn').should("be.visible")
  })
  
})
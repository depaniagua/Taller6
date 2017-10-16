var {defineSupportCode} = require('cucumber');
var {expect} = require('chai');

defineSupportCode(({Given, When, Then}) => {
  Given('I go to losestudiantes home screen', () => {
    browser.url('/');
    if(browser.isVisible('button=Cerrar')) {
      browser.click('button=Cerrar');
    }
  });

  When('I open the login screen', () => {
    browser.waitForVisible('button=Ingresar', 5000);
    browser.click('button=Ingresar');
  });
   
  When(/^I fill with (.*) and (.*)$/ , (email, password) => {
    var cajaLogIn = browser.element('.cajaLogIn');
    var mailInput = cajaLogIn.element('input[name="correo"]');
    mailInput.click();
    mailInput.keys(email);

    var passwordInput = cajaLogIn.element('input[name="password"]');
    passwordInput.click();
    passwordInput.keys(password)
});

  When(/^I fill register with (.*) and (.*) and (.*) and (.*) and (.*)$/ , (name, familyName, email, password, terms) => {
    var cajaSignUp = browser.element('.cajaSignUp');
    var nameInput = cajaSignUp.element('input[name="nombre"]');
    nameInput.click();
    nameInput.keys(name);

    var familyNameInput = cajaSignUp.element('input[name="apellido"]');
    familyNameInput.click();
    familyNameInput.keys(familyName)

    var mailInput = cajaSignUp.element('input[name="correo"]');
    mailInput.click();
    mailInput.keys(email);
    
    var passwordInput = cajaSignUp.element('input[name="password"]');
    passwordInput.click();
    passwordInput.keys(password)
    
    var terminos = cajaSignUp.element('[type="checkbox"]');
    if (terms=="true")
       terminos.click();
  });

  When('I try to login', () => {
    var cajaLogIn = browser.element('.cajaLogIn');
    cajaLogIn.element('button=Ingresar').click()
    });

  When('I try to register', () => {
    var cajaSignUp = browser.element('.cajaSignUp');
    cajaSignUp.element('button=Registrarse').click()
    });

  Then('I expect to see {string}', error => {
    browser.waitForVisible('.aviso.alert.alert-danger', 5000);
    var alertText = browser.element('.aviso.alert.alert-danger').getText();
    expect(alertText).to.include(error);
});

  Then('I expect to display {string}', error => {
    browser.waitForVisible('.sweet-alert', 5000);
    var alertText = browser.element('.sweet-alert').getText();
    expect(alertText).to.include(error);
  });

  Then('I expect redirect to home page', () => {
    browser.waitForVisible('#cuenta', 5000);  
    expect(browser.isVisible('#cuenta')).to.be.true; 
});


});
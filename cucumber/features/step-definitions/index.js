var {defineSupportCode} = require('cucumber');
var {expect} = require('chai');

defineSupportCode(({Given, When, Then}) => {
  Given('I go to losestudiantes home screen', () => {
    browser.url('/');
    if(browser.isVisible('button=Cerrar')) {
      browser.click('button=Cerrar');
    }
  });

  When(/^I enter with (.*) and (.*)$/ , (email, password) => {
     var cajaLogIn = browser.element('.cajaLogIn');

    var mailInput = cajaLogIn.element('input[name="correo"]');
    mailInput.click();
    mailInput.keys(email);

    var passwordInput = cajaLogIn.element('input[name="password"]');
    passwordInput.click();
    passwordInput.keys(password)
});

  When(/^I give my (.*) and (.*)$/ , (name, lastname) => {
  	browser.waitForVisible('.cajaSignUp', 5000);
     var cajaSignUp = browser.element('.cajaSignUp');

    var nameInput = cajaSignUp.element('input[name="nombre"]');
    nameInput.click();
    nameInput.keys(name);

    var lastnameInput = cajaSignUp.element('input[name="apellido"]');
    lastnameInput.click();
    lastnameInput.keys(lastname)
});

  When('I accept the terms and conditions', () => {
  	var cajaSignUp = browser.element('.cajaSignUp');
  	var acceptTerms = cajaSignUp.element('input[name="acepta"]');
    acceptTerms.click();
  });

  When(/^I fill with (.*) and (.*)$/ , (email, password) => {
     var cajaSignUp = browser.element('.cajaSignUp');

    var mailInput = cajaSignUp.element('input[name="correo"]');
    mailInput.click();
    mailInput.keys(email);

    var passwordInput = cajaSignUp.element('input[name="password"]');
    passwordInput.click();
    passwordInput.keys(password)
});

Then('I expect to see {string}', error => {
    browser.waitForVisible('.aviso.alert.alert-danger', 5000);
    var alertText = browser.element('.aviso.alert.alert-danger').getText();
    expect(alertText).to.include(error);
});
Then('I expect to find {string}', text => {
    browser.waitForVisible('.descripcion', 5000);
    var fullText = browser.element('.descripcion').getText();
    expect(fullText).to.include(text);
});

Then('I select a bachelors program', () => {
    var cajaSignUp = browser.element('.cajaSignUp');
  	var program = cajaSignUp.element('select[name="idPrograma"]');
  	program.click().element('select[name="idPrograma"] option:nth-child(3)').click();
});

Then('I expect to see a popup with the text: {string}', text => {
    browser.waitForVisible('.sweet-alert', 5000);
    var popup = browser.element('.sweet-alert');
    var text = popup.element('h2');
    var fullText = text.getText();
    expect(fullText).to.include(text);
});

Then('I expect to observe an x icon', () => {
	browser.waitForVisible('.glyphicon-remove', 5000);
});

  When('I open the login screen', () => {
    browser.waitForVisible('button=Ingresar', 5000);
    browser.click('button=Ingresar');
  });

  When('I fill a wrong email and password', () => {
    var cajaLogIn = browser.element('.cajaLogIn');

    var mailInput = cajaLogIn.element('input[name="correo"]');
    mailInput.click();
    mailInput.keys('wrongemail@example.com');

    var passwordInput = cajaLogIn.element('input[name="password"]');
    passwordInput.click();
    passwordInput.keys('123467891')
  });

  When('I try to login', () => {
    var cajaLogIn = browser.element('.cajaLogIn');
    cajaLogIn.element('button=Ingresar').click()
  });

  When('I try to register', () => {
    var cajaLogIn = browser.element('.cajaSignUp');
    cajaLogIn.element('button=Registrarse').click()
  });

  Then('I expect to not be able to login', () => {
    browser.waitForVisible('.aviso.alert.alert-danger', 5000);
  });
});
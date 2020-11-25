const LifeInsurance = artifacts.require('LifeInsurance');

module.exports = function (deployer) {
  deployer.deploy(LifeInsurance);
};


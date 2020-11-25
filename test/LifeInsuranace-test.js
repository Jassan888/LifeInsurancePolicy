const { assert } = require("console");

const LifeInsurance= artifacts.require('./LifeInsurance.sol');

contract('LifeInsurance', function(accounts){

    it('initalize the setPremiums',function(){

        return LifeInsurance.deploy().then(function(instance){

            return instance.setPremiums();

         }).then(function(Premiums){

            assert.equal(Premiums, 60);
         });
    });
});
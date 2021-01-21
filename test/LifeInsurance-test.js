const LifeInsurance= artifacts.require('./LifeInsurance.sol');

contract('LifeInsurance', function(accounts){

    it('initalize the Beneficiary',function(){

        return Beneficiary.deploy().then(function(instance){

            return instance.premiums();

         }).then(function(Beneficiary){

            assert.equal(Beneficiary);
         });
    });
});
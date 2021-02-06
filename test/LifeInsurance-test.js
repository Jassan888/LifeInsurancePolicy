const LifeInsurance= artifacts.require('LifeInsurance');

contract(LifeInsurance,()=>{

    let lifeInsurance= null;

    before(async()=>{

        lifeInsurance= await LifeInsurance.deployed();
    });
    it('Should set premiums', async()=>{

        const setPremiums= await lifeInsurance.setPremiums();

        assert(premiums == '60');
    });
});

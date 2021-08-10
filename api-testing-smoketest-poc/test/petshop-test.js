const path = require("path");
const environment = process.env.ENVIRONMENT || "local";
const pactum = require('pactum');

require('dotenv').config({path: path.resolve(__dirname, `../.env.${environment}`)});

var serviceUrl = process.env.SERVICE_URL;
var petsPath = process.env.PETS_PATH;
var serviceUrlPetsPath = serviceUrl + petsPath;

describe('Testing AWS Pets Service', function(){
    it('Posting pets', async () => {
      await pactum.spec()
        .post(serviceUrlPetsPath)
        .withJson({
          type: 'dog',
          price: 249.99    
        })    
        .expectStatus(200)
        .expectResponseTime(3000);
    });
    
    it('Getting pets', async () => {
      await pactum.spec()
        .get(serviceUrlPetsPath + '/{petId}')
        .withPathParams({
          'petId': 1                       // object
        })
        .expectStatus(200)
        .expectJson({
          "id": 1,
          "type": "dog",
          "price": 249.99
        })
        .expectResponseTime(3000);
    });  
})


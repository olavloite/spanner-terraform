'use strict';
module.exports = function (app) {
  const validateToken = require('./../helpers/utils').validateToken;
  const companyController = require('./../controller/company.controller');
  const SimulationController = require('./../controller/simulation.controller');
  const UserController = require('./../controller/user.controller');
  app.route('/register-user').post(UserController.register);
  app.route('/login').post(UserController.login);
  app.route('/get-token-social').post(UserController.getTokenSocial);
  app.route('/dashboard').post(validateToken, companyController.getDashboardStock);
  app.route('/get-company-list').get(validateToken, companyController.getList);
  app.route('/create-company').post(validateToken, companyController.create);
  app.route('/delete-company/:companyId').delete(validateToken, companyController.delete);
  app.route('/update-company').post(validateToken, companyController.update);
  app.route('/get-stock-data').post(companyController.getAllStocks);
  app.route('/simulate-company-data').post(validateToken, companyController.simulateCompany);
  app.route('/simulate-bulk-data').post(companyController.simulateAllCompany);
  app.route('/get-simulations').post(SimulationController.getSimulation);
  app.route('/update-simulation').put(SimulationController.updateSimulation);
  app.route('/delete-simulation/:sId').delete(SimulationController.deleteSimulation);
};
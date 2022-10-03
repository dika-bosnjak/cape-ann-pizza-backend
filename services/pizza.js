const db = require('./db');
const helper = require('../helper');

//getAll function returns all pizzas from the database
async function getAll(){
  const rows = await db.query(
    `SELECT pizza.id, pizza.name, rating, price, description, ingredients, picture_link, category.id as category_id, category.name as category_name 
     FROM pizza 
     INNER JOIN category ON pizza.category_id = category.id`
  );
  const data = helper.emptyOrRows(rows);

  return {
    data
  }
}

//serach function returns all pizzas by search param
async function search(searchParam){
  const rows = await db.query(
    `SELECT pizza.id, pizza.name, rating, price, description, ingredients, picture_link, category.id as category_id, category.name as category_name 
     FROM pizza 
     INNER JOIN category ON pizza.category_id = category.id
     WHERE pizza.name LIKE '%${searchParam}%'`
  );
  const data = helper.emptyOrRows(rows);

  return {
    data
  }
}

//get function returns pizza by id from the database
async function get(id){
    const rows = await db.query(
      `SELECT pizza.id, pizza.name, rating, price, description, ingredients, picture_link, category.id as category_id, category.name as category_name 
       FROM pizza 
       INNER JOIN category ON pizza.category_id = category.id
       WHERE pizza.id=${id}`
    );
    const data = helper.emptyOrRows(rows);
  
    return {
      data
    }
  }

//getByCategory function returns all pizzas by ids from the database
async function getByCategory(category_id){
    const rows = await db.query(
      `SELECT pizza.id, pizza.name, rating, price, description, ingredients, picture_link, category.name as category
       FROM pizza 
       INNER JOIN category ON pizza.category_id = category.id
       WHERE category_id=${category_id}`
    );
    const data = helper.emptyOrRows(rows);
  
    return {
      data
    }
  }

//create function inserts a new pizza into the databse
async function create(pizza){
    const result = await db.query(
      `INSERT INTO pizza 
      (name, rating, price, description, ingredients, picture_link, category_id)
      VALUES 
      ("${pizza.name}", ${pizza.rating}, ${pizza.price}, "${pizza.description}", "${pizza.ingredients}", "${pizza.picture_link}", ${pizza.category_id})`
    );
  
    let message = 'Error in creating new pizza';
  
    if (result.affectedRows) {
      message = 'New pizza is created successfully';
    }
  
    return {message};
  }

//update function updates one pizza in the databse
  async function update(id, pizza){
    const result = await db.query(
      `UPDATE pizza 
      SET name="${pizza.name}", rating=${pizza.rating}, price=${pizza.price}, 
      description="${pizza.description}", ingredients="${pizza.ingredients}", picture_link="${pizza.picture_link}", category_id=${pizza.category_id} 
      WHERE id=${id}` 
    );
  
    let message = 'Error in updating pizza';
  
    if (result.affectedRows) {
      message = 'Pizza updated successfully';
    }
  
    return {message};
  }

//remove function deletes one pizza in the databse
async function remove(id){
  const result = await db.query(
    `DELETE FROM pizza WHERE id=${id}`
  );

  let message = 'Error in deleting pizza';

  if (result.affectedRows) {
    message = 'Pizza is deleted successfully';
  }

  return {message};
}

module.exports = {
    getAll,
    get,
    search,
    getByCategory,
    create,
    update,
    remove
}
**API Routes**
----

              Prefix Verb   URI Pattern                                         Controller#Action
 api_automobile_tasks GET    /api/automobiles/:automobile_id/tasks(.:format)     api/v1/tasks#index
                      POST   /api/automobiles/:automobile_id/tasks(.:format)     api/v1/tasks#create
  api_automobile_task DELETE /api/automobiles/:automobile_id/tasks/:id(.:format) api/v1/tasks#destroy
      api_automobiles GET    /api/automobiles(.:format)                          api/v1/automobiles#index
                      POST   /api/automobiles(.:format)                          api/v1/automobiles#create
       api_automobile GET    /api/automobiles/:id(.:format)                      api/v1/automobiles#show
                      PATCH  /api/automobiles/:id(.:format)                      api/v1/automobiles#update
                      PUT    /api/automobiles/:id(.:format)                      api/v1/automobiles#update
                      DELETE /api/automobiles/:id(.:format)                      api/v1/automobiles#destroy
api_maintenance_tasks GET    /api/maintenance_tasks(.:format)                    api/v1/maintenance_tasks#index
                      POST   /api/maintenance_tasks(.:format)                    api/v1/maintenance_tasks#create
 api_maintenance_task GET    /api/maintenance_tasks/:id(.:format)                api/v1/maintenance_tasks#show
                      PATCH  /api/maintenance_tasks/:id(.:format)                api/v1/maintenance_tasks#update
                      PUT    /api/maintenance_tasks/:id(.:format)                api/v1/maintenance_tasks#update
                      DELETE /api/maintenance_tasks/:id(.:format)                api/v1/maintenance_tasks#destroy


**List Automobiles**
----
  Returns json data about all automobiles.

* **URL**

  api/automobiles

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
  None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "id": 1,
        "make": "Mazda",
        "model": "3",
        "year": 2015,
        "odometer_reading": 90001,
    },
    {
        "id": 2,
        "make": "Mazda",
        "model": "3",
        "year": 2015,
        "odometer_reading": 90001,
    },
    {
        "id": 3,
        "make": "Ford",
        "model": "F350",
        "year": 2015,
        "odometer_reading": 80001,
    }
]`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Automobile doesn't exist" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/automobiles",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```

**Show Automobile**
----
  Returns json data about a single automobile.

* **URL**

  api/automobiles/:id

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
    "id": 1,
    "make": "Mazda",
    "model": "3",
    "year": 2015,
    "odometer_reading": 90001,
}`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Couldn't find Automobile with 'id'=:id" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/automobiles/1",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```


  **Create Automobile**
----
  Creates a new automobile.

* **URL**

  api/automobiles

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**
 
  None

* **Data Params**

  JSON data containing new automobile data

  Header: Content-Type   application/json

  {"automobile": { "fuel_mode": "diesel", "make": "Ford", "model": "Escot","year": "2010",
                "odometer_reading": "70001" } }

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
    "id": 4,
    "make": "Ford",
    "model": "Escot",
    "year": 2010,
    "odometer_reading": 70001,
    "created_at": "2016-06-21T03:20:23.255Z",
    "updated_at": "2016-06-21T03:20:23.255Z"
   }`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "<Many different validation errors are possible>" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/automobiles",
      dataType: "json",
      type : "POST",
      success : function(r) {
        console.log(r);
      }
    });
  ```

  **Update Automobile**
----
  Updates an existing automobile.

* **URL**

  api/automobiles/:id

* **Method:**

  `PUT` or `PATCH`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  JSON data containing automobile data

  Header: Content-Type   application/json

  {"automobile": { "model": "Escort" } }


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
    "id": 4,
    "make": "Ford",
    "model": "Escort",
    "year": 2010,
    "odometer_reading": 70001,
    "created_at": "2016-06-21T03:20:23.255Z",
    "updated_at": "2016-06-21T03:30:00.675Z"
}`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "<Many different validation errors are possible>" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/automobiles/:id",
      dataType: "json",
      type : "POST",
      success : function(r) {
        console.log(r);
      }
    });
  ```

  **Delete Automobile**
----
  Deletes an existing automobile.

* **URL**

  api/automobiles

* **Method:**

  `DELETE`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 204 <br />
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Automobile doesn't exist" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/automobiles/:id",
      dataType: "json",
      type : "DELETE",
      success : function(r) {
        console.log(r);
      }
    });
  ```

=======================================================

**List Maintenance Tasks**
----
  Returns json data about all maintenance tasks.

* **URL**

  api/maintenance_tasks

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
  None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "id": 2,
        "maintenance_date": null,
        "automobile_id": null,
        "name": "oil change",
        "description": "oil change",
        "suitable_for_gasoline": true,
        "suitable_for_diesel": true,
        "suitable_for_electrical": false
    },
    {
        "id": 3,
        "maintenance_date": null,
        "automobile_id": null,
        "name": "glow plugs",
        "description": "maintain glow plugs",
        "suitable_for_gasoline": false,
        "suitable_for_diesel": true,
        "suitable_for_electrical": false
    },
    {
        "id": 4,
        "maintenance_date": null,
        "automobile_id": null,
        "name": "spark plugs",
        "description": "maintain spark plugs",
        "suitable_for_gasoline": true,
        "suitable_for_diesel": false,
        "suitable_for_electrical": false
    },
    {
        "id": 5,
        "maintenance_date": null,
        "automobile_id": null,
        "name": "recharger",
        "description": "maintain recharger",
        "suitable_for_gasoline": false,
        "suitable_for_diesel": false,
        "suitable_for_electrical": true
    },
    {
        "id": 6,
        "maintenance_date": null,
        "automobile_id": null,
        "name": "windshield repair",
        "description": "windshield repair",
        "suitable_for_gasoline": true,
        "suitable_for_diesel": true,
        "suitable_for_electrical": true
    },
    {
        "id": 7,
        "maintenance_date": null,
        "automobile_id": null,
        "name": "rotate tires",
        "description": "rotate tires",
        "suitable_for_gasoline": true,
        "suitable_for_diesel": true,
        "suitable_for_electrical": true
    }
]`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/maintenance_tasks",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```

**Show Maintenance Task**
----
  Returns json data about a single maintenance task.

* **URL**

  api/maintenance_tasks/:id

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
    "id": 2,
    "maintenance_date": null,
    "automobile_id": null,
    "name": "oil change",
    "description": "oil change",
    "suitable_for_gasoline": true,
    "suitable_for_diesel": true,
    "suitable_for_electrical": false
}`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Couldn't find MaintenanceTask with 'id'=:id" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/maintenance_tasks/:id",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```


  **Create Maintenance Task**
----
  Creates a new maintenance task.

* **URL**

  api/maintenance_tasks

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**
 
  None

* **Data Params**

  JSON data containing new automobile data

  Header: Content-Type   application/json

  {"maintenance_task": { "name": "rotate tires", "description": "rotate tires", 
                      "suitable_for_gasoline": "true", 
                      "suitable_for_diesel": "true", 
                      "suitable_for_electrical": "true" } }

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
    "id": 8,
    "maintenance_date": null,
    "automobile_id": null,
    "name": "rotate tires",
    "description": "rotate tires",
    "created_at": "2016-06-21T03:56:20.404Z",
    "updated_at": "2016-06-21T03:56:20.404Z",
    "suitable_for_gasoline": true,
    "suitable_for_diesel": true,
    "suitable_for_electrical": true
}`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "<Many different validation errors are possible>" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/maintenance_tasks",
      dataType: "json",
      type : "POST",
      success : function(r) {
        console.log(r);
      }
    });
  ```

  **Update Maintenance Task**
----
  Updates an existing automobile.

* **URL**

  api/maintenance_tasks/:id

* **Method:**

  `PUT` or `PATCH`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  JSON data containing automobile data

  Header: Content-Type   application/json

  {"maintenance_task": { "name": "Rotate Tires" } }


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
    "id": 8,
    "maintenance_date": null,
    "automobile_id": null,
    "name": "Rotate Tires",
    "description": "rotate tires",
    "created_at": "2016-06-21T03:56:20.404Z",
    "updated_at": "2016-06-21T03:58:40.631Z",
    "suitable_for_gasoline": true,
    "suitable_for_diesel": true,
    "suitable_for_electrical": true
}`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "<Many different validation errors are possible>" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/maintenance_tasks/:id",
      dataType: "json",
      type : "POST",
      success : function(r) {
        console.log(r);
      }
    });
  ```

  **Delete Maintenance Task**
----
  Deletes an existing maintenance task.

* **URL**

  api/maintenance_tasks/:id

* **Method:**

  `DELETE`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 204 <br />
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Automobile doesn't exist" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/maintenance_tasks/:id",
      dataType: "json",
      type : "DELETE",
      success : function(r) {
        console.log(r);
      }
    });
  ```

=======================================================

**List Automobile Tasks**
----
  Returns json data about all maintenance tasks for an automobile.

* **URL**

  api/api/automobiles/:id/tasks

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
    "automobile": {
        "id": 1,
        "make": "Mazda",
        "model": "3",
        "year": 2015,
        "odometer_reading": 90001,
        "created_at": "2016-06-17T23:46:21.166Z",
        "updated_at": "2016-06-17T23:46:21.166Z"
    },
    "tasks": [
        {
            "id": 2,
            "maintenance_date": null,
            "automobile_id": null,
            "name": "oil change",
            "description": "oil change",
            "created_at": "2016-06-20T08:43:45.123Z",
            "updated_at": "2016-06-20T08:43:45.123Z",
            "suitable_for_gasoline": true,
            "suitable_for_diesel": true,
            "suitable_for_electrical": false,
            "selected": true
        },
        {
            "id": 4,
            "maintenance_date": null,
            "automobile_id": null,
            "name": "spark plugs",
            "description": "maintain spark plugs",
            "created_at": "2016-06-20T08:45:57.194Z",
            "updated_at": "2016-06-20T08:45:57.194Z",
            "suitable_for_gasoline": true,
            "suitable_for_diesel": false,
            "suitable_for_electrical": false,
            "selected": true
        },
        {
            "id": 6,
            "maintenance_date": null,
            "automobile_id": null,
            "name": "windshield repair",
            "description": "windshield repair",
            "created_at": "2016-06-20T22:23:49.595Z",
            "updated_at": "2016-06-20T22:23:49.595Z",
            "suitable_for_gasoline": true,
            "suitable_for_diesel": true,
            "suitable_for_electrical": true
        },
        {
            "id": 7,
            "maintenance_date": null,
            "automobile_id": null,
            "name": "rotate tires",
            "description": "rotate tires",
            "created_at": "2016-06-21T03:19:10.419Z",
            "updated_at": "2016-06-21T03:19:10.419Z",
            "suitable_for_gasoline": true,
            "suitable_for_diesel": true,
            "suitable_for_electrical": true
        }
    ]
}`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/automobiles/:id/tasks",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```


  **Create Automobile Tasks**
----
  Adds newly selected tasks to an existing automobile.

* **URL**

  api/automobiles/:id/tasks

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**

   `id=[integer]`

* **Data Params**

  JSON data array containing new maintenance_task_ids

  Header: Content-Type   application/json

  {"maintenance_tasks": [{ "maintenance_task_id": "1"} , { "maintenance_task_id": "2"} , { "maintenance_task_id": "4"} ] }

* **Success Response:**

  * **Code:** 201 <br />
    **Content:** `{
    "id": 2,
    "make": "Mazda",
    "model": "3",
    "year": 2015,
    "odometer_reading": 90001,
    "created_at": "2016-06-17T23:48:34.269Z",
    "updated_at": "2016-06-17T23:48:34.269Z"
}`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "<Many different validation errors are possible>" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/automobiles/:id/tasks",
      dataType: "json",
      type : "POST",
      success : function(r) {
        console.log(r);
      }
    });
  ```


  **Delete Automobile Tasks**
----
  Deletes all existing maintenance tasks from an automobile.

* **URL**

  api/automobiles/:id/tasks

* **Method:**

  `DELETE`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 204 <br />
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Automobile doesn't exist" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "api/automobiles/:id/tasks",
      dataType: "json",
      type : "DELETE",
      success : function(r) {
        console.log(r);
      }
    });
  ```


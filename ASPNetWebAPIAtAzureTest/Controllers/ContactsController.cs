﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASPNetWebAPIAtAzureTest.Model;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPNetWebAPIAtAzureTest.Controllers
{
    [Route("api/[controller]")]
    public class ContactsController : Controller
    {
        // GET: api/values
        [HttpGet]
        public IEnumerable<ContactEntity> Get()
        {
            return ContactEntity.GetList();
        }


        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        /* 更新は未だできないよー
        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
        */
    }
}

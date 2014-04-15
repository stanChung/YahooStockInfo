using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TestHAP.WEBAPI
{
    public class StockController : ApiController
    {

        // GET api/<controller>/id
        public dynamic Get(string id)
        {
            return  DataAccess.GetYahooStockInfo(id);
            
        }
        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}
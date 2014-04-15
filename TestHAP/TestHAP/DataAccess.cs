using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using HtmlAgilityPack;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace TestHAP
{
    public class DataAccess
    {
   
        /// <summary>
        /// 以股票代號取得Yahoo的個股資訊
        /// </summary>
        /// <param name="stockNo"></param>
        /// <returns></returns>
        public static List<objData> GetYahooStockInfo(string stockNo)
        {
            var lstObj = new List<objData>();
            try
            {
                var client = new WebClient();
                var ms = new MemoryStream(client.DownloadData(@"https://tw.stock.yahoo.com/q/q?s=" + stockNo));
                var doc = new HtmlDocument();
                doc.OptionFixNestedTags = true;
                doc.OptionOutputOriginalCase = true;
                doc.Load(ms, Encoding.Default);

                var nodeHeader = doc.DocumentNode.SelectSingleNode("/html/body/center/table[2]/tbody/tr/td/table/tbody/tr[1]".Replace("tbody", "")).InnerText.Split(new char[] { '\n' }, StringSplitOptions.RemoveEmptyEntries);
                var values = doc.DocumentNode.SelectSingleNode(@"/html/body/center/table[2]/tbody/tr/td/table/tbody/tr[2]".Replace("tbody", "")).InnerText.Split(new char[] { '\n' }, StringSplitOptions.RemoveEmptyEntries);

                for (int i = 0; i < nodeHeader.Length - 1; i++)
                {
                    var o = new objData()
                    {
                        ColumnName = nodeHeader[i].Trim(),
                        ColumnValue = values[i].Trim()
                    };

                    lstObj.Add(o);
                }
            }
            catch(Exception)
            {

            }

            return lstObj;

        }
    }

    public class objData
    {
        public string ColumnName;
        public string ColumnValue;
    }
}
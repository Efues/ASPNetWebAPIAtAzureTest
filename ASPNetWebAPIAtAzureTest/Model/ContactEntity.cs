using System;
using System.Collections.Generic;

namespace ASPNetWebAPIAtAzureTest.Model
{
    public class ContactEntity
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }

        public static IEnumerable<ContactEntity> GetList()
        {
            var dataList = new List<ContactEntity>();
            var csvPath = System.Environment.CurrentDirectory + "/StaticFiles/Contact.csv";
            if (System.IO.File.Exists(csvPath))
            {
                using (var rs = new System.IO.StreamReader(csvPath))
                {
                    while (!rs.EndOfStream)
                    {
                        var line = rs.ReadLine();
                        var items = line.Split(',');
                        if (items.Length != 3) continue;
                        dataList.Add(new ContactEntity() { Name = items[0], Address = items[1], Phone = items[2] });
                    }
                }
            }
            return dataList;
        }
    }
}

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.data
{
    public class arrGlobal
    {
        public arrGlobal()
        {
        }

        public arrGlobal(ArrayList arrayList)
        {
            this.arrayList = arrayList;
        }

        public ArrayList arrayList { get; set; }

        public void addData()
        {

        }

        public void addUser()
        {
            arrayList = new ArrayList();
            arrayList.Add(new User("mail@gmail.com", "admin", "123"));
            arrayList.Add(new User("sang@gmail.com", "sang123", "sang2005"));
        }
    }
}
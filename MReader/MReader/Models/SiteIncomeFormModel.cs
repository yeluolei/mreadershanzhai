using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MReader.Helps;

namespace MReader.Models

{
    public class SiteIncomeFormModel
    {
        public DateTime StartTime {get;set;}
        public DateTime EndTime {get;set;}

        public PaginatedList<PurchaseHistory> PurchaseHistory {
            get;
            private set;
        }

        public decimal TotalIncome
        {
            get;
            private set;
        }

        public SiteIncomeFormModel() { }
        public SiteIncomeFormModel(IQueryable<PurchaseHistory> phs,int pageIndex,int pageSize,DateTime starttime,DateTime endtime)
        {
            PurchaseHistory = new PaginatedList<PurchaseHistory>(phs, pageIndex, pageSize);
            try
            {
                TotalIncome = phs.Sum(ph => ph.Price);
            }
            catch
            {
                TotalIncome = 0;
            }

            StartTime = starttime;
            EndTime = endtime;
        }

            

    }

}
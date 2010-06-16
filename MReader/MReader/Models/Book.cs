using System;
//using MReader.Models;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;

namespace MReader.Models
{
    public partial class Book
    {

     //   public string bookcover = string.Format(content, "cover");
        public bool IsValid
        {
            get { return (GetRuleViolations().Count() == 0); }
        }

        //书名，ISBN，作者不能为空
        public IEnumerable<RuleViolation> GetRuleViolations()
        {
            if (String.IsNullOrEmpty(_Title))
                yield return new RuleViolation("Title required!!", "Title");
            if (String.IsNullOrEmpty(_ISBN))
                yield return new RuleViolation("ISDB required!!", "ISBN");
            if (String.IsNullOrEmpty(_Author))
                yield return new RuleViolation("Author required!!", "Author");
            yield break;
        }

        //若验证不通过抛出异常
        partial void OnValidate(ChangeAction action)
        {
            if (!IsValid)
                throw new ApplicationException("Rule violations prevent saving");
        }

        public double averageRating
        {
            get
            {
                if (rate1 + rate2 + rate3 + rate4 + rate5 == 0)
                    return 0.0;
                else
                {
                    return (rate1 * 1 + rate2 * 2 + rate3 * 3 + rate4 * 4 + rate5 * 5) / 
                        (double)(rate1 + rate2 + rate3 + rate4 + rate5);
                }
            }
        }
    }


     
}
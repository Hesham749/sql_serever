//---------------------
//---------------------------------------------------------
// <copyright file="CSSqlTrigger.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;
using System.Transactions;

public partial class Triggers
{        
   // [Microsoft.SqlServer.Server.SqlTrigger(Name="S1", Target="Student", Event="FOR UPDATE")]
    public static void SQLTrigger ()
    {
	    // Replace with your own code
        
        using (SqlConnection cn
         = new SqlConnection("context connection = true"))
        {
            string sql =
                "SELECT COUNT(*) FROM INSERTED ";
            SqlCommand cmd = new SqlCommand(sql, cn);
            cn.Open();
            SqlContext.Pipe.ExecuteAndSend(cmd);
            cn.Close();
        }










         //int nullContacts = (int)cmd.ExecuteScalar();
            //if (nullContacts > 0)
            //{
            //    SqlPipe pipe = SqlContext.Pipe;
            //    //cmd.CommandText =
            //      //  "RAISERROR('ContactName cannot be null', 16, 1)";
            //    pipe.ExecuteAndSend(cmd);

            //    //Requires adding a reference to System.Transactions in the project
            //    //Transaction.Current.Rollback();
            //}

            //cn.Close();
        //}

    }
}


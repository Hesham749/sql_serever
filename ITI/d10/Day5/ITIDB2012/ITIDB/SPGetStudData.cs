//------------------------------------------------------------------------------
// <copyright file="CSSqlStoredProcedure.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void SPGetStudData ()
    {
        SqlConnection n=new SqlConnection("data source=.;initial catalog=iti;integrated security=true");
        using (SqlConnection cn
             = new SqlConnection("context connection = true"))
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM [student] ORDER BY st_age desc", cn);

            SqlContext.Pipe.ExecuteAndSend(cmd);
            cn.Close();
        }


    }













   // [Microsoft.SqlServer.Server.SqlProcedure]
    public static void GenerateData(SqlInt32 count)
    {
        // Create a record structure
        SqlDataRecord record = new SqlDataRecord(
            new SqlMetaData("RowID", SqlDbType.Int),
            new SqlMetaData("Random", SqlDbType.Int));

        // Start outputting records
        SqlContext.Pipe.SendResultsStart(record);

        Random random = new Random();
        for (Int32 i = 0; i < count; i++)
        {
            // Generate the data and put it in the row
            record.SetInt32(0, i);
            Int32 num = random.Next(50);
            record.SetInt32(1, num);

            // Send to client
            SqlContext.Pipe.SendResultsRow(record);
        }

        // Finish outputting records
        SqlContext.Pipe.SendResultsEnd();
    }

}

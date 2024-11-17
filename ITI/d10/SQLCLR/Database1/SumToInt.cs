using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlInt16 SumToInt(SqlInt16 x, SqlInt16 y)
    {
        // Put your code here
        return x + y;

    }
}

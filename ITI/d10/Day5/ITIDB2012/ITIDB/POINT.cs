//------------------------------------------------------------------------------
// <copyright file="CSSqlUserDefinedType.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;


[Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedType(Format.Native)]
public struct POINT: INullable
{
    public override string ToString()
    {
        // Replace with your own code
        return string.Empty;
    }
    
    public bool IsNull
    {
        get
        {
            // Put your code here
            return _null;
        }
    }
    
    public static POINT Null
    {
        get
        {
            POINT h = new POINT();
            h._null = true;
            return h;
        }
    }
    
    public static POINT Parse(SqlString s)
    {
        if (s.IsNull)
            return Null;
        POINT u = new POINT();
        // Put your code here
        return u;
    }
    
    // This is a place-holder method
    public string Method1()
    {
        // Put your code here
        return string.Empty;
    }
    
    // This is a place-holder static method
    public static SqlString Method2()
    {
        // Put your code here
        return new SqlString("");
    }
    
    // This is a place-holder member field
    public int _var1;
 
    //  Private member
    private bool _null;
}
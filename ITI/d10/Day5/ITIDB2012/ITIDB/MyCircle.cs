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
public struct MyCircle: INullable
{
    //public int x, y, r;
    int x, y, r;
    public override string ToString()
    {
        return x.ToString() + ',' + y.ToString() + ',' + r.ToString();
    }
    
    public bool IsNull
    {
        get
        {
            // Put your code here
          return _null;
        }
    }
    
    public static MyCircle Null
    {
        get
        {
            MyCircle h = new MyCircle();
            h._null = true;
            return h;
        }
    }
    
    public static MyCircle Parse(SqlString s)
    {
        //if (s.IsNull)
         //   return Null;
        MyCircle u = new MyCircle();

        string[] res = s.Value.Split(',');
        u.x = Convert.ToInt32(res[0]);
        u.y = Convert.ToInt32(res[1]);
        u.r = Convert.ToInt32(res[2]);

        // Put your code here
        return u;
    }
    
    private bool _null;
}
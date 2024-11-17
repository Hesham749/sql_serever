//------------------------------------------------------------------------------
// <copyright file="CSSqlAggregate.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Text;

[Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedAggregate( Format.UserDefined, IsInvariantToDuplicates = false, IsInvariantToNulls = true, IsNullIfEmpty = true,MaxByteSize = 8000)]
public struct AggFun : IBinarySerialize
{
    private StringBuilder sb;
    public void Init()
    {
        // Put your code here
        sb= new StringBuilder();
    }

    public void Accumulate(SqlString Value)
    {
        if (Value.IsNull) return;
        sb.Append(Value.ToString() + ",");
    }

    public void Merge (AggFun Group)
    {
        sb.Append(Group.sb.ToString() + ",");
    }

    public SqlString Terminate ()
    {
        if (sb.ToString().Length == 0)
            return SqlString.Null;
        else
        {
            String result = sb.ToString().Substring(0, sb.Length - 2);
            sb.Length = 0;
            return result;
        }
    }


    // This is a place-holder member field
    //public int _var1;

    public void Read(System.IO.BinaryReader r)
    {
        sb = new StringBuilder(r.ReadString());
    }

    public void Write(System.IO.BinaryWriter w)
    {
        w.Write(sb.ToString());
    }
}

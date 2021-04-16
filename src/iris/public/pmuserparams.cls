/// 
Class public.pmuserparams Extends %Persistent [ ClassType = persistent, DdlAllowed, Final, Owner = {_SYSTEM}, ProcedureBlock, SqlRowIdPrivate, SqlTableName = pm_user_params ]
{

Property id As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ InitialExpression = "nextval('pm_user_params_id_seq'::regclass)", Required, SqlColumnNumber = 2 ];

Property datatypecd As %Library.String(MAXLEN = 50) [ SqlColumnNumber = 3, SqlFieldName = datatype_cd ];

Property userid As %Library.String(MAXLEN = 50) [ Required, SqlColumnNumber = 4, SqlFieldName = user_id ];

Property paramnamecd As %Library.String(MAXLEN = 50) [ Required, SqlColumnNumber = 5, SqlFieldName = param_name_cd ];

Property value As %Library.String(MAXLEN = 2147483647) [ SqlColumnNumber = 6 ];

Property changedate As %Library.TimeStamp [ SqlColumnNumber = 7, SqlFieldName = change_date ];

Property entrydate As %Library.TimeStamp [ SqlColumnNumber = 8, SqlFieldName = entry_date ];

Property changebychar As %Library.String(MAXLEN = 50) [ SqlColumnNumber = 9, SqlFieldName = changeby_char ];

Property statuscd As %Library.String(MAXLEN = 50) [ SqlColumnNumber = 10, SqlFieldName = status_cd ];

/// Bitmap Extent Index auto-generated by DDL CREATE TABLE statement.  Do not edit the SqlName of this index.
Index DDLBEIndex [ Extent, SqlName = "%%DDLBEIndex", Type = bitmap ];

/// DDL Primary Key Specification
Index pmuserparamspkey On id [ PrimaryKey, SqlName = pm_user_params_pkey, Type = index, Unique ];

Parameter USEEXTENTSET = 1;

Storage Default
{
<Data name="pmuserparamsDefaultData">
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>datatypecd</Value>
</Value>
<Value name="3">
<Value>userid</Value>
</Value>
<Value name="4">
<Value>paramnamecd</Value>
</Value>
<Value name="5">
<Value>value</Value>
</Value>
<Value name="6">
<Value>changedate</Value>
</Value>
<Value name="7">
<Value>entrydate</Value>
</Value>
<Value name="8">
<Value>changebychar</Value>
</Value>
<Value name="9">
<Value>statuscd</Value>
</Value>
</Data>
<DataLocation>^B5ms.DWQr.1</DataLocation>
<DefaultData>pmuserparamsDefaultData</DefaultData>
<ExtentLocation>^B5ms.DWQr</ExtentLocation>
<IdFunction>sequence</IdFunction>
<IdLocation>^B5ms.DWQr.1</IdLocation>
<Index name="DDLBEIndex">
<Location>^B5ms.DWQr.2</Location>
</Index>
<Index name="IDKEY">
<Location>^B5ms.DWQr.1</Location>
</Index>
<Index name="pmuserparamspkey">
<Location>^B5ms.DWQr.3</Location>
</Index>
<IndexLocation>^B5ms.DWQr.I</IndexLocation>
<StreamLocation>^B5ms.DWQr.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
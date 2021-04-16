/// 
Class public.datamartreport Extends %Persistent [ ClassType = persistent, DdlAllowed, Final, Owner = {_SYSTEM}, ProcedureBlock, SqlRowIdPrivate, SqlTableName = datamart_report ]
{

Property totalpatient As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 2, SqlFieldName = total_patient ];

Property totalobservationfact As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 3, SqlFieldName = total_observationfact ];

Property totalevent As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 4, SqlFieldName = total_event ];

Property reportdate As %Library.TimeStamp [ SqlColumnNumber = 5, SqlFieldName = report_date ];

/// Bitmap Extent Index auto-generated by DDL CREATE TABLE statement.  Do not edit the SqlName of this index.
Index DDLBEIndex [ Extent, SqlName = "%%DDLBEIndex", Type = bitmap ];

Parameter USEEXTENTSET = 1;

Storage Default
{
<Data name="datamartreportDefaultData">
<Value name="1">
<Value>totalpatient</Value>
</Value>
<Value name="2">
<Value>totalobservationfact</Value>
</Value>
<Value name="3">
<Value>totalevent</Value>
</Value>
<Value name="4">
<Value>reportdate</Value>
</Value>
</Data>
<DataLocation>^B5ms.Dkn2.1</DataLocation>
<DefaultData>datamartreportDefaultData</DefaultData>
<ExtentLocation>^B5ms.Dkn2</ExtentLocation>
<IdFunction>sequence</IdFunction>
<IdLocation>^B5ms.Dkn2.1</IdLocation>
<Index name="DDLBEIndex">
<Location>^B5ms.Dkn2.2</Location>
</Index>
<Index name="IDKEY">
<Location>^B5ms.Dkn2.1</Location>
</Index>
<IndexLocation>^B5ms.Dkn2.I</IndexLocation>
<StreamLocation>^B5ms.Dkn2.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
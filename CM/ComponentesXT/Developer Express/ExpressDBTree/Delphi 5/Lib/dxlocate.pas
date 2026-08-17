unit dxlocate;

interface
uses DB;

function DBTrDataSetLocate(DataSet: TDataSet; AFieldName: string; AValue: Variant; AOptions: TLocateOptions): Boolean;

implementation

function DBTrDataSetLocate(DataSet: TDataSet; AFieldName: string; AValue: Variant; AOptions: TLocateOptions): Boolean;
begin
  Result := DataSet.Locate(AFieldName, AValue, AOptions);
end;

end.

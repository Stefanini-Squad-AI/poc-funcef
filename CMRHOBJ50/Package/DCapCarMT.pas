unit DCapCarMT;

interface                                            
                                                        
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc;

type
  TDtmCapCarMT = class(TDataModule)
    SQLAdtoPendente: TCMSqlParams;
    CdsAdtoPendente: TCMClientDataSet;
    SQLPrevPendente: TCMSqlParams;
    CdsPrevPendente: TCMClientDataSet;
    SQLTestaRegAdianto: TCMSqlParams;
    CDSTestaRegAdianto: TCMClientDataSet;
    SQLTestaRad: TCMSqlParams;
    CdsTestaRad: TCMClientDataSet;
    dsPrevPendente: TwwDataSource;
    dsAdtoPendente: TwwDataSource;
    procedure CdsAdtoPendenteAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmCapCarMT: TDtmCapCarMT;

implementation

{$R *.DFM}

procedure TDtmCapCarMT.CdsAdtoPendenteAfterOpen(DataSet: TDataSet);
begin
   TFloatField( DataSet.FieldByName('VALRES') ).DisplayFormat := '#,##0.00';
   TFloatField( DataSet.FieldByName('VLRBAIXA') ).DisplayFormat := '#,##0.00';
end;

end.



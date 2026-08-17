unit FRptAnimals;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReprot, ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport;

type
  TFrmCmReprot1 = class(TFrmCmReprot)
    QryRptCMNAME: TStringField;
    QryRptCMSIZE: TSmallintField;
    QryRptCMWEIGHT: TSmallintField;
    QryRptCMAREA: TStringField;
    QryRptCMBMP: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
    Class Procedure ShowReprot(Const iIdEmpresa, iIdUsuario, iIdModulo :Integer;
          Const sParams, sFileName, sDataBaseName :String) :Boolean; Override;
  end;

var
  FrmCmReprot1: TFrmCmReprot1;

implementation

{$R *.DFM}

{ TFrmCmReprot1 }

class Procedure TFrmCmReprot1.ShowReprot(const iIdEmpresa, iIdUsuario,
  iIdModulo: Integer; const sParams, sFileName,
  sDataBaseName: String);
Var
  sSql :String;
begin
  Inherited;
  With Self.Create(Application) Do
    Try
      If CmpRptCM.Execute Then
      Begin
         sSql := '';
         With QryRptCM Do
         Begin
            If Active Then Close;
            Sql.Text := 'SELECT * FROM ANIMALS';

            If Not TCMParamsItem(CmpRptCM.Params.Items[0]).IsNull Then
               sSql := ' WHERE NAME ' +
                       TCMParamsItem(CmpRptCM.Params.Items[0]).Comparador + ' ''' +
                       TCMParamsItem(CmpRptCM.Params.Items[0]).AsString + '''';

            If Not TCMParamsItem(CmpRptCM.Params.Items[1]).IsNull Then
               If sSql = '' Then
                  sSql := ' WHERE NAME ' +
                          TCMParamsItem(CmpRptCM.Params.Items[1]).Comparador + ' ''' +
                          TCMParamsItem(CmpRptCM.Params.Items[1]).AsString + ''''
               Else
                  sSql := ' AND AREA ' +
                          TCMParamsItem(CmpRptCM.Params.Items[1]).Comparador + ' ''' +
                          TCMParamsItem(CmpRptCM.Params.Items[1]).AsString + '''';

            Sql.Text := 'SELECT * FROM ANIMALS' + sSql;
         End;

         RptCM.Print;
         ShowMessage('Ok !')
      End;
    finally
      Free;
    End;
end;

end.

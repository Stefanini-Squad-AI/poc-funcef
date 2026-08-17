unit rLivroInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE;

type
  TRptLivroInvent = class(TFrmCmReport)
    bdeLivroInvent: TppBDEPipeline;
    bdeLivroInventppField1: TppField;
    bdeLivroInventppField2: TppField;
    bdeLivroInventppField3: TppField;
    bdeLivroInventppField4: TppField;
    bdeLivroInventppField5: TppField;
    bdeLivroInventppField6: TppField;
    bdeLivroInventppField7: TppField;
    bdeLivroInventppField8: TppField;
    bdeLivroInventppField9: TppField;
    bdeLivroInventppField10: TppField;
    bdeLivroInventppField11: TppField;
    dsLivroInvent: TwwDataSource;
    RptLivroInvent: TppReport;
    ppHeaderBand32: TppHeaderBand;
    ppLabel202: TppLabel;
    ppLine83: TppLine;
    RptLivroInventLine1: TppLine;
    LbDataRep: TppLabel;
    RptLivroInventLabel2: TppLabel;
    RptLivroInventLabel3: TppLabel;
    RptLivroInventLabel4: TppLabel;
    RptLivroInventLabel5: TppLabel;
    RptLivroInventLine2: TppLine;
    RptLivroInventLine3: TppLine;
    RptLivroInventLine4: TppLine;
    RptLivroInventLine5: TppLine;
    RptLivroInventLabel6: TppLabel;
    RptLivroInventLabel7: TppLabel;
    RptLivroInventLine6: TppLine;
    RptLivroInventLabel8: TppLabel;
    LbEmpresa: TppLabel;
    RptLivroInventLabel11: TppLabel;
    LbGrp5: TppLabel;
    ppLabel259: TppLabel;
    ppLabel270: TppLabel;
    ppDetailBand27: TppDetailBand;
    RptLivroInventDBText2: TppDBText;
    RptLivroInventDBText3: TppDBText;
    RptLivroInventDBText4: TppDBText;
    RptLivroInventDBText5: TppDBText;
    RptLivroInventDBText6: TppDBText;
    RptLivroInventDBText7: TppDBText;
    RptLivroInventDBText8: TppDBText;
    ppFooterBand33: TppFooterBand;
    ppLine84: TppLine;
    LblSistema: TppLabel;
    ppPagNo: TppSystemVariable;
    ppCalc66: TppSystemVariable;
    LbPagNo: TppLabel;
    ppLabel208: TppLabel;
    RptLivroInventSummaryBand1: TppSummaryBand;
    RptLivroInventLabel12: TppLabel;
    RptLivroInventDBCalc1: TppDBCalc;
    ppLine116: TppLine;
    ppLine117: TppLine;
    ppGroup17: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    lbAlmox14: TppLabel;
    RptLivroInventDBText1: TppDBText;
    ppLine87: TppLine;
    ppLine115: TppLine;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppLabel257: TppLabel;
    ppDBCalc41: TppDBCalc;
    RptLivroInventLine7: TppLine;
    ppGroup18: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppLabel207: TppLabel;
    ppDBCalc1: TppDBCalc;
    SqlLivroInvent: TCMSqlParams;
    CdsLivroInvent: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    function ListAlmox( CodCusteio: Integer ): String;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure LbPagNoPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptLivroInvent: TRptLivroInvent;
  iPagNum: Integer;
  sNomeAlmox:   String = '';
  sNomeGrupo:   String = '';
  sNomeCusteio: String = '';

implementation

{$R *.DFM}

function TRptLivroInvent.ListAlmox( CodCusteio: Integer ): String;
begin
  If CodCusteio = 0 then
     SqlAux.Sql.Text := 'SELECT CODALMOXARIFADO FROM ALMOX ' +
            'WHERE ( IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' )'
  Else
     SqlAux.Sql.Text := 'SELECT CODALMOXARIFADO FROM ALMOX ' +
            'WHERE ( CODCUSTEIO = ' + FloatToStr( codCusteio ) + ' )';

  SqlAux.Open;
  CdsAux.First;
  Result := '';

  While Not CdsAux.Eof Do Begin
        Result := Result + CdsAux.FieldByName( 'CODALMOXARIFADO' ).AsString + ',';
        CdsAux.Next;
  End;

  CdsAux.Close;
  Result := Copy( Result, 1, length( Result ) - 1 );
end;

procedure TRptLivroInvent.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  SqlAux.Sql.Text := 'SELECT DATAREPRESA FROM PARALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa );
  SqlAux.Open;
  CmpRptCM.ParamByName( 'DataLimite' ).TextDefault := DateToStr( CdsAux.FieldByName( 'DATAREPRESA' ).AsDateTime );
  CdsAux.Close;
end;

procedure TRptLivroInvent.CrmRptCMBeforePrint(Sender: TObject);
Var
  sAlmox: String;
begin
  inherited;
  If Not CmpRptCM.ParamValues[ 0 ].IsNull Then
     ppLabel259.Caption := 'Unidade de Custeio:'
  Else
     ppLabel259.Caption := 'Almoxarifado:';

  If CmpRptCM.ParamValues[ 0 ].IsNull and CmpRptCM.ParamValues[ 1 ].IsNull Then
     ppLabel270.Caption := 'Todos'
  Else
     If CmpRptCM.ParamValues[ 0 ].IsNull Then
        ppLabel270.Caption := Trim( sNomeCusteio )
     Else
        ppLabel270.Caption := Trim( sNomeAlmox );

  If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
     sAlmox := CmpRptCM.ParamValues[ 1 ].AsString
  Else
     sAlmox := ListAlmox( CmpRptCM.ParamValues[ 0 ].AsInteger );

  iPagNum           := CmpRptCM.ParamValues[ 6 ].AsInteger;
  LbDataRep.Caption := 'Estoque existente em: ' + CmpRptCM.ParamValues[ 5 ].AsString;
  LbGrp5.Caption    := 'Todos';

  With SqlLivroInvent Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT AL.CODALMOXARIFADO, ');

       If Not CmpRptCM.ParamValues[ 0 ].IsNull Then
          Sql.Add('    ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ' AS DESCALMOX, ')
       Else
          Sql.Add('       AL.DESCALMOX, ');

       Sql.Add('       AR.CODARTIGO, ');
       Sql.Add('       PR.DESCPROD, ');
       Sql.Add('       PR.CODMEDCUSTO, ');
       Sql.Add('       PR.CODFISCALPADRAO, ');
       Sql.Add('       PR.CODGRUPOPROD, ');
       Sql.Add('       GP.DESCGRUPOPROD, ');
       Sql.Add('       MV.SALDOQTDE, ');
       Sql.Add('       MV.CUSTOMEDIO, ');
       Sql.Add('       ( MV.SALDOQTDE * MV.CUSTOMEDIO ) AS VALTOTAL ');
       Sql.Add('  FROM ( SELECT M.IDMOV, ');
       Sql.Add('                M.CODARTIGO, ');
       Sql.Add('                M.SALDOQTDEMOV AS SALDOQTDE, ');
       Sql.Add('                M.CUSTOMEDIOMOV AS CUSTOMEDIO, ');
       Sql.Add('                M.CODALMOXARIFADO, ');
       Sql.Add('                M.IDPESSOA ');
       Sql.Add('           FROM MOVIMENT M, ');
       Sql.Add('                ( SELECT M.CODARTIGO, M.CODALMOXARIFADO, ');
       Sql.Add('                         MAX( M.IDMOV ) AS IDMOV ');
       Sql.Add('                    FROM MOVIMENT M, ');
       Sql.Add('                         ( SELECT CODARTIGO, CODALMOXARIFADO, ');
       Sql.Add('                                  MAX( DATAMOV ) AS MAXDATAMOV ');
       Sql.Add('                             FROM MOVIMENT ');
       Sql.Add('                            WHERE ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 5 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add('                              AND ( CODALMOXARIFADO = '+ CmpRptCM.ParamValues[ 1 ].AsString +' ) ')
       Else
          Sql.Add('                              AND ( CODALMOXARIFADO In ( ' + sAlmox + ' ) ) ');

       Sql.Add('                            GROUP BY CODARTIGO, CODALMOXARIFADO ');
       Sql.Add('                         ) SUB ');
       Sql.Add('                   WHERE ( M.CODARTIGO = SUB.CODARTIGO ) ');
       Sql.Add('                     AND ( M.CODALMOXARIFADO = SUB.CODALMOXARIFADO ) ');
       Sql.Add('                     AND ( M.DATAMOV = SUB.MAXDATAMOV ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add('                     AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 1 ].AsString + ' ) ')
       Else
          Sql.Add('                     AND ( M.CODALMOXARIFADO In ( ' + sAlmox + ' ) ) ');

       Sql.Add('                     AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('                   GROUP BY M.CODARTIGO, M.CODALMOXARIFADO ');
       Sql.Add('                ) AUX ');
       Sql.Add('          WHERE ( M.CODARTIGO = AUX.CODARTIGO ) ');
       Sql.Add('            AND ( M.CODALMOXARIFADO = AUX.CODALMOXARIFADO ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add('            AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 1 ].AsString + ' ) ')
       Else
          Sql.Add('            AND ( M.CODALMOXARIFADO In ( ' + sAlmox + ' ) ) ');

       Sql.Add('            AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            AND ( M.IDMOV = AUX.IDMOV ) ');
       Sql.Add('       ) MV, ');
       Sql.Add('       ARTIGO AR,                                         ');
       Sql.Add('       PRODUTO PR,                                        ');
       Sql.Add('       GRUPPROD GP,                                       ');
       Sql.Add('       ALMOX AL                                           ');
       Sql.Add(' WHERE ( AL.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          sql.add('   AND ( MV.SALDOQTDE <> 0 ) ');

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then Begin
          Sql.Add('   AND ( RTRIM( PR.CODGRUPOPROD ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 2 ].AsString ) ) + ' ) ');
          LbGrp5.Caption  := sNomeGrupo;
       End;

       Sql.Add('   AND ( AR.CODPRODUTO = PR.CODPRODUTO ) ');
       Sql.Add('   AND ( AR.CODARTIGO  = MV.CODARTIGO ) ');
       Sql.Add('   AND ( PR.CODGRUPOPROD = GP.CODGRUPOPROD ) ');
       Sql.Add('   AND ( AL.CODALMOXARIFADO = MV.CODALMOXARIFADO ) ');

       Case CmpRptCM.ParamValues[ 3 ].AsInteger Of
            0: Sql.Add(' ORDER BY AL.DESCALMOX,PR.CODGRUPOPROD, PR.DESCPROD');
            1: Sql.Add(' ORDER BY AL.DESCALMOX,PR.CODGRUPOPROD, AR.CODARTIGO');
            2: Sql.Add(' ORDER BY AL.DESCALMOX,PR.CODGRUPOPROD, VALTOTAL DESC');
       End;

       Open;
  End;
end;

procedure TRptLivroInvent.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox   := Sender.CtrlLookup.Text;
       1: sNomeCusteio := Sender.CtrlLookup.Text;
       2: sNomeGrupo   := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptLivroInvent.LbPagNoPrint(Sender: TObject);
begin
  inherited;
  LbPagNo.Caption := IntToStr( IPagNum - 1 + StrToInt( ppPagNo.Text ) ); 
end;

end.

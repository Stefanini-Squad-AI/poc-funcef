unit rDifInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport, MontaSelect;

type
  TRptDifInvent = class(TFrmCmReport)
    bdeDifInvent: TppBDEPipeline;
    bdeContInventppField1: TppField;
    bdeContInventppField2: TppField;
    bdeContInventppField3: TppField;
    bdeContInventppField4: TppField;
    bdeContInventppField5: TppField;
    bdeContInventppField6: TppField;
    bdeContInventppField7: TppField;
    bdeContInventppField8: TppField;
    bdeContInventppField9: TppField;
    bdeContInventppField10: TppField;
    bdeContInventppField11: TppField;
    bdeContInventppField12: TppField;
    bdeContInventppField13: TppField;
    dsDifInvent: TwwDataSource;
    RptDifInvent: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel15: TppLabel;
    ppLine8: TppLine;
    Lblempresa: TppLabel;
    lblAlmoxInvent: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    RptContInventDBText1: TppDBText;
    RptContInventDBText2: TppDBText;
    RptContInventDBText3: TppDBText;
    RptContInventDBText4: TppDBText;
    RptContInventDBText5: TppDBText;
    RptContInventDBText6: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine10: TppLine;
    LblSistema: TppLabel;
    ppCalc10: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine11: TppLine;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine12: TppLine;
    ppLabel24: TppLabel;
    RptContInventLabel1: TppLabel;
    RptContInventLabel2: TppLabel;
    RptContInventLabel3: TppLabel;
    RptContInventLabel4: TppLabel;
    RptContInventLabel5: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    RptContInventLine1: TppLine;
    RptContInventLabel6: TppLabel;
    RptContInventDBCalc4: TppDBCalc;
    RptContInventDBCalc2: TppDBCalc;
    RptContInventDBCalc5: TppDBCalc;
    RptContInventGroup1: TppGroup;
    RptContInventGroupHeaderBand1: TppGroupHeaderBand;
    RptContInventLine2: TppLine;
    RptContInventDBText7: TppDBText;
    RptContInventDBText8: TppDBText;
    RptContInventGroupFooterBand1: TppGroupFooterBand;
    RptContInventLabel7: TppLabel;
    RptContInventDBCalc10: TppDBCalc;
    RptContInventDBCalc1: TppDBCalc;
    RptContInventDBCalc3: TppDBCalc;
    SqlDifInvent: TCMSqlParams;
    CdsDifInvent: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    MsDifInvent: TMontaSelect;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptDifInvent: TRptDifInvent;
  sNomeAlmox: String = '';

implementation

{$R *.DFM}

procedure TRptDifInvent.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';

  With CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro Do Begin
       Clear;
       Add( 'CONTAGEMENCERRADA = ''F''' );
       Add( 'IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) );
  End;
end;

procedure TRptDifInvent.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: Begin
          If Sender.CtrlLookup.LookupValue = '' Then Begin
             If CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro.Count = 3 Then
                CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro.Delete( 2 );
          End Else
             If CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro.Count = 2 Then
                CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro.Add( 'CODALMOXARIFADO = ' + Sender.CtrlLookup.LookupValue )
             Else
                CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro[ 2 ] := 'CODALMOXARIFADO = ' + Sender.CtrlLookup.LookupValue;

          sNomeAlmox := Sender.CtrlLookup.Text;
       End;
  End;
end;

procedure TRptDifInvent.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  CdsAux.Close;
  SqlAux.Prepare;
  SqlAux.ParamByName( 'almox' ).AsFloat := CmpRptCM.ParamValues[ 0 ].AsFloat;
  SqlAux.Open;

  With SqlDifInvent Do Begin
       Close;
       Sql.Clear;
       Sql.add('SELECT I.IDINVENTARIO,   ');
       Sql.add('       I.DATAINVENTARIO, ');
       Sql.add('       G.CODGRUPOPROD,   ');
       Sql.add('       G.DESCGRUPOPROD,  ');
       Sql.add('       D.CODARTIGO,      ');
       Sql.add('       D.QTDECONTADA,    ');
       Sql.add('       D.DIFERENCAATUAL, ');
       Sql.add('       D.SALDOINICIAL,   ');
       Sql.add('       DECODE( D.IDMOV, NULL, ( D.SALDOINICIAL * C.CUSTOMEDIO ), ( D.SALDOINICIAL * M.CUSTOMEDIOMOV ) ) AS VALINICIAL, ');
       Sql.add('       DECODE( D.IDMOV, NULL, ( D.QTDECONTADA * C.CUSTOMEDIO ), ( D.QTDECONTADA * M.CUSTOMEDIOMOV ) ) AS VALCONTADA, ');
       Sql.add('       DECODE( D.IDMOV, NULL, ( D.DIFERENCAATUAL * C.CUSTOMEDIO ), ( D.DIFERENCAATUAL * M.CUSTOMEDIOMOV ) ) AS VALDIFERENCA, ');
       Sql.add('       S.LOCALIZACAO, ');
       Sql.add('       ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR ) AS DESCRICAO ');
       Sql.add('  FROM INVENTAR I, ');
       Sql.add('       RESCONT D,  ');
       Sql.add('       PRODUTO P,  ');
       Sql.add('       ARTIGO A,   ');
       Sql.add('       SALDO S,    ');
       Sql.add('       CUSTOMED C, ');
       Sql.add('       GRUPPROD G, ');
       Sql.add('       MOVIMENT M  ');
       Sql.add(' WHERE ( I.CONTAGEMENCERRADA = ''F'' ) ');
       Sql.add('   AND ( D.DIFERENCAATUAL <> 0 ) ');
       Sql.add('   AND ( D.DIFERENCAATUAL IS NOT NULL ) ');
       Sql.add('   AND ( S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.add('   AND ( I.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.add('   AND ( I.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.add('   AND ( S.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.add('   AND ( C.CODCUSTEIO = ' + FloatToStr( CdsAux.FieldByName( 'CODCUSTEIO' ).AsFloat ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add('   AND ( I.IDINVENTARIO = ' + CmpRptCM.ParamValues[ 1 ].AsString + ' ) ')
       Else
          If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
             Sql.Add('   AND ( I.DATAINVENTARIO = TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ',''DD/MM/YYYY'' ) ) ');

       Sql.Add('   AND ( I.IDINVENTARIO = D.IDINVENTARIO ) ');
       Sql.add('   AND ( A.CODARTIGO = D.CODARTIGO )       ');
       Sql.add('   AND ( A.CODARTIGO = C.CODARTIGO )       ');
       Sql.add('   AND ( A.CODARTIGO = S.CODARTIGO(+) )    ');
       Sql.add('   AND ( P.CODPRODUTO = A.CODPRODUTO )     ');
       Sql.add('   AND ( G.CODGRUPOPROD = P.CODGRUPOPROD ) ');
       Sql.add('   AND ( D.IDMOV =  M.IDMOV(+) )           ');

      Case CmpRptCM.ParamValues[ 3 ].AsInteger Of
           0: Sql.Add('ORDER BY I.IDINVENTARIO, G.CODGRUPOPROD, D.CODARTIGO');
           1: Sql.Add('ORDER BY I.IDINVENTARIO, G.CODGRUPOPROD, DESCRICAO');
           2: Sql.Add('ORDER BY I.IDINVENTARIO, G.CODGRUPOPROD, P.CODGRUPOPROD, DESCRICAO');
           3: Sql.Add('ORDER BY I.IDINVENTARIO, G.CODGRUPOPROD, S.LOCALIZACAO, DESCRICAO');
      End;

      lblAlmoxInvent.Caption := sNomeAlmox;
      CdsAux.Close;
      Open;
  End;
end;

end.

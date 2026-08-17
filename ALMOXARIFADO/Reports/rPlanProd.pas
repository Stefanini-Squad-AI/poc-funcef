unit rPlanProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptPlanProd = class(TFrmCmReport)
    sdPlanProd: TwwDataSource;
    dbePlanProd: TppBDEPipeline;
    RptPlanProd: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppLabel103: TppLabel;
    LblEmpresa: TppLabel;
    dsds: TppLabel;
    LbFiltro2: TppLabel;
    ppLine43: TppLine;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLine44: TppLine;
    RptPlanProdLabel1: TppLabel;
    lbAlmox9: TppLabel;
    RptPlanProdLabel2: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLine41: TppLine;
    ppDBText37: TppDBText;
    RptPlanProdDBText3: TppDBText;
    ppFooterBand19: TppFooterBand;
    ppLine42: TppLine;
    LblSistema: TppLabel;
    ppCalc36: TppSystemVariable;
    ppCalc37: TppSystemVariable;
    RptPlanProdGroup1: TppGroup;
    RptPlanProdGroupHeaderBand1: TppGroupHeaderBand;
    RptPlanProdDBText1: TppDBText;
    RptPlanProdDBText2: TppDBText;
    RptPlanProdLine1: TppLine;
    RptPlanProdLine2: TppLine;
    RptPlanProdGroupFooterBand1: TppGroupFooterBand;
    SqlPlanProd: TCMSqlParams;
    CdsPlanProd: TCMClientDataSet;
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
  RptPlanProd: TRptPlanProd;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptPlanProd.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
end;

procedure TRptPlanProd.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       1: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptPlanProd.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlPlanProd Do Begin
       Close;
       Sql.Text := 'SELECT G.CODGRUPOPROD, ' +
                          'G.DESCGRUPOPROD, ' +
                          'A.CODARTIGO, ' +
                          'P.CODMEDCUSTO, ' +
                          '( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ' +
                          'S.LOCALIZACAO ' +
                     'FROM ARTIGO A, ' +
                          'PRODUTO P, ' +
                          'GRUPPROD G, ' +
                          'SALDO S ' +
                    'WHERE ( S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' +
                      'AND ( A.FLGATIVO = ''S'' ) ';

       If CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add('   AND ( P.ITEMESTOCAVEL = ''S'' ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then Begin
          sql.Add('   AND ( RTRIM( G.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 1 ].AsString ) + '%' ) + ' ) ');
          lbFiltro2.Caption := CmpRptCM.ParamValues[ 1 ].AsString + ' - ' + sNomeGrupo;
       End;

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          Sql.Add('  AND ( S.SALDOQTDE <> 0 )');

       Sql.Add('   AND ( A.CODPRODUTO  = P.CODPRODUTO ) ' +
                  'AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ' +
                  'AND ( A.CODARTIGO = S.CODARTIGO ) ');

       Case CmpRptCM.ParamValues[ 2 ].AsInteger Of
            0: Sql.Add('ORDER BY G.CODGRUPOPROD, ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO )');
            1: Sql.Add('ORDER BY G.CODGRUPOPROD, A.CODARTIGO');
            2: Sql.Add('ORDER BY G.CODGRUPOPROD, S.LOCALIZACAO');
       End;

       Open;
  End;

  lbAlmox9.Caption := sNomeAlmox;
end;

end.

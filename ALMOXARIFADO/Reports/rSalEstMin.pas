unit rSalEstMin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport;

type
  TRptSalEstMin = class(TFrmCmReport)
    bdeSalEstMin: TppBDEPipeline;
    dsSalEstMin: TwwDataSource;
    RptSalEstMin: TppReport;
    ppHeaderBand28: TppHeaderBand;
    ppLabel122: TppLabel;
    ppLine74: TppLine;
    LblEmpresa: TppLabel;
    RptSalEstMinLine1: TppLine;
    RptSalEstMinLabel1: TppLabel;
    RptSalEstMinLabel2: TppLabel;
    RptSalEstMinLabel4: TppLabel;
    RptSalEstMinLabel5: TppLabel;
    lbAlmox12: TppLabel;
    LbGrupo2: TppLabel;
    RptSalEstMinLabel6: TppLabel;
    RptSalEstMinLabel8: TppLabel;
    ppDetailBand22: TppDetailBand;
    RptSalEstMinDBText1: TppDBText;
    RptSalEstMinDBText2: TppDBText;
    RptSalEstMinDBText3: TppDBText;
    RptSalEstMinDBText5: TppDBText;
    RptSalEstMinDBText4: TppDBText;
    ppFooterBand28: TppFooterBand;
    ppLine75: TppLine;
    LblSistema: TppLabel;
    ppCalc54: TppSystemVariable;
    ppCalc55: TppSystemVariable;
    SqlSalEstMin: TCMSqlParams;
    CdsSalEstMin: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptSalEstMin: TRptSalEstMin;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptSalEstMin.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
end;

procedure TRptSalEstMin.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  lbAlmox12.Caption := sNomeAlmox;

  With SqlSalEstMin Do Begin
       Close;
       Sql.Clear;
       Sql.add('SELECT S.CODARTIGO, ');
       Sql.add('       ( P.DESCPROD || '' '' || A.CODCOR || '' '' ||  A.CODTAMANHO ) AS DESCRICAO, ');
       Sql.add('       S.SALDOQTDE, ');
       Sql.add('       P.CODMEDCUSTO, ');
       Sql.add('       DECODE( S.ESTMAXIMO, NULL, 0, S.ESTMAXIMO )AS ESTMAXIMO ');
       Sql.add('  FROM SALDO S, ');
       Sql.add('       PRODUTO P, ');
       Sql.add('       ARTIGO A ');
       Sql.add(' WHERE ( S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then Begin
          Sql.add('   AND ( RTRIM( P.CODGRUPOPROD ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 1 ].AsString ) ) + ' ) ');
          lbGrupo2.Caption := sNomeGrupo;
       End Else
          lbGrupo2.Caption  := 'Todos';

       Sql.add('   AND ( S.SALDOQTDE > S.ESTMAXIMO ) ');
       Sql.add('   AND ( S.CODARTIGO = A.CODARTIGO ) ');
       Sql.add('   AND ( A.CODPRODUTO = P.CODPRODUTO ) ');

       Case CmpRptCM.ParamValues[ 2 ].AsInteger Of
            0: Sql.add(' ORDER BY DESCRICAO');
            1: Sql.add(' ORDER BY S.CODARTIGO');
            2: Sql.add(' ORDER BY S.SALDOQTDE');
       End;

       Open;
  End;
end;

procedure TRptSalEstMin.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       1: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

end.

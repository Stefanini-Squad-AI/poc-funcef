unit rSolPrePronta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport, MontaSelect;

type
  TRptSolPrePronta = class(TFrmCmReport)
    bdeSolPrePronta: TppBDEPipeline;
    dsSolPrePronta: TwwDataSource;
    RptSolPrePronta: TppReport;
    ppHeaderBand11: TppHeaderBand;
    RptSolPreProntaLine3: TppLine;
    ppLabel49: TppLabel;
    LblEmpresa: TppLabel;
    RptSolPreProntaLine1: TppLine;
    RptSolPreProntaLabel2: TppLabel;
    RptSolPreProntaLine4: TppLine;
    RptSolPreProntaLabel4: TppLabel;
    RptSolPreProntaLine5: TppLine;
    RptSolPreProntaLabel5: TppLabel;
    RptSolPreProntaLabel6: TppLabel;
    RptSolPreProntaLabel7: TppLabel;
    RptSolPreProntaLabel8: TppLabel;
    RptSolPreProntaLabel1: TppLabel;
    RptSolPreProntaLabel9: TppLabel;
    RptSolPreProntaLabel10: TppLabel;
    RptSolPreProntaLine6: TppLine;
    RptSolPreProntaLabel11: TppLabel;
    RptSolPreProntaLabel12: TppLabel;
    RptSolPreProntaDBText11: TppDBText;
    RptSolPreProntaLabel13: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppFooterBand11: TppFooterBand;
    ppLine23: TppLine;
    LblSistema: TppLabel;
    ppCalc20: TppSystemVariable;
    ppCalc21: TppSystemVariable;
    RptSolPreProntaGroup1: TppGroup;
    RptSolPreProntaGroupHeaderBand1: TppGroupHeaderBand;
    RptSolPreProntaGroupFooterBand1: TppGroupFooterBand;
    RptSolPreProntaGroup2: TppGroup;
    RptSolPreProntaGroupHeaderBand2: TppGroupHeaderBand;
    RptSolPreProntaDBText1: TppDBText;
    RptSolPreProntaLabel3: TppLabel;
    RptSolPreProntaDBText2: TppDBText;
    RptSolPreProntaLine2: TppLine;
    RptSolPreProntaGroupFooterBand2: TppGroupFooterBand;
    RptSolPreProntaGroup3: TppGroup;
    RptSolPreProntaGroupHeaderBand3: TppGroupHeaderBand;
    RptSolPreProntaGroupFooterBand3: TppGroupFooterBand;
    RptSolPreProntaDBText3: TppDBText;
    RptSolPreProntaDBText4: TppDBText;
    RptSolPreProntaDBText5: TppDBText;
    RptSolPreProntaDBText7: TppDBText;
    RptSolPreProntaDBText6: TppDBText;
    RptSolPreProntaDBText8: TppDBText;
    RptSolPreProntaDBText12: TppDBText;
    RptSolPreProntaDBText9: TppDBText;
    RptSolPreProntaDBText10: TppDBText;
    RptSolPreProntaLine7: TppLine;
    RptSolPreProntaLine8: TppLine;
    RptSolPreProntaLine9: TppLine;
    SqlSolPrePronta: TCMSqlParams;
    CdsSolPrePronta: TCMClientDataSet;
    MsSolPrepronta: TMontaSelect;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure RptSolPreProntaPrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptSolPrePronta: TRptSolPrePronta;
  iNumSoli: Integer;
  
implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TRptSolPrePronta.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  iNumSoli := 0;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';

  With CmpRptCM.ParamByName( 'NumSolicit' ).MontaSelect.Filtro Do Begin
       Clear;
       Add( 'IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) );
       Add( 'CODALMOXARIFADO = 0' );
       Add( 'FLGPREPRONTA = ''S''' );
       Add( 'IMPRESSO = ''F''' );
  End;
end;

procedure TRptSolPrePronta.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;

  Case Index Of
       0: Begin
          CmpRptCM.ParamByName( 'NumSolicit' ).MontaSelect.Filtro[ 1 ] := '( CODALMOXARIFADO = ' + Sender.CtrlLookup.LookupValue + ' ) ';
       End;

       1: Begin
          If Sender.CtrlRadioGroup.ItemIndex = 0 Then
             CmpRptCM.ParamByName( 'NumSolicit' ).MontaSelect.Filtro[ 3 ] := '( IMPRESSO = ''F'' )'
          Else
             CmpRptCM.ParamByName( 'NumSolicit' ).MontaSelect.Filtro[ 3 ] := '( IMPRESSO = ''T'' )';
       End;
  End;
end;

procedure TRptSolPrePronta.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlSolPrePronta Do Begin
       Close;
       Sql.Text := 'SELECT I.NUMSOLCOMPRA, ' +
                          'G.CODGRUPOPROD, ' +
                          'G.DESCGRUPOPROD, ' +
                          'I.CODARTIGO, ' +
                          'NF.VLRUNITARIO, ' +
                          'NF.DATAENTDEVOL AS DATAULT, ' +
                          'SA.SALDOQTDE, ' +
                          '( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ' +
                          'I.QTDEPEDIDA, ' +
                          'I.CODMEDIDA, ' +
                          'P.CODMEDCUSTO AS UNIDSALDO, ' +
                          'NF.NOME ' +
                     'FROM SOLICOMP S, ' +
                          'ITEMSOLI I, ' +
                          'ARTIGO A, ' +
                          'PRODUTO P, ' +
                          'GRUPPROD G, ' +
                          'SALDO SA, ' +
                          '( SELECT I.CODARTIGO, ' +
                                   'I.VLRUNITARIO, ' +
                                   'P.NOME, ' +
                                   'N.DATAENTDEVOL ' +
                              'FROM PESSOA P, ' +
                                   'NFRECEBDEVOL N, ' +
                                   'ITENSRECEBDEVOL I, ' +
                                   '( SELECT MAX( IDITENSRECDEV ), ' +
                                            'CODARTIGO ' +
                                       'FROM ITENSRECEBDEVOL ' +
                                      'GROUP BY CODARTIGO ' +
                                   ') AUX ' +
                             'WHERE ( I.CODARTIGO = AUX.CODARTIGO ) ' +
                               'AND ( N.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL ) ' +
                               'AND ( P.IDPESSOA = N.IDFORCLI ) ' +
                          ') NF '+
                    'WHERE ( S.FLGPREPRONTA = ''S'' ) ';

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
          Sql.Add('AND ( S.NUMSOLCOMPRA = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' ) ');

       If CmpRptCM.ParamValues[ 1 ].AsInteger = 0 Then
          Sql.Add('AND ( S.IMPRESSO = ''F'' ) ')
       Else
          Sql.Add('AND ( S.IMPRESSO = ''T'' ) ');

       Sql.Add(  'AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ' +
                 'AND ( A.CODPRODUTO = P.CODPRODUTO ) ' +
                 'AND ( S.NUMSOLCOMPRA = I.NUMSOLCOMPRA ) ' +
                 'AND ( I.CODARTIGO = A.CODARTIGO ) ' +
                 'AND ( I.CODARTIGO = SA.CODARTIGO ) ' +
                 'AND ( S.CODALMOXARIFADO = SA.CODALMOXARIFADO ) ' +
                 'AND ( I.CODARTIGO = NF.CODARTIGO(+) ) ' +
               'ORDER BY S.NUMSOLCOMPRA, G.CODGRUPOPROD, DESCRICAO');
       Open;

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
          iNumSoli := CmpRptCM.ParamValues[ 2 ].AsInteger;
  End;
end;

procedure TRptSolPrePronta.RptSolPreProntaPrintingComplete(
  Sender: TObject);
var
  str: String;
begin
  inherited;
  str := '';
  CdsSolPrePronta.First;

  While Not CdsSolPrePronta.Eof Do Begin
        If str <> '' Then
           str := str + ',';

        str := str + IntToStr( CdsSolPrePronta.FieldByName( 'NUMSOLCOMPRA' ).AsInteger );
        CdsSolPrePronta.Next;
  End;

  If str <> '' Then
     Padroes.ExecSqlAndCommit( 'UPDATE SOLICOMP SET IMPRESSO = ''T'' WHERE NUMSOLCOMPRA IN ( ' + str + ' )' );
end;

end.

{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------}

unit rPosLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, TXRB;

type
  TRptPosLote = class(TFrmCmReport)
    PpEmisCq: TppBDEPipeline;
    DsEmisCq: TwwDataSource;
    RptEmisCq: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLine23: TppLine;
    ppLabel1: TppLabel;
    LblRelChequeEmiss: TppLabel;
    RptEmisCqLabel1: TppLabel;
    RptEmisCqLabel2: TppLabel;
    RptEmisCqLabel3: TppLabel;
    RptEmisCqLabel4: TppLabel;
    RptEmisCqLabel5: TppLabel;
    RptEmisCqLabel6: TppLabel;
    RptEmisCqLabel11: TppLabel;
    RptEmisCqLabel13: TppLabel;
    ppDetailBand17: TppDetailBand;
    RptEmisCqDBText1: TppDBText;
    RptEmisCqDBText2: TppDBText;
    RptEmisCqDBText3: TppDBText;
    RptEmisCqDBText4: TppDBText;
    RptEmisCqDBText5: TppDBText;
    RptEmisCqDBText6: TppDBText;
    RptEmisCqDBText7: TppDBText;
    RptEmisCqDBText8: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppLine24: TppLine;
    ppLabel19: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    RptEmisCqSummaryBand1: TppSummaryBand;
    RptEmisCqDBCalc3: TppDBCalc;
    RptEmisCqLabel9: TppLabel;
    RptEmisCqLabel10: TppLabel;
    RptEmisCqDBCalc4: TppDBCalc;
    LblBancoEmisCheque: TppLabel;
    RptEmisCqLabel12: TppLabel;
    RptEmisCqGroup1: TppGroup;
    RptEmisCqGroupHeaderBand1: TppGroupHeaderBand;
    RptEmisCqGroupFooterBand1: TppGroupFooterBand;
    RptEmisCqDBCalc1: TppDBCalc;
    RptEmisCqLabel7: TppLabel;
    RptEmisCqLabel8: TppLabel;
    RptEmisCqDBCalc2: TppDBCalc;
    RptEmisCqLine1: TppLine;
    SqlEmisCq: TCMSqlParams;
    CdsEmisCq: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptListaEmissCheque: TRptListaEmissCheque;

implementation

{$R *.DFM}

procedure TRptListaEmissCheque.CrmRptCMBeforePrint(Sender: TObject);
var
  sTipo, sSqlData, sSqlStatus, sSqlDataProg, sSituacao: string;
begin
  inherited;

  sSqlData := '';
  sSqlDataProg := '';

  if not CmpRptCM.ParamValues[0].IsNull then
    sSqlData := ' (LOTP.DATAEMISSAO >= TO_DATE(''' + CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'')) AND ';
  sSqlData := sSqlData + ' (LOTP.DATAEMISSAO <= TO_DATE(''' + CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) AND ';

  if not CmpRptCM.ParamValues[2].IsNull then
    sSqlDataProg := ' (D.DATAPROGRAMADA >= TO_DATE(''' + CmpRptCM.ParamValues[2].AsString + ''',''DD/MM/YYYY'')) AND ';

  if not CmpRptCM.ParamValues[3].IsNull then
    sSqlDataProg := sSqlDataProg + ' (D.DATAPROGRAMADA <= TO_DATE(''' + CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY'')) AND ';

  if not CmpRptCM.ParamValues[7].IsNull then
    sSqlDataProg := sSqlDataProg + ' (PC.CODPORTADOR = ' + CmpRptCM.ParamValues[7].AsString + ') AND ';

  case CmpRptCM.ParamValues[8].AsInteger of
    0:
      begin
        sSqlStatus := '(LOTP.FLAGEMISSAO = ''1'') AND ';
        sSituacao := ' Emitidos';
      end;
    1:
      begin
        sSituacao := ' Emitidos';
        sSqlStatus := '((LOTP.FLAGCANCEL <> ''C'') OR (LOTP.FLAGCANCEL IS NULL)) AND (LOTP.FLAGEMISSAO = ''1'') AND ';
      end;
    2:
      begin
        sSituacao := ' Baixados';
        sSqlStatus := '(LOTP.FLAGCANCEL = ''B'') AND ';
      end;
    3:
      begin
        sSituacao := ' em aberto';
        sSqlStatus := '((LOTP.FLAGEMISSAO = ''1'') AND ' +
          '(((LOTP.FLAGCANCEL <> ''B'') AND (LOTP.FLAGCANCEL <> ''C'')) OR LOTP.FLAGCANCEL IS NULL)) AND ';
      end;
    4:
      begin
        sSqlStatus := '(LOTP.FLAGCANCEL = ''C'') AND (LOTP.FLAGEMISSAO = ''1'') AND ';
        sSituacao := ' Cancelados';
      end;
  end;

  with SqlEmisCq do
  begin
    Close;
//    Sql.Text := 'SELECT /*+ RULE */ ' +  //Everson TIBERO
    Sql.Text := 'SELECT ' +  //Everson TIBERO
      ' LOTP.DATAEMISSAO, LOTP.NUMLOTE, LOTP.NUMCHQBORDERO, ' +
      ' DECODE(LOTP.FLAGCANCEL,''C'',0,DECODE(LOTP.FLAGCANCEL,''R'',0,SUM(LOTD.VALOR))) AS VALOR, ' +
      ' P.DESCRICAO, LOTP.FAVORECIDO, ' +
      ' DECODE(LOTP.FLAGCANCEL,NULL,''E'',LOTP.FLAGCANCEL) AS FLAGCANCEL, ' +
      ' D.DATAPROGRAMADA, P.CODPORTADOR ' +
      'FROM LOTEXDOCUM LOTD, LOTEPAGTO LOTP, PORTADORFORMA P, PORTADORCONTA PC, DOCUMENTO D ' +
      ',(select count(*) as totdocum , ld.numlote from lotepagto LoTP,lotexdocum ld , documento d where ' +
      '        D.RECPAG         = ''P''  AND ' + sSqlData + ' LoTP.numlote=ld.numlote and ' +
      '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by ld.numlote  ) totdocum ' +
      ',(select count(*) as totdocum , ld.numlote from lotepagto LoTP,lotexdocum ld , documento d where ' +
      '        D.RECPAG         = ''P''  AND ' + sSqlData + ' LoTP.numlote=ld.numlote and ' +
      '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and ' +
      '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =  ''P''' +
      ' and not exists  (select 1 from UsuarioxTpdocto b where recpag=''P'' and b.idusuario=' + inttostr(CrmRptCM.idusuario) +
      '            ) union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''P''' +
      '  and exists (select 1 from UsuarioxTpdocto b where recpag=''P'' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
      inttostr(CrmRptCM.idusuario) +
      ' )) group by ld.numlote  ) totlote ' +
      ' WHERE  (LOTP.CODPORTFORMA = P.CODPORTFORMA) AND' +
      sSqlData + sSqlStatus + sSqlDataProg +
      '  totlote.totdocum=totdocum.totdocum and ' +
      ' totlote.numlote=totdocum.numlote and   totlote.numlote=  LOTD.NUMLOTE  and ' +
      '  (LOTD.NUMLOTE = LOTP.NUMLOTE) AND ' +
      '  (P.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND' +
      '  (P.RECPAG = ''P'') AND';
    if not CmpRptCM.ParamValues[5].IsNull then
      Sql.Text := Sql.Text + ' (LOTP.NUMLOTE >= ' + CmpRptCM.ParamValues[5].AsString + ') AND ';
    if not CmpRptCM.ParamValues[6].IsNull then
      Sql.Text := Sql.Text + ' (LOTP.NUMLOTE <= ' + CmpRptCM.ParamValues[6].AsString + ') AND ';

    case StrToInt(CmpRptCM.ParamValues[9].AsString) of
      0:
        begin
          sTipo := 'Lotes';
        end;
      1:
        begin
          sTipo := 'Cheques';
          Sql.Text := Sql.Text + ' (P.IDTEMPLCHEQUE IS NOT NULL) AND ';
        end;
      2:
        begin
          sTipo := 'Pagamentos Eletrônicos';
          Sql.Text := Sql.Text + ' (P.CODARQUIVOREMESSA IS NOT NULL) AND ';
        end;
    end;

    Sql.Text := Sql.Text +
      '   (P.CODPORTADOR      = PC.CODPORTADOR(+)) AND ' +
      '   (LOTD.CODDOCUMENTO  = D.CODDOCUMENTO)      ' +
      '   GROUP  BY LOTP.NUMLOTE, LOTP.DATAEMISSAO, LOTP.NUMCHQBORDERO, P.DESCRICAO, LOTP.FAVORECIDO,FLAGCANCEL,P.CODPORTADOR,  D.DATAPROGRAMADA  ';

    case CmpRptCM.ParamValues[4].AsInteger of
      0: Sql.Text := Sql.Text + ' ORDER BY LOTP.DATAEMISSAO,P.CODPORTADOR,LOTP.NUMCHQBORDERO';
      1: Sql.Text := Sql.Text + ' ORDER BY LOTP.DATAEMISSAO,Lotp.NUMLOTE';
    end;
    Open;
  end;

  if CmpRptCM.ParamValues[0].IsNull then
    LblRelChequeEmiss.Caption := 'Relação dos ' + sTipo + sSituacao + ' Até ' + CmpRptCM.ParamValues[0].AsString
  else
    LblRelChequeEmiss.Caption := 'Relação dos ' + sTipo + sSituacao + ' Entre ' + CmpRptCM.ParamValues[0].AsString + ' e ' +
      CmpRptCM.ParamValues[1].AsString;

  if not CmpRptCM.ParamValues[7].IsNull then
    LblBancoEmisCheque.Caption := 'Somente ' + sTipo + ' da Conta ' + CmpRptCM.ParamValues[7].AsString
  else
    LblBancoEmisCheque.Caption := '';
end;

procedure TRptListaEmissCheque.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[7].LookupSettings.SQL.text := 'select codportador, nocontacorr, descricao ' +
    'from   portadorconta  ' +
    'where  IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa)  +
    '     order by descricao ';

end;

end.


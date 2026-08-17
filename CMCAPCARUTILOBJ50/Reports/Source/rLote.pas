unit rLote;

{-----------------------------------------------------------------------------------------
  Data      : 02/04/2007
  Autor     : Marcus Oliveira
  Pendência : 24816
  Descrição : Corrigir o filtro por dia, que não está totalizando.
-----------------------------------------------------------------------------------------}
{-----------------------------------------------------------------------------------------
  Data      : 24/01/2007
  Autor     : Rodolpho da Silva
  Pendência : 24266
  Descrição : Não obrigar a data final dos lotes emitidos
-----------------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, Wwdatsrc, DBTables, Wwquery, ppDB, ppDBPipe, ppDBBDE,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, TXRB, uSistema;

type
  TRptLote = class(TFrmCmReport)
    Rptlotes: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLine23: TppLine;
    ppLabel9: TppLabel;
    LblRelChequeEmiss: TppLabel;
    RptEmisCqLabel2: TppLabel;
    RptEmisCqLabel3: TppLabel;
    RptEmisCqLabel4: TppLabel;
    RptEmisCqLabel5: TppLabel;
    RptEmisCqLabel6: TppLabel;
    RptEmisCqLabel11: TppLabel;
    RptEmisCqLabel13: TppLabel;
    ppDetailBand17: TppDetailBand;
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
    Pplotes: TppBDEPipeline;
    Dslotes: TwwDataSource;
    CdsLotes: TCMClientDataSet;
    SqlLotes: TCMSqlParams;
    ppShape1: TppShape;
    cdsCabecario: TCMClientDataSet;
    sqlCabecario: TCMSqlParams;
    ppDBImage1: TppDBImage;
    ppBDEPipeline1: TppBDEPipeline;
    dsCabecario: TwwDataSource;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptLote: TRptLote;

implementation

{$R *.DFM}

procedure TRptLote.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[7].LookupSettings.SQL.text := 'select codportador, nocontacorr, descricao ' +
    'from   portadorconta  ' +
    'where  IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) +
    '     order by descricao ';
end;

procedure TRptLote.CrmRptCMBeforePrint(Sender: TObject);
var
  sTipo, sSqlData, sSqlStatus, sSqlDataProg, sSituacao: string;
begin
  inherited;

  sSqlData := '';
  sSqlDataProg := '';
  //Marcus Oliveira P.24817 02/04/2007 - Cabeçario do relatorio.
  with sqlCabecario do
    Begin
      Prepare;
      SQL.Clear;
      SQL.Add('SELECT                                             ' ) ;
      SQL.Add('  P.RAZAOSOCIAL, P.NUMDOCUMENTO, I.IMAGEM          ' ) ;
      SQL.Add('FROM                                               ' ) ;
      SQL.Add('  PESSOA P, IMAGENS I                              ' ) ;
      SQL.Add('WHERE                                              ' ) ;
      SQL.Add('  ( I.IDIMAGEM = P.IDIMAGEM ) AND                  ' ) ;
      SQL.Add('  (P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +')');
      Open;
    end;

  if not CmpRptCM.ParamValues[0].IsNull then
    sSqlData := ' (LOTP.DATAEMISSAO >= TO_DATE(''' + CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'')) AND ';

  // Rodolpho da Silva - P: 24266 - 24/01/2007
  if not CmpRptCM.ParamValues[1].IsNull then
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
        sSituacao := ' Emitidos e Pendentes de Emissão';
      end;
    1:
      begin
        sSituacao := ' Emitidos';
        sSqlStatus :=
          ' (LOTP.FLAGEMISSAO = ''1'') AND ';
      end;
    2:
      begin
        sSituacao := ' Pendentes de Emissão';
        sSqlStatus := ' (LOTP.FLAGEMISSAO = ''0'' or ' +
          'LOTP.FLAGEMISSAO = '' '' or ' +
          'LOTP.FLAGEMISSAO is null) AND ';
      end;
  end;

  case CmpRptCM.ParamValues[9].AsInteger of
    1:
      begin
        sSituacao := sSituacao + ' Baixados ';
        sSqlStatus := ' (LOTP.FLAGCANCEL = ''B'') AND ';
      end;
    2:
      begin
        sSituacao := sSituacao + ' Cancelados ';
        sSqlStatus := ' (LOTP.FLAGCANCEL = ''C'') AND ';
      end;
    3:
      begin
        sSituacao := sSituacao + ' Regerados ';
        sSqlStatus := ' (LOTP.FLAGCANCEL = ''R'') AND ';
      end;
  end;

  with sqllotes do
  begin
    Close;
    Sql.Text :=
      'SELECT ' +
      '   LOTP.DATAEMISSAO, LOTP.NUMLOTE, LOTP.NUMCHQBORDERO, ' +
      '   DECODE(LOTP.FLAGCANCEL, ''C'', 0, DECODE(LOTP.FLAGCANCEL, ''R'', 0, SUM(LOTD.VALOR))) AS VALOR, ' +
      '   P.DESCRICAO, LOTP.FAVORECIDO, DECODE(LOTP.FLAGCANCEL, NULL, ''E'', LOTP.FLAGCANCEL) AS FLAGCANCEL, ' +
      '   D.DATAPROGRAMADA, P.CODPORTADOR ' +
      'FROM ' +
      '   LOTEXDOCUM LOTD, LOTEPAGTO LOTP, PORTADORFORMA P, PORTADORCONTA PC, DOCUMENTO D, ' +
      '   (select count(*) as totdocum, ld.numlote ' +
      '      from lotepagto LoTP, ' +
      '           lotexdocum ld, ' +
      '           documento d ' +
      '      where (D.RECPAG = ''P'') AND ' + sSqlData + ' LoTP.numlote = ld.numlote and ' +
      '            ld.CODDOCUMENTO = D.CODDOCUMENTO ' +
      '      group by ld.numlote) TOTDOCUM, ' +
      '   (select count(*) as totdocum, ld.numlote ' +
      '      from lotepagto LoTP, lotexdocum ld, documento d ' +
      '      where (D.RECPAG = ''P'') AND ' + sSqlData + ' LoTP.numlote = ld.numlote and ' +
      '            ld.CODDOCUMENTO = D.CODDOCUMENTO and ' +
      '            d.codtipdoc in (SELECT CODTIPDOC ' +
      '                            FROM TIPODOCRECPAG a ' +
      '                            WHERE a.RECPAG = ''P'' ' +
      '                              and not exists (select 1 ' +
      '                                              from UsuarioxTpdocto b ' +
      '                                              where recpag = ''P'' and ' +
      '                                                    b.idusuario = ' + inttostr(CrmRptCM.idusuario) + ') ' +
      '                            UNION ' +
      '                            SELECT CODTIPDOC ' +
      '                            FROM TIPODOCRECPAG a ' +
      '                            WHERE a.RECPAG = ''P'' ' +
      '                              and exists (select 1 ' +
      '                                          from UsuarioxTpdocto b ' +
      '                                          where recpag = ''P'' and ' +
      '                                                a.codtipdoc = b.codtipdoc and ' +
      '                                                b.idusuario = ' + inttostr(CrmRptCM.idusuario) + ')) ' +
      '                                          group by ld.numlote) TOTLOTE ' +
      'WHERE (LOTP.CODPORTFORMA = P.CODPORTFORMA) AND ' +
      sSqlData + sSqlStatus + sSqlDataProg +
      '      totlote.totdocum = totdocum.totdocum and ' +
      '      totlote.numlote = totdocum.numlote and ' +
      '      totlote.numlote = LOTD.NUMLOTE and ' +
      '      (LOTD.NUMLOTE = LOTP.NUMLOTE) AND ' +
      '      (P.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ' +
      '      (P.RECPAG = ''P'') AND ';
    if not CmpRptCM.ParamValues[5].IsNull then
      Sql.Text := Sql.Text + ' (LOTP.NUMLOTE >= ' + CmpRptCM.ParamValues[5].AsString + ') AND ';
    if not CmpRptCM.ParamValues[6].IsNull then
      Sql.Text := Sql.Text + ' (LOTP.NUMLOTE <= ' + CmpRptCM.ParamValues[8].AsString + ') AND ';
    case CmpRptCM.ParamValues[10].AsInteger of
      0:
        begin
          sTipo := 'Lotes';
        end;
      1:
        begin
          sTipo := 'Cheques';
          Sql.Text := Sql.Text + '(P.IDTEMPLCHEQUE IS NOT NULL) AND ';
        end;
      2:
        begin
          sTipo := 'Pagamentos Eletrônicos';
          Sql.Text := Sql.Text + '(P.CODARQUIVOREMESSA IS NOT NULL) AND ';
        end;
    end;
    Sql.Text := Sql.Text + ' (P.CODPORTADOR = PC.CODPORTADOR(+)) AND ' +
      '  (LOTD.CODDOCUMENTO = D.CODDOCUMENTO) ' +
      ' GROUP BY LOTP.NUMLOTE, ' +
      '         LOTP.DATAEMISSAO, ' +
      '         LOTP.NUMCHQBORDERO, ' +
      '         P.DESCRICAO, ' +
      '         LOTP.FAVORECIDO, ' +
      '         FLAGCANCEL, ' +
      '         P.CODPORTADOR, ' +
      '         D.DATAPROGRAMADA ';
    case CmpRptCM.ParamValues[4].AsInteger of
      0:
        Sql.Text := Sql.Text + ' ORDER BY LOTP.DATAEMISSAO, P.CODPORTADOR, LOTP.NUMCHQBORDERO';
      1:
        Sql.Text := Sql.Text + ' ORDER BY LOTP.DATAEMISSAO, Lotp.NUMLOTE';
    end;
  end;

  if not CmpRptCM.ParamValues[0].IsNull then
    LblRelChequeEmiss.Caption := 'Relação dos ' + sTipo + sSituacao + ' até ' + CmpRptCM.ParamValues[0].AsString
  else
    LblRelChequeEmiss.Caption := 'Relação dos ' + sTipo + sSituacao + ' entre ' + CmpRptCM.ParamValues[0].AsString + ' e ' + CmpRptCM.ParamValues[1].AsString;

  if not CmpRptCM.ParamValues[7].IsNull then
    LblBancoEmisCheque.Caption := 'Somente ' + sTipo + ' da conta ' + CmpRptCM.ParamValues[7].AsString
  else
    LblBancoEmisCheque.Caption := '';
  Sqllotes.Open;
end;

end.


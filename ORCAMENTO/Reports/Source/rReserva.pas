{=========================================================================================
 Autor     : Marcus Oliveira
 Pendência : 20423
 Data      : 14/09/2007
 Descrição : Criado os filtros do Plano, Patro, C.Custo e ativ.proj.
=========================================================================================}

unit rReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, ppVar, ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, Wwdatsrc, uCmSqlParams, ppModule, raCodMod, TXRB, usistema,
  Menus, uCtrlTransacoesPorGrupo, uCtrlPadroes, uMensErro;

type
  TrptReserva = class(TFrmCmReport)
    sqlReserva: TCMSqlParams;
    dsReserva: TwwDataSource;
    pplReserva: TppBDEPipeline;
    rpReserva: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppDetailBand16: TppDetailBand;
    ppShape2: TppShape;
    ppLabel158: TppLabel;
    ppDBText57: TppDBText;
    ppLabel159: TppLabel;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppDBText63: TppDBText;
    ppLine41: TppLine;
    rptReservaDBMemo1: TppDBMemo;
    ppLabel246: TppLabel;
    txtSaldoAntReserva: TppLabel;
    ppLabel248: TppLabel;
    ppDBText121: TppDBText;
    ppLabel249: TppLabel;
    txtSaldoReserva: TppLabel;
    ppLine76: TppLine;
    ppLabel254: TppLabel;
    ppLine78: TppLine;
    ppLabel255: TppLabel;
    ppLine79: TppLine;
    ppLabel256: TppLabel;
    ppLabel257: TppLabel;
    txtValorOrcado: TppLabel;
    ppFooterBand17: TppFooterBand;
    ppLine42: TppLine;
    ppLabel165: TppLabel;
    ppCalc32: TppSystemVariable;
    ppCalc33: TppSystemVariable;
    sqlValorOrcado: TCMSqlParams;
    cdsValorOrcado: TCMClientDataSet;
    cdsReserva: TCMClientDataSet;
    MainMenu1: TMainMenu;
    ppLabel93: TppLabel;
    ppLabel102: TppLabel;
    ppDBImage1: TppDBImage;
    mParametros: TppMemo;
    pplCdsImagem: TppBDEPipeline;
    CdsImagem: TCMClientDataSet;
    dsImagem: TDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sqlReservaFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlValorOrcadoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
  private
    CtrlTransacoesPorGrupo : TCtrlTransacoesPorGrupo ;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptReserva: TrptReserva;

implementation

{$R *.DFM}
//************************************************


Procedure TrptReserva.CrmRptCMBeforePrint(Sender: TObject);
Var
  iAno, iMes, iDia : Word;
  sMesRef, sFiltro : String;
Begin
  Inherited;

  if CmpRptCM.ParamValues[0].AsInteger = 0 then
    raise Exception.Create( 'Número da reserva especial inválido.' );

  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);
  CdsImagem.Data := CtrlTransacoesPorGrupo.ListaImagem(Sistema.IdEmpresa);

  With sqlReserva do begin
    Prepare;
    ParamByName('IDOPERACAO').asInteger := CmpRptCM.ParamValues[0].AsInteger ;
    ParamByName('IDPESSOA').asInteger   := Trunc( CrmRptCM.IdEmpresa );

    if Trim( CmpRptCM.ParamValues[2].AsString ) <> '' then
      ParamByName('ATIVPROJ').AsString := 'AND (C.UNIDNEGOC = ' + CmpRptCM.ParamValues[2].AsString + ')'
      else
      ParamByName('ATIVPROJ').AsString := 'AND (1 = 1)';

    if Trim( CmpRptCM.ParamValues[3].AsString ) <> '' then
      ParamByName('CCUSTO').AsString := 'AND (C.CODCENTROCUSTO = ' + CmpRptCM.ParamValues[3].AsString + ')'
      else
      ParamByName('CCUSTO').AsString := 'AND (1 = 1)';

    if Trim( CmpRptCM.ParamValues[4].AsString ) <> '' then
      ParamByName('PLANO').AsString := 'AND (C.IDPLANOPREV = ' + CmpRptCM.ParamValues[4].AsString + ')'
      else
      ParamByName('PLANO').AsString := 'AND (1 = 1)';

    if Trim( CmpRptCM.ParamValues[5].AsString ) <> '' then
      ParamByName('PATRO').AsString := 'AND (C.IDPATRO = ' + CmpRptCM.ParamValues[5].AsString + ')'
      else
      ParamByName('PATRO').AsString := 'AND (1 = 1)';
  end;

  sqlReserva.Open;
  sFiltro := '';
  //Passando os filtros para o relatório
  if Trim( CmpRptCM.ParamValues[2].AsString ) <> '' then
    sFiltro := sFiltro + 'Ativ/Proj: ' + CmpRptCM.ParamValues[2].DispalyText + ' ';

  if Trim( CmpRptCM.ParamValues[3].AsString ) <> '' then
    sFiltro := sFiltro + 'C.Custo: ' + CmpRptCM.ParamValues[3].DispalyText + ' ';

  if Trim( CmpRptCM.ParamValues[4].AsString ) <> '' then
    sFiltro := sFiltro + 'Plano: ' + CmpRptCM.ParamValues[4].DispalyText + ' ';

  if Trim( CmpRptCM.ParamValues[5].AsString ) <> '' then
    sFiltro := sFiltro + 'Patro: ' + CmpRptCM.ParamValues[5].DispalyText + ' ';

  DecodeDate(cdsReserva.FieldByName('DATAREFERENCIA').asDateTime,iAno,iMes, iDia);
  If iMes < 10 Then
    sMesRef := IntToStr(iAno)+'0'+IntToStr(iMes)
  Else
    sMesRef := IntToStr(iAno)+IntToStr(iMes);

  sqlValorOrcado.Prepare;
  sqlValorOrcado.ParamByName('IDPLANOORCAMEN').asInteger := cdsReserva.FieldByName('IDPLANOORCAMEN').asInteger;
  sqlValorOrcado.ParamByName('IDCONTAORCAMEN').asString  := cdsReserva.FieldByName('IDCONTAORCAMEN').asString;
  sqlValorOrcado.ParamByName('ANOMESREF').asString       := sMesRef;
  sqlValorOrcado.ParamByName('IDPESSOA').asInteger       := Trunc( CrmRptCM.IdEmpresa );

  with sqlValorOrcado do begin

    if Trim( CmpRptCM.ParamValues[2].AsString ) <> '' then
      ParamByName('ATIVPROJ').AsString := 'AND (C.UNIDNEGOC = ' + CmpRptCM.ParamValues[2].AsString + ')'
      else
      ParamByName('ATIVPROJ').AsString := 'AND (1 = 1)';

    if Trim( CmpRptCM.ParamValues[3].AsString ) <> '' then
      ParamByName('CCUSTO').AsString := 'AND (C.CODCENTROCUSTO = ' + CmpRptCM.ParamValues[3].AsString + ')'
      else
      ParamByName('CCUSTO').AsString := 'AND (1 = 1)';

    if Trim( CmpRptCM.ParamValues[4].AsString ) <> '' then
      ParamByName('PLANO').AsString := 'AND (C.IDPLANOPREV = ' + CmpRptCM.ParamValues[4].AsString + ')'
      else
      ParamByName('PLANO').AsString := 'AND (1 = 1)';

    if Trim( CmpRptCM.ParamValues[5].AsString ) <> '' then
      ParamByName('PATRO').AsString := 'AND (C.IDPATRO = ' + CmpRptCM.ParamValues[5].AsString + ')'
      else
      ParamByName('PATRO').AsString := 'AND (1 = 1)';
  end;



  sqlValorOrcado.Open;

  txtValorOrcado.caption     := FormatFloat( '###,###,###,###,##0.00',
                                             cdsValorOrcado.FieldByName('VLRORCADO').asFloat);
  txtSaldoReserva.caption    := FormatFloat( '###,###,###,###,##0.00',
                                             CmpRptCM.ParamValues[1].AsFloat );
  txtSaldoAntReserva.caption := FormatFloat( '###,###,###,###,##0.00',
                                             CmpRptCM.ParamValues[1].AsFloat + cdsReserva.FieldByName('VLRRESERVA').AsFloat);

  //Passa os filtros do relatório.
  mParametros.Lines.Add(sFiltro);
End;

procedure TrptReserva.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria SQL Parametro Atividade/Projeto
  with CmpRptCM.ParamValues[2].LookupSettings.SQL do begin
    Clear;
    Add('SELECT UNIDNEGOC, NOME');
    Add('FROM UNIDNEGOCIO');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') ');
    Add('ORDER BY NOME');
  end;

  // Cria SQL Parametro Centro de Custo
  with CmpRptCM.ParamValues[3].LookupSettings.SQL do begin
    Clear;
    Add('SELECT CODCENTROCUSTO, NOME');
    Add('FROM CENTCUST');
    Add('WHERE (IDEMPRESA = ' + IntToStr(sistema.idEmpresa) + ') ');
    Add('AND (ATIVO = ''S'') ');
    Add('ORDER BY NOME');
  end;

  // Cria SQL Parametro Plano
  with CmpRptCM.ParamValues[4].LookupSettings.SQL do begin
    Clear;
    Add('SELECT NOME, IDPLANOPREV   ' );
    Add('FROM PLANPREVCONTABIL      ' );
    Add('WHERE ATIVO = ''S''        ' );
    Add('ORDER BY NOME              ' );
  end;

  // Cria SQL Parametro Patro
  with CmpRptCM.ParamValues[5].LookupSettings.SQL do begin
    Clear;
    Add('SELECT PT.IDPESSOA, P.NOME     ' );
    Add('FROM PATRO PT, PESSOA P        ' );
    Add('WHERE PT.IDPESSOA = P.IDPESSOA ' );
    Add('ORDER BY P.NOME                ' );
  end;

end;

procedure TrptReserva.sqlReservaFormartParam(sParamName, sOldValue: String;
  var sNewValue: String);
begin
  inherited;

  if (sParamName = 'ATIVPROJ') or (sParamName = 'PATRO') or
     (sParamName = 'PLANO') or (sParamName = 'CCUSTO') then

  sNewValue := sOldValue;

end;

procedure TrptReserva.sqlValorOrcadoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'ATIVPROJ') or (sParamName = 'PATRO') or
     (sParamName = 'PLANO') or (sParamName = 'CCUSTO') then

  sNewValue := sOldValue;

end;

End.

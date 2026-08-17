unit fIntegraLancDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  Db, DBTables, Wwquery, uFuncoesImob;

type
  TfrmIntegraLancDiario = class(TfrmOkCancelar)
    Label5: TLabel;
    cboMes: TwwDBComboBox;
    DBspnAno: TwwDBSpinEdit;
    qryLancPrevImob: TwwQuery;
    qryLancPrevDiaImob: TwwQuery;
    qryLancPrevImobIDLANCPREVIMOB: TFloatField;
    qryLancPrevImobIDTIPOCUSTORECIMO: TFloatField;
    qryLancPrevImobVLRMES: TStringField;
    qryLancPrevImobFLGAJUSTEANUAL: TStringField;
    qryLancPrevDiaImobIDLANCPREVDIAIMOB: TFloatField;
    qryLancPrevDiaImobPLNCODIGO: TFloatField;
    qryLancPrevDiaImobDATALANCTO: TDateTimeField;
    qryLancPrevDiaImobVLRDIA: TFloatField;
    qryLancPrevImobCODTIPIMOVEL: TStringField;
    qryLancPrevImobDESCCUSTORECIMO: TStringField;
    qryPlanoPatro: TwwQuery;
    qryLancPrevImobRECCUSTO: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IntegraLancDiario;
    procedure ZeraParamContabeis(var vParamContabeis: TParamContabeis);
    function DefineHistorico: TParamContabeis;
    function BuscaParametrizacao(var ParamContabeis: TParamContabeis): integer;
  end;

var
  frmIntegraLancDiario: TfrmIntegraLancDiario;

implementation

uses
  uModuloImobiliario, uDiasUteis, FProgresso, uLancContab, uFuncaoGeral, uModulo,
  uSistema;

{$R *.DFM}

function TfrmIntegraLancDiario.BuscaParametrizacao(var ParamContabeis: TParamContabeis): integer;
var
  iCodErro: integer;
  sRecPag : string;
begin
  if qryLancPrevImobRECCUSTO.AsString = 'C' then
  else sRecPag := 'P';

  iCodErro := FuncoesImob.BuscaPadrLanc(sRecPag,
                            qryLancPrevImobCODTIPIMOVEL.AsString,
                            Sistema.IdEmpresa,
                            Sistema.IdModulo,
                            qryLancPrevImobIDTIPOCUSTORECIMO.AsInteger,
                            -1, -1, ParamContabeis, true);

  if iCodErro = -4 then Result := -7
  else if iCodErro = -5 then Result := -8
  else Result := 0;
end;

function TfrmIntegraLancDiario.DefineHistorico: TParamContabeis;
var
  ParamContabeis: TParamContabeis;
begin
  ZeraParamContabeis (ParamContabeis);

  // histórico determinado pela adriana (funcef)
  ParamContabeis.sHistorico := qryLancPrevImobCODTIPIMOVEL.AsString + ' - '+
                               qryLancPrevImobDESCCUSTORECIMO.AsString+ ' - '+
                               Modulo.sPlanoPrevGlobal + '/' + Modulo.sPatroGlobal;

  // Divide o histórico em sub-históricos se exceder a quantidade de caracteres
  FuncaoGeral.ArrumaHistorico(ParamContabeis.sHistorico, ParamContabeis.sHist1, ParamContabeis.sHist2, ParamContabeis.sHist3, ParamContabeis.sHist4, ParamContabeis.sHist5);

  Result := ParamContabeis;
end;

procedure TfrmIntegraLancDiario.FormCreate(Sender: TObject);
var
   dDiaAux: TDate;
   vDia, vMes, vAno: word;
begin
  inherited;
  dDiaAux := EncodeDate (ModuloImobiliario.AdminImob.iAnoCompetencia,
                         ModuloImobiliario.AdminImob.iMesCompetencia, 1);
  dDiaAux := DiasUteis.SomaMeses (dDiaAux, 1);

  DecodeDate (dDiaAux, vAno, vMes, vDia);
  cboMes.ItemIndex := vMes - 1;
  DBspnAno.Value   := vAno;
end;

procedure TfrmIntegraLancDiario.IntegraLancDiario;
var
  iMes, iAno, iNumDias, iQuant, iAtual: integer;
  ParamContabeis: TParamContabeis;
begin
  iMes := cboMes.ItemIndex + 1;
  iAno := word(trunc(DBspnAno.Value));
  iNumDias := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAno, iMes));

  LimpaParametros(qryLancPrevImob);
  qryLancPrevImob.ParamByName('PMESCOMPETENCIA').AsInteger := iMes;
  qryLancPrevImob.ParamByName('PANOCOMPETENCIA').AsInteger := iAno;
  qryLancPrevImob.Open;

  iQuant := qryLancPrevImob.RecordCount * iNumDias;
  iAtual := 1;
  MostraFormProgresso('Calculando...', 1, iQuant, true, true);
  Application.ProcessMessages;
  while not qryLancPrevImob.Eof do begin
    DefineHistorico;
    BuscaParametrizacao (ParamContabeis);

    LimpaParametros(qryLancPrevDiaImob);
    qryLancPrevDiaImob.ParamByName('PIDLANCPREVIMOB').AsInteger := qryLancPrevImobIDLANCPREVIMOB.AsInteger;
    qryLancPrevDiaImob.Open;
    while not qryLancPrevDiaImob.Eof do begin
      Application.ProcessMessages;
      if frmProgresso.Cancelou then raise exception.Create('Processo abortado!');


      Inc(iAtual);
      AndaFormProgresso(iAtual);
      qryLancPrevDiaImob.Next;
    end;

    qryLancPrevImob.next;
  end;



end;

procedure TfrmIntegraLancDiario.ZeraParamContabeis(var vParamContabeis: TParamContabeis);
begin
  with vParamContabeis do begin
    sContaContabilDebito    := '';
    sSubContaDebito         := '';
    sCentroCustoDebito      := '';
    sContaContabilCredito   := '';
    sSubContaCredito        := '';
    sCentroCustoCredito     := '';
    sHistorico              := '';
    sHist1                  := '';
    sHist2                  := '';
    sHist3                  := '';
    sHist4                  := '';
    sHist5                  := '';
    iPlanilha               := 0;
    iExercicio              := 0;
    iPeriodo                := 0;
    iIdRateioDocum          := 0;
    iCodDocumento           := 0;

    sContaDebCred           := '';
    sContaResult            := '';
    sCentroCustoDebCred     := '';
    sCentroCustoResult      := '';
    iUnidNegoc              := 0;
    sSubContaDebCred        := '';
    sSubContaResult         := '';
    sCodTipRecDes           := '';
    iFlgIntegraCapCar       := 0;
    iFlgIntegraContab       := 0;
    sCodCentroRespon        := '';
    sTipCodigo              := '';
  end;
end;

end.

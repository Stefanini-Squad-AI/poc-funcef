unit FRegDuplicado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook;

type
  TfrmRegDuplicado = class(TfrmSairAjuda)
    pnlDadosFiltro: TPanel;
    btnFiltra: TBitBtn;
    gbFaixaValor: TGroupBox;
    lblSaldo: TLabel;
    Label1: TLabel;
    ednValorFim: TRealEdit;
    ednValorIni: TRealEdit;
    gbBanco: TGroupBox;
    lblContaBanco: TLabel;
    dblcPortador: TwwDBLookupCombo;
    Panel2: TPanel;
    pnlContaDe: TPanel;
    Label2: TLabel;
    dbgContaDe: TwwDBGrid;
    pnlContaPara: TPanel;
    Label3: TLabel;
    dbgContaPara: TwwDBGrid;
    qryLancNaoIdent: TwwQuery;
    qryLancIdent: TwwQuery;
    bbtnRegulariza: TBitBtn;
    Panel1: TPanel;
    gbTotais: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    reIdent: TRealEdit;
    reNaoIdent: TRealEdit;
    dsLancNaoIdent: TwwDataSource;
    dsLancIdent: TwwDataSource;
    qryLancIdentCODLANCFINANC: TFloatField;
    qryLancIdentPLNCODIGO: TFloatField;
    qryLancIdentIDMODULO: TFloatField;
    qryLancIdentHISTPADFINAN: TFloatField;
    qryLancIdentMOECODIGO: TFloatField;
    qryLancIdentIDUSUARIOINCLUSAO: TFloatField;
    qryLancIdentCODPORTADOR: TFloatField;
    qryLancIdentVALORLANCFINAN: TFloatField;
    qryLancIdentNUMCHQBORDERO: TStringField;
    qryLancIdentDATALANCFINAN: TDateTimeField;
    qryLancIdentDATACONCILIACAO: TDateTimeField;
    qryLancIdentENTRADASAIDA: TStringField;
    qryLancIdentHISTORICO: TStringField;
    qryLancIdentSTATUSCONCILIA: TStringField;
    qryLancIdentVALOROUTRAMOEDA: TFloatField;
    qryLancIdentIDPESSOA: TFloatField;
    qryLancIdentCODLANCTRANSF: TFloatField;
    qryLancNaoIdentCODLANCFINANC: TFloatField;
    qryLancNaoIdentPLNCODIGO: TFloatField;
    qryLancNaoIdentIDMODULO: TFloatField;
    qryLancNaoIdentHISTPADFINAN: TFloatField;
    qryLancNaoIdentMOECODIGO: TFloatField;
    qryLancNaoIdentIDUSUARIOINCLUSAO: TFloatField;
    qryLancNaoIdentCODPORTADOR: TFloatField;
    qryLancNaoIdentVALORLANCFINAN: TFloatField;
    qryLancNaoIdentNUMCHQBORDERO: TStringField;
    qryLancNaoIdentDATALANCFINAN: TDateTimeField;
    qryLancNaoIdentDATACONCILIACAO: TDateTimeField;
    qryLancNaoIdentENTRADASAIDA: TStringField;
    qryLancNaoIdentHISTORICO: TStringField;
    qryLancNaoIdentSTATUSCONCILIA: TStringField;
    qryLancNaoIdentVALOROUTRAMOEDA: TFloatField;
    qryLancNaoIdentIDPESSOA: TFloatField;
    qryLancNaoIdentCODLANCTRANSF: TFloatField;
    updLancNaoIdent: TUpdateSQL;
    updLancIdent: TUpdateSQL;
    qryPortador: TwwQuery;
    gbData: TGroupBox;
    edDataReg: TCMDateTimePicker;
    qryLancNaoIdentDATADISPFINANC: TDateTimeField;
    qryLancIdentDATADISPFINANC: TDateTimeField;
    procedure FormActivate(Sender: TObject);
    procedure btnFiltraClick(Sender: TObject);
    procedure LimpaVariaveis;
    procedure LimpaFiltro;
    procedure qryLancNaoIdentSTATUSCONCILIAChange(Sender: TField);
    procedure qryLancIdentSTATUSCONCILIAChange(Sender: TField);
    procedure bbtnRegularizaClick(Sender: TObject);
  private
    { Private declarations }
    rNaoIdent,rIdent:Real;
  public
    { Public declarations }
  end;

var
  frmRegDuplicado: TfrmRegDuplicado;
implementation

uses uMensErro,uDataBase, DBaseDados,UAutorizacao,uSistema,UFuncaoGeral,ULancFinanc;

{$R *.DFM}

procedure TfrmRegDuplicado.FormActivate(Sender: TObject);
begin
  inherited;
  //
  qryPortador.Close;
  qryPortador.SQL.Clear;
  qryPortador.SQL.text := 'SELECT CODPORTADOR, MOECODIGO, DESCRICAO FROM PORTADORCONTA '+
                          'WHERE IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+' ORDER BY DESCRICAO';
  qryPortador.Open;
  //
  LimpaFiltro;
end;

procedure TfrmRegDuplicado.btnFiltraClick(Sender: TObject);
var sSql:String;
begin
  inherited;
  if trim(dblcPortador.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Conta do Banco/Caixa','Erro',mtError,[mbOk],0);
    dblcPortador.SetFocus;
    exit;
  end;
  //
  LimpaVariaveis;
  qryLancIdent.CancelUpdates;
  qryLancNaoIdent.CancelUpdates;
  //
  sSql:='';
  sSql:=sSql+'SELECT * FROM MOVIMFINANC WHERE CODPORTADOR = '+qryPortador.FieldByName('CODPORTADOR').AsString;
  sSql:=sSql+' AND IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+' AND STATUSCONCILIA = ''I''';
  if ednValorIni.Value > 0 then
     sSql:=sSql+' AND VALORLANCFINAN >= '+FloatToStr(ednValorIni.Value);
  if ednValorFim.Value > 0 then
     sSql:=sSql+' AND VALORLANCFINAN <= '+FloatToStr(ednValorFim.Value);
  sSql:=sSql+' ORDER BY DATALANCFINAN, NUMCHQBORDERO';
  qryLancNaoIdent.Close;
  qryLancNaoIdent.SQL.Clear;
  qryLancNaoIdent.SQL.text :=sSql;
  qryLancNaoIdent.Open;
  //
  sSql:='';
  sSql:=sSql+'SELECT * FROM MOVIMFINANC WHERE CODPORTADOR = '+qryPortador.FieldByName('CODPORTADOR').AsString;
  sSql:=sSql+' AND IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+' AND STATUSCONCILIA = ''N''';
  if ednValorIni.Value > 0 then
     sSql:=sSql+' AND VALORLANCFINAN >= '+FloatToStr(ednValorIni.Value);
  if ednValorFim.Value > 0 then
     sSql:=sSql+' AND VALORLANCFINAN <= '+FloatToStr(ednValorFim.Value);
  sSql:=sSql+' ORDER BY DATALANCFINAN, NUMCHQBORDERO';
  qryLancIdent.Close;
  qryLancIdent.SQL.Clear;
  qryLancIdent.SQL.text := sSql;
  qryLancIdent.Open;
  //
end;

procedure TfrmRegDuplicado.LimpaVariaveis;
begin
  //
  reIdent.Value:=0;
  reNaoIdent.Value:=0;
  rNaoIdent:=0;
  //rIdent:=0;
  //
end;

procedure TfrmRegDuplicado.LimpaFiltro;
begin
  //
  dblcPortador.Text:='';
  //
  LimpaVariaveis;
  ednValorIni.Value:=0;
  ednValorFim.Value:=0;
  //
  qryLancNaoIdent.Close;
  qryLancNaoIdent.SQL.Clear;
  qryLancNaoIdent.SQL.text := 'SELECT * FROM MOVIMFINANC WHERE CODLANCFINANC =  0 ';
  qryLancNaoIdent.Open;
  //
  qryLancIdent.Close;
  qryLancIdent.SQL.Clear;
  qryLancIdent.SQL.text := 'SELECT * FROM MOVIMFINANC WHERE CODLANCFINANC =  0 ';
  qryLancIdent.Open;
  //
  dblcPortador.SetFocus;
end;

procedure TfrmRegDuplicado.qryLancNaoIdentSTATUSCONCILIAChange(
  Sender: TField);
begin
  inherited;
  if qryLancNaoIdent.FieldByName('STATUSCONCILIA').AsString = 'J' then
   begin
      if qryLancNaoIdent.FieldByName('ENTRADASAIDA').AsString = 'E' then
         rNaoIdent:=rNaoIdent+qryLancNaoIdent.FieldByName('VALORLANCFINAN').AsFloat
      else
         rNaoIdent:=rNaoIdent-qryLancNaoIdent.FieldByName('VALORLANCFINAN').AsFloat;
   end
  else
   if qryLancNaoIdent.FieldByName('ENTRADASAIDA').AsString = 'E' then
      rNaoIdent:=rNaoIdent-qryLancNaoIdent.FieldByName('VALORLANCFINAN').AsFloat
   else
      rNaoIdent:=rNaoIdent+qryLancNaoIdent.FieldByName('VALORLANCFINAN').AsFloat;

  reNaoIdent.Value:=rNaoIdent;
end;

procedure TfrmRegDuplicado.qryLancIdentSTATUSCONCILIAChange(
  Sender: TField);
begin
  inherited;
  if qryLancIdent.FieldByName('STATUSCONCILIA').AsString = 'X' then
   begin
      if qryLancIdent.FieldByName('ENTRADASAIDA').AsString = 'E' then
         rIdent:=rIdent+qryLancIdent.FieldByName('VALORLANCFINAN').AsFloat
      else
         rIdent:=rIdent-qryLancIdent.FieldByName('VALORLANCFINAN').AsFloat;
   end
  else
   if qryLancIdent.FieldByName('ENTRADASAIDA').AsString = 'E' then
      rIdent:=rIdent-qryLancIdent.FieldByName('VALORLANCFINAN').AsFloat
   else
      rIdent:=rIdent+qryLancIdent.FieldByName('VALORLANCFINAN').AsFloat;
      
  reIdent.Value:=rIdent;
end;

procedure TfrmRegDuplicado.bbtnRegularizaClick(Sender: TObject);
var
   iCodLancFinanc   : LongInt;
   sDataConcilia    : String;
begin
  inherited;
  if (reNaoIdent.Value = 0) then
   begin
      MsgDlg('Obrigatório marcar algum lançamento não identificado marcado para ser regularizado','Erro',mtError,[mbOk],0);
      dbgContaDe.SetFocus;
      exit;
   end;

  if (reIdent.Value = 0) then
   begin
      if MsgDlg('Não existe nenhum lançamento não conciliado marcado. Confirma ?','Confirmação',mtConfirmation,[mbOk,mbCancel],0) = mrCancel then
       begin
          dbgContaDe.SetFocus;
          exit;
       end;
   end;

  if Format('%17.2f',[reIdent.Value]) <> Format('%17.2f',[reNaoIdent.Value]) then
   begin
      MsgDlg('Total dos não identificados não bate com o total dos não conciliados','Erro',mtError,[mbOk],0);
      dbgContaDe.SetFocus;
      exit;
   end;

  if trim(edDataReg.Text) = '' then
   begin
      MsgDlg('Obrigatório preencher a Data de Regularização','Erro',mtError,[mbOk],0);
      edDataReg.SetFocus;
      exit;
   end;

  //
  //Grava Arquivos
  //

  Try
     StartTransacao;
     qryLancNaoIdent.First;

     while not qryLancNaoIdent.EOF do
     begin
        if qryLancNaoIdent.FieldByName('STATUSCONCILIA').AsString = 'J' then
         begin
            //Inclui Relacionados
            LancFinanc.IncluiRelacionado(Self,qryLancNaoIdentCODLANCFINANC.AsFloat,
                                              qryLancNaoIdentDATADISPFINANC.AsDateTime,'I');

            sDataConcilia :=qryLancNaoIdent.FieldByName('DATACONCILIACAO').AsString;
            iCodLancFinanc:=qryLancNaoIdent.FieldByName('CODLANCFINANC').AsInteger;
            LancFinanc.MudaStatusConcilia('J',edDataReg.Text,iCodLancFinanc);
            LancFinanc.EstornoFinanceiro(edDataReg.Text,'N',iCodLancFinanc,
                                         qryLancNaoIdentDATADISPFINANC.AsDateTime);
            if iCodLancFinanc = -1 then abort;
         end;
        qryLancNaoIdent.Next;
     end;

     qryLancIdent.DisableControls;
     qryLancIdent.First;
     while not qryLancIdent.EOF do
     begin
        if qryLancIdent.FieldByName('STATUSCONCILIA').AsString = 'X' then
         begin
            //Inclui Relacionados
            LancFinanc.IncluiRelacionado(Self,qryLancIdentCODLANCFINANC.AsFloat,
                                              qryLancIdentDATADISPFINANC.AsDateTime,'N');

            iCodLancFinanc:=qryLancIdent.FieldByName('CODLANCFINANC').AsInteger;
            LancFinanc.MudaStatusConcilia('X',sDataConcilia,iCodLancFinanc);
         end;
        qryLancIdent.Next;
     end;
     qryLancIdent.EnableControls;

     //Grava Relacionados
     LancFinanc.GravaRelacNI(Self);

     CommitTransacao;
     MsgDlg('Regularização Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
     FuncaoGeral.TiraIcone;
     LimpaFiltro;
  except
     MsgDlg('Regularização Não Efetuada','Erro',mtError,[mbOk],0);
     FuncaoGeral.TiraIcone;
     RollBackTransacao;
     raise;
  end;
  //
  qryLancIdent.CancelUpdates;
  qryLancNaoIdent.CancelUpdates;
  LimpaFiltro;
  rIdent:=0;
  rNaoIdent:=0;
//
end;

end.

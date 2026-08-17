unit FConcilia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, TEdNum,
  Wwdatsrc, TREdit, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Provider, DBClient;

type
  TfrmConcilia = class(TfrmOkCancelar)
    pnlDadosFiltro: TPanel;
    dbgExtrato: TwwDBGrid;
    qryPortador: TwwQuery;
    btnFiltra: TBitBtn;
    qryExtrato: TwwQuery;
    dsExtrato: TwwDataSource;
    updExtrato: TUpdateSQL;
    plnSaldos: TPanel;
    gbCorrente: TGroupBox;
    lblSaldoConciliadoAn: TLabel;
    edSaldoConciliadoAnt: TEditNum;
    lblSaldoConciliadoAt: TLabel;
    edSaldoConciliadoAtu: TEditNum;
    gbOutraMoeda: TGroupBox;
    lblSaldoConciliaOMAt: TLabel;
    edSaldoConciliaOMAtu: TEditNum;
    lblSaldoConciliaOMAn: TLabel;
    edSaldoConciliaOMAnt: TEditNum;
    gbSaldoExtrato: TGroupBox;
    lblSaldo: TLabel;
    Label1: TLabel;
    ednSaldoOMoeda: TRealEdit;
    ednSaldoCorrente: TRealEdit;
    gbData: TGroupBox;
    edDataExtrato: TCMDateTimePicker;
    gbBanco: TGroupBox;
    dblcPortador: TwwDBLookupCombo;
    lblDataExtrato: TLabel;
    lblContaBanco: TLabel;
    Label2: TLabel;
    edSaldoConciliadoAnterior: TEditNum;
    cdsExtrato: TClientDataSet;
    dspExtrato: TDataSetProvider;
    cdsExtratoSTATUSCONCILIA: TStringField;
    cdsExtratoDATALANCFINAN: TDateTimeField;
    cdsExtratoNUMCHQBORDERO: TStringField;
    cdsExtratoENTRADASAIDA: TStringField;
    cdsExtratoVALORLANCFINAN: TFloatField;
    cdsExtratoVALOROUTRAMOEDA: TFloatField;
    cdsExtratoHISTORICO: TStringField;
    cdsExtratoCODLANCFINANC: TFloatField;
    cdsExtratoPLNCODIGO: TFloatField;
    cdsExtratoIDMODULO: TFloatField;
    cdsExtratoHISTPADFINAN: TFloatField;
    cdsExtratoMOECODIGO: TFloatField;
    cdsExtratoIDUSUARIOINCLUSAO: TFloatField;
    cdsExtratoCODPORTADOR: TFloatField;
    cdsExtratoDATACONCILIACAO: TDateTimeField;
    cdsExtratoIDPESSOA: TFloatField;
    procedure btnFiltraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcPortadorExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure LimpaFiltro;
    procedure dbgExtratoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure cdsExtratoSTATUSCONCILIAChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    rSaldoCorrente,rSaldoOutraMoeda    : Real;
    rSaldoAnterior,rSaldoAnteriorOutra : Real;
    sUltimoIndice : String;
  public
    { Public declarations }
  end;

var
  frmConcilia: TfrmConcilia;

implementation

uses uMensErro,uDataBase, DBaseDados,UAutorizacao,uSistema,ULancFinanc,UFuncaoGeral;

{$R *.DFM}

procedure TfrmConcilia.FormCreate(Sender: TObject);
begin
   inherited;
   sUltimoIndice:='';
end;

procedure TfrmConcilia.btnFiltraClick(Sender: TObject);
begin
  inherited;
  if trim(dblcPortador.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Conta do Banco/Caixa que se Deseja Conciliar','Erro',mtError,[mbOk],0);
    dblcPortador.SetFocus;
    exit;
  end;
  if trim(edDataExtrato.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Data do Extrato que se Deseja Conciliar','Erro',mtError,[mbOk],0);
    dblcPortador.SetFocus;
    exit;
  end;
  //
  cdsExtrato.Close;
  qryExtrato.SQL.Clear;
  qryExtrato.SQL.text := 'SELECT * FROM MOVIMFINANC WHERE CODPORTADOR = '+qryPortador.FieldByName('CODPORTADOR').AsString+' AND IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+' AND (STATUSCONCILIA = ''N'' OR STATUSCONCILIA = ''P'') ORDER BY DATALANCFINAN, NUMCHQBORDERO';
  cdsExtrato.Open;

  // Calcula saldo só com os que bateram
  rSaldoCorrente:=0;
  rSaldoOutraMoeda:=0;
  LancFinanc.CalculaSaldoFinanc(qryPortador.FieldByName('CODPORTADOR').AsInteger,edDataExtrato.Text,
                                'X'',''I','L',rSaldoCorrente,rSaldoOutraMoeda);
  //
  edSaldoConciliadoAnt.Text:=FormatFloat('#,##0.00',rSaldoCorrente);
  edSaldoConciliaOMAnt.Text:=FormatFloat('#,##0.00',rSaldoOutraMoeda);
  // Calcula saldo só com os que bateram e os provisórios
  rSaldoCorrente:=0;
  rSaldoOutraMoeda:=0;
  LancFinanc.CalculaSaldoFinanc(qryPortador.FieldByName('CODPORTADOR').AsInteger,
                                edDataExtrato.Text,
                                'X'',''P'',''I','L',rSaldoCorrente,rSaldoOutraMoeda);
  //
  edSaldoConciliadoAtu.Text:=FormatFloat('#,##0.00',rSaldoCorrente);
  edSaldoConciliaOMAtu.Text:=FormatFloat('#,##0.00',rSaldoOutraMoeda);

  rSaldoAnterior:=0;
  rSaldoAnteriorOutra:=0;
  LancFinanc.CalculaSaldoFinanc(qryPortador.FieldByName('CODPORTADOR').AsInteger,
                                DateToStr(StrToDate(edDataExtrato.Text)-1),
                                'X'',''P'',''I','L',rSaldoAnterior,rSaldoAnteriorOutra);

  edSaldoConciliadoAnterior.Text:=FormatFloat('#,##0.00',rSaldoAnterior);
end;

procedure TfrmConcilia.FormActivate(Sender: TObject);
begin
  inherited;
  //
  qryPortador.Close;
  qryPortador.SQL.Clear;
  qryPortador.SQL.text := 'SELECT CODPORTADOR, MOECODIGO, DESCRICAO FROM PORTADORCONTA WHERE IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+' ORDER BY DESCRICAO';
  qryPortador.Open;
  //
  LimpaFiltro;
end;

procedure TfrmConcilia.dblcPortadorExit(Sender: TObject);
begin
  inherited;
  gbSaldoExtrato.Enabled := True;
  if qryPortador.FieldByName('MOECODIGO').AsInteger <> 0 then
  Begin
     ednSaldoCorrente.Enabled := False;
     ednSaldoOMoeda.Enabled   := True;
  end
  else
  Begin
     ednSaldoCorrente.Enabled := True;
     ednSaldoOMoeda.Enabled   := False;
  end;
end;

procedure TfrmConcilia.cdsExtratoSTATUSCONCILIAChange(Sender: TField);
begin
  inherited;
  if cdsExtrato.FieldByName('STATUSCONCILIA').AsString = 'P' then
   begin
      if cdsExtrato.FieldByName('ENTRADASAIDA').AsString = 'E' then
       begin
          rSaldoCorrente   := rSaldoCorrente   + cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
          rSaldoOutraMoeda := rSaldoOutraMoeda + cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
       end
      else
       begin
          rSaldoCorrente   := rSaldoCorrente   - cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
          rSaldoOutraMoeda := rSaldoOutraMoeda - cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
       end;
   end
  else
   begin
      if cdsExtrato.FieldByName('ENTRADASAIDA').AsString = 'E' then
       begin
          rSaldoCorrente   := rSaldoCorrente   - cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
          rSaldoOutraMoeda := rSaldoOutraMoeda - cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
       end
      else
       begin
          rSaldoCorrente   := rSaldoCorrente   + cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
          rSaldoOutraMoeda := rSaldoOutraMoeda + cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
       end;
   end;

  edSaldoConciliadoAtu.Text:=FormatFloat('#,##0.00',rSaldoCorrente);
  edSaldoConciliaOMAtu.Text:=FormatFloat('#,##0.00',rSaldoOutraMoeda);
  edSaldoConciliadoAnterior.Text:=FormatFloat('#,##0.00',rSaldoAnterior);
end;

procedure TfrmConcilia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cdsExtrato.ApplyUpdates(0);
  if qryPortador.FieldByName('MOECODIGO').AsInteger <> 0 then
  Begin
     if Format('%17.2f',[rSaldoOutraMoeda]) <> Format('%17.2f',[ednSaldoOMoeda.Value]) then
     begin
       MsgDlg('Saldo Conciliado não bate com o Saldo do Extrato.Verifique','Erro',mtError,[mbOk],0);
       FuncaoGeral.TiraIcone;
       ednSaldoOMoeda.SetFocus;
       exit;
     end;
  end
  else
  Begin
     if Format('%17.2f',[rSaldoCorrente]) <> Format('%17.2f',[ednSaldoCorrente.Value]) then
     begin
       MsgDlg('Saldo Conciliado não bate com o Saldo do Extrato.Verifique','Erro',mtError,[mbOk],0);
       FuncaoGeral.TiraIcone;
       ednSaldoCorrente.SetFocus;
       exit;
     end;
  end;
  try
     StartTransacao;
     LancFinanc.ConciliaConta(qryPortador.FieldByName('CODPORTADOR').AsInteger,edDataExtrato.Text);
     CommitTransacao;
     MsgDlg('Conciliação Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
     FuncaoGeral.TiraIcone;
     LimpaFiltro;
  except
     MsgDlg('Conciliação Não Efetuada','Erro',mtError,[mbOk],0);
     FuncaoGeral.TiraIcone;
     RollBackTransacao;
     raise;
  end;
end;

procedure TfrmConcilia.LimpaFiltro;
begin
  //
  dblcPortador.Text:='';
  edDataExtrato.Text:=DateToStr(Date);
  ednSaldoCorrente.Value:=0;
  ednSaldoOMoeda.Value:=0;
  edSaldoConciliadoAnt.Text:='';
  edSaldoConciliadoAtu.Text:='';
  edSaldoConciliadoAnterior.Text:='';
  edSaldoConciliaOMAnt.Text:='';
  edSaldoConciliaOMAtu.Text:='';
  rSaldoCorrente:=0;
  rSaldoOutraMoeda:=0;
  //
  cdsExtrato.Close;
  qryExtrato.SQL.Clear;
  qryExtrato.SQL.text := 'SELECT * FROM MOVIMFINANC WHERE CODLANCFINANC = 0 ';
  cdsExtrato.Open;
  //
  gbSaldoExtrato.Enabled := False;
  dblcPortador.SetFocus;
end;

procedure TfrmConcilia.dbgExtratoTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
   sListaIndices : TStringList;
begin
  inherited;

  if not(cdsExtrato.Active) or (cdsExtrato.IsEmpty) then Exit;

  cdsExtrato.IndexName:='';
  
  sListaIndices:=TStringList.Create;
  try
     cdsExtrato.GetIndexNames(sListaIndices);
     if (sListaIndices.IndexOf('Ind'+AFieldName)=-1) then
      begin
         cdsExtrato.AddIndex('Ind'+AFieldName,AFieldName+';NUMCHQBORDERO',[]);
         cdsExtrato.IndexName:='Ind'+AFieldName;
         cdsExtrato.AddIndex('IndDesc'+AFieldName,AFieldName+';NUMCHQBORDERO',[ixDescending]);
         cdsExtrato.IndexName:='Ind'+AFieldName;
         sUltimoIndice:='Ind'+AFieldName;
      end
     else
      if sUltimoIndice=('Ind'+AFieldName) then
         sUltimoIndice:=('IndDesc'+AFieldName)
      else
         sUltimoIndice:=('Ind'+AFieldName)
  finally
     sListaIndices.Free;
  end;

  cdsExtrato.IndexName:=sUltimoIndice;

end;

end.

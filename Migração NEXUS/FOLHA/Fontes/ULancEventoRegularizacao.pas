unit ULancEventoRegularizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, DBCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, dBaseDados;

type
  TfrmLancEventoRegularizacao = class(TfrmOkCancelar)
    lbEventoRegularizacao: TLabel;
    edtTipoRegularizacao: TEdit;
    lbDataRegularizacao: TLabel;
    lbTipoRegularizacao: TLabel;
    lbSelArquivoRegularizacao: TLabel;
    edtSelArquivoRegularizacao: TEdit;
    grpDadosBancarios: TGroupBox;
    lbBanco: TLabel;
    lbAgencia: TLabel;
    edtConta: TEdit;
    Label4: TLabel;
    lbObservacao: TLabel;
    mmObservacao: TMemo;
    btnSelecionarArquivo: TBitBtn;
    opDlgSelecionarArquivo: TOpenDialog;
    qryBanco: TwwQuery;
    dsBanco: TwwDataSource;
    dblcBanco: TwwDBLookupCombo;
    dblcAgencia: TwwDBLookupCombo;
    qryAgencia: TwwQuery;
    dsAgencia: TwwDataSource;
    QryEvento: TwwQuery;
    DSEvento: TwwDataSource;
    qryAux: TwwQuery;
    dblEvento: TwwDBLookupCombo;
    dbeDataReg: TCMDateTimePicker;
    procedure btnSelecionarArquivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    Function VerificaPreenchimentoInformacoes():Boolean;
    function InsereHstRegularizacao(): boolean;

    procedure LimpaEventoLancar();


    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblEventoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcAgenciaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcBancoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure edtContaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FIdAgencia: Longint;
    FIdBanco: Longint;
    FIdConta: Longint;
    MS:TMemoryStream;
    procedure SetIdAgencia(const Value: Longint);
    procedure SetIdBanco(const Value: Longint);
    procedure SetIdConta(const Value: Longint);
    { Private declarations }
  public

     Property IdBanco: Longint Read FIdBanco Write SetIdBanco;
     Property IdAgencia: Longint Read FIdAgencia Write SetIdAgencia;
     Property IdConta: Longint Read FIdConta Write SetIdConta;

     Procedure InsereEventoRegularizacao();

    { Public declarations }
  end;

var
  frmLancEventoRegularizacao: TfrmLancEventoRegularizacao;

implementation

uses
   UConciliacaoCredito, UMensErro;
{$R *.DFM}

procedure TfrmLancEventoRegularizacao.btnSelecionarArquivoClick(
  Sender: TObject);
begin
   inherited;

   opDlgSelecionarArquivo.Execute;
   edtSelArquivoRegularizacao.ReadOnly := false;
   edtSelArquivoRegularizacao.Text := opDlgSelecionarArquivo.FileName;
   edtSelArquivoRegularizacao.ReadOnly := true;

end;

procedure TfrmLancEventoRegularizacao.FormCreate(Sender: TObject);
begin
   inherited;
   qryBanco.close;
   qryBanco.Open;

   qryAgencia.close;
   qryAgencia.ParamByName('pIdBanco').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
   qryAgencia.Open;

   QryEvento.close;
   QryEvento.Open;

end;

procedure TfrmLancEventoRegularizacao.dblcBancoChange(Sender: TObject);
begin
   inherited;
   qryAgencia.close;
   qryAgencia.ParamByName('pIdBanco').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
   qryAgencia.Open;
end;

Function TfrmLancEventoRegularizacao.VerificaPreenchimentoInformacoes(): Boolean;
begin

   Result := false;
   if (dblEvento.Text = '') then
   begin
      MsgDlg('É obrigatório selecionar o evento de regularização.','Informação',mtInformation,[mbOk],0);
      exit;
   end;


   if (dbeDataReg.Date = 0) then
   begin
      MsgDlg('É obrigatório informar a data de regularização.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (edtTipoRegularizacao.Text = '') then
   begin
      MsgDlg('É obrigatório informar o tipo de regularização.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (edtSelArquivoRegularizacao.Text = '') then
   begin
      MsgDlg('É obrigatório selecionar arquivo para regularização.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if ((trim(dblcBanco.text) <> '') or (trim(dblcAgencia.text) <> '')) and (trim(edtConta.text) = '') then
   begin
      MsgDlg('Foi informado banco ou agência bancária, mas não foi informada a conta para regularização. É obrigatório informar a conta bancária.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if ((trim(dblcBanco.text) = '') or (trim(dblcAgencia.text) = '')) and (trim(edtConta.text) <> '') then
   begin
      MsgDlg('Foi informado conta bancária, mas não foi informado banco ou agência bancária para regularização. É obrigatório informar a conta bancária.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (trim(dblcBanco.text) <> '') or (trim(dblcAgencia.text) <> '') or (trim(edtConta.text) <> '') then
   begin
      if(MsgDlg('Foram informados novos dados bancários para regularização de pagamento, deseja continuar? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo) then
      begin
         exit;
      end;
   end;

   if (mmObservacao.Text = '') then
   begin
      MsgDlg('É obrigatório informar a observação sobre a regularização.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   Result := true;
end;

procedure TfrmLancEventoRegularizacao.InsereEventoRegularizacao;
begin

end;

procedure TfrmLancEventoRegularizacao.SetIdAgencia(const Value: Longint);
begin
  FIdAgencia := Value;
end;

procedure TfrmLancEventoRegularizacao.SetIdBanco(const Value: Longint);
begin
  FIdBanco := Value;
end;

procedure TfrmLancEventoRegularizacao.SetIdConta(const Value: Longint);
begin
  FIdConta := Value;
end;

procedure TfrmLancEventoRegularizacao.bbtnConfirmarClick(Sender: TObject);
var iIdArq : Longint;
begin
   inherited;
   if (VerificaPreenchimentoInformacoes) then
   begin
      if not(InsereHstRegularizacao)then//PreencheEventoLancar;
         MsgDlg('Erro ao lançar o evento de regularização.','Informação',mtInformation,[mbOk],0)
      else
      begin
         MsgDlg('Evento de regularização cadastrado com sucesso.','Informação',mtInformation,[mbOk],0);
         Close;
      end;
   end;

   frmConciliacaoCredito.AtualizaDados(frmConciliacaoCredito.IdArquivoRetornoCaixa);

end;




procedure TfrmLancEventoRegularizacao.LimpaEventoLancar;
begin
   dblcAgencia.Text := '';
   dblEvento.Text := '';
   dblcBanco.Text := '';
   edtConta.Text := '';
   dbeDataReg.Text := '';
   edtTipoRegularizacao.Text := '';
   mmObservacao.Text := '';
   edtSelArquivoRegularizacao.Text := '';

end;

function TfrmLancEventoRegularizacao.InsereHstRegularizacao(): boolean;

var sArquivo, sExtencao, snomeArquivo, sNumAgencia, sNumBanco, sContaBancaria  : string;
    aArquivo  :  TfileStream;


begin
   sExtencao    := edtSelArquivoRegularizacao.Text;
   snomeArquivo := edtSelArquivoRegularizacao.Text;

   if trim(dblcAgencia.Value) <> '' then
      sNumAgencia  :=  qryAgencia.FieldByName('NUMAGENCIA').AsString
   else
      sNumAgencia :=  frmConciliacaoCredito.CdsDadosRetornoCaixa.FieldByName('AGENCIA').AsString;

   if trim(dblcBanco.Value) <> '' then
      sNumBanco :=  qryBanco.FieldByName('NUMBANCO').AsString
   else
      sNumBanco :=  frmConciliacaoCredito.CdsDadosRetornoCaixa.FieldByName('BANCO').AsString;

   if trim(edtConta.Text) <> '' then
      sContaBancaria := edtConta.Text
   else
      sContaBancaria :=  frmConciliacaoCredito.CdsDadosRetornoCaixa.FieldByName('CONTABANCARIA').AsString;
   result := true;

   try
      aArquivo := TFileStream.Create(edtSelArquivoRegularizacao.Text, fmOpenRead or fmShareExclusive);
      //sArquivo := (aArquivo);


      while pos('.',sExtencao) > 0 do
      begin
         sExtencao := copy(sExtencao,pos('.',sExtencao)+1, length(sExtencao));
      end;

      while pos('\',snomeArquivo) > 0 do
      begin
         snomeArquivo := copy(snomeArquivo,pos('\',snomeArquivo)+1, length(snomeArquivo));
      end;
      snomeArquivo := copy(snomeArquivo,1,40);
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add( ' INSERT INTO CM.HSTREGULARIZACAOFOLHA ( ' + #13#10 +
                      ' IDHSTREGULARIZACAOFOLHA,' + #13#10 +
                      ' IDARQUIVORETORNOCAIXA,' + #13#10 +
                      ' IDCADEVENTOSDEREGULARIZACAO,' + #13#10 +
                      ' DATAREGULARIZACAO,' + #13#10 +
                      ' TIPOREGULARIZACAO,' + #13#10 +
                      ' ARQUIVOREGULARIZACAO,' + #13#10 +
                      ' EXTENSAOARQUIVO,' + #13#10 +
                      ' NOMEARQUIVO,' + #13#10 +
                      ' NUMBANCO,' + #13#10 +
                      ' NUMAGENCIA,' + #13#10 +
                      ' CONTABANCARIA, '+ #13#10 +
                      ' OBSERVACAO ) ' + #13#10 +
                      'VALUES ( cm.SEQHSTREGULARIZACAOFOLHA.NEXTVAL, '+ #13#10 +
                      IntToStr(frmConciliacaoCredito.IdArquivoRetornoCaixa) +', '+ #13#10 +
                      IntToStr(QryEvento.FieldbyName('IDCADEVENTO').AsInteger) +', '+ #13#10 +
                      QuotedStr(dbeDataReg.Text)+', '+ #13#10 +
                      QuotedStr(edtTipoRegularizacao.Text)+', '+ #13#10 +
                      ':ARQUIVOREGULARIZACAO,' + #13#10 +
                      QuotedStr('.'+trim(sExtencao))+', '+ #13#10 +
                      QuotedStr(snomeArquivo)+', '+ #13#10 +
                      QuotedStr(sNumBanco)+', '+ #13#10 +
                      QuotedStr(sNumAgencia)+', '+ #13#10 +
                      QuotedStr(sContaBancaria)+', '+ #13#10 +
                      QuotedStr(mmObservacao.Text)+ ' ) ');

      qryAux.Params.ParamByName('ARQUIVOREGULARIZACAO').LoadFromStream(aArquivo, ftBLOB);
      if Not(dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryAux.ExecSQL;
      if (dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.Commit;

   except
      result := false;
   end;
   //aArquivo := TFileStream.Create(edtSelArquivoRegularizacao.Text, fmClosed);

   if Not(dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.StartTransaction;
   if QryEvento.FieldbyName('CODIGO').AsString <> '00' then
   begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add( ' UPDATE ARQUIVODERETORNOCAIXA A SET FLGINCONSISTENCIA = 1 WHERE A.IDARQUIVORETORNOCAIXA = '+IntToStr(frmConciliacaoCredito.IdArquivoRetornoCaixa));
      try
         qryAux.ExecSQL;
      except
         result := true;
      end;
   end
   else
   begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add( ' UPDATE ARQUIVODERETORNOCAIXA A SET FLGINCONSISTENCIA = 0 WHERE A.IDARQUIVORETORNOCAIXA = '+IntToStr(frmConciliacaoCredito.IdArquivoRetornoCaixa));
      try
         qryAux.ExecSQL;
      except
         result := true;
      end;
   end;
   if (dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.Commit;

   FreeAndNil(aArquivo);
  // se for diferente de 00 alterar a informação de sit pagamento.
end;

procedure TfrmLancEventoRegularizacao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaEventoLancar();
end;

procedure TfrmLancEventoRegularizacao.dblEventoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  Accept := False;
end;

procedure TfrmLancEventoRegularizacao.dblcAgenciaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  Accept := False;
end;

procedure TfrmLancEventoRegularizacao.dblcBancoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  Accept := False;
end;

procedure TfrmLancEventoRegularizacao.edtContaKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in ['0'..'9', chr(8), chr(13)]) then
      Key:=#0;
end;

procedure TfrmLancEventoRegularizacao.FormShow(Sender: TObject);
begin
  inherited;
  frmConciliacaoCredito.bControlaTela := true;
end;

procedure TfrmLancEventoRegularizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmConciliacaoCredito.bControlaTela := false;
end;

end.

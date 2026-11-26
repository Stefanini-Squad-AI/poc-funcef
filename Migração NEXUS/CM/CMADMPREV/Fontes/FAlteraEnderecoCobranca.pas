unit FAlteraEnderecoCobranca;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina      : AlteraEnderecoCobranca, bbtnConfirmarClick
//Pendência   : SIG100575
//Responsável : Edilaine
//Data        : 13/07/2020
//Descrição   : conta corrente nao estava respeitando mascara cadastrada para o banco
//-----------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, DBCtrls,
  wwdblook, CMDBLookupCombo, wwdbedit, Mask, ComCtrls, TEdNum;

type
  TfrmAlteraEnderecoCobranca = class(TfrmOkCancelar)
    qry: TwwQuery;
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    qryCidade: TwwQuery;
    qryCidadeNOMECIDADE: TStringField;
    qryCidadeCODESTADO: TStringField;
    qryCidadeIDCIDADES: TFloatField;
    qryCidadeNOMEESTADO: TStringField;
    qryCidadeIDPAIS: TFloatField;
    qryCidadeNOMEPAIS: TStringField;
    dsCidade: TwwDataSource;
    qryAux: TwwQuery;
    ds: TwwDataSource;
    pgctrlAlteracoes: TPageControl;
    tbsEndereco: TTabSheet;
    tbsContaBancaria: TTabSheet;
    lblPdLocal: TLabel;
    lblPdLogradouro: TLabel;
    lblPdComplemento: TLabel;
    lblPdCidade: TLabel;
    lblPdPais: TLabel;
    lblPdEstado: TLabel;
    lblBairro: TLabel;
    lblPdCEP: TLabel;
    Label57: TLabel;
    lblPdNumero: TLabel;
    cmbCidade: TCMDBLookupCombo;
    dbedPais: TwwDBEdit;
    dbedEstado: TwwDBEdit;
    dbeCodEstado: TwwDBEdit;
    edNomeEndereco: TEdit;
    edLogradouro: TEdit;
    edNumero: TEdit;
    edComplemento: TEdit;
    edBairro: TEdit;
    edCEP: TEdit;
    qryCBancaria: TwwQuery;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dblkpcmbBanco: TwwDBLookupCombo;
    dblkpcmbAgencia: TwwDBLookupCombo;
    edDigBanco: TEditNum;
    edDigAgencia: TEditNum;
    dsCBancaria: TwwDataSource;
    rgrpContaConjunta: TRadioGroup;
    rgrpTipoConta: TRadioGroup;
    edNumeroConta: TwwDBEdit;
    UpdCBancaria: TUpdateSQL;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkpcmbBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edDigBancoExit(Sender: TObject);
    procedure edDigAgenciaExit(Sender: TObject);
    procedure dblkpcmbAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbBancoExit(Sender: TObject);
    procedure edNumeroContaExit(Sender: TObject);
  private
    { Private declarations }
    bEnderecoNovo : boolean;
    bContaNova    : boolean;
    bDesprezaEndereco : boolean;
    bDesprezaConta    : boolean;

    function ValidaContaCorrente : boolean;   //edilaine SIG100575

  public
    { Public declarations }
    function AlteraEnderecoCobranca ( piIdPessoa : longint ) : boolean;
  end;

var
  frmAlteraEnderecoCobranca: TfrmAlteraEnderecoCobranca;

implementation

uses UMensErro, UDataBase, UAdmPrev, UCalcDV;

{$R *.DFM}

function TfrmAlteraEnderecoCobranca.AlteraEnderecoCobranca ( piIdPessoa : longint ) : boolean;
var mrResult : TModalResult;
begin
   Result := False;
   bDesprezaEndereco := False;
   bDesprezaConta    := False;
   pgctrlAlteracoes.ActivePage := tbsEndereco;
   qryCidade.Close;
   qryCidade.Open;

   qry.Close;
   qry.ParamByName('IDPESSOA').AsInteger := piIdPessoa;
   qry.Open;
   if (qry.IsEmpty) or (qry.FieldByName('IDENDERECO').AsInteger <= 0)
   then begin
      if MsgDlg('O participante não possui endereço registrado como Endereço para Cobrança.'+#13+
                'Deseja inserir um novo endereço ?',
                'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
      then begin
         if MsgDlg('O participante não possui endereço registrado como Endereço para Cobrança.'+#13+
                   'Deseja desconsiderar o cadastramento do endereço ? ',
                   'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
         then Exit;
         bDesprezaEndereco           := True;
         pgctrlAlteracoes.ActivePage := tbsContaBancaria;
         tbsEndereco.Enabled         := False;
      end;
      bEnderecoNovo := True;
      edNomeEndereco.Text := '';
      edLogradouro.Text   := '';
      edNumero.Text       := '';
      edComplemento.Text  := '';
      edBairro.Text       := '';
      edCEP.Text          := '';
      cmbCidade.Text      := '';
      dbedEstado.Text     := '';
      dbeCodEstado.Text   := '';
      dbedPais.Text       := '';
   end
   else begin
      bEnderecoNovo       := False;
      edNomeEndereco.Text := qry.FieldByName('NOME').AsString;
      edLogradouro.Text   := qry.FieldByName('LOGRADOURO').AsString;
      edNumero.Text       := qry.FieldByName('NUMERO').AsString;
      edComplemento.Text  := qry.FieldByName('COMPLEMENTO').AsString;
      edBairro.Text       := qry.FieldByName('BAIRRO').AsString;
      edCEP.Text          := qry.FieldByName('CEP').AsString;
      if (qry.FieldByName('IDCIDADES').AsInteger > 0) and (qryCidade.Locate('IDCIDADES',qry.FieldByName('IDCIDADES').AsInteger,[]))
      then begin
         cmbCidade.Text := qryCidade.FieldByName('NOMECIDADE').AsString;
      end
      else begin
         cmbCidade.Text    := '';
         dbedEstado.Text   := '';
         dbeCodEstado.Text := '';
         dbedPais.Text     := '';
      end;
   end;

   qryBanco.Close;
   qryBanco.Open;
   qryCBancaria.Close;
   qryCBancaria.ParamByName('IDPESSOA').AsInteger := piIdPessoa;
   qryCBancaria.Open;
   if (qry.IsEmpty) or (qry.FieldByName('IDENDERECO').AsInteger <= 0)
   then begin
      if MsgDlg('O participante não possui conta bancária registrada como preferencial.'+#13+
                'Deseja inserir uma nova conta bancária ?',
                'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
      then begin
         if MsgDlg('O participante não possui conta bancária registrada como preferencial.'+#13+
                   'Deseja desconsiderar o cadastramento de conta bancária ?',
                   'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
         then Exit;
         bDesprezaConta := True;
         pgctrlAlteracoes.ActivePage := tbsEndereco;
         tbsContaBancaria.Enabled    := False;
      end;
      qryAgencia.Close;
      qryAgencia.ParamByName('IDBANCO').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
      qryAgencia.Open;

      qryCBancaria.insert;    //edilaine SIG100575

      bContaNova                  := True;
      edDigBanco.Text             := '';
      dblkpcmbBanco.Text          := '';
      edDigAgencia.Text           := '';
      dblkpcmbAgencia.Text        := '';
      edNumeroConta.Text          := '';
      rgrpTipoConta.ItemIndex     := 0;
      rgrpContaConjunta.ItemIndex := 0;

   end
   else begin
      qryBanco.Locate('IDPESSOA',qryCBancaria.FieldByName('IDBANCO').AsInteger,[]);
      qryAgencia.Close;
      qryAgencia.ParamByName('IDBANCO').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
      qryAgencia.Open;
      qryAgencia.Locate('IDPESSOA',qryCBancaria.FieldByName('IDAGENCIA').AsInteger,[]);

      qryCBancaria.edit;    //edilaine SIG100575

      bContaNova                  := False;
      edDigBanco.Text             := qryCBancaria.FieldByName('NUMBANCO').AsString;
      dblkpcmbBanco.Text          := qryCBancaria.FieldByName('NOMEBANCO').AsString;
      dblkpcmbBanco.PerformSearch;
      edDigAgencia.Text           := qryCBancaria.FieldByName('NUMAGENCIA').AsString;
      dblkpcmbAgencia.Text        := qryCBancaria.FieldByName('NOMEAGENCIA').AsString;
      dblkpcmbAgencia.PerformSearch;
      edNumeroConta.Text          := qryCBancaria.FieldByName('CONTACORRENTE').AsString;
      if qryCBancaria.FieldByName('TIPOCONTA').AsInteger = 1
      then rgrpTipoConta.ItemIndex := 0
      else if qryCBancaria.FieldByName('TIPOCONTA').AsInteger = 2
      then rgrpTipoConta.ItemIndex := 1
      else if qryCBancaria.FieldByName('TIPOCONTA').AsInteger = 3
      then rgrpTipoConta.ItemIndex := 2
      else rgrpTipoConta.ItemIndex := -1;

      if qryCBancaria.FieldByName('FLGCONTACONJUNTA').AsString = 'S'
      then rgrpContaConjunta.ItemIndex := 1
      else rgrpContaConjunta.ItemIndex := 0;
   end;

   if bDesprezaEndereco and bDesprezaConta
   then Exit;
   
   mrResult := ShowModal;
   if mrResult = mrOK then Result := True;
end;

procedure TfrmAlteraEnderecoCobranca.bbtnConfirmarClick(Sender: TObject);
var sSQL         : string;
    iIdEndereco  : longint;
    iIdCBancaria : longint;
begin
  // ***************************************************************************
  // VERIFICAR CAMPOS OBRIGATORIOS
  // ***************************************************************************
  if not bDesprezaEndereco
  then begin
     if Trim(edLogradouro.Text) = ''
     then begin
        MsgDlg('O preenchimento do Logradouro é obrigatório.','Erro',mtError,[mbOK],0);
        Abort;
     end;

     if Trim(cmbCidade.Text) = ''
     then begin
        MsgDlg('O preenchimento da Cidade é obrigatório.','Erro',mtError,[mbOK],0);
        Abort;
     end;
  end;

  if not bDesprezaConta
  then begin
     if Trim(dblkpcmbBanco.Text) = ''
     then begin
        MsgDlg('O preenchimento do Banco é obrigatório.','Erro',mtError,[mbOK],0);
        Abort;
     end;

     if Trim(dblkpcmbAgencia.Text) = ''
     then begin
        MsgDlg('O preenchimento da Agência é obrigatório.','Erro',mtError,[mbOK],0);
        Abort;
     end;

     if Trim(edNumeroConta.Text) = ''
     then begin
        MsgDlg('O preenchimento do Número da Conta é obrigatório.','Erro',mtError,[mbOK],0);
        Abort;
     end;

      //edilaine SIG100575 : inicio
     if not ValidaContaCorrente then
     begin
        Abort;
     end;
      //edilaine SIG100575 : fim

  end;


  inherited;

  // ***************************************************************************
  // GRAVA ENDEREÇO
  // ***************************************************************************
  if not bDesprezaEndereco
  then begin
     if bEnderecoNovo
     then begin
        iIdEndereco := LeUltRegistro(nil,'ENDPESS');
        sSQL := ' INSERT INTO ENDPESS                                               '+
                '             (IDPESSOA, IDENDERECO, IDCIDADES, LOGRADOURO, NUMERO, '+
                '              COMPLEMENTO, BAIRRO, NOME, CEP )                     '+
                ' VALUES      (                                                     '+
                OraNumero(qry.FieldByName('IDPESSOA').AsString)                  +','+
                IntToStr(iIdEndereco);

        if Trim(cmbCidade.Text)      <> '' then sSQL := sSQL +','''+OraNumero(qryCidade.FieldByName('IDCIDADES').AsString)+''''  else sSQL := sSQL +', NULL';
        if Trim(edLogradouro.Text)   <> '' then sSQL := sSQL +','''+edLogradouro.Text+''''                                       else sSQL := sSQL +', NULL';
        if Trim(edNumero.Text)       <> '' then sSQL := sSQL +','''+edNumero.Text+''''                                           else sSQL := sSQL +', NULL';
        if Trim(edComplemento.Text)  <> '' then sSQL := sSQL +','''+edComplemento.Text+''''                                      else sSQL := sSQL +', NULL';
        if Trim(edBairro.Text)       <> '' then sSQL := sSQL +','''+edBairro.Text+''''                                           else sSQL := sSQL +', NULL';
        if Trim(edNomeEndereco.Text) <> '' then sSQL := sSQL +','''+edNomeEndereco.Text+''''                                     else sSQL := sSQL +', NULL';
        if Trim(edCEP.Text)          <> '' then sSQL := sSQL +','''+edCEP.Text+''''                                              else sSQL := sSQL +', NULL';
        sSQL := sSQL +')';
     end
     else begin

        sSQL := ' UPDATE ENDPESS SET ';
        if Trim(cmbCidade.Text)      <> '' then sSQL := sSQL +'  IDCIDADES   = '+OraNumero(qryCidade.FieldByName('IDCIDADES').AsString) else sSQL := sSQL +'  IDCIDADES   = NULL';
        if Trim(edLogradouro.Text)   <> '' then sSQL := sSQL +', LOGRADOURO  = '''+edLogradouro.Text+''''                               else sSQL := sSQL +', LOGRADOURO  = NULL';
        if Trim(edNumero.Text)       <> '' then sSQL := sSQL +', NUMERO      = '''+edNumero.Text+''''                                   else sSQL := sSQL +', NUMERO      = NULL';
        if Trim(edComplemento.Text)  <> '' then sSQL := sSQL +', COMPLEMENTO = '''+edComplemento.Text+''''                              else sSQL := sSQL +', COMPLEMENTO = NULL';
        if Trim(edBairro.Text)       <> '' then sSQL := sSQL +', BAIRRO      = '''+edBairro.Text+''''                                   else sSQL := sSQL +', BAIRRO      = NULL';
        if Trim(edNomeEndereco.Text) <> '' then sSQL := sSQL +', NOME        = '''+edNomeEndereco.Text+''''                             else sSQL := sSQL +', NOME        = NULL';
        if Trim(edCEP.Text)          <> '' then sSQL := sSQL +', CEP         = '''+edCEP.Text+''''                                      else sSQL := sSQL +', CEP         = NULL';
        sSQL := sSQL +' WHERE IDPESSOA   = '+OraNumero(qry.FieldByName('IDPESSOA').AsString)+
                      ' AND   IDENDERECO = '+OraNumero(qry.FieldByName('IDENDERECO').AsString);
     end;

     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        try
           ExecSQL;
        except
           ModalResult := mrCancel;
           Abort;
        end;
     end;

     if bEnderecoNovo
     then begin
        sSQL := ' UPDATE PESSOA SET IDENDCOBRANCA = '+IntToStr(iIdEndereco)+
                ' WHERE IDPESSOA   = '+OraNumero(qry.FieldByName('IDPESSOA').AsString);
        with qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(sSQL);
           try
              ExecSQL;
           except
              ModalResult := mrCancel;
              Abort;
           end;
        end;
     end
     else begin
     end;
  end;

  // ***************************************************************************
  // GRAVA CONTA BANCÁRIA
  // ***************************************************************************
  if not bDesprezaConta
  then begin
     if bContaNova
     then begin
        iIdCBancaria := LeUltRegistro(nil,'CONTABANCARIA');
        sSQL := ' INSERT INTO CONTABANCARIA                                              '+
                '             (IDCBANCARIA,      IDPESSOA,     IDAGENCIA, CONTACORRENTE, '+
                '              FLGCONTACONJUNTA, FLGCONTAPREF, TIPOCONTA )               '+
                ' VALUES      (                                                          '+
                IntToStr(iIdCBancaria)                                                +','+
                OraNumero(qry.FieldByName('IDPESSOA').AsString)                       +','+
                OraNumero(qryAgencia.FieldByName('IDPESSOA').AsString)                +','+
                //''''+edNumeroConta.Text+                                             ''',';    //edilaine SIG100575
                ''''+qryCBancaria.FieldByName('CONTACORRENTE').AsString+''''              ;      //edilaine SIG100575
        if rgrpContaConjunta.ItemIndex = 0
        then sSQL := sSQL +',''N'''
        else sSQL := sSQL +',''S''';
        sSQL := sSQL +', 1'; // FLGCONTAPREF
        sSQL := sSQL +', '''+IntToStr(rgrpTipoConta.ItemIndex)+                       '''';
        sSQL := sSQL +')';
     end
     else begin
        sSQL := ' UPDATE CONTABANCARIA SET ';
        sSQL := sSQL +'  IDAGENCIA     = '+OraNumero(qryAgencia.FieldByName('IDPESSOA').AsString);
        //sSQL := sSQL +', CONTACORRENTE = '''+edNumeroConta.Text+'''';                                  //edilaine SIG100575
        sSQL := sSQL +', CONTACORRENTE = '''+qryCBancaria.FieldByName('CONTACORRENTE').AsString+'''';    //edilaine SIG100575
        if rgrpContaConjunta.ItemIndex = 0
        then sSQL := sSQL +', FLGCONTACONJUNTA = ''N'''
        else sSQL := sSQL +', FLGCONTACONJUNTA = ''S''';
        sSQL := sSQL +', FLGCONTAPREF = 1 ';
        sSQL := sSQL +', TIPOCONTA = '''+IntToStr(rgrpTipoConta.ItemIndex)+'''';
        sSQL := sSQL +' WHERE IDPESSOA    = '+OraNumero(qry.FieldByName('IDPESSOA').AsString)+
                      ' AND   IDCBANCARIA = '+OraNumero(qryCBancaria.FieldByName('IDCBANCARIA').AsString);
     end;

     qryCBancaria.CancelUpdates;   //edilaine SIG100575
     
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        try
           ExecSQL;
        except
           ModalResult := mrCancel;
           Abort;
        end;
     end;

  end;
end;

procedure TfrmAlteraEnderecoCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // inherited; // COMENTADO PARA NÃO DAR FREE

end;

procedure TfrmAlteraEnderecoCobranca.dblkpcmbBancoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not qryBanco.Active then Exit;
  qryAgencia.Close;
  qryAgencia.ParamByName('IDBANCO').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
  qryAgencia.Open;
  edDigAgencia.Text := '';
  if Trim(dblkpcmbBanco.Text) <> ''  then edDigBanco.Text := qryBanco.FieldByName('NUMBANCO').AsString;

  dblkpcmbBancoExit(Sender);    //edilaine SIG100575
end;

procedure TfrmAlteraEnderecoCobranca.edDigBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigBanco.Text) = '' then Exit;
  if qryBanco.Locate('NumBanco',Trim(edDigBanco.Text),[loCaseInsensitive, loPartialKey])
  then begin
    dblkpcmbBanco.Text := qryBanco.FieldByName('Banco').AsString;
    dblkpcmbBanco.PerformSearch;
    qryAgencia.Close;
    qryAgencia.ParamByName('IDBANCO').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
    qryAgencia.Open;
  end;
end;

procedure TfrmAlteraEnderecoCobranca.edDigAgenciaExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigAgencia.Text) = '' then Exit;
  if qryAgencia.Locate('NumAgencia',Trim(edDigAgencia.Text),[loCaseInsensitive, loPartialKey])
  then begin
    dblkpcmbAgencia.Text := qryAgencia.FieldByName('Agencia').AsString;
    dblkpcmbAgencia.PerformSearch;
  end;
end;

procedure TfrmAlteraEnderecoCobranca.dblkpcmbAgenciaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(dblkpcmbAgencia.Text) <> ''
  then edDigAgencia.Text := qryAgencia.FieldByName('NUMAGENCIA').AsString;
end;

//edilaine SIG100575 : inicio
procedure TfrmAlteraEnderecoCobranca.dblkpcmbBancoExit(Sender: TObject);
begin
  inherited;
  If (Not qryBanco.FieldByName('MASCARACC').IsNull) Then
     qryCBancaria.FieldByName('CONTACORRENTE').EditMask := qryBanco.FieldByName('MASCARACC').AsString + ';' + MaskNoSave + '; '
  Else
     qryCBancaria.FieldByName('CONTACORRENTE').EditMask := '';

  qryCBancaria.FieldByName('NOMEBANCO').AsString := qryBanco.FieldByName('BANCO').AsString;
end;

procedure TfrmAlteraEnderecoCobranca.edNumeroContaExit(Sender: TObject);
begin
  inherited;
  if not ValidaContaCorrente() then
     exit;
end;

function TfrmAlteraEnderecoCobranca.ValidaContaCorrente : boolean;
begin
  result := true;

  if Trim(qryBanco.FieldByName('FLGVALIDACC').AsString) = 'S'
  then begin
     CalculaDv := TCalcDv.Create;            //edilaine SIG100575
     try
        CalculaDV.TipoConta  := rgrpTipoConta.ItemIndex + 1;
        if not CalculaDV.ValidaConta( qryBanco.FieldByName('NumBanco').AsString,
                                      qryAgencia.FieldByName('Numagencia').AsString,
                                      edNumeroConta.Text,
                                      True)
        then begin
           edNumeroConta.Text := '';
           result := false;
        end;
     finally
        Screen.Cursor := crDefault;
        CalculaDv.Free;
     end;
  end;
end;
//edilaine SIG100575 : fim


end.

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina      : cmbBancoExit
//Pendência   : SIG100575
//Responsável : Edilaine
//Data        : 13/07/2020
//Descrição   : conta corrente nao estava respeitando mascara cadastrada para o banco
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 135283 Kintana 803604
//Responsável : Renato Visoni
//Descrição   : Cadastro de Conta Resgate.
//---------------------------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 05.10.2009
// Pendencia   : 123407
// Alteração   : Adicionando um "Refresh" para o Numero da Agencia.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 05.08.2004
// Pendencia   : 17316
// Alteração   : Exibir nome da pessoa
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 25/06/2003
// Alteração   : Validação da conta somente se FLGVALIDACC = 'S'
//------------------------------------------------------------------------------
unit fCadContaRequerBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  wwdblook, Mask, wwdbedit, DBCtrls, UCMTypes;

type
  TfrmCadContaRequerBenef = class(TFrmCadastroGridCS)
    qryAgencia: TwwQuery;
    qryBanco: TwwQuery;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    qryAux: TwwQuery;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtNumBanco: TEdit;
    Label1: TLabel;
    cmbBanco: TwwDBLookupCombo;
    Label5: TLabel;
    edtNumAgencia: TEdit;
    Label2: TLabel;
    cmbAgencia: TwwDBLookupCombo;
    Label3: TLabel;
    edtConta: TwwDBEdit;
    lblNome: TLabel;
    lblDocumento: TLabel;
    QryContaResgate: TwwQuery;
    updContaResgate: TUpdateSQL;
    dbRdgContaResgate: TDBRadioGroup;
    procedure cmbBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edtNumBancoExit(Sender: TObject);
    procedure edtNumAgenciaExit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryAfterPost(DataSet: TDataSet);
    procedure qryAfterDelete(DataSet: TDataSet);
    procedure edtContaExit(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure cmbBancoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iIdPessoa: Integer;
  end;

var
  frmCadContaRequerBenef: TfrmCadContaRequerBenef;

implementation

{$R *.DFM}

uses uDataBase, DBasedados, UMensErro, UCalcDV;

procedure TfrmCadContaRequerBenef.cmbBancoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  // alimenta qryagencia
  qryAgencia.Close;
  qryAgencia.Params[0].AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
  qryAgencia.Open;
  edtNumAgencia.Clear;

  if cmbBanco.Text = '' Then
  Begin
    edtNumBanco.Clear;
    edtNUmAgencia.Clear;
    CmbAgencia.Text := '';
  End
  Else edtNumBanco.Text := qryBanco.FieldByName('NUMBANCO').AsString;

end;

procedure TfrmCadContaRequerBenef.cmbAgenciaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  edtNumAgencia.Text := qryAgencia.FieldByName('NUMAGENCIA').AsString;
end;

procedure TfrmCadContaRequerBenef.edtNumBancoExit(Sender: TObject);
begin
  inherited;
  // seta qrybanco
  If Trim(edtNumBanco.Text) <> '' Then
    If qryBanco.Locate('NUMBANCO',Trim(edtNumBanco.Text),[loCaseInsensitive, loPartialKey]) Then
    Begin
      cmbBanco.Text := qryBanco.FieldByName('BANCO').AsString;
      cmbBanco.OnCloseUp(self,qryBanco,nil,false);
    End Else cmbBanco.Text := '';
end;

procedure TfrmCadContaRequerBenef.edtNumAgenciaExit(Sender: TObject);
begin
  inherited;
  // seta agencia
  If trim(edtNumAgencia.text) <> ''Then Begin
    If qryAgencia.Locate('NUMAGENCIA',Trim(edtNumAgencia.Text),[loCaseInsensitive, loPartialKey]) Then Begin
      cmbAgencia.Text := qryAgencia.FieldByName('AGENCIA').AsString;
      cmbAgencia.PerformSearch;
    End Else
      cmbAgencia.Text := '';
  End;
end;

procedure TfrmCadContaRequerBenef.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IDCBANCARIA').AsInteger := LeUltRegistro(NIL,'CONTABANCARIA');
  qry.FieldByName('IDPESSOA').AsInteger := iIdPessoa;

  // limpa edits e combos.
  cmbBanco.Text := '';
  cmbAgencia.Text := '';
  edtNumBanco.Clear;
  edtNumAgencia.Clear;
  edtConta.Clear;
end;

procedure TfrmCadContaRequerBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;

  // verifica se possui uma conta preferencial e avisa
  If qry.FieldByName('IDPESSOA').IsNull Then Exit;

  With qryAux Do
  Begin
    Sql.Clear;
    Sql.Add(' SELECT COUNT(*) QTD FROM CONTABANCARIA ' +
            ' WHERE IDPESSOA = ' + qry.FieldByName('IDPESSOA').AsString +
            '  AND FLGCONTAPREF = 1');
    Open;
    If FieldByName('QTD').AsInteger = 0 Then
      MsgDlg('Não há conta preferencial cadastra.','Atenção',mtWarning,[mbOk],0);
    Close;
  End;

end;

procedure TfrmCadContaRequerBenef.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  inherited;

end;

procedure TfrmCadContaRequerBenef.FormShow(Sender: TObject);
begin
  inherited;

  dbGrd.BringToFront;

  // seta a query
  qryBanco.Open;
  qryBanco.Locate('IDPESSOA',qry.FieldByName('IDBANCO').AsInteger,[]);

  qryAgencia.Close;
  qryAgencia.Params[0].AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
  qryAgencia.open;
  qryAgencia.Locate('IDPESSOA',qry.FieldByName('IDAGENCIA').AsInteger,[]);

  cmbAgencia.Text    := qryAgencia.FieldByName('AGENCIA').AsString;
  edtNumAgencia.Text := qryAgencia.FieldByName('NUMAGENCIA').AsString;

  cmbBanco.Text      := qryBanco.FieldByName('BANCO').AsString;
  edtNumBanco.Text   := qryBanco.FieldByName('NUMBANCO').AsString;

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT P.NOME, '+
             '        TRIM(REPLACE(TO_CHAR(P.NUMDOCUMENTO,''000,000,000,00''),'','',''.'') ) AS NUMDOCUMENTO '+
             ' FROM PESSOA P '+
             ' WHERE P.IDPESSOA = '+IntToStr(iIdPessoa));
     Open;
     lblNome.Caption := 'Nome : '+FieldByName('NOME').AsString;
     lblDocumento.Caption := 'CPF : '+FieldByName('NUMDOCUMENTO').AsString;
     Close;
  end;


  // forço o create para capturar os eventos do padrão
  If qry.RecordCount > 0 Then
    CmeCadastro.Operacao := opIdle
  Else CmeCadastro.Operacao := opVazio;
    CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadContaRequerBenef.bbtnConfirmarClick(Sender: TObject);
begin
   //Renato Visoni SOL 135283 Kintana 803604
   if dbRdgContaResgate.ItemIndex = 0 then begin
     if QryContaResgate.RecordCount <> 0 then begin
       if trim(Qry.fieldByname('ROWID').asString) <> '' then begin
         if not QryContaResgate.Locate('IDROWID',Qry.fieldByname('ROWID').asString,[]) then begin
           MsgDlg('Conta resgate já cadastrada.','Erro',mtInformation,[mbOk],0);
           Exit;
         end else begin
           QryContaResgate.Append;
           QryContaResgate.FieldByname('IDROWID').asString := Qry.fieldByname('ROWID').asString;
           QryContaResgate.Post;
         end;
       end else begin
         MsgDlg('Conta resgate já cadastrada.','Erro',mtInformation,[mbOk],0);
         Exit;
       end;
     end else begin
       QryContaResgate.Append;
       if trim(Qry.fieldByname('ROWID').asString) = '' then begin
         QryContaResgate.FieldByname('IDROWID').asString := 'NOVO';
       end else begin
         QryContaResgate.FieldByname('IDROWID').asString := Qry.fieldByname('ROWID').asString;
       end;
       QryContaResgate.Post;
     end;
   end else begin
     if QryContaResgate.FieldByname('IDROWID').asString = 'NOVO' Then begin
       QryContaResgate.Delete;
     end else begin
       if QryContaResgate.Locate('IDROWID',Qry.fieldByname('ROWID').asString,[]) then begin
         QryContaResgate.Delete;
       end;
     end;
   end;
   //Renato Visoni SOL 135283 Kintana 803604

  inherited;
  //Atualiza grid.
  qry.Close;
  qry.Params[0].AsInteger := iIdPessoa;
  qry.open;
end;

procedure TfrmCadContaRequerBenef.qryAfterPost(DataSet: TDataSet);
begin
  inherited;
  qry.ApplyUpdates;
end;

procedure TfrmCadContaRequerBenef.qryAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qry.ApplyUpdates;

end;

procedure TfrmCadContaRequerBenef.edtContaExit(Sender: TObject);
begin
  inherited;


  if Trim(edtConta.Text) = '' then Exit;
  

  if Trim(qryBanco.FieldByName('FLGVALIDACC').AsString) = 'S'
  then begin
     CalculaDv := TCalcDv.Create;        //edilaine SIG100575
     try
        CalculaDV.TipoConta  := DBRadioGroup1.ItemIndex + 1;
        if not CalculaDV.ValidaConta( qryBanco.FieldByName('NumBanco').AsString,
                                      qryAgencia.FieldByName('Numagencia').AsString,
                                      edtConta.Text, 
                                      True)
        then begin
           edtConta.Text := '';
        end;
     finally
        CalculaDv.Free;
     end;
  end;

end;

procedure TfrmCadContaRequerBenef.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //
  if qry.FieldByName('TIPOCONTA').AsString = ''
  then begin
     qry.FieldByName('TIPOCONTA').AsInteger := 1;
  end;
  
  if qry.FieldByName('FLGCONTAPREF').AsString = ''
  then begin
     qry.FieldByName('FLGCONTAPREF').AsInteger := 1;
  end;

  if qry.FieldByName('FLGCONTACONJUNTA').AsString = ''
  then begin
     qry.FieldByName('FLGCONTACONJUNTA').AsString := 'N';
  end;
end;

procedure TfrmCadContaRequerBenef.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //SOL123407 - Ádler Souza
  qryAgencia.Locate('NUMAGENCIA',qry.FieldByName('IDAGENCIA').AsInteger,[]);
  edtNumAgencia.Text := qryAgencia.FieldByName('NUMAGENCIA').AsString;
  //Fim - SOL123407 - Ádler Souza
end;

procedure TfrmCadContaRequerBenef.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  //Renato Visoni SOL 135283 Kintana 803604
  QryContaResgate.Close;
  QryContaResgate.Open;

  Qry.First;
  while not Qry.eof do begin
    if Qry.FieldByname('FLGCONTARESGATE').asInteger = 1 then begin
      QryContaResgate.Append;
      QryContaResgate.fieldByname('IDROWID').asString := Qry.FieldByname('ROWID').asString;
      QryContaResgate.Post;
    end;
    Qry.Next;
  end;

  QryContaResgate.First;
  while not QryContaResgate.eof do begin
    if trim(QryContaResgate.FieldByName('IDROWID').asString) = '' then begin
      QryContaResgate.Delete;
    end else begin
      QryContaResgate.Next;
    end;
  end;
  //Renato Visoni SOL 135283 Kintana 803604

end;

//edilaine SIG100575 : inicio
procedure TfrmCadContaRequerBenef.cmbBancoExit(Sender: TObject);
begin
  inherited;
  If (Not qryBanco.FieldByName('MASCARACC').IsNull) Then
     qry.FieldByName('CONTACORRENTE').EditMask := qryBanco.FieldByName('MASCARACC').AsString + ';' + MaskNoSave + '; '
  Else
     qry.FieldByName('CONTACORRENTE').EditMask := '';

  qry.FieldByName('BANCO').AsString := qryBanco.FieldByName('BANCO').AsString;
end;
//edilaine SIG100575 : fim

end.

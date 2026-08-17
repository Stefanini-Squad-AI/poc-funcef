// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------------------------
// Autor(a)   : Edilaine Ferraresi
// Data       : 23/07/2018
// SIG        : 71995
// Descricao  : Inconsistencia na finalização do cadastro de representante legal
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 137519 KINTANA 831220
//Responsável : BRUNO AZEVEDO
//Data        : 16/06/2010
//Descrição   : Ajuste no controle de transação ao fechar a tela.
//--------------------------------------------------------------------------------------------------
//Autor(a)  : Thiago Passos
//Data      : 21/01/2010
//Pendencia : Sol 127643 / Kintana 685903
//Alteração : Não permitir numero de celular inválidos
//---------------------------------------------------------------------------------------------------
// Autor(a)    : Thiago Passos
// Data        : 12/11/2009
// SOL         : 115358
// Kintana     : 553569
// Alteração   : Incluir o campo CPF no "MontaSelect"
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 19/07/2006
// Pendência   : 21347
// Alteração   : Incluir tipo de conta corrente "OP\Recibo"
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 18/07/2006
// Pendência   : 21141
// Alteração   : Verificação se já foi cadastrado uma conta preferencial
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 25/06/2003
// Alteração   : Validação da conta somente se FLGVALIDACC = 'S'
//------------------------------------------------------------------------------

unit FCadResponsa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc,
  Wwquery, TB97, MAHlpBtn, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, checklst,
  Buttons, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, Wwdbspin, TEdNum, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, TREdit;

type
  TfrmCadResponsa = class(TfrmPessoa)
    tbsContaBancaria: TTabSheet;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    qryContaBancaria: TwwQuery;
    dsContaBancaria: TwwDataSource;
    updContaBancaria: TUpdateSQL;
    Panel3: TPanel;
    GroupBoxBanco: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dblkpcmbAgencia: TwwDBLookupCombo;
    dblkpcmbBanco: TwwDBLookupCombo;
    dbedContaCorrente: TwwDBEdit;
    edDigBanco: TEditNum;
    edDigAgencia: TEditNum;
    rgrpTipoConta: TDBRadioGroup;
    dbgrpContaPref: TDBRadioGroup;
    dbgrpContaConj: TDBRadioGroup;
    dbgrdContaBancaria: TwwDBGrid;
    procedure qrySubTipoBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    procedure dblkpcmbBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbedContaCorrenteExit(Sender: TObject);
    procedure edDigBancoExit(Sender: TObject);
    procedure edDigAgenciaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure PessoaChangeSubtipo(IdPessoa: Integer);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure qryContaBancariaBeforePost(DataSet: TDataSet);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEDDDDKeyPress(Sender: TObject; var Key: Char);
    procedure DBEDNUMEROKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }

    OpDetalhe   : String;
    function  VerificaContaBancaria: boolean;
    procedure ValidaCampoNumericoDDD(var Key: char);
    procedure ValidaCampoNumerico(var Key: char);
  public
    { Public declarations }
  end;

var
  frmCadResponsa: TfrmCadResponsa;

implementation

uses DBaseDados, UCalcDV, UMensErro, UAdmPrev, UDataBase, FConsPessoaGeral, Usistema;

{$R *.DFM}

procedure TfrmCadResponsa.qrySubTipoBeforePost(DataSet: TDataSet);
begin
  inherited;
  qrySubTipo.FieldByName('FLGADMPREV').AsInteger := 1;
end;

procedure TfrmCadResponsa.FormActivate(Sender: TObject);
begin
  inherited;
  qryAgencia.Close; qryAgencia.Open;
  qryBanco.Close; qryBanco.Open;
end;

procedure TfrmCadResponsa.PessoaChangeSubtipo(IdPessoa: Integer);
begin
   // Abrir Outras Querys
   if qryContaBancaria.Active and qryContaBancaria.CachedUpdates
   then qryContaBancaria.CancelUpdates;
   qryContaBancaria.ParamByName('IDPESSOA').Value := IdPessoa;
   qryContaBancaria.Close;
   qryContaBancaria.Open;
   qryContaBancaria.CancelUpdates;
end;

procedure TfrmCadResponsa.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   if pgctrlDetalhe.ActivePage = tbsContaBancaria
   then begin
      if not qryContaBancaria.IsEmpty then begin
         edDigBanco.Text      := qryContaBancaria.FieldByName('NumBanco').AsString;
         edDigAgencia.Text    := qryContaBancaria.FieldByName('NumAgencia').AsString;
      end;
   end;
end;

procedure TfrmCadResponsa.dblkpcmbBancoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryContaBancaria.FieldbyName('BANCO').AsString := qryBanco.FieldByName('BANCO').AsString;
  edDigAgencia.Text := '';
  dblkpcmbAgencia.Text := '';

  qryAgencia.Close;  
  qryAgencia.ParamByName('pIdBanco').AsString := qryBanco.FieldbyName('IDPESSOA').AsString;
  qryAgencia.Open;

  edDigBanco.Text := IntToStr(qryBanco.FieldbyName('NUMBANCO').AsInteger);
end;

procedure TfrmCadResponsa.dblkpcmbAgenciaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
 inherited;
  qryContaBancaria.FieldbyName('AGENCIA').AsString := qryAgencia.FieldByName('AGENCIA').AsString;
  edDigAgencia.Text := qryAgencia.FieldByName('NUMAGENCIA').AsString;
end;

procedure TfrmCadResponsa.dbedContaCorrenteExit(Sender: TObject);
begin
  inherited;
  If Trim(qryBanco.FieldByName('FLGVALIDACC').AsString) = 'S'
   Then try
          CalculaDV.TipoConta := rgrpTipoConta.ItemIndex + 1;
          if not CalculaDV.ValidaConta( qryBanco.FieldByName('NumBanco').AsString,
                                        qryAgencia.FieldByName('Numagencia').AsString,
                                        dbedContaCorrente.Text,
                                        True)
          then dbedContaCorrente.Text := '';
        finally
           CalculaDv.Free;
        end;
end;

procedure TfrmCadResponsa.edDigBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigBanco.Text) = '' then Exit;
  if qryBanco.Locate('NumBanco',Trim(edDigBanco.Text),[loCaseInsensitive, loPartialKey])
  then begin
     dblkpcmbBanco.Text := qryBanco.FieldByName('Banco').AsString;
     dblkpcmbBanco.PerformSearch;
     dblkpcmbBanco.OnCloseUp(self,qryBanco,nil,false);  
     edDigAgencia.Text := '';
     dblkpcmbAgencia.Text := '';
  end;
end;

procedure TfrmCadResponsa.edDigAgenciaExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigAgencia.Text) = '' then Exit;
  if qryAgencia.Locate('NumAgencia',Trim(edDigAgencia.Text),[loCaseInsensitive, loPartialKey])
  then begin
     dblkpcmbAgencia.Text := qryAgencia.FieldByName('Agencia').AsString;
     dblkpcmbAgencia.PerformSearch;
     dblkpcmbAgencia.OnCloseUp(self,qryAgencia,nil,false);  
  end;
end;

procedure TfrmCadResponsa.FormCreate(Sender: TObject);
begin
  inherited;
  CalculaDV := TCalcDV.Create;
  qryContaBancaria.Prepare;
end;

procedure TfrmCadResponsa.bbtnOkDetClick(Sender: TObject);
begin

 if (pgctrlDetalhe.ActivePage = tbsTelefone) then  //SOL 127643 Thiago Passos
     begin
        if chkTipoTelefone.Checked[3] then
          if StrToInt(DBEDNUMERO.text[1]) < 6 then
           begin
            MessageDlg('Número de telefone celular inválido.', mtInformation, [mbOK], 0);
            exit;
           end;

        if Length(DBEDDDD.Text) <> 2 then
          begin
            MessageDlg('Número DDD inválido.', mtInformation, [mbOK], 0);
            exit;
           end;

        if StrToInt(DBEDDDD.Text[1])=0 then
          begin
            MessageDlg('Número DDD inválido.', mtInformation, [mbOK], 0);
            exit;
           end;
     end;


  if (pgctrlDetalhe.ActivePage = tbsContaBancaria)
  then begin
     if not VerificaContaBancaria then Exit;
  end;
  inherited;
end;

function TfrmCadResponsa.VerificaContaBancaria:boolean;
Var qryPreferencial:TwwQuery;
begin
   Result := False;
   if Trim(dblkpcmbBanco.Text) = '' then
      begin
           MsgDlg('O Banco deve ser informado antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
           dblkpcmbBanco.SetFocus;
           Exit;
      end;

   if Trim(dblkpcmbAgencia.Text) = '' then
      begin
           MsgDlg('A Agência Bancária deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
           dblkpcmbAgencia.SetFocus;
           Exit;
      end;

   if dbgrpContaPref.ItemIndex = 1 then
      begin
         qryPreferencial := TwwQuery.Create(Nil);

         qryPreferencial.close;
         qryPreferencial.DatabaseName := 'BaseDados';
         qryPreferencial.sql.Clear;
         qryPreferencial.sql.Add(' SELECT COUNT(CONTABANCARIA.FLGCONTAPREF) FLGCONTAPREF  ');
         qryPreferencial.sql.Add(' FROM   CONTABANCARIA, PESSOA A,PESSOA B, AGENCIABANCARIA, BANCO  ');
         qryPreferencial.sql.Add(' WHERE  CONTABANCARIA.IDPESSOA     = ' + qry.FieldByName('IDPESSOA').AsString );
         qryPreferencial.sql.Add(' AND    CONTABANCARIA.IDAGENCIA    = A.IDPESSOA  ');
         qryPreferencial.sql.Add(' AND    CONTABANCARIA.IDAGENCIA    = AGENCIABANCARIA.IDPESSOA  ');
         qryPreferencial.sql.Add(' AND    AGENCIABANCARIA.IDBANCO    = B.IDPESSOA  ');
         qryPreferencial.sql.Add(' AND    AGENCIABANCARIA.IDBANCO    = BANCO.IDpessoa  ');
         qryPreferencial.sql.Add(' AND    CONTABANCARIA.FLGCONTAPREF = 1  ');
         qryPreferencial.open;

         if qryPreferencial.FieldByName('FLGCONTAPREF').AsInteger > 0 then
            begin
                 MsgDlg('Conta preferencial já cadastrada.','Erro',mtError,[mbOk,mbHelp],0);
                 dbgrpContaPref.ItemIndex := 0;
                 dbgrpContaPref.SetFocus;
                 FreeAndNil(qryPreferencial);
                 Exit;
            end;
         FreeAndNil(qryPreferencial);
      end;

   if rgrpTipoConta.ItemIndex < 3 then  
   begin
      if Trim(dbedContaCorrente.Text) = '' then
         begin
              MsgDlg('A Conta Corrente deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
              dbedContaCorrente.SetFocus;
              Exit;
         end;
   End;

   Result := True;
end;

procedure TfrmCadResponsa.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) and
     (qryContaBancaria.State in [dsInsert,dsEdit])
  then begin
     if not VerificaContaBancaria
     then begin
        pgctrlDetalhe.ActivePage := tbsContaBancaria;
        tbcDetalhe.TabIndex := 4;
        Abort;
     end;
  end;
end;

procedure TfrmCadResponsa.FormDestroy(Sender: TObject);
begin
  inherited;
  CalculaDV.Free;
end;

procedure TfrmCadResponsa.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  iIdResponsavelGeral := qry.FieldByName('IdPessoa').AsInteger;
end;

procedure TfrmCadResponsa.bbtnConfirmarClick(Sender: TObject);
 begin
  inherited;
  //edilaine - SIG71995 - inicio
  if bExecutaCommitDados then
  begin
    if qryContaBancaria.UpdatesPending then
        qryContaBancaria.CommitUpdates;
  end
  else
  begin
    if qryContaBancaria.UpdatesPending then
        qryContaBancaria.ApplyUpdates;
  end;
  //edilaine - SIG71995 - dim
end;

procedure TfrmCadResponsa.CmeDetalheInsert(Sender: TObject);
begin
   edDigBanco.Text         := '';
   edDigAgencia.Text       := '';                            
   inherited;
end;

procedure TfrmCadResponsa.qryContaBancariaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryContaBancaria.State in [dsinsert]
  then begin
     qryContaBancaria.FieldByName('IDPESSOA').AsInteger := qry.FieldByName('IdPessoa').AsInteger;
     qryContaBancaria.FieldByName('IDCBANCARIA').AsInteger := LeUltRegistro(Nil,'CONTABANCARIA');
  end;
end;

procedure TfrmCadResponsa.sbtnAltDetClick(Sender: TObject);
begin
  If QryContaBancaria.Active = True Then Begin
    qryAgencia.Close;
    qryAgencia.ParamByName('pIdBanco').AsString :=
      QryContaBancaria.FieldbyName('IDBANCO').AsString;
    qryAgencia.Open;
  End;
  inherited;
  OpDetalhe := 'A';
end;

procedure TfrmCadResponsa.CmeCadastroConfirma(Sender: TObject);
begin
   try
     //edilaine - SIG71995 - inicio
     if bExecutaCommitDados then
     begin
        if OpDetalhe <> 'E'
        then AplicaAlteracoes([qry,QryContaBancaria])
        else AplicaAlteracoes([QryContaBancaria,qry]);
     end
     else
     begin
        if OpDetalhe <> 'E'
        then AplicaUpdates([qry,QryContaBancaria])
        else AplicaUpdates([QryContaBancaria,qry]);
     end;
     //edilaine - SIG71995 - fim
   except
     Raise;
   end;
   OpDetalhe := '';

   inherited;

   Try
     //BRUNO AZEVEDO SOL 137519 KINTANA 831220
     If Not Sistema.GravaLogOperacoes(Self.Caption, bExecutaCommitDados {True}) Then     //edilaine - SIG71995
       raise exception.Create('Erro ao gravar Log.')
   Except
   End;
end;

procedure TfrmCadResponsa.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  OpDetalhe := '';
end;

procedure TfrmCadResponsa.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  OpDetalhe := 'I';
end;

procedure TfrmCadResponsa.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  OpDetalhe := 'E';
end;

procedure TfrmCadResponsa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  // Se Form de Consulta Geral de Pessoa estiver aberto então retorna a normal.
  WindowState:= wsNormal;
  If frmConsPessoaGeral <> Nil
   Then frmConsPessoaGeral.WindowState:= wsNormal;

   //edilaine - SIG71995 - inicio
   if bExecutaCommitDados then
   begin
      //BRUNO AZEVEDO SOL 137519 KINTANA 831220
      if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
        dtmBaseDados.dbBaseDados.RollBack;
   end;
   //edilaine - SIG71995 - fim
  end;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
end;

procedure TfrmCadResponsa.ValidaCampoNumerico(var Key: char);
begin              //SOL 127643 Thiago Passos
  if key<>'' then
   begin
      if not (Key = #8 ) then
       begin
        If Not (Key In ['0'..'9'] )  Then
          KEY := #0;
       end;
   end;

end;

procedure TfrmCadResponsa.ValidaCampoNumericoDDD(var Key: char);
begin        //SOL 127643 Thiago Passos
  if key<>'' then
   begin
      if not (Key = #8 ) then
       begin
        If Not (Key In ['1'..'9'] )  Then
          KEY := #0;
       end;
   end;

end;


procedure TfrmCadResponsa.DBEDDDDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;   //SOL 127643 Thiago Passos
      ValidaCampoNumericoDDD(key);
end;

procedure TfrmCadResponsa.DBEDNUMEROKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
            //SOL 127643 Thiago Passos
      ValidaCampoNumerico(key);
end;


End.

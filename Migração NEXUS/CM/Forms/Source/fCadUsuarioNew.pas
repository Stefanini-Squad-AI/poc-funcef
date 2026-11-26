//*****************************************************************************
// SISTEMA : Forms CM
{/--------------------------------------------------------------------------------

//******************************************************************************
//N. SIG.............: 137435
//Data da Alteração..: 14/07/2023
//Responsável........: André Imakawa
//Descrição..........: Criação da validação maiuscula, minuscula e Especial
//******************************************************************************
//N. SIG.............: 120429
//Data da Alteração..: 26/10/2021
//Responsável........: Ewerton Beltramini
//Descrição..........: Caso o email não seja localizado, preenche com a sugestão
//                     automática.
//******************************************************************************
//Rotina.............: dbrgrpTipoUsuarioChange, DbEdUsuarioExit
//N. SIG.............: 118471
//Data da Alteração..: 16/08/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Possibilitar o preenchimento automático de e-mail para
//                     novos empregados FUNCEF, na sua inserção.
//******************************************************************************
// Rotinas   : btnAuditoriaClick
// Data      : 12/07/2016
// Autor     : Darivaldo Alencar
// SIG       : 20724
//******************************************************************************
// Rotinas   : btnAuditoriaClick
// Data      : 12/07/2016
// Autor     : Darivaldo Alencar
// SIG       : 20724
//******************************************************************************
// Nº SOL: 253300/17804
// Nº KINTANA/PPM: 1093186
// Data da Alteração: 10.11.2015
// Responsável: Michelle S. Mota
// Descrição: Melhoria na funcionalidade de cadastro de usuários disponível em
// todos os módulos do PLANUS.
//******************************************************************************   
-------------------------------------------------------------------------------
Data           : 05/03/2010
Autor          : Bruno Bastos
Sol_Kintana    : 131911_754836
Descrição      : Passar a gravar o campo FlgDispFinanc quando incluir um novo usuário.
----------------------------------------------------------------------------------
Data           : 18.07.2007
Autor          : Antonio Marcos - amf
Pendência      : 23929
Descrição      : Correção da crítica de email. Estava criticando sem pré-condição.
----------------------------------------------------------------------------------
Data           : 02.04.2007
Autor          : Antonio Marcos - amf
Pendência      : 23929 - [Para liberação no padrão 5.10.16]
Descrição      : Critica o email. Procura o caracter "@" para validar o email.
----------------------------------------------------------------------------------
Data           : 15.03.2007
Autor          : Antonio Marcos - amf
Pendência      : 24755
Descrição      : Corrige o erro de duplicidade do IDPESSOA (Tabela Pessoa) que estava gerando um IDUSUARIO diferente do IDPESSOA Original.
----------------------------------------------------------------------------------
Data           : 23.02.2007
Autor          : Antonio Marcos - amf
Pendência      : 24459
Descrição      : Alteração da rotina de envio de email. Foi utilizado o método da biblioteca JCL(JclMapi),
                 que já funciona no envio de email do padrão de relatórios.
-----------------------------------------------------------------------------------------------------------
//  Autor      : David
//  Data       : 15.12.2003
//  Descrição  : Implementado envio de aviso de alteração e/ou desbloqueio de
//               senha para usuários com e-mail cadastrados.
//  Pendencia  : 14525
//------------------------------------------------------------------------------}

unit fCadUsuarioNew;

interface

uses
  Windows, Messages, SysUtils, Forms, Classes, Graphics, Controls, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Mask, wwdbedit, wwdbdatetimepicker,
  CMDateTimePicker, Db, Wwdatsrc, DBTables, Wwquery, uDataBase, ComCtrls,
  uAutorizacao, ShellApi, JCLSysUtils, fResetSenha, {amf 23.02.2007 24459}JclMapi;

const
  LF = #13#10; 

type
  TfrmCadUsuarioNew = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    lblCargoTipo: TLabel;//Michelle Mota Sol: 253300/17804 PPM: 1093186
    DbCkbMudarSenha: TDBCheckBox;
    DBCkbPodeMudarSenha: TDBCheckBox;
    DBCkbSenhaPermanente: TDBCheckBox;
    DBCkbHabilitado: TDBCheckBox;
    DBCkbBloqueado: TDBCheckBox;
    DbEdUsuario: TwwDBEdit;
    DbEdNome: TwwDBEdit;
    dbedtCargoTipo: TwwDBEdit;//Michelle Mota Sol: 253300/17804 PPM: 1093186
    LblValidade: TLabel;
    DtSenha: TCMDateTimePicker;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BtnGrupos: TBitBtn;
    BtnDireitos: TBitBtn;
    Label4: TLabel;
    EdSenha: TEdit;
    EdSenha2: TEdit;
    Label5: TLabel;
    BtnReset: TBitBtn;
    btnNomePessoa: TSpeedButton;
    Label6: TLabel;
    dtBloqueioAte: TCMDateTimePicker;
    Label7: TLabel;
    DBEMAIL: TwwDBEdit;
	//Início - Michelle Mota Sol: 253300/17804 PPM: 1093186
    lblLotacaoEmpresa: TLabel;
    dbedtLotacaoEmpresa: TwwDBEdit;
    btnLotacaoEmpresa: TSpeedButton;
    bvl1: TBevel;
    dbrgrpTipoUsuario: TDBRadioGroup;
    btnAuditoria: TBitBtn;
	//Término - Michelle Mota Sol: 253300/17804 PPM: 1093186
    procedure BtnGruposClick(Sender: TObject);
    procedure BtnDireitosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBCkbSenhaPermanenteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnResetClick(Sender: TObject);
    procedure EdSenhaChange(Sender: TObject);
    procedure DBCkbPodeMudarSenhaClick(Sender: TObject);
    procedure btnNomePessoaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
	//Início - Michelle Mota Sol: 253300/17804 PPM: 1093186
    procedure btnLotacaoEmpresaClick(Sender: TObject);
    procedure dbrgrpTipoUsuarioChange(Sender: TObject);
    procedure btnAuditoriaClick(Sender: TObject);
    procedure DbEdUsuarioExit(Sender: TObject);
	//Término - Michelle Mota Sol: 253300/17804 PPM: 1093186
  private
    { Private declarations }
    bObrigaMudaSenha: Boolean;

    { Variáveis criadas para envio de e-mail na alteração e no desbloqueio.}
    bAlterouSenha : boolean;
    sSenhaNaoCripto : string;
    sBloqueadoAnt : string;

    bSenhaLetraMaiuscula, bSenhaLetraMinuscula, bSenhaEspecial: Boolean;  // Andre Imakawa - SIG137435

    { Rotina de envio de e-mail.}
    procedure EnviaEMail( sEndereco, sAssunto, sMensagem: string);

    function SenhaAleatoria : string;
    function SenhaAleatoriaBD : string;

  public
    { Public declarations }
  end;

function StrIsAlphaNum(const S: AnsiString;var sMsg: String; abSenhaLetraMaiuscula, abSenhaLetraMinuscula, abSenhaEspecial:Boolean): Boolean; // Andre Imakawa - SIG137435
function ExistsMultChar(const S: AnsiString): Boolean;


var
  frmCadUsuarioNew: TfrmCadUsuarioNew;

implementation

Uses ftelaAut, uSistema, FGrupoxUsu, FDireitosUsu, fUserManager, dautorizacao,
     uMensErro, uCripto, dBaseDados, uCmConectaBanco, uCtrlGrupoUsu,
  fUsuxTabela;

{$R *.DFM}

function StrIsAlphaNum(const S: AnsiString;var sMsg: String; abSenhaLetraMaiuscula, abSenhaLetraMinuscula, abSenhaEspecial:Boolean): Boolean;
var
  I: Integer;
  bIsAlpha, bIsNum, bIsAlphaUpper, bIsAlphaLower, bIsEspecial: Boolean; // Andre Imakawa - SIG137435

  function CharIsAlpha(const C: AnsiChar): Boolean;
  begin
    Result := (C In ['A'..'Z']) or (C In ['a'..'z']);
  end;

  function CharIsNum(const C: AnsiChar): Boolean;
  begin
    Result := (C In ['0'..'9']);
  end;

  // Andre Imakawa - SIG137435 - Inicio
  function CharIsAlphaUpper(const C: AnsiChar): Boolean;
  begin
    Result := (C In ['A'..'Z']);
  end;

  function CharIsAlphaLower(const C: AnsiChar): Boolean;
  begin
    Result := (C In ['a'..'z']);
  end;

  function CharIsEspecial(const C: AnsiChar): Boolean;
  begin
    Result := not((C In ['A'..'Z']) or (C In ['a'..'z']) or (C In ['0'..'9']));
  end;
  // Andre Imakawa - SIG137435 - Fim
begin

  bIsAlpha := False;
  bIsNum := False;
  bIsAlphaUpper := False;  // Andre Imakawa - SIG137435
  bIsAlphaLower := False;  // Andre Imakawa - SIG137435
  bIsEspecial := False;    // Andre Imakawa - SIG137435


  for I := 1 to Length( S ) do begin
      if Not bIsAlpha then
         bIsAlpha := CharIsAlpha( S[ I ] );

      if Not bIsNum then
         bIsNum := CharIsNum( S[ I ] );

      // Andre Imakawa - SIG137435 - Inicio
      if Not bIsAlphaUpper then
         bIsAlphaUpper := CharIsAlphaUpper( S[ I ] );

      if Not bIsAlphaLower then
         bIsAlphaLower := CharIsAlphaLower( S[ I ] );

      if Not bIsEspecial then
         bIsEspecial := CharIsEspecial( S[ I ] );
      // Andre Imakawa - SIG137435 - Fim
  end;

  // Ver com o Gustavo onde tem um query que eu possa utilizar para testar
  // os parametros

  // Testa se precisa ter numeros e/ou letras
  // Andre Imakawa - SIG137435 - Inicio
  {
  If Sistema.SenhaLetra Then
     If Sistema.SenhaNumero Then
        Result := bIsAlpha And bIsNum
     Else
        Result := bIsAlpha
  Else
     If Sistema.SenhaNumero Then
        Result := bIsNum
     Else
        Result := True;
  }
  Result := True;

  If Sistema.SenhaLetra Then
  begin
    Result := Result and bIsAlpha;
    sMsg := sMsg + '- Letras' + #13;
  end;

  if Sistema.SenhaNumero Then
  begin
    Result := Result and bIsNum;
    sMsg := sMsg + '- Números' + #13;
  end;

  if abSenhaLetraMaiuscula Then
  begin
    Result := Result and bIsAlphaUpper;
    sMsg := sMsg + '- Ao menos uma letra maiúscula'+ #13;
  end;

  if abSenhaLetraMinuscula Then
  begin
    Result := Result and bIsAlphaLower;
    sMsg := sMsg + '- Ao menos uma letra minúscula'+ #13;
  end;

  if abSenhaEspecial Then
  begin
    Result := Result and bIsEspecial;
    sMsg := sMsg + '- Ao menos um caractere especial'+ #13;
  end;
  // Andre Imakawa - SIG137435 - Fim
end;

function ExistsMultChar(const S: AnsiString): Boolean;
Var
   x: Integer;
Begin
    Result := False;

    If Trim( S ) <> '' Then Begin
       For x := 2 To Length( S ) Do
           If S[ x ] = S[ x - 1 ] Then Begin
              Result := True;
              Break;
           End;
    End;
End;

procedure TfrmCadUsuarioNew.BtnGruposClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal( FrmGrupoxUsu, TFrmGrupoxUsu );
end;

procedure TfrmCadUsuarioNew.BtnDireitosClick(Sender: TObject);
var
  iusuario, iespacesso: Integer;
begin
  inherited;
  With FrmUserManager Do
       If bnovo Then Begin
          iusuario   := CdsUsuario.FieldByName( 'idusuario' ).AsInteger;
          iespacesso := -99;
       End Else Begin
          //iusuario   := StrToInt( lstUsuario.ItemFocused.SubItems[ 2 ] ); // Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          //iespacesso := StrToInt( lstUsuario.ItemFocused.SubItems[ 3 ] ); // Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          iusuario   := CdsUsuario.FieldByName('IDUSUARIO').AsInteger; // Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          iespacesso := CdsUsuario.FieldByName('IDESPACESSO').AsInteger; // Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       End;

  With TFrmDireitosUsu.Create( iusuario, iespacesso, True, Self ) Do
       Try
          ShowModal;
       Finally
          Free;
       End;
end;

procedure TfrmCadUsuarioNew.FormCreate(Sender: TObject);
var
   iProxPessoa, iProxEspAcesso: Integer;
begin
  inherited;

  bAlterouSenha := False;

  With FrmUserManager, CdsUsuario  Do Begin
		// Início - Michelle Mota Sol: 253300/17804 PPM: 1093186
	   //DbEdUsuario.DataSource          := dsUsuario;
       //DbEdNome.DataSource             := dsPessoa;
       //DbEdDescricao.DataSource        := dsUsuario;
	   // Término - Michelle Mota Sol: 253300/17804 PPM: 1093186

       DbCkbMudarSenha.DataSource      := dsUsuario;
       DbCkbPodeMudarSenha.DataSource  := dsUsuario;
       DbCkbSenhaPermanente.DataSource := dsUsuario;
       DbCkbHabilitado.DataSource      := dsUsuario;
       DbCkbBloqueado.DataSource       := dsUsuario;
       DtSenha.DataSource              := dsUsuario;
       dtBloqueioAte.datasource        := dsUsuario;
       dtBloqueioAte.mindate           := date;
       dbEdUsuario.DataSource          := dsUsuario;//Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       dbrgrpTipoUsuario.DataSource    := dsUsuario;//Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       
	   //dbEmail.DataSource              := dsPessoa;//Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       DtSenha.MinDate := Date;
       DtSenha.MaxDate := Date + 180;

       If Active Then
          Close;

       If bnovo Then
       Begin
          bObrigaMudaSenha := false;
		  //btnNomePessoa.Enabled := True;//Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          //DbEdNome.Enabled := True;//Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          iProxPessoa := -99;

          SqlUsuario.Prepare;
          SqlUsuario.ParamByName( 'IdUsuario' ).AsInteger := iProxPessoa;
          SqlUsuario.Open;

          Append;
          FieldByName( 'IdUsuario' ).AsInteger := iProxPessoa;

          SqlGrupoAtu.Prepare;
          SqlGrupoAtu.ParamByName( 'IdGrupo' ).AsInteger   := -99;
          SqlGrupoAtu.ParamByName( 'IdUsuario' ).AsInteger := iProxPessoa;
          SqlGrupoAtu.Open;

          SqlPessoa.Prepare;
          SqlPessoa.ParamByName( 'idpessoa' ).AsInteger := iProxPessoa;
          SqlPessoa.Open;

          CdsPessoa.Append;
          CdsPessoa.FieldByName( 'idpessoa' ).AsInteger := iProxPessoa;

          BtnReset.Enabled := False;

          iProxEspAcesso := -99;
          FieldByName( 'IdEspAcesso' ).Value := iProxEspAcesso;
          FieldByName( 'FlgDispFinanc' ).AsString := 'N'; //Bruno Bastos - Sol: 131911 - Kintana: 754836 - 05/03/2010

          sBloqueadoAnt := '';

          // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          dbrgrpTipoUsuario.ReadOnly := False;
          CdsUsuario.FieldByName('FLGTIPOUSU').AsInteger := 1;
          // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       End
       Else
       Begin
	      //btnNomePessoa.Enabled := False;//Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          SqlUsuario.Prepare;
          SqlUsuario.ParamByName( 'IdUsuario' ).AsInteger := StrToInt( lstUsuario.ItemFocused.SubItems[ 4 ] );  //Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          SqlUsuario.Open;

          // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          dbrgrpTipoUsuario.ReadOnly := True;
          dbEdUsuario.DataSource          := dsPesqPessoa;
          dbEdNome.DataSource             := dsPesqPessoa;
          dbEmail.DataSource              := dsPesqPessoa;
          dbEdtCargoTipo.DataSource       := dsPesqPessoa;

          SqlPesqPessoa.Prepare;
          SqlPesqPessoa.ParamByName( 'IdPessoa' ).AsInteger := StrToInt( lstUsuario.ItemFocused.SubItems[ 4 ] );
          SqlPesqPessoa.Open;

          dbEdtLotacaoEmpresa.Text :=  cdsPesqPessoa.fieldbyname('AREA').AsString;
          // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186

          If IsEmpty Then Begin
             Close;
             MsgDlg( 'Usuário não encontrado', 'Cadastro de Usuário', MtError, [Mbok], 0 );
             FrmCadUsuarioNew.Close;
             Exit;
          End;

          bObrigaMudaSenha := (FieldByName('BLOQUEADO').AsString = 'S');

          SqlGrupoAtu.Prepare;
          SqlGrupoAtu.ParamByName( 'IdGrupo' ).AsInteger   := -99;
          SqlGrupoAtu.ParamByName( 'IdUsuario' ).AsInteger := StrToInt( lstUsuario.ItemFocused.SubItems[ 4 ] ); //Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          SqlGrupoAtu.Open;

          SqlPessoa.Prepare;
          SqlPessoa.ParamByName( 'idpessoa' ).AsInteger := StrToInt( lstUsuario.ItemFocused.SubItems[ 4 ] ); //Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          SqlPessoa.Open;
          CdsPessoa.Edit;

          sBloqueadoAnt   := FieldByName('BLOQUEADO').AsString;

          Edit;
       END;

       DtSenha.Enabled := ( FieldByName( 'ValidadeSenha' ).Value <> Null );
       LblValidade.Enabled := DtSenha.Enabled;
  End;
end;

procedure TfrmCadUsuarioNew.DBCkbSenhaPermanenteClick(Sender: TObject);
begin
  inherited;
  With FrmUserManager.CdsUsuario Do
       If DbCkbSenhaPermanente.Checked Then
       Begin
          LblValidade.Enabled := False;
          DtSenha.Enabled := False;
          DtSenha.ClearDateTime;

          If State In [ DsEdit, DsInsert ] Then
             FieldByName( 'ValidadeSenha' ).Clear;
       End
       Else
       Begin
          LblValidade.Enabled := True;
          DtSenha.Enabled := True;

          If State In [ DsEdit, DsInsert ] Then
             If FieldByName( 'ValidadeSenha' ).Value = Null Then
                FieldByName( 'ValidadeSenha' ).Value := Date + 30;
       End;
end;

procedure TfrmCadUsuarioNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
   i: Integer;
   sSenha, sMensagem : string;


// Andre Imakawa - SIG137435 - Inicio
Procedure BuscaParametrosSeguranca;
var
  QryAux: TwwQuery;
  auxSql: string;
Begin
  try
    try
      auxSql := ' SELECT ' +
                '   FLGSENHALETRAS, FLGSENHANUMEROS, FLGREPETESENHA, ' +
                '   FLGALTSENHASUPER, TAMMINSENHA, TAMHISTORICOSENHA, ' +
                '   TEMPOTRAVA, SENHASUPER, FLGVALSENHANOME ' +
                '   ,FLGSENHAMAIUSCULA, FLGSENHAMINUSCULA, FLGSENHAESPECIAL  ' +
                ' FROM ' +
                '    SEGURANCA ';
      QryAux := TwwQuery.Create(Application);
      QryAux.DataBaseName := 'BaseDados';

      QryAux.close;
      QryAux.SQL.clear;
      QryAux.SQL.Add(auxSql);
      QryAux.Open;

      if not QryAux.isempty then
      begin
        bSenhaLetraMaiuscula := (QryAux.fieldbyname('FLGSENHAMAIUSCULA').AsString = 'S') ;
        bSenhaLetraMinuscula := (QryAux.fieldbyname('FLGSENHAMINUSCULA').AsString = 'S') ;
        bSenhaEspecial :=       (QryAux.fieldbyname('FLGSENHAESPECIAL').AsString = 'S') ;
      end;
    except
      bSenhaLetraMaiuscula := False;
      bSenhaLetraMinuscula := False;
      bSenhaEspecial       := False;
    end;
  finally
    FreeAndNil(QryAux);
  end;
End;
// Andre Imakawa - SIG137435 - Fim

begin
  inherited;
  If ModalResult = MrOk Then
  Begin
     BuscaParametrosSeguranca; // Andre Imakawa - SIG137435
     if bObrigaMudaSenha then
     begin
        if (Not (FrmUserManager.CdsUsuario.State in [DsEdit,DsInsert])) then
           FrmUserManager.CdsUsuario.Edit;
        FrmUserManager.CdsUsuario.FieldByName('MUDARSENHA').AsString := 'S';
     end;

     If ( Trim( EdSenha.Text ) = '' ) and ( Trim( EdSenha2.Text ) = '' ) Then
        With FrmUserManager, CdsUsuario Do
        Begin
             If bnovo Then
             Begin
                frmResetSenha := TfrmResetSenha.Create( Self );
                try
                  if frmResetSenha.ShowModal = mrOk then
                  begin
                    if frmResetSenha.rgrpSenha.ItemIndex = 0 then
                      sSenha := 'MUDESUASENHA'
                    else
                      //sSenha := SenhaAleatoria; // Andre Imakawa - SIG 137435
                      sSenha := SenhaAleatoriaBD; // Andre Imakawa - SIG 137435
                  end
                  else
                    Abort;
                finally
                  frmResetSenha.Free;
                end;
                If (FieldByName( 'IDUSUARIO' ).AsInteger <= 0) Then
                   FieldByName( 'Senha' ).AsString := sSenha
                Else
                   FieldByName( 'Senha' ).AsString := CriptografarHash( sSenha, FieldByName( 'IDUSUARIO' ).AsInteger, 15 );
             End;
        End
     Else
     Begin
        If FrmUserManager.bnovo Then
           For i := 0 To FrmUserManager.lstUsuario.Items.Count - 1 Do
               If FrmUserManager.CdsUsuario.FieldByName( 'NomeUsuario' ).AsString = FrmUserManager.lstUsuario.Items[ i ].Caption Then Begin
                  MsgDlg( 'Já existe usuário cadastrado com esse nome', 'Cadastro de Usuário', MtError, [Mbok], 0 );
                  Action := CaNone;
                  Exit;
               End;

        If EdSenha.Text <> EdSenha2.Text Then Begin
           MsgDlg( 'As novas senha digitadas são diferentes.', 'Cadastro de Usuário', MtError, [Mbok], 0 );
           edSenha.Clear;
           edSenha2.Clear;
           edSenha.SetFocus;
           Action := CaNone;
           Exit;
        End Else
        If Length( edSenha.Text ) < Sistema.SenhaTamMin then begin
           MsgDlg( 'Senha deve ter pelo menos ' + IntToStr( Sistema.SenhaTamMin ) +
                   ' caracteres', 'Alterar senha', mtError, [mbOk, mbHelp], 0 );
           edSenha.Clear;
           edSenha2.Clear;
           edSenha.SetFocus;
           Action := CaNone;
           Exit;
        End Else
        If Not StrIsAlphaNum( edSenha.Text, sMensagem, bSenhaLetraMaiuscula, bSenhaLetraMinuscula, bSenhaEspecial ) Then Begin
           // Andre Imakawa - SIG137435 - Inicio
           MsgDlg( 'Senha deve possuir:' + #13 + sMensagem, 'Alterar senha',
                   mtError, [mbOk, mbHelp], 0 );
           {
           If Sistema.SenhaLetra Then
              If Sistema.SenhaNumero Then
                 MsgDlg( 'Senha deve possuir números e letras', 'Alterar senha',
                         mtError, [mbOk, mbHelp], 0 )
              Else
                 MsgDlg( 'Senha deve possuir pelo menos uma letra', 'Alterar senha',
                         mtError, [mbOk, mbHelp], 0 )
           Else
              If Sistema.SenhaNumero Then
                 MsgDlg( 'Senha deve possuir pelo menos um número', 'Alterar senha',
                         mtError, [mbOk, mbHelp], 0 )
              Else
                 MsgDlg( 'Senha inválida', 'Alterar senha', mtError, [mbOk, mbHelp], 0 );
           }
           // Andre Imakawa - SIG137435 - Fim
           edSenha.Clear;
           edSenha2.Clear;
           edSenha.SetFocus;
           Action := CaNone;
           Exit;
        End Else
        If ExistsMultChar( edSenha.Text ) Then Begin
           MsgDlg( 'Senha não pode ter caracteres repetidos consecutivos',
                   'Alterar senha', mtError, [ mbOk, mbHelp ], 0 );
           edSenha.Clear;
           edSenha2.Clear;
           edSenha.SetFocus;
           Action := CaNone;
           Exit;
        End Else
        If (Sistema.ValidaSenhaNome) And
           (( Pos( EdSenha.Text, FrmUserManager.CdsPessoa.FieldByName( 'Nome' ).AsString ) <> 0 ) Or
            ( Pos( EdSenha.Text, UpperCase( FrmUserManager.CdsUsuario.FieldByName( 'NomeUsuario' ).AsString ) ) <> 0 )) Then Begin
           MsgDlg( 'A Senha não pode conter partes do Nome ou Sobrenome do Usuário\Login', 'Alterar senha', mtError, [ mbOk, mbHelp ], 0 );
           edSenha.Clear;
           edSenha2.Clear;
           edSenha.SetFocus;
           Action := CaNone;
           Exit;
        End Else
           With FrmUserManager Do
           Begin

                If Not bnovo Then
                   GravaHistSenha( CdsUsuario.FieldByName( 'IDUSUARIO' ).AsInteger,
                                   CdsUsuario.FieldByName( 'Senha' ).AsString,
                                   EdSenha.Text );

                If CdsUsuario.FieldByName( 'IDUSUARIO' ).AsInteger <= 0 Then
                   CdsUsuario.FieldByName( 'Senha' ).Value := EdSenha.Text
                Else
                   CdsUsuario.FieldByName( 'Senha' ).Value := CriptografarHash( EdSenha.Text, CdsUsuario.FieldByName( 'IDUSUARIO' ).AsInteger, 15 );
           End;
     End;

     With FrmUserManager, CdsUsuario Do
     Begin
          Try
             // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
             if dbrgrpTipoUsuario.ItemIndex = 1 then begin
               If Not (CdsPessoa.State in [ DsEdit, DsInsert ]) Then CdsPessoa.Edit;
               If CdsPessoa.State in [ DsEdit, DsInsert ] Then
               Begin
                  CdsPessoa.FieldbyName('NOME').AsString := DbEdNome.Text;
                  CdsPessoa.FieldbyName('EMAIL').AsString := DbEmail.Text;
                  CdsPessoa.FieldbyName('RAZAOSOCIAL').AsString := DbEdNome.Text;
                  CdsPessoa.Post;
               end;
             end;
             FieldByName('NomeUsuario').AsString := dbEdUsuario.text;
             Post;
             // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186

             //Chama Control para aplicar as alterações aqui
             If Not GrupoUsu.ProcessaGrupoUsu( null, null, null, null, CdsUsuario.Data, CdsPessoa.Data, CdsGrupoAtu.Data, CdsAutorizaAtu.Data, CdsAtuAutorizaRpt.Data, CdsAtuAutorizaConsulta.Data, opUsuario) Then
             Begin
                MsgDlg(GrupoUsu.MessageInfo, 'Atenção', mtError, [MbOk], 0);
                Abort;
             End;


             If bnovo Then
             Begin
                MontaList( SqlPesqUsuario, lstUsuario, 0 );
             End
             Else
             Begin
                // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
                lstUsuario.ItemFocused.Caption := FieldByName( 'NomeUsuario' ).Text;
                //lstUsuario.ItemFocused.SubItems[ 1 ] := FieldByName( 'Descricao' ).Text;
                lstUsuario.ItemFocused.SubItems[ 2 ] := dbedtLotacaoEmpresa.Text;
                lstUsuario.ItemFocused.SubItems[ 0 ] := CdsPessoa.FieldByName( 'Nome' ).Text;
                 if (DBCkbHabilitado.Checked) then
                   lstUsuario.ItemFocused.SubItems[ 3 ] := 'INATIVO'
                 else
                   lstUsuario.ItemFocused.SubItems[ 3 ] := 'ATIVO';
                // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
             End;
          Except
             On Exception Do
             Begin
                If CdsAtuAutorizaConsulta.ChangeCount > 0 Then
                   CdsAtuAutorizaConsulta.CancelUpdates;

                If CdsAtuAutorizaRpt.ChangeCount > 0 Then
                   CdsAtuAutorizaRpt.CancelUpdates;

                If CdsAutorizaAtu.ChangeCount > 0 Then
                   CdsAutorizaAtu.CancelUpdates;

                If CdsGrupoAtu.ChangeCount > 0 Then
                   CdsGrupoAtu.CancelUpdates;

                If CdsUsuario.ChangeCount > 0 Then
                   CdsUsuario.CancelUpdates;

                If CdsPessoa.ChangeCount > 0 Then
                   CdsPessoa.CancelUpdates;

                If bnovo Then
                      MsgDlg( 'Não foi possível incluir o novo usuário.',
                              'Alterar senha', mtError, [ mbOk, mbHelp ], 0 )
                   Else
                      MsgDlg( 'Não foi possível alterar o usuário.',
                              'Cadastro de Usuários', mtError, [ mbOk, mbHelp ], 0 );

             End;
          End;
     End;

    //--------------- Início das alterações
    with FrmUserManager do
    begin

      if not cdsPessoa.Active then
      begin
        SqlPessoa.ParamByName('IDPESSOA').AsInteger := CdsUsuario.FieldByName('IDUSUARIO').AsInteger;
        SqlPessoa.Open;
      end;

      if trim( cdsPessoa.FieldByName('EMAIL').AsString ) <> '' then
      begin

        if ( sBloqueadoAnt = 'S' ) and ( CdsUsuario.FieldByName('BLOQUEADO').AsString = 'N' ) then
        begin
          if MessageDlg('Este usuário possui um endereço de e-mail cadastrado. Deseja enviar-lhe uma mensagem informando o desbloqueio da senha?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            EnviaEMail( trim( cdsPessoa.FieldByName('EMAIL').AsString ),
            'Desbloqueio de senha no Planus',
            'Caro usuário;                                                                             ' + LF +
                                                                                                           LF +
            'Sua senha de acesso aos sistemas da solução Planus foi desbloqueada.                   ' + LF +
            iff( sSenhaNaoCripto = '', '', LF + 'Sua senha atual é: ' + LF + sSenhaNaoCripto + LF )      +
                                                                                                           LF +
            'Att.; '                                                                                     + LF +
            'Planus'                                                                                  );
        end
        else
        begin
          if bAlterouSenha then
            if MessageDlg('Este usuário possui um endereço de e-mail cadastrado. Deseja enviar-lhe uma mensagem informando a nova senha?',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              EnviaEMail( trim( cdsPessoa.FieldByName('EMAIL').AsString ),
              'Alteração de senha no Planus',
              'Caro usuário;                                                            ' + LF +
                                                                                            LF +
              'Sua senha de acesso aos sistemas da solução Planus foi alterada para: ' + LF +
              sSenhaNaoCripto                                                             + LF +
                                                                                            LF +
              'Att.; '                                                                    + LF +
              'Planus'                                                                 );
        end;
      end;
    end;
    //--------------- Fim das alterações


  End Else Begin
     With FrmUserManager, CdsUsuario Do
     Begin
          Cancel;
          If ChangeCount > 0 Then
             CancelUpdates;

          If CdsPessoa.State In [ DsEdit, DsInsert ] Then
             CdsPessoa.Cancel;

          If CdsAtuAutorizaConsulta.ChangeCount > 0 Then
             CdsAtuAutorizaConsulta.CancelUpdates;

          If CdsAtuAutorizaRpt.ChangeCount > 0 Then
             CdsAtuAutorizaRpt.CancelUpdates;

          If CdsAutorizaAtu.ChangeCount > 0 Then
             CdsAutorizaAtu.CancelUpdates;

          If CdsGrupoAtu.ChangeCount > 0 Then
             CdsGrupoAtu.CancelUpdates;

          If CdsPessoa.ChangeCount > 0 Then
             CdsPessoa.CancelUpdates;
     End;
  End;

  With FrmUserManager, CdsUsuario Do
  Begin
       CdsAtuAutorizaConsulta.Close;
       CdsAtuAutorizaRpt.Close;
       CdsAutorizaAtu.Close;
       CdsGrupoAtu.Close;
       Close;
       CdsPessoa.Close;
       //Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       cdsPesqTelaUsuario.Close;
       cdsPesqPessoa.Close;
	   // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
  End;
end;

procedure TfrmCadUsuarioNew.BtnResetClick(Sender: TObject);
var
  sSenha : string;
begin
  inherited;

  frmResetSenha := TfrmResetSenha.Create( Self );
  try
    if frmResetSenha.ShowModal = mrOk then
    begin
      if frmResetSenha.rgrpSenha.ItemIndex = 0 then
        sSenha := 'MUDESUASENHA'
      else
        //sSenha := SenhaAleatoria; // Andre Imakawa - SIG 137435
        sSenha := SenhaAleatoriaBD; // Andre Imakawa - SIG 137435
    end
    else
      Abort;
  finally
    frmResetSenha.Free;
  end;

  With FrmUserManager.CdsUsuario Do
  Begin
       EdSenha.Text  := '';
       EdSenha2.text := '';

       If FieldByName( 'IDUSUARIO' ).AsInteger <= 0 Then
          FieldByName( 'Senha' ).Value := sSenha
       Else
          FieldByName( 'Senha' ).Value := CriptografarHash( sSenha, FieldByName( 'IDUSUARIO' ).AsInteger, 15 );

       FieldByName( 'MudarSenha' ).Value := 'S';

       sSenhaNaoCripto := sSenha;
       bAlterouSenha   := True;

  End;
end;

procedure TfrmCadUsuarioNew.EdSenhaChange(Sender: TObject);
var
  sSenha : string;
begin
  inherited;

  bAlterouSenha := ( ( edSenha.Text <> '' ) or ( edSenha2.Text <> '' ) );

  With FrmUserManager, CdsUsuario, FieldByName( 'MudarSenha' ) Do
       If ( EdSenha.Text <> '' ) or ( EdSenha2.Text <> '' ) Then
       begin
          Value := 'N';

          if bAlterouSenha then sSenhaNaoCripto := edSenha.Text;

       end
       Else
          If bnovo Then
          Begin
             frmResetSenha := TfrmResetSenha.Create( Self );
             try
               if frmResetSenha.ShowModal = mrOk then
               begin
                 if frmResetSenha.rgrpSenha.ItemIndex = 0 then
                   sSenha := 'MUDESUASENHA'
                 else
                   sSenha := SenhaAleatoria;
               end
               else
                 Abort;
             finally
               frmResetSenha.Free;
             end;
             If FieldByName( 'IDUSUARIO' ).AsInteger <= 0 Then
                FieldByName( 'Senha' ).AsString := sSenha
             Else
                FieldByName( 'Senha' ).AsString := CriptografarHash( sSenha, FieldByName( 'IDUSUARIO' ).AsInteger, 15 );
             Value := 'S';

             if bAlterouSenha then sSenhaNaoCripto := sSenha;

          End Else
             Value := OldValue;
end;

procedure TfrmCadUsuarioNew.DBCkbPodeMudarSenhaClick(Sender: TObject);
begin
  inherited;
  With FrmUserManager.CdsUsuario Do
       If State in [ DsEdit, DsInsert ] Then
       Begin
          FieldByName( 'SenhaPermanente' ).Text := 'S';
          DBCkbSenhaPermanente.Enabled := ( Not DBCkbPodeMudarSenha.Checked );
       End;
end;

procedure TfrmCadUsuarioNew.btnNomePessoaClick(Sender: TObject);
begin
  inherited;
     With FrmUserManager Do Begin
          MontaPessoa.Executar;

       If Montapessoa.RetornouValor Then Begin
          CdsPessoa.Cancel;

          If bnovo Then Begin
             SqlPessoa.Prepare;
             SqlPessoa.ParamByName( 'idpessoa' ).AsInteger := StrToInt( Montapessoa.ValoresChave[ 0 ] );
             SqlPessoa.Open;

             CdsPessoa.Edit;
          End;

          CdsUsuario.FieldByName( 'IdUsuario' ).AsInteger := StrToInt( Montapessoa.ValoresChave[ 0 ] );

          // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
          if dbrgrpTipoUsuario.ItemIndex = 0 then begin
            dbEdNome.DataSource             := dsPesqTelaUsuario;
            dbEmail.DataSource              := dsPesqTelaUsuario;
            dbEdtCargoTipo.DataSource       := dsPesqTelaUsuario;
            dbEdtLotacaoEmpresa.DataSource  := dsPesqTelaUsuario;

            SqlPesqTelaUsuario.Prepare;
            SqlPesqTelaUsuario.ParamByName( 'IdPessoa' ).AsInteger := StrToInt( Montapessoa.ValoresChave[ 0 ] );
            SqlPesqTelaUsuario.Open;
          end;
          // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       End;

       //Ewerton Beltramini - 26/10/2021 - SIG120429...
       if (DBEMAIL.Text = '') then
           DbEdUsuarioExit(sender);
  End;
end;

{ Rotina de envio de e-mail.}
procedure TfrmCadUsuarioNew.EnviaEMail(sEndereco, sAssunto, sMensagem: string);
begin
  if not JclSimpleSendMail(sEndereco, '', sAssunto, sMensagem) then
     MsgDlg('Erro ao tentar enviar e-mail','Erro',mtError,[mbOk],0);

end;

function TfrmCadUsuarioNew.SenhaAleatoria: string;
var
  i, iQtde, iChar : integer;
  sC, Ch : string;
begin
  Result := '';

  Randomize;

  if FrmUserManager.cdsSeguranca.Active = False then
    FrmUserManager.SqlSeguranca.Open;

  iQtde := FrmUserManager.cdsSeguranca.FieldByName('TAMMINSENHA').AsInteger;

  sC := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  for i := 1 to iQtde  do
  begin
    iChar := Random( 36 ) + 1;
    Ch := Copy( sC, iChar, 1 );
    Result := Result + Ch;
  end;
end;

// Andre Imakawa - SIG 137435 - Inicio
function TfrmCadUsuarioNew.SenhaAleatoriaBD: string;
var
  iQtde: integer;
  QryAux: TwwQuery;
  auxSql: string;
begin

  try
    Result := '';
    QryAux := TwwQuery.Create(Application);
    iQtde := Sistema.SenhaTamMin;
    auxSql := 'SELECT CM.PCK_SEGURANCA_PLANUS.GERAR_SENHA('+inttostr(iQtde)+', 3, 3, 1, ''L'', ''S'', 1) AS SENHA FROM DUAL ';

    try
      QryAux.DataBaseName := 'BaseDados';

      QryAux.close;
      QryAux.SQL.clear;
      QryAux.SQL.Add(auxSql);
      QryAux.Open;


      if not QryAux.isempty then
      begin
        Result := trim(QryAux.FieldByName('SENHA').AsString)
      end
      else
      begin
        Result := SenhaAleatoria;
      end;
    except

    end;
  finally
    FreeAndNil(QryAux);
  end;

end;
// Andre Imakawa - SIG 137435 - Fim

procedure TfrmCadUsuarioNew.bbtnConfirmarClick(Sender: TObject);
begin  
  inherited;
  // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
  if DbEdUsuario.text = '' then
     begin
        MsgDlg( 'O campo Nome do Usuário é de preenchimento obrigatório.',
                'Aviso', mtError, [ mbOk ], 0 );
        modalResult :=  mrNone;
        abort;
     end
     else
        modalResult :=  mrOk;

  if DbEdNome.text = '' then
     begin
        //MsgDlg( 'O nome completo deve ser informado.',
        MsgDlg( 'O campo Nome Completo é de preenchimento obrigatório.',
                'Aviso', mtError, [ mbOk ], 0 );
        modalResult :=  mrNone;
        abort;
     end
     else
        modalResult :=  mrOk;

  if ( trim( dbemail.Text) <> '' ) then
  begin
     if (Pos('@', dbemail.Text) = 0) then
     begin
        //MsgDlg( 'Email inválido. Não foi encontrado o caracter ''@''.', 'Aviso', mtInformation, [ mbOk ], 0 );
        MsgDlg( 'Email: Não foi encontrado o caracter ''@''.', 'Aviso', mtError, [ mbOk ], 0 );
        modalResult :=  mrNone;
        abort;
     end;
  end;
// Término - Michelle Mota Sol: 253300/17804 PPM: 1093186 - 
end;

procedure TfrmCadUsuarioNew.btnLotacaoEmpresaClick(Sender: TObject);
begin
  inherited;
  // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
  {FUNCEF
  - Lotação: Não grava na base de dados, busca da tabela centcust.
  PRESTADOR DE SERVIÇO
  - Empresa: Campo: IDFORCLI, tabela: USUARIOSISTEMA, valor: IDFORCLI referente
  ao IDPESSOA do fornecedor/empresa buscado pelo usuário.
  }
  With FrmUserManager Do Begin
    MontaEmpresa.Executar;

    If MontaEmpresa.RetornouValor Then Begin
          CdsPessoa.Cancel;

      if dbrgrpTipoUsuario.ItemIndex = 1 then begin
        CdsUsuario.FieldByName( 'IDFORCLI' ).AsInteger := StrToInt( MontaEmpresa.ValoresChave[ 0 ] );
        dbedtLotacaoEmpresa.Text := MontaEmpresa.ValoresChave[ 1 ]; // razao social
      end;

    End;
  // Término - Michelle Mota Sol: 253300/17804 PPM: 1093186
  end;

end;

procedure TfrmCadUsuarioNew.dbrgrpTipoUsuarioChange(Sender: TObject);
begin
  inherited;
  // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
  with FrmUserManager do begin

    case dbrgrpTipoUsuario.ItemIndex of
      0: begin // FUNCEF
           DbEdNome.ReadOnly := True;
           DbEdNome.Color := clSilver;
           DbEmail.ReadOnly := True;
           DbEmail.Color := clSilver;
           DbEdtCargoTipo.ReadOnly := True;
           DbEdtCargoTipo.Color := clSilver;
           DbEdtLotacaoEmpresa.ReadOnly := True;
           DbEdtLotacaoEmpresa.Color := clSilver;
           btnNomePessoa.Enabled := False;
           btnLotacaoEmpresa.Enabled := False;
           lblLotacaoEmpresa.Caption := 'Lotação';
           lblCargoTipo.Caption := 'Cargo';
         end;
      1: begin // Prestador de Serviço
           DbEdNome.ReadOnly := False;
           DbEdNome.Color := clWhite;
           DbEmail.ReadOnly := False;
           DbEmail.Color := clWhite;
           DbEdtCargoTipo.ReadOnly := True;
           DbEdtCargoTipo.Color := clSilver;
           DbEdtLotacaoEmpresa.ReadOnly := True;
           DbEdtLotacaoEmpresa.Color := clSilver;
           btnNomePessoa.Enabled := False;
           btnLotacaoEmpresa.Enabled := True;
           lblLotacaoEmpresa.Caption := 'Empresa';
           lblCargoTipo.Caption := 'Tipo';
         end
    end;

    If bnovo then begin // modo inserir

        case dbrgrpTipoUsuario.ItemIndex of
          0: begin // FUNCEF
               cdsPesqTelaUsuario.close;
               CdsUsuario.FieldByName( 'DESCRICAO' ).AsString := 'FUNCEF';
               btnNomePessoa.Enabled := True;
               if dbEdtCargoTipo.Text = 'PRESTADOR DE SERVIÇO' then
                 begin
                   dbEdtCargoTipo.Text := '';
                   dbEdNome.Text := '';
                   dbEmail.Text := '';
                   CdsUsuario.FieldByName( 'nomeusuario' ).AsString := '';
                   dbedtLotacaoEmpresa.text := '';
                 end;
             end;
          1: begin // Prestador de Serviço
               cdsPesqTelaUsuario.close;
               CdsUsuario.FieldByName( 'NOMEUSUARIO' ).AsString := '';
               CdsUsuario.FieldByName( 'DESCRICAO' ).AsString := 'PRESTADOR DE SERVIÇO';
               dbedtCargoTipo.Text := 'PRESTADOR DE SERVIÇO';
               btnNomePessoa.Enabled := False;
               DBEMAIL.Text := EmptyStr //Cássio Rovaroto - SIG nº 118471                             
             end;
        end;

    end;
  
  end;
  // Término - Michelle Mota Sol: 253300/17804 PPM: 1093186
end;

//Início - Darivaldo - SIG 20724
procedure TfrmCadUsuarioNew.btnAuditoriaClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal( FrmUsuxTabela, TFrmUsuxTabela );
end;
//Término - Darivaldo - SIG 20724

//Cássio Rovaroto - SIG nº 118471 - Início
procedure TfrmCadUsuarioNew.DbEdUsuarioExit(Sender: TObject);
begin
  inherited;
  if (FrmUserManager.bnovo) and (dbrgrpTipoUsuario.ItemIndex = 0) then
    if (DbEdUsuario.Text <> EmptyStr) then
      DBEMAIL.Text := Trim(LowerCase(DbEdUsuario.Text)) + '@funcef.com.br'
    else
      DBEMAIL.Text := EmptyStr;
end;
//Cássio Rovaroto - SIG nº 118471 - Fim

end.

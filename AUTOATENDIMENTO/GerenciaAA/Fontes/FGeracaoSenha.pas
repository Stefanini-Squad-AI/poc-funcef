unit FGeracaoSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, JClStrings,
  uCmTypes, dBaseDados, uSistema, FLogOperacao, JCLSysUtils,  
  uGeraSenha, uCmCrypto, uCtrlWebAcesso, Db, DBClient, uCMClientDataSet;

type
  TfrmGeracaoSenha = class(TfrmOkCancelar)
    cdsWebAcesso: TCMClientDataSet;
    PageControl: TPageControl;
    tbsDefinido: TTabSheet;
    tbsAleatorio: TTabSheet;
    grpCompoSenha: TGroupBox;
    lblNumMin: TLabel;
    lblNumMax: TLabel;
    edtNumMin: TEdit;
    edtNumMax: TEdit;
    cbMaiusculas: TCheckBox;
    cbComecaComChar: TCheckBox;
    rgbTipoSenha: TRadioGroup;
    pnlTop: TPanel;
    grpOpcoesGeracao: TGroupBox;
    rbTodos: TRadioButton;
    rbLOGINPESSOAL: TRadioButton;
    edtLOGINPESSOAL: TEdit;
    pnlBottom: TPanel;
    lblTotal: TLabel;
    lblAlterados: TLabel;
    pgbProgresso: TProgressBar;
    grpConteudo: TGroupBox;
    rbConteudoUnico: TRadioButton;
    rbConteudoDinamico: TRadioButton;
    edtPalavraSenha: TEdit;
    pnlCampo: TPanel;
    rbDtNasc: TRadioButton;
    rbMatricula: TRadioButton;
    cmbFormatoData: TComboBox;
    rbLogin: TRadioButton;
    rbgrpOperacao: TRadioGroup;
    cbTeste: TCheckBox;
    cdsTeste: TCMClientDataSet;
    rbQuery: TRadioButton;
    memQuery: TMemo;
    procedure edtNumMinKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumMaxKeyPress(Sender: TObject; var Key: Char);
    procedure edtConfirmarKeyPress(Sender: TObject; var Key: Char);
    procedure rbTodosClick(Sender: TObject);
    procedure rbLOGINPESSOALClick(Sender: TObject);
    procedure rbQueryClick(Sender: TObject);    
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rbConteudoUnicoClick(Sender: TObject);
    procedure rbConteudoDinamicoClick(Sender: TObject);
    procedure rbMatriculaClick(Sender: TObject);
    procedure rbDtNascClick(Sender: TObject);
    procedure rbLoginClick(Sender: TObject);
    procedure rbgrpOperacaoClick(Sender: TObject);
  private
    WebAcesso : TCtrlWebAcesso;
    CMCrypto : TCMCrypto;

    procedure MsgErro ( sMsg : String );
  public
    { Public declarations }
  end;

var
  frmGeracaoSenha: TfrmGeracaoSenha;

implementation

{$R *.DFM}

procedure TfrmGeracaoSenha.edtNumMinKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

procedure TfrmGeracaoSenha.edtNumMaxKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

procedure TfrmGeracaoSenha.edtConfirmarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

procedure TfrmGeracaoSenha.rbTodosClick(Sender: TObject);
begin
  inherited;
  edtLOGINPESSOAL.Enabled := False;
  memQuery.Enabled        := False;
end;

procedure TfrmGeracaoSenha.rbLOGINPESSOALClick(Sender: TObject);
begin
  inherited;
  edtLOGINPESSOAL.Enabled := True;
  memQuery.Enabled        := False;
end;

procedure TfrmGeracaoSenha.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmGeracaoSenha.FormCreate(Sender: TObject);
begin
  inherited;
  CMCrypto := TCMCrypto.Create;

  WebAcesso := TCtrlWebAcesso.Create;
  WebAcesso.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebAcesso.CdsWebAcesso := cdsWebAcesso;
end;

procedure TfrmGeracaoSenha.FormDestroy(Sender: TObject);
begin
  inherited;
  WebAcesso.Free;
  CMCrypto.Free;
end;

procedure TfrmGeracaoSenha.bbtnConfirmarClick(Sender: TObject);
var
  iCont : integer;
  sSenha, sSenhaGravada : String;
  bOk : Boolean;
  dData : TDateTime;
  Log : TStringList;
  bCripto : boolean;
  sCab : string;
  sNomeUsuario : string;
  sRegAlterados, sRegNAlterados, sRegErro : string;
begin
  inherited;

  bOk := False;
  iCont := 0;

  Randomize;

  sRegAlterados  := '';
  sRegNAlterados := '';
  sRegErro       := '';

  //Verifica se operação deve gerar senha criptografada
  bCripto := ( ( rbgrpOperacao.ItemIndex = 0 ) or ( rbgrpOperacao.ItemIndex = 2 ) );

  cdsWebAcesso.Close;

  //Seleciona os registros para os quais irá gerar senha
  if rbLOGINPESSOAL.Checked  then
  begin
    //Login específico

    //Se o login não foi preenchido...
    if trim( edtLOGINPESSOAL.Text ) = '' then
    begin
      ShowMessage('Infome o login do usuário.');
      edtLOGINPESSOAL.SetFocus;
      exit;
    end; {if trim( edtLOGINPESSOAL.Text ) = '' then}

    cdsWebAcesso.Data := WebAcesso.SelecionaPorLogin( edtLOGINPESSOAL.Text )
  end
  else
  if rbQuery.Checked then
    //Todos sem senha
    cdsWebAcesso.Data := WebAcesso.SelecionaPorQuery( memQuery.Text )
  else
    //Todos os registros
    cdsWebAcesso.Data := WebAcesso.SelecionaTodos;

  //Se houverem registros...
  if not cdsWebAcesso.IsEmpty then
  begin

    //Inicializa dados do processo
    pgbProgresso.Min := 0;
    pgbProgresso.Max := cdsWebAcesso.RecordCount;
    pgbProgresso.Position := 0;
    lblTotal.Caption := 'Total de Registros: ' + IntToStr( pgbProgresso.Max );
    lblAlterados.Caption   := 'Alterados: 0';
    lblTotal.Visible       := True;
    lblAlterados.Visible   := True;
    pgbProgresso.Visible   := True;

    iCont := 0;

    bOk := True;

    //Loop de registros
    cdsWebAcesso.First;
    while ( not cdsWebAcesso.Eof ) and bOk do
    begin

      sSenha := '';

      //Definição da operação
      if rbgrpOperacao.ItemIndex <= 1  then                       //Geração de senha
      begin

        //Definição do tipo de senha
        if PageControl.ActivePage = tbsDefinido then              //Tipo definido
        begin

          if rbConteudoUnico.Checked then                         //Conteúdo único
          begin

            //Se a palavra não foi preenchida...
            if trim( edtPalavraSenha.Text ) = '' then
            begin
              ShowMessage('Infome a senha a preencher.');
              edtPalavraSenha.SetFocus;
              exit;
            end; {if trim( edtPalavraSenha.Text ) = '' then}

            sSenha := trim( edtPalavraSenha.Text );

          end {if rbConteudoUnico.Checked then}
          else                                                   //Campo
          begin

            if rbMatricula.Checked then                          //Matricula
            begin
              sSenha := trim( WebAcesso.RecuperaMatricula(
               cdsWebAcesso.FieldByName('IDPESSOA').AsInteger ) );
            end {if rbMatricula.Checked then}
            else
              if rbLogin.Checked then                            //Login

                sSenha := cdsWebAcesso.FieldByName('LOGINPESSOAL').AsString

              else                                               //Data de nascimento
              begin
                //Se o formato não foi informado...
                if trim( cmbFormatoData.Text ) = '' then
                begin
                  ShowMessage('Informe o formato da data de nascimento.');
                  cmbFormatoData.SetFocus;
                  exit;
                end; {if trim( cmbFormatoData.Text ) = '' then}

                dData := WebAcesso.RecuperaDataNasc(
                 cdsWebAcesso.FieldByName('IDPESSOA').AsInteger );

                //Se a data não for nula
                if dData > 0 then
                begin
                  if cmbFormatoData.Text = 'DDMMAA' then
                    sSenha := FormatDateTime( 'ddmmyy', dData )
                  else
                    sSenha := FormatDateTime( 'ddmmyyyy', dData );
                end;

              end;

          end; {if rbConteudoUnico.Checked then}
        end
        else
        begin

          //Se o número mínimo de caracteres não foi preenchido...
          if StrToIntDef( edtNumMin.Text, 0 ) = 0 then
          begin
            ShowMessage('Infome o número mínimo de caracteres.');
            edtNumMin.SetFocus;
            exit;
          end; {if StrToIntDef( edtNumMin.Text, 0 ) = 0 then}

          //Se o número máximo de caracteres não foi preenchido...
          if StrToIntDef( edtNumMax.Text, 0 ) = 0 then
          begin
            ShowMessage('Infome o número máximo de caracteres.');
            edtNumMax.SetFocus;
            exit;
          end; {if StrToIntDef( edtNumMax.Text, 0 ) = 0 then}

          sSenha := GeraSenha(  StrToIntDef( edtNumMin.Text, 0 ), //Senha aleatória
                                StrToIntDef( edtNumMax.Text, 0 ),
                                cbMaiusculas.Checked,
                                cbComecaComChar.Checked,
                                rgbTipoSenha.ItemIndex + 1,
                                False );

        end; {if PageControl.ActivePage = tbsDefinido then}

      end {if rbgrpOperacao.ItemIndex <= 1  then}
      else
      begin

        sSenha := trim( cdsWebAcesso.FieldByName('SENHAPESSOAL').AsString );

        //Se não for vazio...
        if trim( sSenha ) <> '' then
          if rbgrpOperacao.ItemIndex = 3 then               //Decriptografar senha
            sSenha := CMCrypto.CMDecryptStr(
             StrPadRight( sSenha, 20, ' '),
             '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' );

      end;


      //Se não for vazio...
      if trim( sSenha ) <> '' then
      begin

        //---------------------------------- Salva a senha -------------------
        bOk := WebAcesso.GravaSenha( cdsWebAcesso.FieldByName('IDPESSOA').AsInteger,
                                     cdsWebAcesso.FieldByName('LOGINPESSOAL').AsString,
                                     sSenha, '', Sistema.IdUsuario, bCripto );
        //--------------------------------------------------------------------

        if bOk then
        begin
          //Atualiza o log de alterados
          sRegAlterados := sRegAlterados + '   ' + cdsWebAcesso.FieldByName('LOGINPESSOAL').AsString + #13#10;

          //Atualiza dados do processo
          Inc( iCont );
          lblAlterados.Caption := 'Alterados: ' + IntToStr( iCont );


          //Se estiver marcado como teste após cada registro...
          if cbTeste.Checked then
          begin
            cdsTeste.Close;
            cdsTeste.Data := WebAcesso.SelecionaPorLogin( cdsWebAcesso.FieldByName('LOGINPESSOAL').AsString );
            sSenhaGravada := cdsTeste.FieldByName('SENHAPESSOAL').AsString;

            //Se foi criptografada, decriptografa para testar...
            if bCripto then
              sSenhaGravada := CMCrypto.CMDecryptStr( StrPadRight( sSenhaGravada, 20, ' '),
               '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' );

            if trim( sSenhaGravada ) <> trim( sSenha ) then
              //Atualiza o log de registros com erro
              sRegErro := sRegErro + '   ' + cdsWebAcesso.FieldByName('LOGINPESSOAL').AsString +
              ' - Senha gerada: ' + trim( sSenha ) + '; Senha gravada: ' + trim( sSenhaGravada ) + #13#10
              + '; Senha cripto: ' + CMCrypto.CMEncryptStr( StrPadRight( sSenhaGravada, 20, ' '),
               '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' );

            cdsTeste.Close;

          end; {if cbTeste.Checked then}

        end; {if bOk then}

      end; {if trim( sSenha ) <> '' then}

      if not bOk then 
        //Atualiza o log de não alterados
        sRegNAlterados := sRegNAlterados + '   ' + cdsWebAcesso.FieldByName('LOGINPESSOAL').AsString + #13#10;


      //Atualiza meter
      pgbProgresso.StepIt;
      frmGeracaoSenha.Refresh;

      cdsWebAcesso.Next;

    end; //while ( not cdsWebAcesso.Eof ) do

  end; //if not cdsWebAcesso.IsEmpty then

  //Gera cabeçalho do Log
  case rbgrpOperacao.ItemIndex of
    0 : sCab := 'Geração de senhas criptografadas';
    1 : sCab := 'Geração de senhas sem criptografia';
    2 : sCab := 'Criptografia de senhas';
    3 : sCab := 'Decriptografia de senhas';
  end;

  //Indica no log para quem foi gerado senha
  if rbLOGINPESSOAL.Checked then
    sCab := sCab + ' para o login ' + trim( edtLOGINPESSOAL.Text );
  if rbQuery.Checked then
    sCab := sCab + ' para todos os logins trazidos pela query: ' + #13#10 + UpperCase( trim( memQuery.Text ) );
  if rbTodos.Checked then
    sCab := sCab + ' para todos os usuários';

  //Recupera o nome do usuário que alterou a senha
  cdsWebAcesso.Close;
  cdsWebAcesso.Data := WebAcesso.NomeUsuario( Sistema.IdUsuario );
  sNomeUsuario := cdsWebAcesso.FieldByName('NOMEUSUARIO').AsString;
  cdsWebAcesso.Close;

  sCab := sCab                                                                                      + #13#10 +
          '--------------------------------------------------------------------------------'        + #13#10 +
          'Término da operação : ' + FormatDateTime( 'dd/MM/yyyy hh:nn:ss', Now )                   + #13#10 +
          'Usuário             : ' + sNomeUsuario                                                   + #13#10 +
                                                                                                      #13#10 +
          '- Opção de teste a cada registro ' + Iff( cbTeste.Checked, 'ligada', 'desligada' ) + '.' + #13#10 ;

  if rbgrpOperacao.ItemIndex <= 1  then
  begin

    if PageControl.ActivePage = tbsDefinido then
    begin
      sCab :=  sCab +
            '- Senhas com conteúdo definido.'                                                       + #13#10 ;

      if rbConteudoUnico.Checked then
        sCab :=  sCab +
            '- Senhas preenchidas com a palavra "' + edtPalavraSenha.Text + '".'                    + #13#10 ;

      if rbConteudoDinamico.Checked then
      begin
        sCab :=  sCab +
            '- Senhas preenchidas com o campo ';

        if rbMatricula.Checked then sCab := sCab + 'MATRICULA.' + #13#10;
        if rbLogin.Checked     then sCab := sCab + 'LOGIN.' + #13#10;
        if rbDtNasc.Checked    then sCab := sCab + 'DATA DE NASCIMENTO no formato "' + cmbFormatoData.Text + '".' + #13#10;
      end;

    end
    else
    begin
      sCab :=  sCab +
            '- Senhas com conteúdo aleatório.'                                                      + #13#10 +
            '- Mínimo de ' + trim( edtNumMin.Text ) + ' e máximo de ' + trim( edtNumMax.Text ) + ' caracteres.' + #13#10 ;

      if cbMaiusculas.Checked then sCab :=  sCab + '- Apenas caracteres maiúsculos.' + #13#10 ;

      if cbComecaComChar.Checked then sCab :=  sCab + '- Começando com caracter.' + #13#10 ;

      sCab :=  sCab +
       '- Senha composta por ' + StrRight( rgbTipoSenha.Items.Strings[ rgbTipoSenha.ItemIndex ],
       length( rgbTipoSenha.Items.Strings[ rgbTipoSenha.ItemIndex ] ) - 3 ) + #13#10 ;

    end;
  end;

  sCab := sCab                                                                + #13#10 +
          'Total de registros selecionados : ' + IntToStr( pgbProgresso.Max ) + #13#10 +
          'Total de registros alterados    : ' + IntToStr( iCont )            + #13#10 ;

  frmLogOperacao := TfrmLogOperacao.Create( Self );
  Log := TStringList.Create;
  try
    Log.Add( sCab );

    if cbTeste.Checked then
    begin
      if sRegErro <> '' then
      begin
        sRegErro := #13#10 + 'Registros que apresentaram erro no teste:' + #13#10 + sRegErro + #13#10;
        Log.Add( sRegErro );
      end
      else
        Log.Add( #13#10 + 'Nenhum erro foi encontrado durante os testes.' + #13#10 );
    end;

    if sRegAlterados <> '' then
    begin
      sRegAlterados  := #13#10 + 'Registros alterados:' + #13#10 + sRegAlterados + #13#10;
      Log.Add( sRegAlterados );
    end;

    if sRegNAlterados <> '' then
    begin
      sRegNAlterados := #13#10 + 'Registros selecionados e não alterados:' + #13#10 + sRegNAlterados + #13#10 ;
      Log.Add( sRegNAlterados );
    end;

    Log.Add( '--------------------------------------------------------------------------------' + #13#10 +
             'Término do log ' );

    frmLogOperacao.Caption := 'Resultado';
    frmLogOperacao.memLog.Text := Log.Text;

    frmLogOperacao.ShowModal;
  finally
    frmLogOperacao.Free;
    Log.Free;
  end;

  if bOk then
  begin
    lblTotal.Visible       := False;
    lblAlterados.Visible   := False;
    pgbProgresso.Visible   := False;
  end;

end;

procedure TfrmGeracaoSenha.rbConteudoUnicoClick(Sender: TObject);
begin
  inherited;
  edtPalavraSenha.Enabled := True;
  pnlCampo.Enabled        := False;
  cmbFormatoData.Enabled     := False;
end;

procedure TfrmGeracaoSenha.rbConteudoDinamicoClick(Sender: TObject);
begin
  inherited;
  edtPalavraSenha.Enabled := False;
  edtPalavraSenha.Text    := '';
  pnlCampo.Enabled        := True;

  cmbFormatoData.Enabled := rbDtNasc.Checked;
end;

procedure TfrmGeracaoSenha.rbMatriculaClick(Sender: TObject);
begin
  inherited;
  cmbFormatoData.Enabled     := False;
end;

procedure TfrmGeracaoSenha.rbDtNascClick(Sender: TObject);
begin
  inherited;
  cmbFormatoData.Enabled     := True;
end;

procedure TfrmGeracaoSenha.rbLoginClick(Sender: TObject);
begin
  inherited;
  cmbFormatoData.Enabled     := False;
end;

procedure TfrmGeracaoSenha.rbgrpOperacaoClick(Sender: TObject);
begin
  inherited;

  PageControl.Visible := ( rbgrpOperacao.ItemIndex <= 1 );  

  if ( rbgrpOperacao.ItemIndex = 0 ) or ( rbgrpOperacao.ItemIndex = 1 ) then
    grpOpcoesGeracao.Caption := 'Gerar senhas...'
  else
    if rbgrpOperacao.ItemIndex = 2 then
      grpOpcoesGeracao.Caption := 'Criptografar senhas...'
    else
      grpOpcoesGeracao.Caption := 'Decriptografar senhas...';
end;

procedure TfrmGeracaoSenha.rbQueryClick(Sender: TObject);
begin
  inherited;
  edtLOGINPESSOAL.Enabled := False;
  memQuery.Enabled        := True;
end;

end.

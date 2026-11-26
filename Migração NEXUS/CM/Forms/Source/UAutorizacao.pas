// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{*******************************************************************************
 N. WO       : 41032 (40760)
 Responsável : Edilaine
 Data        : 07/07/2026
 Descrição   : Trocar componente para apresentação das fotos
********************************************************************************
 N. WO.......: 28421
 Merge.......: 26/01/2026
 Data........: 24/07/2025
 Responsável.: Leandro Pocebon
 Descrição...: Criação da Função para fzer login via parametro recebido.
 Rotina......: LoginAutomatico
********************************************************************************
 Nº WO.......: WO Oracle
 Data........: 21/07/2025
 Autor.......: Leandro Pocebon
 Descrição...: Alteração da string de conexão do componente ADO
               De Tibero para Oracle
 Rotina......: getStringConexaoADO
********************************************************************************
 N. SIG......: 137435
 Data........: 23/10/2023
 Responsável.: Andre Imakawa
 Descrição...: Criação da Função que cria senha aleatoria via Package no BD.
********************************************************************************
 N. SIG......: 134476
 Data........: 04/04/2023
 Responsável.: Everson Cunha
 Descrição...: Alteração da URL da Central de Notificações
********************************************************************************
 N. SIG......: Recuperação de Senha
 Data........: 06/07/2020
 Responsável.: Everson Cunha
 Descrição...: Implementação do link "Esqueceu a senha?" na FLogin
********************************************************************************
 Nº SIG......: SIG Tibero
 Data........: 03/11/2018
 Autor.......: Everson Cunha
 Descrição...: Alteração da string de conexão do componente ADO
               De oracle para Tibero
 Rotina......: getStringConexaoADO
********************************************************************************
 Nº SIG......: 62086
 Data........: 13/07/2018
 Autor.......: Darivaldo Alencar
 Descrição...: Impressora padrão mudando sozinha durante a geração do relatório.
 Rotina......: GerandoRelatorio, ChangeDefaultPrinter, ImpressoraPadrao,
               FecharTelaPreviewRel
********************************************************************************
 Nº SIG......: 67981
 Data........: 21/05/2018
 Autor.......: Darivaldo Alencar
 Descrição...: Criação de funcionalidade para conexão ADO de relatórios que não
               apresentam erro com TQuery/ClientDataset
 Rotina......: getStringConexaoADO
********************************************************************************
 Criada função para verificar se existe transação aberta antes de iniciar outra
 quando efetua a rotina de apply updates
 Alteracao........: AplicaAlteracoesInTransacao
 Nº SIG:........... 33979
 Data da Alteração: 19/02/2018
 Responsável......: Edilaine
 Descrição........: Reestruturação da tela do elegível
********************************************************************************
 Data     : 06/09/2007
 Autor    : Rodolpho da Silva
 Descrição: Retirar do controle Default o menu de relatórios
 Rotina   : TAutorizacao.AtualizaMenus
********************************************************************************
 Data     : 26/04/2006
 Autor    : Rodolpho da Silva
 Descrição: Habilitar novo componente de menu (mnuVariacaoIndices)
            como "default"
 Rotina   : TAutorizacao.AtualizaMenus
********************************************************************************
 Atualizado por : André Tavares - 11/12/2003 - pendência 15763
                  - incluí um parâmetro no SqlAutoriza
******************************************************************************** }

unit UAutorizacao;

interface

uses Classes, Forms, Menus, Controls, windows, Messages,
     Dialogs, DBTables, UMensErro, FLogin, SysUtils, DAutorizacao,
     UData, UCripto, dBaseDados, uCMTypes, DbClient,
     // alex 17/07/06
     filectrl, //leandro wo12235
     Graphics, DB, JPEG, ExtCtrls,   //edilaine WO41032
     actnlist, Registry, WinSpool, Printers;

type
    {** Descrição de TTipoAutorizacao}
    TTipoAutorizacao = (afSoDesabilitar, afSoHabilitar, afNormal);
    {** Descrição de TAutorizacao}
   TAutorizacao = class
   private
      FLogged     : Boolean;
      FAutorizaMenu : Boolean;
      FUltForm    : string;
      FAfterLogin : TNotifyEvent;
      FPodeMudarSenha: Boolean;
      _Cds: TClientDataSet;
      Procedure AtualizaMenus(Tipo :TTipoAutorizacao);

   protected

      procedure CriarDataModules;

   public
     FChangePassword : Boolean; //Everson Cunha / Recuperação de Senha

      constructor Create;
      destructor Destroy; override;

      function Login: boolean;
      function LoginAutomatico(sUsr, sPass, iProcesso, iSeqIni, iSeqFim: string): boolean;
      function PedirLogin(var sUsr, sSenha: string): Boolean;
      procedure PedirEmpresa;
      procedure AutorizarForm(frm: TForm; TipoAutoriza : TTipoAutorizacao);
      procedure HabilitarComponente(compo: TComponent; Habilita:Boolean);
      procedure LigaCompo(compo: TComponent; Habilita:Boolean; TipoAutoriza : TTipoAutorizacao);
      procedure MudarSenha;
      procedure FecharForms;
      property AfterLogin: TNotifyEvent read FAfterLogin write FAfterLogin;
      Property PodeMudarSenha: Boolean read FPodeMudarSenha;
      {** Funciona bem pra caramba }
      function ConectaUsuario : Boolean;
      function getStringConexaoADO: String; //Darivaldo Alencar SIG67981

      //Darivaldo Alencar SIG62086 -Inicio
      procedure FecharTelaPreviewRel;
      function ImpressoraPadrao(bGerar: Boolean; sImpressora: String =''): String;
      function GerandoRelatorio(bGerar: Boolean; iValor: Integer = 0): Boolean;
      procedure ChangeDefaultPrinter(const Name: string; const iOpcao: Integer);
      function ImpressoraPadraoWindows: String;
      //Darivaldo Alencar SIG62086 -Fim

     //Everson Cunha / Recuperação de Senha
     function SenhaAleatoria : string;
     function PreparaNotificacao(pIdUsuario, pSenha, pEmail : String): Boolean;
     procedure RecuperarSenha(const idUsuario : string);
     //Everson Cunha / Recuperação de Senha

     function SenhaAleatoriaBD : string; // Andre Imakawa - SIG 137435

     procedure CarregarImagem(CampoImg: TBlobField; FrameImg : TImage);          //edilaine WO41032

   published
   end;

function VerificarSuperSenha(const sSenha: string): Boolean;
function ValidaSenhaUsuario(sUsuario, sSenha :String; Var IdUsuario, IdEspAcesso :Integer) :Boolean;
Procedure GravaHistSenha( iusuario: Integer; ssenhaant, ssenhanova: String );

procedure AplicaAlteracoesInTransacao( pDataSet : array of TDBDataSet) ;    //edilaine - SIG33979
procedure AplicaUpdatesInTrans(const DataSets: array of TDBDataSet);        //edilaine - SIG33979

var
   Autorizacao: TAutorizacao;

implementation

uses FLogEmpresa, fAltSenha, uSistema, uCtrlPadroes;

Procedure GravaHistSenha( iusuario: Integer; ssenhaant, ssenhanova: String );
var
  iqtde: Integer;
begin
  With dtmAutorizacao Do
  Begin
       If CdsHistSenha.Active Then CdsHistSenha.Close;
       SqlHistSenha.Prepare;
       SqlHistSenha.ParamByName( 'IdUsuario' ).AsInteger := iusuario;
       SqlHistSenha.Open;
       iqtde := 0;

       CdsHistSenha.First;
       While Not CdsHistSenha.Eof Do
       Begin
             Inc( iqtde );

             If iqtde >= 5 Then
                CdsHistSenha.Delete;

             CdsHistSenha.Next;
       End;

       CdsHistSenha.Append;
       CdsHistSenha.FieldByName( 'IdUsuario' ).AsInteger   := iusuario;
       CdsHistSenha.FieldByName( 'DataTroca' ).AsDateTime  := Now;
       CdsHistSenha.FieldByName( 'SenhaAntiga' ).AsString  := ssenhaant;
       //CdsHistSenha.FieldByName( 'SenhaNova' ).AsString    := CriptografarHash( ssenhanova, Sistema.IdUsuario, 15 ); //Everson Cunha / Recuperação de Senha
       CdsHistSenha.FieldByName( 'SenhaNova' ).AsString    := CriptografarHash( ssenhanova, iusuario, 15 );            //Everson Cunha / Recuperação de Senha
       CdsHistSenha.Post;


       If Not Padroes.GravaHistoricodeSenha(CdsHistSenha.Data) Then
          MsgDlg(Padroes.MessageInfo,Application.Title,MtError,[MbOk],0);
       CdsHistSenha.Close;
  End;
end;

procedure TAutorizacao.HabilitarComponente(compo: TComponent; Habilita:Boolean);
var i : integer;
begin
     if (compo is TMainMenu) then
        for i := 0 to TMainMenu(compo).Items.Count -1 do
            HabilitarComponente(TMainMenu(compo).Items[i], Habilita);

     if (compo is TMenuItem) then
         TMenuItem(Compo).Enabled := Habilita;

     if (compo is TControl) then
        TControl(Compo).Enabled := Habilita;
end;

procedure TAutorizacao.LigaCompo(compo: TComponent; Habilita:Boolean; TipoAutoriza : TTipoAutorizacao);
var i : integer;
begin
     if ((TipoAutoriza = afSoDesabilitar) and (not Habilita)) or
        ((TipoAutoriza = afSoHabilitar) and (Habilita)) or
         (TipoAutoriza = afNormal) then
     begin
          if (compo is TMainMenu) then
             for i := 0 to TMainMenu(compo).Items.Count -1 do
                 LigaCompo(TMainMenu(compo).Items[i], Habilita, TipoAutoriza);

          if (compo is TMenuItem) then
             TMenuItem(Compo).Enabled := Habilita;

          if (compo is TControl) then
             TControl(Compo).Enabled := Habilita;

          // Alex 17/07/2006 - Habilitar também os taction = o TAction
          // habilita tanto menu, quanto botões simultaneamente, verifique RAD
          //Obs: Tem que ser desta forma, pois se apenas habilitá-lo, ele não
          //faz o Refresh, atualizando assim apenas o botão, sem o menu.
          if (compo is TAction) then
          begin
             TAction(Compo).Enabled := not Habilita;
             TAction(Compo).Enabled := Habilita;
          end;

     end;
end;

constructor TAutorizacao.Create;
begin
   inherited Create;
   FLogged := False;
   FUltForm := '+++---';
   FAutorizaMenu := True;
   _Cds := TClientDataSet.Create(nil);
end;

destructor TAutorizacao.Destroy;
begin
   _Cds.Free;
   inherited;
end;

procedure TAutorizacao.CriarDataModules;
begin
   dtmBaseDados.Cds.Data := Padroes.GetDataPacket('SELECT NOMEMODULO FROM MODULO WHERE ( MODULO.IDMODULO = '+IntToStr(Sistema.IdModulo)+')');
   if Not dtmBaseDados.Cds.IsEmpty then
      Sistema.NomeModulo := dtmBaseDados.Cds.FieldByname('NOMEMODULO').AsString
   else
   begin
        MsgDlg('Não existe o Módulo '+IntToStr(Sistema.IdModulo) +' na tabela MODULO', 'Módulo não cadastrado', mtError, [mbOk], 0);
        Application.Terminate ;
   end;
end;

procedure TAutorizacao.PedirEmpresa;
begin
   if Not FLogged then Exit;

   if FLogEmpresa.PedirEmpresa then FecharForms;

   FUltForm := '+++---';
end;

function TAutorizacao.Login : boolean;
var
   sUsuario, sUsuarioAnt, sSenha, sSenhaBanco, ssenhanova: string;
   balterousenha, TemChance, Achou, bSenhaValida: boolean;
   iDiasSenha, iOldUsuario, JaTentou: integer;
begin
   iOldUsuario := Sistema.IdUsuario;

   if Not FLogged then
     CriarDataModules;

   Sistema.NomeUsuario := '';
   Sistema.IdUsuario := -1;
   Sistema.IdEspAcesso := -1;
   FLogged  := False;

   JaTentou := 0;
   TemChance := true;
   sUsuarioAnt := '';

   while TemChance do
   begin
         if not PedirLogin(sUsuario, sSenha) then
            TemChance := false
         else
         begin
            If sUsuario <> sUsuarioAnt Then
            Begin
               JaTentou := 0;
               sUsuarioAnt := sUsuario;
            End;

            with dtmAutorizacao.CdsUsuario do
            begin
                 // Entrada de SUPERusuario
                 if (AnsiUpperCase(sUsuario) = 'SUPER') then
                 begin
                    If ( ( Sistema.SenhaAlteraSuper ) and ( Sistema.SenhaSuper = CriptografarHash( sSenha, 0, 15 ) ) ) or
                           ( ( Not Sistema.SenhaAlteraSuper ) and ( VerificarSuperSenha( sSenha ) ) ) Then
                    Begin
                       Sistema.IdUsuario := 0;
                       Sistema.IdEspAcesso := 0;
                       Sistema.NomeUsuario := 'SUPER';
                       Sistema.SuperUsuario := True;
                       FLogged := ConectaUsuario;

                       if not FLogEmpresa.PedirEmpresa then
                       begin
                          Sistema.IdUsuario := -1;
                          Sistema.IdEspAcesso := -1;
                          Sistema.NomeUsuario := '';
                          FLogged := false;
                          TemChance := false;
                       end;
                    End
                 end else
                 begin
                    try
                       dtmAutorizacao.CdsUsuario.Data := Padroes.GetDataPacket(
                                          'SELECT USUARIOSISTEMA.IDUSUARIO, USUARIOSISTEMA.IDESPACESSO,'+
                                          'USUARIOSISTEMA.SENHA, USUARIOSISTEMA.NOMEUSUARIO, ' +
                                          'USUARIOSISTEMA.BLOQUEADO, USUARIOSISTEMA.DESATIVADO, ' +
                                          'USUARIOSISTEMA.MUDARSENHA, USUARIOSISTEMA.VALIDADESENHA, ' +
                                          'USUARIOSISTEMA.BLOQUEIAATEDATA, '+ //P.RAMOS-23.11.2004-PEND.17809
                                          'USUARIOSISTEMA.NAOMUDASENHA, USUARIOSISTEMA.SENHAPERMANENTE ' +
                                          'FROM USUARIOSISTEMA '+
                                          'WHERE USUARIOSISTEMA.NOMEUSUARIO = ' + QuotedStr( sUsuario ) ) ;
                       Achou := Not dtmAutorizacao.CdsUsuario.IsEmpty;
                    except
                       Achou := false;
                    end;

                    if Not Achou then
                       MsgDlg('Usuário não encontrado', 'Erro', mtError, [mbOk, mbHelp], 0)
                    Else
                    Begin

{                      // Excluído Vinicius - 29/09/2004
                       // Verifica tipo de conexao ao BD
                       if not Sistema.UsuarioUnico then
                       begin
                          sSenhaBanco  := FieldByName('Senha').AsString;
                          bSenhaValida := (sSenhaBanco = CriptografarCM(sSenha));
                       end
                       else
                       begin
                          bSenhaValida := True;
                          Sistema.AtualizaCMUserID(1,FieldByName('IdUsuario').AsInteger);
                       end; }

                       //Everson Cunha / Recuperação de Senha - Início
                       if FChangePassword then
                       begin

                         JaTentou := 0;
                         TemChance := true;
                         FLogged := False;

                         RecuperarSenha(FieldByName('IdUsuario').AsString);

                       end
                       else
                       begin
                       //Everson Cunha / Recuperação de Senha - Fim

                         sSenhaBanco  := FieldByName('Senha').AsString;
                         bSenhaValida := (sSenhaBanco = CriptografarCM(sSenha));

                         // Vinícius - 29/09/2004
                         if Sistema.UsuarioUnico then begin
                            Sistema.AtualizaCMUserID(1,FieldByName('IdUsuario').AsInteger);
                         end;

                         if bSenhaValida then
                            Padroes.ExecSqlAndCommit('UPDATE USUARIOSISTEMA SET SENHA = ' +
                                                     QuotedStr( CriptografarHash( sSenha, FieldByName('IdUsuario').AsInteger, 15 ) ) +
                                                    ' WHERE IDUSUARIO = ' + FieldByName('IdUsuario').AsString );
                         If FieldByName( 'Bloqueado' ).AsString = 'S' Then Begin
                            TemChance := true;
                            FLogged := False;
                            MsgDlg( 'Usuário Bloqueado! ' + #13#10 +
                                    'Entre em contato com o Administrador' + #13#10 +
                                    'para efetuar o desbloqueio.', 'Controle de Acesso', mtError, [mbOk], 0);
                         End Else Begin
                            If FieldByName( 'Desativado' ).AsString = 'S' Then Begin
                               TemChance := True;
                               FLogged := False;
                               MsgDlg( 'Usuário Desativado! ' + #13#10 +
                                       'Entre em contato com o Administrador' + #13#10 +
                                       'para reativar seu acesso.',
                                       'Controle de Acesso', mtError, [mbOk], 0);
                            End Else Begin
                            //P.RAMOS-23.11.2004-PEND.17809
                            if (fieldbyname('BLOQUEIAATEDATA').asdatetime > 0) and
                               (date <= fieldbyname('BLOQUEIAATEDATA').asdatetime) then
                            begin
                               TemChance := True;
                               FLogged := False;
                               MsgDlg( 'Usuário temporariamente desativado até: ' +
                                       formatdatetime('dd/mm/yyyy', fieldbyname('BLOQUEIAATEDATA').asdatetime)+'.'+#13#10+
                                       'Entre em contato com o Administrador' + #13#10 +
                                       'para reativar o seu acesso.',
                                       'Controle de Acesso', mtError, [mbOk], 0);
                            end
                            else
                            begin
                            //P.RAMOS-23.11.2004-PEND.17809
                               If ( FieldByName( 'SenhaPermanente' ).AsString = 'N' ) and
                                      ( FieldByName( 'ValidadeSenha' ).Value < Date ) Then Begin
                                  TemChance := True;
                                  FLogged := False;
                                  Padroes.ExecSqlAndCommit('UPDATE USUARIOSISTEMA SET BLOQUEADO = ' + QuotedStr( 'S' ) +
                                                           ' WHERE IDUSUARIO = ' + FieldByName('IdUsuario').AsString );
                                  MsgDlg( 'Sua senha expirou! ' + #13#10 +
                                          'Entre em contato com o Administrador' + #13#10 +
                                          'para reativar sua senha.',
                                          'Controle de Acesso', mtError, [mbOk], 0);
                               End Else Begin
                                  If (bSenhaValida) or (sSenhaBanco = CriptografarHash(sSenha,FieldByName('IdUsuario').AsInteger,15)) then begin
                                     If sSenha = 'MUDESUASENHA' then
                                        MsgDlg( 'Você ainda está utilizando a senha de acesso' + #13#10 +
                                                'gerada pelo sistema no cadastramento de usuários.'+
                                                #10+#13+#10+#13+'Utilize a tela "Alterar senha" para cadastrar um nova.',
                                                'Mude sua senha',mtWarning,[mbOk],0);


                                     If FieldByName( 'MudarSenha' ).AsString = 'S' Then Begin
                                        ssenhanova := CriptografarHash( sSenha, FieldByName('IdUsuario').AsInteger, 15 );
                                        balterousenha := PedirNovaSenha( ssenhanova );

                                        If balterousenha Then Begin
                                           GravaHistSenha( FieldByName( 'IDUSUARIO' ).AsInteger,
                                                           FieldByName( 'Senha' ).AsString,
                                                           sSenhanova );
                                           Padroes.ExecSqlAndCommit('UPDATE USUARIOSISTEMA SET SENHA = ' +
                                                          QuotedStr( CriptografarHash( sSenhanova, FieldByName('IdUsuario').AsInteger, 15 ) ) +
                                                          ', MudarSenha = ' + QuotedStr( 'N' ) +
                                                          ' WHERE IDUSUARIO = ' + FieldByName('IdUsuario').AsString );
                                        End Else Begin
                                           TemChance := True;
                                           FLogged := False;
                                        End
                                     End Else
                                        balterousenha := True;

                                     //Verifica se a data para troca de senha expirou e peda alteração de senha
                                     if balterousenha then
                                     begin
                                       _Cds.Data := Padroes.GetDataPacket('SELECT DIASTROCASENHA FROM SEGURANCA');
                                       iDiasSenha := _Cds.Fields[0].AsInteger;

                                       if iDiasSenha > 0 then
                                       begin
                                          _Cds.Data := Padroes.GetDataPacket(' SELECT ' +
                                                                             '   DECODE(MAX(H.DATATROCA), NULL, MAX(U.TRGDTINCLUSAO), MAX(H.DATATROCA)) AS DATA ' +
                                                                             ' FROM ' +
                                                                             '   HISTSENHA H, USUARIOSISTEMA U ' +
                                                                             ' WHERE ' +
                                                                             '  ( U.IDUSUARIO =  ' + FieldByName('IdUsuario').AsString + ' ) AND ' +
                                                                             '  ( H.IDUSUARIO(+) = U.IDUSUARIO ) ');

                                          if (not _Cds.IsEmpty) And (Date > (_Cds.Fields[0].AsDateTime + iDiasSenha) ) then
                                          begin
                                            MsgDlg( 'A sua senha de acesso expirou.' + #13#10 +
                                                    'É necessária a alteração da mesma para habilitar a operação do sistema.',
                                                    'Mude sua senha',mtWarning,[mbOk],0);

                                            ssenhanova := CriptografarHash( sSenha, FieldByName('IdUsuario').AsInteger, 15 );
                                            balterousenha := PedirNovaSenha( ssenhanova );

                                            If balterousenha Then
                                            Begin
                                               GravaHistSenha( FieldByName( 'IDUSUARIO' ).AsInteger,
                                                               FieldByName( 'Senha' ).AsString,
                                                               sSenhanova );
                                               Padroes.ExecSqlAndCommit('UPDATE USUARIOSISTEMA SET SENHA = ' +
                                                              QuotedStr( CriptografarHash( sSenhanova, FieldByName('IdUsuario').AsInteger, 15 ) ) +
                                                              ', MudarSenha = ' + QuotedStr( 'N' ) +
                                                              ' WHERE IDUSUARIO = ' + FieldByName('IdUsuario').AsString );
                                            End
                                            Else
                                            Begin
                                               TemChance := True;
                                               FLogged := False;
                                            End
                                          end;
                                       end;
                                     end;

                                     if _Cds.Active then _Cds.Close;

                                     If balterousenha Then Begin
                                        Sistema.IdUsuario := FieldByName('IdUsuario').AsInteger;
                                        Sistema.IdEspAcesso := FieldByName('IdEspAcesso').AsInteger;
                                        Sistema.NomeUsuario := sUsuario;
                                        Sistema.SuperUsuario := False;
                                        FPodeMudarSenha := FieldByName( 'NaoMudaSenha' ).AsString <> 'S';

                                        If Not FLogEmpresa.PedirEmpresa Then Begin
                                           Sistema.IdUsuario := -1;
                                           Sistema.IdEspAcesso := -1;
                                           Sistema.NomeUsuario := '';
                                           FLogged := false;
                                           TemChance := false;
                                        End Else
                                           FLogged := ConectaUsuario;
                                     End;
                                  End Else Begin
                                     Inc( JaTentou );
                                     MsgDlg( 'Senha inválida', 'Erro', mtError, [mbOk, mbHelp], 0 );
                                  End;
                               End;
                            end; //P.RAMOS-23.11.2004-PEND.17809
                            End;
                         End;
                       end;
                    end;
                 end;

                 If FLogged then
                    TemChance := false;

                 If JaTentou = 3 then Begin
                    JaTentou := 0;
                    TemChance := True;
                    // Bloqueia o usuário
                    Padroes.ExecSqlAndCommit('UPDATE USUARIOSISTEMA SET BLOQUEADO = ' + QuotedStr( 'S' ) +
                                             ' WHERE IDUSUARIO = ' + FieldByName('IdUsuario').AsString );
                    MsgDlg( 'Você foi bloqueado por ter errado sua senha três vezes.' + #13#10 +
                            'Entre em contato com o Administrador' + #13#10 +
                            'para efetuar o desbloqueio.', 'Erro', mtError, [mbOk], 0);
                 End;
            End;
         end;
   end; // while

   if FLogged then begin
      FUltForm := '+++---';
      AutorizarForm(Application.MainForm, afNormal);
   end;

   Result := FLogged;

   Sistema.FezLogin := FLogged;

   If Sistema.FezLogin Then
      Sistema.MudouUsuario := (iOldUsuario <> Sistema.IdUsuario);

   if Assigned(FAfterLogin) then FAfterLogin(Self);
end;

function TAutorizacao.LoginAutomatico(sUsr, sPass, iProcesso, iSeqIni, iSeqFim: string): boolean;
var
   sUsuario, sUsuarioAnt, sSenha, sSenhaBanco, ssenhanova: string;
   balterousenha, TemChance, Achou, bSenhaValida: boolean;
   iDiasSenha, iOldUsuario, JaTentou: integer;

   procedure Gravalog(sTexto, sExt:string; bLimpaArquivo : boolean = true);
   var
     ArqLog : String;
     fLog   : TextFile;
     Path   : string;
   begin
     Path := ExtractFilePath(Application.ExeName) + '\ETL_REGRA\';

     if not DirectoryExists(Path) then
     begin
       if not CreateDir(Path) then
       begin
         ForceDirectories(Path);
       end;
     end;

     ArqLog := Path + 'ETL_REGRA_' + iProcesso + '_' + iSeqIni + '_' + iSeqFim + '.' + UpperCase(sExt);
     AssignFile(fLog, ArqLog);
     if bLimpaArquivo then
       Rewrite(fLog)
     else
       Append(fLog);
     Writeln(fLog,sTexto);
     CloseFile(fLog);
   end;

begin
   iOldUsuario := Sistema.IdUsuario;

   if Not FLogged then
     CriarDataModules;

   Sistema.NomeUsuario := '';
   Sistema.IdUsuario := -1;
   Sistema.IdEspAcesso := -1;
   FLogged  := False;

   JaTentou := 0;
   TemChance := true;
   sUsuarioAnt := '';

   while TemChance do
   begin
     sUsuario := sUsr;
     sSenha   := sPass;

     If sUsuario <> sUsuarioAnt Then
     Begin
       JaTentou := 0;
       sUsuarioAnt := sUsuario;
     End;

     with dtmAutorizacao.CdsUsuario do
     begin
       // Entrada de SUPERusuario
       if (AnsiUpperCase(sUsuario) = 'SUPER') then
       begin
         If ( ( Sistema.SenhaAlteraSuper ) and ( Sistema.SenhaSuper = CriptografarHash( sSenha, 0, 15 ) ) ) or
            ( ( Not Sistema.SenhaAlteraSuper ) and ( VerificarSuperSenha( sSenha ) ) ) Then
         Begin
           Sistema.IdUsuario := 0;
           Sistema.IdEspAcesso := 0;
           Sistema.NomeUsuario := 'SUPER';
           Sistema.SuperUsuario := True;
           FLogged := ConectaUsuario;

           if not FLogEmpresa.PedirEmpresa then
           begin
             Sistema.IdUsuario := -1;
             Sistema.IdEspAcesso := -1;
             Sistema.NomeUsuario := '';
             FLogged := false;
             TemChance := false;
           end;
         End
         end
         else
         begin
           try
             dtmAutorizacao.CdsUsuario.Data := Padroes.GetDataPacket(
                                          'SELECT USUARIOSISTEMA.IDUSUARIO, USUARIOSISTEMA.IDESPACESSO,'+
                                          'USUARIOSISTEMA.SENHA, USUARIOSISTEMA.NOMEUSUARIO, ' +
                                          'USUARIOSISTEMA.BLOQUEADO, USUARIOSISTEMA.DESATIVADO, ' +
                                          'USUARIOSISTEMA.MUDARSENHA, USUARIOSISTEMA.VALIDADESENHA, ' +
                                          'USUARIOSISTEMA.BLOQUEIAATEDATA, '+ //P.RAMOS-23.11.2004-PEND.17809
                                          'USUARIOSISTEMA.NAOMUDASENHA, USUARIOSISTEMA.SENHAPERMANENTE ' +
                                          'FROM USUARIOSISTEMA '+
                                          'WHERE USUARIOSISTEMA.NOMEUSUARIO = ' + QuotedStr( sUsuario ) ) ;
             Achou := Not dtmAutorizacao.CdsUsuario.IsEmpty;
           except
             Achou := false;
           end;

           if Not Achou then
           begin
             Gravalog('PROCESSAMENTO: ERRO','ERR');
             Gravalog('ERRO: Usuário não encontrado','ERR',false);
           end
           Else
           Begin
             //Everson Cunha / Recuperação de Senha - Início
             if FChangePassword then
             begin
               JaTentou := 0;
               TemChance := false;
               FLogged := False;

               Gravalog('PROCESSAMENTO: ERRO','ERR');
               Gravalog('ERRO: Usuário Precisa Rrecuperar Senha! ','ERR',false);
             end
             else
             begin
               //Everson Cunha / Recuperação de Senha - Fim

               sSenhaBanco  := FieldByName('Senha').AsString;
               bSenhaValida := (sSenhaBanco = CriptografarCM(sSenha));

               // Vinícius - 29/09/2004
               if Sistema.UsuarioUnico then
               begin
                 Sistema.AtualizaCMUserID(1,FieldByName('IdUsuario').AsInteger);
               end;

               if bSenhaValida then
                 Padroes.ExecSqlAndCommit('UPDATE USUARIOSISTEMA SET SENHA = ' +
                                          QuotedStr( CriptografarHash( sSenha, FieldByName('IdUsuario').AsInteger, 15 ) ) +
                                          ' WHERE IDUSUARIO = ' + FieldByName('IdUsuario').AsString );

               If FieldByName( 'Bloqueado' ).AsString = 'S' Then
               begin
                 TemChance := False;
                 FLogged := False;

                 Gravalog('PROCESSAMENTO: ERRO','ERR');
                 Gravalog('ERRO: Usuário Bloqueado! ' + #13#10 +
                          'Entre em contato com o Administrador' + #13#10 +
                          'para efetuar o desbloqueio.','ERR',false);
               End
               Else
               Begin
                 If FieldByName( 'Desativado' ).AsString = 'S' Then
                 Begin
                   TemChance := False;
                   FLogged := False;

                   Gravalog('PROCESSAMENTO: ERRO','ERR');
                   Gravalog('ERRO: Usuário Desativado! ' + #13#10 +
                            'Entre em contato com o Administrador' + #13#10 +
                            'para reativar seu acesso.','ERR',false);
                 End
                 Else
                 Begin
                   //P.RAMOS-23.11.2004-PEND.17809
                   if (fieldbyname('BLOQUEIAATEDATA').asdatetime > 0) and
                      (date <= fieldbyname('BLOQUEIAATEDATA').asdatetime) then
                   begin
                     TemChance := False;
                     FLogged := False;
                     Gravalog('PROCESSAMENTO: ERRO','ERR');
                     Gravalog('ERRO: Usuário temporariamente desativado até: ' +
                              formatdatetime('dd/mm/yyyy', fieldbyname('BLOQUEIAATEDATA').asdatetime)+'.'+#13#10+
                             'Entre em contato com o Administrador' + #13#10 +
                             'para reativar o seu acesso.','ERR',false);
                   end
                   else
                   begin
                     //P.RAMOS-23.11.2004-PEND.17809
                     If ( FieldByName( 'SenhaPermanente' ).AsString = 'N' ) and
                        ( FieldByName( 'ValidadeSenha' ).Value < Date ) Then
                     Begin
                       TemChance := False;
                       FLogged := False;
                       Padroes.ExecSqlAndCommit('UPDATE USUARIOSISTEMA SET BLOQUEADO = ' + QuotedStr( 'S' ) +
                                                ' WHERE IDUSUARIO = ' + FieldByName('IdUsuario').AsString );
                       Gravalog('PROCESSAMENTO: ERRO','ERR');
                       Gravalog('ERRO: Sua senha expirou! ' + #13#10 +
                                'Entre em contato com o Administrador' + #13#10 +
                                'para reativar sua senha.','ERR',false);
                     End
                     Else
                     Begin
                       If (bSenhaValida) or (sSenhaBanco = CriptografarHash(sSenha,FieldByName('IdUsuario').AsInteger,15)) then
                       begin
                         If sSenha = 'MUDESUASENHA' then
                         begin
                           Gravalog('PROCESSAMENTO: ERRO','ERR');
                           Gravalog('ERRO: Você ainda está utilizando a senha de acesso' + #13#10 +
                                    'gerada pelo sistema no cadastramento de usuários.'+
                                     #10+#13+#10+#13+'Utilize a tela "Alterar senha" para cadastrar um nova.','ERR',false);
                         end;

                         //Verifica se a data para troca de senha expirou e peda alteração de senha
                         if true then
                         begin
                           _Cds.Data := Padroes.GetDataPacket('SELECT DIASTROCASENHA FROM SEGURANCA');
                           iDiasSenha := _Cds.Fields[0].AsInteger;

                           if iDiasSenha > 0 then
                           begin
                             _Cds.Data := Padroes.GetDataPacket(' SELECT ' +
                                                                '   DECODE(MAX(H.DATATROCA), NULL, MAX(U.TRGDTINCLUSAO), MAX(H.DATATROCA)) AS DATA ' +
                                                                ' FROM ' +
                                                                '   HISTSENHA H, USUARIOSISTEMA U ' +
                                                                ' WHERE ' +
                                                                '  ( U.IDUSUARIO =  ' + FieldByName('IdUsuario').AsString + ' ) AND ' +
                                                                '  ( H.IDUSUARIO(+) = U.IDUSUARIO ) ');

                             if (not _Cds.IsEmpty) And (Date > (_Cds.Fields[0].AsDateTime + iDiasSenha) ) then
                             begin
                               Gravalog('PROCESSAMENTO: ERRO','ERR');
                               Gravalog('ERRO: A sua senha de acesso expirou.' + #13#10 +
                                        'É necessária a alteração da mesma para habilitar a operação do sistema.','ERR',false);

                               TemChance := False;
                               FLogged := False;
                             end;
                           end;
                         end;

                         if _Cds.Active then _Cds.Close;

                         if true Then
                         Begin
                           Sistema.IdUsuario := FieldByName('IdUsuario').AsInteger;
                           Sistema.IdEspAcesso := FieldByName('IdEspAcesso').AsInteger;
                           Sistema.NomeUsuario := sUsuario;
                           Sistema.SuperUsuario := False;
                           FPodeMudarSenha := FieldByName( 'NaoMudaSenha' ).AsString <> 'S';

                           If Not FLogEmpresa.PedirEmpresa Then
                           Begin
                             Sistema.IdUsuario := -1;
                             Sistema.IdEspAcesso := -1;
                             Sistema.NomeUsuario := '';
                             FLogged := false;
                             TemChance := false;
                           End
                           Else
                             FLogged := ConectaUsuario;
                           End;
                         End
                         Else
                         Begin
                           Inc( JaTentou );
                           FLogged := false;
                           TemChance := false;
                           Gravalog('PROCESSAMENTO: ERRO','ERR');
                           Gravalog('ERRO: Senha inválida','ERR',false);
                         End;
                       End;
                     end; //P.RAMOS-23.11.2004-PEND.17809
                   End;
                 End;
               end;
             end;
           end;

           If FLogged then
             TemChance := false;

           If JaTentou = 3 then
           Begin
             JaTentou := 0;
             TemChance := True;
             // Bloqueia o usuário
             Padroes.ExecSqlAndCommit('UPDATE USUARIOSISTEMA SET BLOQUEADO = ' + QuotedStr( 'S' ) +
                                             ' WHERE IDUSUARIO = ' + FieldByName('IdUsuario').AsString );
             Gravalog('PROCESSAMENTO: ERRO','ERR');
             Gravalog('ERRO: Você foi bloqueado por ter errado sua senha três vezes.' + #13#10 +
                      'Entre em contato com o Administrador' + #13#10 +
                      'para efetuar o desbloqueio.','ERR',false);
           End;
         End;
   end; // while

   if FLogged then begin
      FUltForm := '+++---';
      AutorizarForm(Application.MainForm, afNormal);
   end;

   Result := FLogged;

   Sistema.FezLogin := FLogged;

   If Sistema.FezLogin Then
      Sistema.MudouUsuario := (iOldUsuario <> Sistema.IdUsuario);

   if Assigned(FAfterLogin) then FAfterLogin(Self);
end;


procedure TAutorizacao.AutorizarForm(frm: TForm; TipoAutoriza : TTipoAutorizacao);
var
   Compo: TComponent;

begin
   if not FLogged then Exit;

   If FAutorizaMenu And (Frm = Application.MainForm) Then AtualizaMenus(afNormal);

   if FUltForm <> frm.Name then
   begin
        FUltForm := frm.Name;

        { Lista todos os objetos do Form que são controlados}
        with dtmAutorizacao.SqlObjeto do
        begin
          Prepare;
          ParamByName('NomeForm').AsString := frm.Name;
          ParamByName('IdModulo').AsFloat := Sistema.IdModulo;
          Open;
        end;

        with dtmAutorizacao.SqlAutoriza do
        begin
          Prepare;
          ParamByName('IdEmpresa').AsFloat := Sistema.IdEmpresa;
          ParamByName('IdEspAcesso').AsFloat := Sistema.IdEspAcesso;
          ParamByName('IdUsuario').AsFloat := Sistema.IdUsuario;
          // início - André Tavares - pendência 15763
          ParamByName('IdModulo').AsFloat := Sistema.IdModulo;
          // fim - André Tavares - pendência 15763
          Open;
        end;
   end;

   {Desabilita os objetos controlados}
   with dtmAutorizacao.CdsObjeto do
   begin
        If Active Then
        Begin
          first;
          while not eof do
          begin
               Compo := frm.FindComponent(FieldByName('NomeObjeto').AsString);
               //Habilita / Desabilta Botoes

               if Sistema.SuperUsuario then
                  LigaCompo(Compo, true, afNormal)
               else
                   LigaCompo(Compo,
                   dtmAutorizacao.CdsAutoriza.Locate('IDOPERFUNC', FieldByName('IDOPERFUNC').AsInteger, []), TipoAutoriza);
               next;
          end;
        End;
   end;

   If FAutorizaMenu And (Frm = Application.MainForm) Then AtualizaMenus(afSoHabilitar);
end;

function TAutorizacao.PedirLogin(var sUsr, sSenha: string): Boolean;
var
  frmLogin : TfrmLogin;
begin
  try
     Application.ProcessMessages;
     Application.CreateForm(TfrmLogin, frmLogin);
     Application.ProcessMessages;     
     Result := (frmLogin.ShowModal = mrOk);

     FChangePassword := frmLogin.FChangePassword; //Everson Cunha / Recuperação de Senha

     if Result then begin
        sUsr   := frmLogin.edUsuario.Text;
        sSenha := frmLogin.edSenha.Text;
     end;
  finally
     frmLogin.free;
  end;
end;

procedure TAutorizacao.MudarSenha;
var
   sSenha: string;
begin
   if Sistema.SuperUsuario then Exit;

   dtmBaseDados.Cds.Data := Padroes.GetDataPacket('SELECT SENHA FROM USUARIOSISTEMA WHERE USUARIOSISTEMA."IDUSUARIO"='+IntToStr(Sistema.IdUsuario));
   dtmBaseDados.Cds.First;
   
   sSenha := dtmBaseDados.Cds.FieldByName('SENHA').AsString;

   if PedirNovaSenha(sSenha) then
   Begin
      GravaHistSenha( Sistema.IdUsuario, dtmBaseDados.Cds.FieldByName('SENHA').AsString, sSenha );

      Padroes.ExecSqlAndCommit( 'UPDATE USUARIOSISTEMA SET SENHA = ' +
                               QuotedStr( CriptografarHash( sSenha, Sistema.IdUsuario, 15 ) ) +
                              ' WHERE IDUSUARIO = ' + IntToStr( Sistema.IdUsuario ) );
   End;
end;

procedure TAutorizacao.FecharForms;
var i : integer;
begin
     with Application do
     begin
          ProcessMessages;
          //Correção no fecha forma
          for i := (ComponentCount -1) Downto 0 do
              if (Components[i] is TForm) and
                 (TForm(Components[i]) <> Application.MainForm ) and
                 ( CompareText(TForm(Components[i]).name, 'frmAguarde') <> 0) and
                 (TForm(Components[i]) <> nil) and
                 (TForm(application.Components[i]).visible) then
                 TForm(Components[i]).close;
          ProcessMessages;
     end;
end;

procedure TAutorizacao.AtualizaMenus(Tipo :TTipoAutorizacao);
Var
  X:Integer;
Begin
  With Application.MainForm Do
  Begin
    For X:=0 To ComponentCount - 1 Do
    Begin
        If (Components[x] is TMenuItem) Then
        Begin
           If ((Components[x] as TMenuItem).Count > 0) Or
              // Rodolpho da Silva - P: 26079 - 06/09/2007
              //(Components[x].Name = 'Relatorios1') Or

              // Rodolpho da Silva - 26/04/2006
              (Components[x].Name = 'mnuVariacaoIndices') Or

              (Components[x].Name = 'mnuLLH_Padrao') Or
              (Components[x].Name = 'mnuLLV_Padrao') Or
              (Components[x].Name = 'mnuCascata_Padrao') Or
              (Components[x].Name = 'mnuOrgIcons_padrao') Or
              (Components[x].Name = 'mnuMininizar_Padrao') Or
              (Components[x].Name = 'mnuAjudaIndice') Or
              (Components[x].Name = 'mnuAjudaComoUsar') Or
              (Components[x].Name = 'Histricodealteraes1') Or
              (Components[x].Name = 'mnusepAjuda1') Or
              (Components[x].Name = 'mnuAjudaSobre') Or
              (Components[x].Name = 'Grficos2') Or
              (Components[x].Name = 'MnuConsultasGerais_Padrao') Or
              (Components[x].Name = 'mnuLogin') Or
              (Components[x].Name = 'mnuListaMensagens') Or
              (Components[x].Name = 'mnuEnviaMensagem') Or
              (Components[x].Name = 'MudarEmpresa1') Or
              (Components[x].Name = 'mnuSair') Or
              (Components[x].Name = 'mnuLLH') Or
              (Components[x].Name = 'mnuLLV') Or
              (Components[x].Name = 'mnuCascata') Or
              (Components[x].Name = 'mnuOrgIcons') Or
              (Components[x].Name = 'mnuMininizar') Or
              (Components[x].Name = 'mnuAjudaIndice') Or
              (Components[x].Name = 'mnuAjudaComoUsar') Or
              (Components[x].Name = 'Histricodealteraes1') Or
              (Components[x].Name = 'BarradeAtalhos1') Or
              (Components[x].Name = 'mnuConfigBarradeStatus') Or
              (Components[x].Name = 'mnuAjudaSobre') Or
              (Components[x].Name = 'Alterarsenha1') Or
              ((UpperCase(Sistema.NomeUsuario) = 'SUPER') And
               ((Components[x].Name = 'Usuarios1') Or
                (Components[x].Name = 'Grupos1'))) Or
               (((Components[x] as TMenuItem).Parent <> nil ) AND
                ((Components[x] as TMenuItem).Parent.Name = 'mnuIdiomas'))
              Then
                (Components[x] as TMenuItem).Enabled := True
           Else
              If Tipo = afNormal Then
                 (Components[x] as TMenuItem).Enabled := False;
        End;
    End;
  End;
End;


function TAutorizacao.ConectaUsuario : Boolean;
function Conecta(db : TDataBase) : Boolean;
begin
     with db do
     begin
          if CompareText(Sistema.DriverServidor, DriverOracle) = 0 then
          begin
             Close;
             if not Sistema.UsuarioUnico then
             begin
                Params.Values['USER NAME'] := 'CM'+IntToStr(Sistema.IdUsuario);

                if not dtmBaseDados.AbreDataBase(db) then
                begin
                   if Sistema.IdUsuario = 0 then
                   begin
                        MsgDlg( 'Não foi possivel conectar com o servidor'+#10#13+
                                'Usuario - CM'+IntToStr(Sistema.IdUsuario),
                                'Erro Grave', mtError, [mbOk],0);
                        Halt;
                   end

                   else
                   begin
                        MsgDlg( 'Não foi possivel conectar com o servidor'+#10#13+
                                'Usuario - CM'+IntToStr(Sistema.IdUsuario),
                                'Acesso Negado', mtError, [mbOk],0);
                        Sistema.IdUsuario := 0;
                        Conecta(db);
                   end;
                   Result := false;
                end
                else
                   Result := true;
             end
             else
                Result := true;
          end
          else
            Result := true;
     end;
end;

begin
   Result := Conecta(dtmBaseDados.dbBaseDados);
end;

function VerificarSuperSenha(const sSenha: string): Boolean;
var
   dt: TDateTime;
begin
   dt := Now;
   Result := IntToStr((Day(dt) + Month(dt))*Year(dt) + Hour(dt)) = sSenha;
end;


function ValidaSenhaUsuario(sUsuario, sSenha :String; Var IdUsuario, IdEspAcesso :Integer) :Boolean;
Var
  sSenhaBanco :String;
  bSenhaValida :Boolean;
Begin
    Result := False;

    dtmBaseDados.Cds.Data := Padroes.GetDataPacket('SELECT USUARIOSISTEMA.IDUSUARIO, USUARIOSISTEMA.IDESPACESSO,'+
                                           '       USUARIOSISTEMA.SENHA, USUARIOSISTEMA.NOMEUSUARIO '+
                                           'FROM USUARIOSISTEMA '+
                                           'WHERE (USUARIOSISTEMA.NOMEUSUARIO = '''+sUsuario+''')');
    if Not dtmBaseDados.Cds.IsEmpty then
    begin
        IdUsuario := dtmBaseDados.Cds.FieldByName('IDUSUARIO').AsInteger;
        IdEspAcesso := dtmBaseDados.Cds.FieldByName('IDESPACESSO').AsInteger;

        sSenhaBanco := dtmBaseDados.Cds.FieldByName('SENHA').AsString;

        bSenhaValida := (sSenhaBanco = CriptografarCM(sSenha));

        Result := (bSenhaValida) or
                  (sSenhaBanco = CriptografarHash(sSenha,dtmBaseDados.Cds.FieldByName('IDUSUARIO').AsInteger,15));
    End;
End;

//edilaine - SIG33979 - inicio
procedure AplicaAlteracoesInTransacao( pDataSet : array of TDBDataSet) ;
begin
     AplicaUpdatesInTrans(pDataSet);
     if Sistema.ConectaRemoto then
        AplicaUpdatesInTrans(pDataSet);
end;

procedure AplicaUpdatesInTrans(const DataSets: array of TDBDataSet);
var
  I: Integer;
begin
  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

  try
     for I := 0 to High(DataSets) do
     begin
         if DataSets[I].Database = dtmBaseDados.dbBaseDados then
            DataSets[I].ApplyUpdates;
     end;

     dtmBaseDados.dbBaseDados.Commit;

     for I := 0 to High(DataSets) do
         if DataSets[I].Database = dtmBaseDados.dbBaseDados then
            DataSets[I].CommitUpdates;
  except
        dtmBaseDados.dbBaseDados.Rollback;
        raise;
  end;
end;
//edilaine - SIG33979 - fim

//Darivaldo Alencar SIG67981 -inicio
function TAutorizacao.getStringConexaoADO: String;
var
  sLinha,
  sConexao,
  sUser,
  sPassword: String;
  i: Integer;

function DadoCopiado(iLinha: Integer): String;
begin
  result:= Copy(dtmBaseDados.dbBaseDados.Params[iLinha],pos('=',sLinha) + 1, 500);
end;

begin
  for i:= 0 to dtmBaseDados.dbBaseDados.Params.Count -1 do
    begin
      sLinha:= UpperCase(dtmBaseDados.dbBaseDados.Params[i]);
      if pos('SERVER NAME',sLinha) >0 then
        sConexao:= DadoCopiado(i)
      else
      if pos('USER NAME',sLinha) >0 then
        sUser:= DadoCopiado(i)
      else
      if pos('PASSWORD',sLinha) >0 then
        sPassword:= DadoCopiado(i);

      if (sUser<> emptyStr) and (sConexao<> emptyStr)  and (sPassword<> emptyStr) then
          break;
    end;

    //Leandro Pocebon - WO Oracle 21/07/2025 - Inicio
    //Everson Luiz - SIG Tibero 03/11/2018 - Início
    result:= 'Provider=OraOLEDB.Oracle.1;Password='+sPassword+';Persist Security Info=True;User ID='+sUser+';Data Source='+ sConexao;

    //result:= 'Provider=tbprov.Tbprov.6;Cache Authentication=False;Encrypt Password=False;Integrated Security="";Mask Password=False;Persist Encrypted=False;' +
    //         'Persist Security Info=True;Bind Flags=0;Initial Catalog="";Impersonation Level=Anonymous;Location="";Lock Owner="";Mode=ReadWrite;Protection Level=None;' +
    //         'Extended Properties="";Updatable Cursor=False;Enlist=None;Max Pool Size=100;Min Pool Size=1;Connect Lifetime=0;' +
    //         'Data Source=' + sConexao + ';Password=' +  sPassword + ';User ID=' + sUser ;
    //Everson Luiz - SIG Tibero 03/11/2018 - Fim
    //Leandro Pocebon - WO Oracle 21/07/2025 - Fim
end;
//Darivaldo Alencar SIG67981 -fim


//Darivaldo Alencar SIG62086 -Inicio
procedure TAutorizacao.FecharTelaPreviewRel;
var
  sImpressora: String;
begin
  if (GerandoRelatorio(False)) then
    begin
       sImpressora:= ImpressoraPadrao(False);
       ChangeDefaultPrinter(sImpressora, 0);
       //GerandoRelatorio(True,0);
       ImpressoraPadrao(True,sImpressora);
    end;
end;

{Guarda sempre a impressora padrão correta}
function TAutorizacao.ImpressoraPadrao(bGerar: Boolean; sImpressora: String =''): String;
var
  Registro: TRegistry;
  sPadrao: String;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      if(Registro.OpenKey('Software\Microsoft\Windows NT\CurrentVersion\Windows',True)) then
        begin
            if (bGerar) then
               Registro.WriteString('ImpPadrao',Trim(sImpressora));

            sPadrao:= Registro.ReadString('ImpPadrao');
        end
      else sPadrao:= EmptyStr;
    except
      sPadrao:= EmptyStr;
      Registro.WriteString('ImpPadrao',sPadrao);
    end;
    result:= Trim(sPadrao);
  finally
    Registro.CloseKey;
    FreeAndNil(Registro);
  end;
end;

{Verificar se já existe um relatório sendo gerado}
function TAutorizacao.GerandoRelatorio(bGerar: Boolean; iValor: Integer = 0): Boolean;
var
  Registro: TRegistry;
  iImprimindo: Integer;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      if(Registro.OpenKey('Software\Microsoft\Windows NT\CurrentVersion\Windows',True)) then
        begin
            if (bGerar) then
               Registro.WriteInteger('ImprimindoMR',iValor);

            iImprimindo:= Registro.ReadInteger('ImprimindoMR');
        end
      else iImprimindo:= 0;
    except
      iImprimindo:= 0;
      Registro.WriteInteger('ImprimindoMR',iImprimindo);
    end;
    result:= (iImprimindo = 1);
  finally
    Registro.CloseKey;
    FreeAndNil(Registro);
  end;
end;

function TAutorizacao.ImpressoraPadraoWindows: String;
var
   Registry: TRegistry;
   sImpressoraWindows: String;
begin
    Registry := TRegistry.Create;
    try
      Registry.RootKey := HKEY_CURRENT_USER;
      try
        Registry.OpenKeyReadOnly('Software\Microsoft\Windows NT\CurrentVersion\Windows');
        sImpressoraWindows := Registry.ReadString('Device');
        sImpressoraWindows := Copy(sImpressoraWindows, 1, Pos(',', sImpressoraWindows)- 1);
      except
        sImpressoraWindows:= EmptyStr;
      end;
      result:= sImpressoraWindows;
    finally
      Registry.CloseKey;
      Registry.Free;
    end;
end;

procedure TAutorizacao.ChangeDefaultPrinter(const Name: string; const iOpcao: Integer);
var
  W2KSDP: function(pszPrinter: PChar): Boolean; stdcall;
  H: THandle;
  Size, Dummy: Cardinal;
  PI: PPrinterInfo2;

begin
  GerandoRelatorio(True, iOpcao); //Alteração do gerar relatorio

  if (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion >= 5) then
  begin
    @W2KSDP := GetProcAddress(GetModuleHandle(winspl), 'SetDefaultPrinterA');
    if @W2KSDP = nil then Exit;

    if not W2KSDP(PChar(Name)) then Exit;

  end
end;
//Darivaldo Alencar SIG62086 -Fim

//Everson Cunha / Recuperação de Senha - Início
function TAutorizacao.SenhaAleatoria: string;
var
  i, iQtde, iChar : integer;
  sC, Ch : string;
begin
  Result := '';

  Randomize;

  //iQtde := 7;                 // Andre Imakawa - SIG 137435
  iQtde := Sistema.SenhaTamMin; // Andre Imakawa - SIG 137435

  sC := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  for i := 1 to iQtde  do
  begin
    iChar := Random( 36 ) + 1;
    Ch := Copy( sC, iChar, 1 );
    Result := Result + Ch;
  end;
end;
//Everson Cunha / Recuperação de Senha - Fim

// Andre Imakawa - SIG 137435 - Inicio
function TAutorizacao.SenhaAleatoriaBD: string;
var
  i, iQtde, iChar : integer;
  sC, Ch : string;
begin
  Result := '';

  iQtde := Sistema.SenhaTamMin; // Andre Imakawa - SIG 137435

  _Cds.Data := Padroes.GetDataPacket('SELECT CM.PCK_SEGURANCA_PLANUS.GERAR_SENHA('+inttostr(iQtde)+', 3, 3, 1, ''L'', ''S'', 1) AS SENHA FROM DUAL ');

  if not(_Cds.isEmpty) then
  begin
    Result := trim(_Cds.FieldByName('SENHA').AsString)
  end
  else
  begin
    Result := SenhaAleatoria;
  end;


end;
// Andre Imakawa - SIG 137435 - Fim

//Everson Cunha / Recuperação de Senha - Início
function TAutorizacao.PreparaNotificacao(pIdUsuario, pSenha, pEmail: String): Boolean;
var
  sUrl, sTokenSistema, sChavePublica, sChavePrivada, sContentType, sBaseDados,
  sJSON : string;
  sRetorno: string;
begin
  //sUrl          := 'https://www.funcef.com.br/api/centralnotificacao/EnviarNotificacao/Enviar';    //SIG134476 - Everson Cunha
  sUrl          := 'https://intranet.funcef.com.br/api/centralnotificacao/EnviarNotificacao/Enviar'; //SIG134476 - Everson Cunha
  sTokenSistema := 'DUJ6KCEYo3vnLaxs/ofHtA==';
  sChavePublica := 'i3Ml2e0zgxY=';
  sChavePrivada := 'LLgiknVEYkQeJW786syCW0WqqG5fA+/Klizyf68sGE8X4lvWydp9jg==';
  sContentType  := 'application/json';

  if Copy(UpperCase(Sistema.AliasServidor), 1, 8) <> 'PRODUCAO' then
    sBaseDados := Sistema.AliasServidor;

  sJSON := '{"ChavePublica": "' + sChavePublica +
         '", "ChavePrivada": "' + sChavePrivada +
         '", "Destinatarios":[{ "Nome": "", "Email": "' + pEmail +
         '", "Tags":{ "senha": "' + pSenha + '", "baseDados": "' + sBaseDados + '" } }] }';

  if FuncaoGeral.RequestAPI(sUrl, sJSON, sRetorno, sContentType, sTokenSistema) then
    result := True
  else
    result := False;

end;
//Everson Cunha / Recuperação de Senha - Fim

//Everson Cunha / Recuperação de Senha - Início
procedure TAutorizacao.RecuperarSenha(const idUsuario : string);
var
  sSenhaNova, sEmail: string; // Andre Imakawa - SIG 137435

begin
  //Verifica se o empregado está Ativo
  _Cds.Data := Padroes.GetDataPacket('SELECT S.TIPOSIT, P.EMAIL FROM CM.FUNCIONARIO F ' +
                                     '  JOIN CM.PESSOA P ON P.IDPESSOA = F.IDPESSOA ' +
                                     '  JOIN CM.SITFUNC S ON S.IDSITFUNC = F.IDSITFUNC ' +
                                     ' WHERE F.IDPESSOA = ' + idUsuario);

  //Caso não seja empregado, refaz o select buscando apenas na tabela pessoa
  if _Cds.isEmpty then
  begin
    _Cds.Data := Padroes.GetDataPacket('SELECT ''A'' TIPOSIT, P.EMAIL FROM CM.PESSOA P ' +
                                       ' WHERE P.IDPESSOA = ' + idUsuario);
  end;

  if trim(_Cds.FieldByName('EMAIL').AsString) = '' then
  begin
    MsgDlg('Email não localizado no cadastro',
           'Cadastro incompleto', mtWarning, [mbOk], 0);
    Exit;
  end;

  //Alteração não permitida para empregados Demitidos ou Afastados
  if _Cds.FieldByName('TIPOSIT').AsString <> 'A' then
    MsgDlg('Alteração não permitida para empregados Afastados ou Desligados',
           'Ação não Permitida', mtInformation, [mbOk], 0)
  else
  if MsgDlg('Uma nova senha será encaminhada para o email ' +
            trim(_Cds.FieldByName('EMAIL').AsString) + #13#10 +
            'Confirma?', 'Confirmação de Email', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    //Gerar senha aleatória
    sEmail := trim(_Cds.FieldByName('EMAIL').AsString); // Andre Imakawa - SIG 137435
    sSenhaNova := SenhaAleatoriaBD; // Andre Imakawa - SIG 137435

    //Caso tenha algum problema na geração da senha aleatória
    if sSenhaNova <> '' then
    begin
      //Envio de email informando a nova senha
      if PreparaNotificacao(idUsuario, sSenhaNova, sEmail) then // Andre Imakawa - SIG 137435
      begin
        //Gravar senha no histórico
        GravaHistSenha(StrToInt(idUsuario), '', sSenhaNova);

        //Gravar senha na tabela USUARIOSISTEMA
        if Padroes.ExecSqlAndCommit('UPDATE USUARIOSISTEMA SET SENHA = ' +
                                    QuotedStr( CriptografarHash(sSenhaNova, StrToInt(idUsuario), 15) ) +
                                    ', MudarSenha = ' + QuotedStr( 'S' ) +
                                    ', Bloqueado = ' + QuotedStr( 'N' ) +
                                    ' WHERE IDUSUARIO = ' + idUsuario ) then
          MsgDlg('Alteração de senha realizada com Sucesso! ' + #13#10 +
                 'Utilize a nova senha encaminhada por email',
                 'Sucesso', mtInformation, [mbOk], 0)
        else //Problemas na gravação da senha no banco
          MsgDlg('Alteração de senha NÃO realizada, procure a área de suporte' + #13#10 + #13#10 +
                 'Desconsidere a nova senha encaminhada por Email',
                 'Problemas com a gravação da Senha', mtError, [mbOk], 0);
      end
      else  //Erro no envio do email
        MsgDlg('Alteração de senha NÃO realizada, procure a área de suporte',
               'Problemas com o envio do Email', mtError, [mbOk], 0);
    end
    else //Erro na geração da senha aleatória
      MsgDlg('Alteração de senha NÃO realizada, procure a área de suporte',
             'Problemas com a geração da senha', mtError, [mbOk], 0);
  end
  else  //Usuário não confirma o envio, cancela a operação
    MsgDlg('Alteração de senha CANCELADA',
           'Alteração Cancelada pelo Usuário', mtInformation, [mbOk], 0);
end;
//Everson Cunha / Recuperação de Senha - Fim


//edilaine WO41032 : inicio
procedure TAutorizacao.CarregarImagem(CampoImg: TBlobField; FrameImg : TImage);
var
  Bmp: TBitmap;

  function BlobImagemParaBitmap(CampoBlob: TBlobField; Bitmap: TBitmap): Boolean;
  var
    MS: TMemoryStream;
    JPG: TJPEGImage;
    B1, B2, B3: Byte;
  begin
    Result := False;

    if (CampoBlob = nil) or CampoBlob.IsNull then
      Exit;

    MS := TMemoryStream.Create;
    JPG := TJPEGImage.Create;
    try
      CampoBlob.SaveToStream(MS);

      if MS.Size < 3 then
        Exit;

      MS.Position := 0;
      MS.Read(B1, 1);
      MS.Read(B2, 1);
      MS.Read(B3, 1);
      MS.Position := 0;

      { BMP começa com "BM" }
      if (B1 = Ord('B')) and (B2 = Ord('M')) then
      begin
        Bitmap.LoadFromStream(MS);
        Result := True;
      end
      { JPG começa com FF D8 FF }
      else if (B1 = $FF) and (B2 = $D8) and (B3 = $FF) then
      begin
        JPG.LoadFromStream(MS);
        Bitmap.Assign(JPG);  { aqui converte JPEG para BMP em memória }
        Result := True;
      end;
    finally
      JPG.Free;
      MS.Free;
    end;
  end;

begin
  Bmp := TBitmap.Create;
  try
    if BlobImagemParaBitmap(CampoImg, Bmp) then
      FrameImg.Picture.Bitmap.Assign(Bmp)
    else
      FrameImg.Picture := nil;
  finally
    Bmp.Free;
  end;
end;
//edilaine WO41032 : fim


end.

{===============================================================================
Analista  : Vinícius
Pendência : 17429
Descrição : Inclusão do parâmetro Sistema.TipoCliente para identificação de
            customizações específicas
===============================================================================}


unit FLogEmpresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, Buttons, ExtCtrls, MAHlpBtn, Db, DBTables,
  comctrls, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, FOkCancelar;

type
  TfrmLogEmpresa = class(TfrmOkCancelar)
    Label1: TLabel;
    dblkpEmpresa: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogEmpresa: TfrmLogEmpresa;

function PedirEmpresa: Boolean;

implementation

uses DAutorizacao, uMensErro, uSistema, dBaseDados, registry, uCtrlPadroes, uCMTypes;

{$R *.DFM}

function PedirEmpresa: Boolean;
var
  Reg : TRegistry;
  iOldEmpresa: Integer;
begin
   Result := False;

   iOldEmpresa := Sistema.IdEmpresa;

   dtmAutorizacao.SQLEmpresaProp.Open;

   case dtmAutorizacao.CdsEmpresaProp.RecordCount of
        1: begin
                Sistema.IdEmpresa := dtmAutorizacao.CdsEmpresaProp.FieldByName('IdPessoa').AsInteger;
                Sistema.TipoEmpresa := dtmAutorizacao.CdsEmpresaProp.FieldByName('TIPOEMPRESA').AsString;
                Sistema.NomeEmpresa := dtmAutorizacao.CdsEmpresaProp.FieldByName('NomeEmpresa').AsString;
                Sistema.UsaPlanoPatro := (dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGPLANOPATRO').AsString = 'S');
                ///Marcus Oliveira P. Flg para o RADPlus
                Sistema.UsaRad := (UpperCase(dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGRAD').AsString) = 'S') OR
                                  (dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGRAD').AsString = '+');

                Sistema.VersaoRad := UpperCase(dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGRAD').AsString);
                Sistema.EmailOnError := dtmAutorizacao.CdsEmpresaProp.FieldByName('EmailOnError').AsString;

                // Pend. 17429 Vinicius
                Sistema.TipoCliente := dtmAutorizacao.CdsEmpresaProp.FieldByName('TIPOCLIENTE').AsInteger;

                if dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGFILTROUSUARIO').AsString = 'A' then
                   Sistema.TipoFiltroUsuario := fuSoAtivos
                else
                   Sistema.TipoFiltroUsuario := fuALL;

                dtmBaseDados.Cds.Data := Padroes.GetDataPacket('SELECT RAZAOSOCIAL, NOME, NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = '+ IntToStr(Sistema.IdEmpresa));
                Sistema.RazaoSocial   := dtmBaseDados.Cds.FieldByName('RAZAOSOCIAL').AsString;
                Sistema.NomeFantasia  := dtmBaseDados.Cds.FieldByName('NOME').AsString;
                Sistema.NumDocEmpresa := dtmBaseDados.Cds.FieldByName('NUMDOCUMENTO').AsString;


                Result := True;
           end;
        0: begin
                MsgDlg('Não existe Empresa cadastrada', 'Log de Empresa',mtWarning , [mbOk,mbHelp], 0);
           end;
        else begin
                  Reg := TRegistry.Create;
                  Reg.RootKey := HKEY_CURRENT_USER;
                  Reg.OpenKey('software\cm', false);
                  try
                     Sistema.IdEmpresa := Reg.ReadInteger('Ultima Empresa');
                  except

                  end;
                  Reg.CloseKey;

                  If Sistema.PedeLoginEmpresa Then
                  Begin
                     frmLogEmpresa := TfrmLogEmpresa.Create(Application);
                     try
                        with frmLogEmpresa do
                        begin
                             if Sistema.IdEmpresa <> -1 then
                                dblkpEmpresa.LookupValue := IntToStr(Sistema.IdEmpresa)
                             else
                                 dblkpEmpresa.LookupValue :=
                                 IntToStr(dtmAutorizacao.CdsEmpresaProp.FieldByName('IdPessoa').AsInteger);

                             Result := (ShowModal = mrOk);
                             if Result then
                             begin
                                  Sistema.IdEmpresa := StrToInt(dblkpEmpresa.LookupValue);
                                  Sistema.TipoEmpresa := dtmAutorizacao.CdsEmpresaProp.FieldByName('TIPOEMPRESA').AsString;

                                  // Pend. 17429 Vinicius
                                  Sistema.TipoCliente := dtmAutorizacao.CdsEmpresaProp.FieldByName('TIPOCLIENTE').AsInteger;

                                  if dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGFILTROUSUARIO').AsString = 'A' then
                                     Sistema.TipoFiltroUsuario := fuSoAtivos
                                  else
                                     Sistema.TipoFiltroUsuario := fuALL;

                                  Sistema.EmailOnError := dtmAutorizacao.CdsEmpresaProp.FieldByName('EmailOnError').AsString;
                                  Sistema.NomeEmpresa := dblkpEmpresa.Text;

                                  // Utiliza RAD ?
                                  Sistema.UsaPlanoPatro := (dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGPLANOPATRO').AsString = 'S');
                                  //Marcus Oliveira P. Flg para o RADPlus
                                  Sistema.UsaRad := (UpperCase(dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGRAD').AsString) = 'S') OR
                                                    (dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGRAD').AsString = '+');
                                  Sistema.VersaoRad := UpperCase(dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGRAD').AsString);
                                  //Sistema.UsaRad := (dtmAutorizacao.CdsEmpresaProp.FieldByName('FLGRAD').AsString = 'S');

                                  // Razao Social
                                  dtmBaseDados.Cds.Data := Padroes.GetDataPacket('SELECT RAZAOSOCIAL, NOME, NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = '+ IntToStr(Sistema.IdEmpresa));
                                  Sistema.RazaoSocial := dtmBaseDados.Cds.FieldByName('RAZAOSOCIAL').AsString;
                                  Sistema.NomeFantasia  := dtmBaseDados.Cds.FieldByName('NOME').AsString;
                                  Sistema.NumDocEmpresa := dtmBaseDados.Cds.FieldByName('NUMDOCUMENTO').AsString;

                                  Reg.OpenKey('software\cm', false);
                                  try
                                     if Sistema.GravaRegister then
                                        Reg.WriteInteger('Ultima Empresa', Sistema.IdEmpresa);
                                  except end;
                                  Reg.CloseKey;
                             end;
                        end; {with}
                     finally
                            frmLogEmpresa.Release;
                     end; {finally}
                  End
                  Else
                  Begin
                     Sistema.IdEmpresa := -1;
                     Sistema.TipoEmpresa := 'I';
                     Sistema.NomeEmpresa := 'Sistema Corporativo';
                     Sistema.RazaoSocial := 'Sistema Corporativo';
                     Sistema.NomeFantasia := 'Sistema Corporativo';
                     Sistema.TipoFiltroUsuario := fuALL;
                     Result := True;
                  End;

                  reg.free;
              end //else
   end; //case

   //Busca Parâmetro de Pesso No ParamGlobal
   If Result Then
   Begin
      If dtmAutorizacao.CdsParamGlobal.Active Then dtmAutorizacao.CdsParamGlobal.Close;

      //Busca Atributos do Controle de Usuário/Senha do ParamGlobal
      dtmAutorizacao.SqlParamGlobal.Prepare;
      dtmAutorizacao.SqlParamGlobal.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      dtmAutorizacao.SqlParamGlobal.Open;

      If dtmAutorizacao.CdsParamGlobal.IsEmpty Then
      Begin
         Sistema.SoUpperPessoa     := False;
         Sistema.UsaEnderecoPessoa := False;
         Sistema.ObrigaDocPessoa   := False;
         Sistema.DuplicaDocPessoa  := True;
         Sistema.ViculaModuloxPessoa  := False;
      End
      Else
      Begin
         Sistema.SoUpperPessoa     := (dtmAutorizacao.CdsParamGlobal.FieldByName('FLGUSAUPPERPESSOA').AsString = 'S');
         Sistema.UsaEnderecoPessoa := (dtmAutorizacao.CdsParamGlobal.FieldByName('FLGUSAENDPESSOA').AsString = 'S');
         Sistema.ObrigaDocPessoa   := (dtmAutorizacao.CdsParamGlobal.FieldByName('FLGOBRIDOCPESSOA').AsString = 'S');
         Sistema.DuplicaDocPessoa  := (dtmAutorizacao.CdsParamGlobal.FieldByName('FLGDUPLDOCPESSOA').AsString <> 'N');
         Sistema.ViculaModuloxPessoa  := (dtmAutorizacao.CdsParamGlobal.FieldByName('FLGUSAMODRESPON').AsString = 'S');
      End;

      dtmAutorizacao.CdsParamGlobal.Close;
   End;

   Sistema.MudouEmpresa := (iOldEmpresa <> Sistema.IdEmpresa);
end;

procedure TfrmLogEmpresa.FormActivate(Sender: TObject);
begin
     dblkpEmpresa.SetFocus;
end;

procedure TfrmLogEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  dblkpEmpresa.LookupTable  := dtmAutorizacao.CdsEmpresaProp;
end;

end.

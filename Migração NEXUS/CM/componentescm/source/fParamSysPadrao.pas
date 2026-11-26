{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                14/10/2004 por andre tavares - pendência 16830
{ Descrição : grava o parametro  no registro do sistema que define se é permitido }
{ a execução de mais de uma instância do mesmo sistema.                           }
{                                                       }
{*******************************************************}
unit fParamSysPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, TB97, CmDock, ExtCtrls, fcTreeView,
  ImgList, ComCtrls, StdCtrls, Registry, Buttons, BfDialogs, BrowseFolder,
  uProcuraDir;

type
  TFrmParamSysPadrao = class(Tform)
    CMOkCancelar1: TCMOkCancelar;
    pnlFundo: TPanel;
    TvwParams: TfcTreeView;
    NtbParams: TNotebook;
    Memo1: TMemo;
    Image1: TImage;
    Image2: TImage;
    Memo2: TMemo;
    Image3: TImage;
    Memo3: TMemo;
    Image4: TImage;
    Memo4: TMemo;
    Label1: TLabel;
    EdtAliasPrincipal: TEdit;
    Label2: TLabel;
    EdtAliasSecundario: TEdit;
    Label3: TLabel;
    EdtSocketHost: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdtUrl: TEdit;
    Label8: TLabel;
    EdtComputerName: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Memo5: TMemo;
    Image5: TImage;
    Label6: TLabel;
    EdtVersao: TEdit;
    BtnFolder: TSpeedButton;
    DlgDir: TProcuraDirDlg;
    Label7: TLabel;
    EdtNomeServ: TEdit;
    EdtNomeServSecundario: TEdit;
    Label12: TLabel;
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TvwParamsEditing(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; var AllowEdit: Boolean);
    procedure TvwParamsClick(Sender: TObject);
    procedure TvwParamsToggleCheckbox(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure CMOkCancelar1SairClick(Sender: TObject);
    procedure BtnFolderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamSysPadrao: TFrmParamSysPadrao;

implementation

Uses uSistema, uMidasUtil, uCMTypes, uCmRegister;

{$R *.DFM}

procedure TFrmParamSysPadrao.CMOkCancelar1OkClick(Sender: TObject);
Var
  X: Integer;
begin
  inherited;



  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      try
        OpenKey('Software\CM\'+Sistema.NomeModulo, True);
      except
        OpenKeyReadOnly('Software\CM\'+Sistema.NomeModulo);
      end;

      For X:=0 To TvwParams.Items.Count - 1 Do
      Begin
         Case TvwParams.Items[x].ImageIndex of
            //Alias Servidor
            1:
              If EdtAliasPrincipal.Text <> Sistema.AliasServidor Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_ALIAS_SERVIDOR, EdtAliasPrincipal.Text)
                 else
                    Sistema.AliasServidor := EdtAliasPrincipal.Text;
            //Driver Servidor Oracle
            2:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidor) = 'ORACLE')) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR, 'ORACLE');
            //Driver Servidor Db2
            3:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidor) = 'DB2')) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR, 'DB2');
            //Alias Servidor Remoto
            4:
              If EdtAliasSecundario.Text <> Sistema.AliasServidorRemoto Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_ALIAS_SERVIDOR_REMOTO, EdtAliasSecundario.Text);
            //Driver Servidor Remoto Oracle
            5:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidorRemoto) = 'ORACLE')) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR_REMOTO, 'ORACLE');
            //Driver Servidor Remoto DB2
            6:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidorRemoto) = 'DB2')) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR_REMOTO, 'DB2');
            //Tipo de Conexão BDE
            7:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.ConnectionType = cntBDE)) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_CONNECTION_TYPE, '0');
            //Tipo de Conexão ADO
            8:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.ConnectionType = cntADO)) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_CONNECTION_TYPE, '1');
            //Tipo de Conexão IB
            9:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.ConnectionType = cntIB)) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_CONNECTION_TYPE, '2');
            //Tipo de Conexão DOA
            10:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.ConnectionType = cntDOA)) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_CONNECTION_TYPE, '3');
            //Funciona como Client Server Local
            11:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.ConnectionSide = cnsServer)) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_CONNECTION_SIDE, '0');
            //Funciona como Thin Client
            12:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.ConnectionSide = cnsClient)) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_CONNECTION_SIDE, '1');
            //Usa Socket + HOST
            13:
            Begin
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.MidleWareConnection = mwcSocket)) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_MIDLEWARE_CONNECTION, '0');

              If EdtSocketHost.Text <> Sistema.SocketHost Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_SOCKET_HOST, EdtSocketHost.Text);
            End;
            //Usa Web Connection + URL
            14:
            Begin
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.MidleWareConnection = mwcWEB)) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_MIDLEWARE_CONNECTION, '2');

              If EdtUrl.Text <> Sistema.WebUrl Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_WEB_URL, EdtUrl.Text);
            End;
            //Usa DCOM + Computer Name
            15:
            Begin
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.MidleWareConnection = mwcDCOM)) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_MIDLEWARE_CONNECTION, '1');

              If EdtComputerName.Text <> Sistema.DcomComputerName Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DCOM_COMPUTERNAME, EdtComputerName.Text);
            End;
            //Idioma Português
            16:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.IdiomaAtivo = 1)) Then
                 Sistema.IdiomaAtivo := 1;
            //Idioma Espanhol
            17:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.IdiomaAtivo = 2)) Then
                 Sistema.IdiomaAtivo := 2;
            //Idioma Inglês
            18:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (Sistema.IdiomaAtivo = 3)) Then
                 Sistema.IdiomaAtivo := 3;
            19:
            Begin
              If (EdtVersao.Text <> Sistema.DirVersao) Then
                 with TRegistry.Create do
                   Try
                     try
                        OpenKey('Software\CM', True);
                     except
                        OpenKeyReadOnly('Software\CM');
                     end;

                     if Sistema.GravaRegister then
                        WriteString(KEY_DIR_VERSAO, EdtVersao.Text)
                   finally
                     CloseKey;
                     free;
                   End;
            End;
            20:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidor) = 'MSSQL')) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR, 'MSSQL');
            //Driver Servidor Remoto Oracle
            21:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidorRemoto) = 'MSSQL')) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR_REMOTO, 'MSSQL');
            //Driver Servidor Remoto DB2
            22:
              If EdtNomeServ.Text <> Sistema.NomeServidor Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_NOME_SERVIDOR, EdtNomeServ.Text);
            23:
              If EdtNomeServSecundario.Text <> Sistema.NomeServidorSecundario Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_NOME_SERVIDOR_SECUNDARIO, EdtNomeServSecundario.Text);
            24:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidor) = UpperCase('SQL Server'))) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR, 'SQL Server');
            25:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidorRemoto) = UpperCase('SQL Server'))) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR_REMOTO, 'SQL Server');
            26:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidor) = UpperCase(DriverPGODBC))) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR, DriverPGODBC);
            27:
              If TvwParams.Items[x].Checked And
                 (TvwParams.Items[x].Checked <> (UpperCase(Sistema.DriverServidorRemoto) = UpperCase(DriverPGODBC))) Then
                 if Sistema.GravaRegister then
                    WriteString(KEY_DRIVER_SERVIDOR_REMOTO, DriverPGODBC);

            99:
               With TCmRegister.Create Do
                  Try
                     if Sistema.GravaRegister then
                     begin
                        If TvwParams.Items[x].Checked Then
                           EscreverNumeroReg(HKEY_CURRENT_USER,'Software\CM',KEY_SHOWPARAM,1)
                        Else
                           EscreverNumeroReg(HKEY_CURRENT_USER,'Software\CM',KEY_SHOWPARAM,0);
                     end;
                  finally
                     Free;
                  End;


            37:
               With TCmRegister.Create Do
                  Try
                    If Sistema.GravaRegister then
                    begin
                      if TvwParams.Items[x].Checked then
                        EscreverNumeroReg(HKEY_CURRENT_USER,'Software\CM',KEY_INSTANCIAS,1)
                      else
                        EscreverNumeroReg(HKEY_CURRENT_USER,'Software\CM',KEY_INSTANCIAS,0);
                    end;
                  finally
                     Free;
                  End;


         End;
      End;
    finally
      CloseKey;
      free;
    End;

  Sistema.GetInfoServidor(EdtAliasPrincipal.Text <> Sistema.AliasServidor);
  ModalResult := MrOk;
end;

procedure TFrmParamSysPadrao.CMOkCancelar1CancelarClick(Sender: TObject);
begin

  inherited;
  ModalResult := MrCancel;
end;

procedure TFrmParamSysPadrao.FormCreate(Sender: TObject);
Var
  X: Integer;
begin
  Caption := Caption + ' ' + Sistema.NomeModulo;

  NtbParams.ActivePage := 'DbDefaul';

  For X:=0 To TvwParams.Items.Count - 1 Do
  Begin
     Case TvwParams.Items[x].ImageIndex of
     //Alias Servidor
     1: EdtAliasPrincipal.Text := Sistema.AliasServidor;
     //Driver Servidor Oracle
     2: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidor) = 'ORACLE');
     //Driver Servidor Db2
     3: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidor) = 'DB2');
     //Alias Servidor Remoto
     4: EdtAliasSecundario.Text :=  Sistema.AliasServidorRemoto;
     //Driver Servidor Remoto Oracle
     5: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidorRemoto) = 'ORACLE');
     //Driver Servidor Remoto DB2
     6: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidorRemoto) = 'DB2');
     //Tipo de Conexão BDE
     7: TvwParams.Items[x].Checked := (Sistema.ConnectionType = cntBDE);
     //Tipo de Conexão ADO
     8: TvwParams.Items[x].Checked := (Sistema.ConnectionType = cntADO);
     //Tipo de Conexão IB
     9: TvwParams.Items[x].Checked := (Sistema.ConnectionType = cntIB);
     //Tipo de Conexão DOA
     10: TvwParams.Items[x].Checked := (Sistema.ConnectionType = cntDOA);
     //Funciona como Client Server Local
     11: TvwParams.Items[x].Checked := (Sistema.ConnectionSide = cnsServer);
     //Funciona como Thin Client
     12: TvwParams.Items[x].Checked := (Sistema.ConnectionSide = cnsClient);
     //Usa Socket + HOST
     13:
     Begin
       TvwParams.Items[x].Checked := (Sistema.MidleWareConnection = mwcSocket);
       EdtSocketHost.Text := Sistema.SocketHost;
     End;
     //Usa Web Connection + URL
     14:
     Begin
       TvwParams.Items[x].Checked := (Sistema.MidleWareConnection = mwcWEB);
       EdtUrl.Text := Sistema.WebUrl;
     End;
     //Usa DCOM + Computer Name
     15:
     Begin
       TvwParams.Items[x].Checked := (Sistema.MidleWareConnection = mwcDCOM);
       EdtComputerName.Text := Sistema.DcomComputerName;
     End;
     //Idioma Português
     16: TvwParams.Items[x].Checked := (Sistema.IdiomaAtivo = 1);
     //Idioma Espanhol
     17: TvwParams.Items[x].Checked := (Sistema.IdiomaAtivo = 2);
     //Idioma Inglês
     18: TvwParams.Items[x].Checked := (Sistema.IdiomaAtivo = 3);
     19: EdtVersao.Text := Sistema.DirVersao;
     20: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidor) = 'MSSQL');
     //Driver Servidor Remoto SQL SERVER
     21: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidorRemoto) = 'MSSQL');
     22: EdtNomeServ.Text := Sistema.NomeServidor;
     23: EdtNomeServSecundario.Text := Sistema.NomeServidorSecundario;
     24: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidor) = UpperCase('SQL Server'));
     25: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidorRemoto) = UpperCase('SQL Server'));
     26: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidor) = UpperCase(DriverPGODBC));
     27: TvwParams.Items[x].Checked := (UpperCase(Sistema.DriverServidorRemoto) = UpperCase(DriverPGODBC));
     99:  With TCmRegister.Create Do
            Try
               TvwParams.Items[x].Checked := (LerNumeroReg(HKEY_CURRENT_USER,'Software\CM',KEY_SHOWPARAM,0) = 1);
            finally
               Free;
            End;


     37:  With TCmRegister.Create Do
            Try
              TvwParams.Items[x].Checked := (LerNumeroReg(HKEY_CURRENT_USER,'Software\CM',KEY_INSTANCIAS,0) = 1);
            finally
              Free;
            End;
     

     End;
  End;

  TvwParams.FullCollapse;
end;

procedure TFrmParamSysPadrao.TvwParamsEditing(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; var AllowEdit: Boolean);
begin
  AllowEdit := False;
end;

procedure TFrmParamSysPadrao.TvwParamsClick(Sender: TObject);
begin
   If (TvwParams.Selected <> nil) And
      (TvwParams.Selected.StringData <> '') Then
   Begin
      NtbParams.ActivePage := TvwParams.Selected.StringData;
   End
   Else
      NtbParams.ActivePage := 'DbDefaul';
end;

procedure TFrmParamSysPadrao.TvwParamsToggleCheckbox(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
begin
  If Node.Checked Then  Node.Selected := True;
end;

procedure TFrmParamSysPadrao.CMOkCancelar1SairClick(Sender: TObject);
begin
  Halt(1);
end;

procedure TFrmParamSysPadrao.BtnFolderClick(Sender: TObject);
begin
  If DlgDir.Execute Then
     EdtVersao.Text := DlgDir.Directory;
end;

end.

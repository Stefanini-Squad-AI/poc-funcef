unit FCadSubGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uCtrlSubGrupo, uCtrlContaContabil,{$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


type
  TfrmCadSubGrupoMT = class(TFrmCadastroMT)
    Label2: TLabel;
    dbeNomeSubGrupo: TwwDBEdit;
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    CtrlContaContabil :TCtrlContaContabil;
    CtrlSubGrupo  :TCtrlSubGrupo;
  public
    { Public declarations }
  end;

var
  frmCadSubGrupoMT: TfrmCadSubGrupoMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo;

{$R *.DFM}

{ -----------------------------------------------------------------------------}
{                                                                              }
{ Cadastro de Sub-Grupos - TELA REFEITA                                        }
{                                                                              }
{ Autor : Veronica Almeida                                                     }
{ Data de Início  : 04/01/2002                                                 }
{ Data de Término : 04/01/2002                                                 }
{                                                                              }
{ -----------------------------------------------------------------------------}


procedure TfrmCadSubGrupoMT.CmeCadastroDelete(Sender: TObject);
begin
   If CtrlContaContabil.SubGrupoTemContaContabil(StrToInt(MontaSelect.ValoresChave[0])) Then
   Begin
      MsgDlg('Este Sub-Grupo não pode ser excluído.','Erro',mtError,[mbOk, mbHelp], 0);
      Exit;
   End;

   inherited;

end;

procedure TfrmCadSubGrupoMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if dbeNomeSubGrupo.CanFocus then
      dbeNomeSubGrupo.SetFocus;

end;

procedure TfrmCadSubGrupoMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;

  If MontaSelect.RetornouValor Then
  Begin
    Cds.Data := CtrlSubGrupo.ListSubGrupos(StrToFloat(MontaSelect.ValoresChave[0]));
  End;

end;

procedure TfrmCadSubGrupoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
  dbeNomeSubGrupo.SetFocus;
end;


procedure TfrmCadSubGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe principal***
  CtrlSubGrupo := TCtrlSubGrupo.Create;
  CtrlSubGrupo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlSubGrupo.CdsSubGrupo    := Cds;
  Cds.Data := CtrlSubGrupo.ListSubGrupos(-1);

  // *** Instancia a classe contacontabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

end;


procedure TfrmCadSubGrupoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
  Cds.Data := CtrlSubGrupo.ListSubGrupos(Cds.FieldByName('CODSUBGRP').AsFloat);

end;

procedure TfrmCadSubGrupoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin

    If (dbeNomeSubGrupo.Text = '') Then
    Begin
       MsgDlg('Nome do Sub-Grupo não informado.','Erro',mtError,[mbOk],0);
       If dbeNomeSubGrupo.CanFocus Then
          dbeNomeSubGrupo.SetFocus;
       Accept := False;
    End;
  End;

end;

procedure TfrmCadSubGrupoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlSubGrupo.Gravar;
end;

procedure TfrmCadSubGrupoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlSubGrupo.Gravar;

end;

procedure TfrmCadSubGrupoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlSubGrupo.Gravar;

end;

procedure TfrmCadSubGrupoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If  CtrlSubGrupo.MessageInfo <> '' Then
      MsgDlg(CtrlSubGrupo.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadSubGrupoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlSubGrupo.ListSubGrupos(-1);

end;

end.

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : Seleciona
Data      : 18/08/2003
Pendencia : 14624
Descrição : Mostrar na lista dos centros de custos seus respectivos códigos.
---------------------------------------------------------------------------------------------------}

unit FCadUsrxCCustoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlUsrCCusto, uCtrlParamIntegra
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TFrmUsuxCCusto = class(TFrmCadastroMT)
    EdUsu: TEdit;
    Label1: TLabel;
    plnTransf: TPanel;
    grdTranf: TwwDBGrid;
    grgCCusto: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    CdsCCusto: TCMClientDataSet;
    DsCCusto: TwwDataSource;
    BtnAdicionaTudo: TSpeedButton;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
     Procedure Seleciona( IdUsuario: Double );
  public
    { Public declarations }
    iIdUsuario: Double;
    UsrCCusto: TCtrlUsrCCusto;
  end;

var
  FrmUsuxCCusto: TFrmUsuxCCusto;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

Procedure TFrmUsuxCCusto.Seleciona( IdUsuario: Double );
Begin

  { 18/08/2003 (Pendência 14624)
    Recupera o código do centro de custo junto com o nome.}
  cds.Data := UsrCCusto.ListaUsrCodCCusto( Sistema.IdEmpresa, IdUsuario, 0, '', 0, ParamIntegra.PlanoCentroCusto);

  If IdUsuario = -1 Then
     cdsCCusto.Data := UsrCCusto.ListaUsrCodCCustoUsr( IdUsuario, IdUsuario, 0, ParamIntegra.PlanoCentroCusto )
  Else
     cdsCCusto.Data := UsrCCusto.ListaUsrCodCCustoUsr( Sistema.IdEmpresa, IdUsuario, 0, ParamIntegra.PlanoCentroCusto  );
end;

procedure TFrmUsuxCCusto.FormCreate(Sender: TObject);
begin
  inherited;
  UsrCCusto := TCtrlUsrCCusto.Create;
  UsrCCusto.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  UsrCCusto.cds := cds;

  CmeCadastro.RepetirInsert := False;
  iIdUsuario := -1;
  Seleciona( iIdUsuario );
  EdUsu.Clear;
end;

procedure TFrmUsuxCCusto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     iIdUsuario := StrToFloat( MontaSelect.ValoresChave[ 0 ] );
     edUsu.Text := MontaSelect.ValoresChave[ 1 ];
     Seleciona( iIdUsuario );
  End;
end;

procedure TFrmUsuxCCusto.CmeCadastroInsert(Sender: TObject);
begin
  If Trim( edUsu.Text ) = '' Then Begin
     MsgDlg( 'Não há Nenhum Usuário selecionado', 'Atenção', mtWarning, [mbOk], 0 );
     bbtnCancelar.Click;
  End;
end;

procedure TFrmUsuxCCusto.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  If Trim( edUsu.Text ) <> '' Then Begin
     Seleciona( iIdUsuario );
  End Else Begin
     Seleciona( -1 );
     edUsu.Clear;
  End;
end;

procedure TFrmUsuxCCusto.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [ opInserir, opAlterar ] Then Begin
     If Not CdsCCusto.IsEmpty Then Begin
        With Cds Do Begin
             Append;
             FieldByName( 'IDUSUARIO'{ivlm} ).AsFloat       := iIdUsuario;
             FieldByName( 'IDPESSOA'{ivlm} ).AsFloat        := Sistema.IdEmpresa;
             FieldByName( 'CODCENTROCUSTO'{ivlm} ).asString := CdsCCusto.FieldByName( 'CODCENTROCUSTO'{ivlm} ).asString;
             FieldByName( 'IDEMPRESA'{ivlm} ).asFloat       := CdsCCusto.FieldByName( 'IDEMPRESA'{ivlm} ).asFloat;
             FieldByName( 'NOME'{ivlm} ).asString           := CdsCCusto.FieldByName( 'NOME'{ivlm} ).asString;
             Post;
        End;

        CdsCCusto.Delete;
     End;
  End;
end;

procedure TFrmUsuxCCusto.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [ opInserir, opAlterar ] Then Begin
     If Not Cds.IsEmpty Then Begin
        With CdsCCusto Do Begin
             Append;
             FieldByName( 'CODCENTROCUSTO'{ivlm} ).asString := Cds.FieldByName( 'CODCENTROCUSTO'{ivlm} ).asString;
             FieldByName( 'IDEMPRESA'{ivlm} ).asFloat       := Cds.FieldByName( 'IDEMPRESA'{ivlm} ).asFloat;
             FieldByName( 'NOME'{ivlm} ).asString           := Cds.FieldByName( 'NOME'{ivlm} ).asString;
             Post;
        End;

        Cds.Delete;
     End;
  End;
end;

procedure TFrmUsuxCCusto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmUsuxCCusto.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( UsrCCusto.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TFrmUsuxCCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UsrCCusto.Free;
end;

procedure TFrmUsuxCCusto.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsCCusto.First;

  While Not cdsCCusto.Eof Do
        btnAdiciona.Click;
end;

procedure TFrmUsuxCCusto.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cds.First;

  While Not cds.Eof Do
        btnRemove.Click;
end;

procedure TFrmUsuxCCusto.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  UsrCCusto.Gravar;
  Seleciona( iIdUsuario );
end;

end.


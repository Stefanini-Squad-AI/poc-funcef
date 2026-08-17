unit FCadWebTpReports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlWebReports, uCtrlWebTpReports,
  Mask, wwdbedit,uCMTypes, DBCtrls;

type
  TfrmCadWebTpReports = class(TFrmCadastroMT)
    Label1: TLabel;
    edDesc: TDBEdit;
    lblFlgTipo: TLabel;
    Label2: TLabel;
    edId: TDBEdit;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    CtrlWebReports   : TCtrlWebReports;
    CtrlWebTpReports : TCtrlWebTpReports;
  public
    { Public declarations }
  end;

var
  frmCadWebTpReports: TfrmCadWebTpReports;

implementation

Uses uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmCadWebTpReports.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if trim(edDesc.Text)='' then begin
     MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOk],0);
     edDesc.SetFocus;
     exit;
  end;
  Accept := True;
end;

procedure TfrmCadWebTpReports.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlWebTpReports := TCtrlWebTpReports.Create;
  CtrlWebTpReports.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CtrlWebTpReports.CdsWebTpReports := cds;
  //
  cds.Data := CtrlWebTpReports.SelecionaWebTpReports(-1);
  //
end;

procedure TfrmCadWebTpReports.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlWebTpReports.Free;
end;

procedure TfrmCadWebTpReports.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  edDesc.SetFocus;
end;

procedure TfrmCadWebTpReports.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edDesc.SetFocus;
end;

procedure TfrmCadWebTpReports.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     cds.Data := CtrlWebTpReports.SelecionaWebTpReports(StrTointDef(MontaSelect.ValoresChave[0],0));
  end;

end;

procedure TfrmCadWebTpReports.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
     Accept := CtrlWebTpReports.GravaWebTpReports;
end;

procedure TfrmCadWebTpReports.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlWebTpReports.GravaWebTpReports;
end;

procedure TfrmCadWebTpReports.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  cds.FieldByName('FLGTIPO').AsInteger := 1;
  Accept := CtrlWebTpReports.GravaWebTpReports;
end;

procedure TfrmCadWebTpReports.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if CtrlWebTpReports.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ CtrlWebTpReports.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadWebTpReports.CmeCadastroAfterConfirma(Sender: TObject);
begin
  cds.Data := CtrlWebTpReports.SelecionaWebTpReports(cds.FieldByName('IDWEBREPORTS').AsInteger);
end;

procedure TfrmCadWebTpReports.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

  lblFlgTipo.Visible  := (cds.FieldByName('IDWEBREPORTS').AsInteger > 0) and
                         (cds.FieldByName('IDWEBREPORTS').AsInteger < 5);

  if CmeCadastro.Operacao = opIdle then begin
     sbtnAlterar.Enabled := not lblFlgTipo.Visible;
     sbtnApagar.Enabled  := not lblFlgTipo.Visible;
  end;
end;

end.

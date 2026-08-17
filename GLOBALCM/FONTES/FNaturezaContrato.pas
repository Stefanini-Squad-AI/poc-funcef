unit FNaturezaContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  UCtrlNaturezaContrato, Mask, wwdbedit, DBCtrls, uCtrlPadroes, uCMTypes, UMensErro;

type
  TfrmNaturezaContrato = class(TFrmCadastroMT)
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    cbkFlgAtivo: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    
  private
    CtrlNaturezaContrato: TCtrlNaturezaContrato;
  public
    { Public declarations }
  end;

var
  frmNaturezaContrato: TfrmNaturezaContrato;

implementation

{$R *.DFM}

procedure TfrmNaturezaContrato.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlNaturezaContrato:= TCtrlNaturezaContrato.Create;
  CtrlNaturezaContrato.InitializeAs(Padroes);
  CtrlNaturezaContrato.cds := cds;

  Cds.Data:= CtrlNaturezaContrato.SelecionaNaturezaContr(-1);

end;

procedure TfrmNaturezaContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlNaturezaContrato.Free;
end;

procedure TfrmNaturezaContrato.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  if not CtrlNaturezaContrato.Aviso('Informe a descrição!',
                                Trim(dbedDescricao.Text) = '',
                                MB_ICONWARNING) then
  begin
    dbedDescricao.SetFocus;
    Abort;
  end;

  inherited;
  Accept:= CtrlNaturezaContrato.Gravar;
end;

procedure TfrmNaturezaContrato.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept:= CtrlNaturezaContrato.Gravar;
end;

procedure TfrmNaturezaContrato.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedDescricao.SetFocus;
end;

procedure TfrmNaturezaContrato.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedDescricao.SetFocus;
  Cds.FieldByName('FLGATIVO').AsString:= 'S';

  //cbkFlgAtivo.Checked:= False;
  cbkFlgAtivo.Checked:= True;
  cbkFlgAtivo.ValueChecked:= 'S';
end;


procedure TfrmNaturezaContrato.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(CtrlNaturezaContrato.MessageInfo, 'Erro', mtError, [mbOK], 0);
  
end;

procedure TfrmNaturezaContrato.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept:= CtrlNaturezaContrato.Gravar;
end;

procedure TfrmNaturezaContrato.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
    Cds.Data:= CtrlNaturezaContrato.SelecionaNaturezaContr(StrToInt(MontaSelect.ValoresChave[0]));

end;

end.

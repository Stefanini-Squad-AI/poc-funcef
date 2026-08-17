{--------------------------------------------------------------------------------------------------
Nº SOL......: 185805
Nº KINTANA..: 1763461
Data........: 08/01/2013
Responsável.: Thiago Melo
Descrição...: Alteração de layout e inclusão de flags (email de cobrança)
--------------------------------------------------------------------------------------------------}



unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, ImgList,
  CmEventosCadastro, DBClient, uCMClientDataSet, uCtrlParamRH, ComCtrls;

type
  TfrmCadParam = class(TFrmCadastroMT)
    gbxAvalMax: TGroupBox;
    dbspeAvalMax: TwwDBSpinEdit;
    gbxFatorAvalAlunos: TDBRadioGroup;
    dbrgFatorCurso: TDBRadioGroup;
    grpEmail: TGroupBox;
    ckbAtivaAviso: TDBCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    mmObservacaoMail: TDBMemo;
    edtDiaCobranca: TwwDBSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    CtrlParamRH: TCtrlParamRH;

    procedure Sel;
    function  GravarRegistro: boolean;
  end;

var
  frmCadParam: TfrmCadParam;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCMTypes;

{$R *.DFM}

procedure TfrmCadParam.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamRH := TCtrlParamRH.Create;
  CtrlParamRH.InitializeAs(Padroes);
  CtrlParamRH.CdsParamRH := Cds;

  Sel;
  if (Cds.IsEmpty) then
  begin
    CtrlParamRH.ExecInsert;
    CtrlParamRH.GravarParamRH;
    Sel;
  end;
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := not(Cds.IsEmpty);
end;

procedure TfrmCadParam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamRH);
  inherited;
end;

procedure TfrmCadParam.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadParam.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
  Sel;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadParam.Sel;
begin
  Cds.Data := CtrlParamRH.ListParamRH;
end;

function TfrmCadParam.GravarRegistro: boolean;
begin
  Result := CtrlParamRH.GravarParamRH;
  if not(Result) then
    raise Exception.Create(CtrlParamRH.MessageInfo);
end;

procedure TfrmCadParam.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Thiago Melo SOL 185805 Kintana 1763461
  if (ckbAtivaAviso.Checked) and (Trim(mmObservacaoMail.Lines.Text) = '') then begin
    MsgDlg('Informe o texto do e-mail', 'Aviso', mtWarning, [mbOk], 0);
    Abort;
  end;
  // Thiago Melo SOL 185805 Kintana 1763461
end;

end.

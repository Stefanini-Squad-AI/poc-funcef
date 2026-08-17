unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, wwdblook, ComCtrls,
  ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList, DBClient,
  uCMClientDataSet, uCtrlParamRH;

type
  TfrmCadParam = class(TfrmCadastroMT)
    pgctrlPaginas: TPageControl;
    tbshUsoPessoal: TTabSheet;
    dbrgUsoPessoal: TDBRadioGroup;
    gbxAutor: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    dbcbxInsEnder: TDBCheckBox;
    dbcbxAltEnder: TDBCheckBox;
    dbcbxExcEnder: TDBCheckBox;
    dbcbxInsTelef: TDBCheckBox;
    dbcbxAltTelef: TDBCheckBox;
    dbcbxExcTelef: TDBCheckBox;
    dbcbxInsContt: TDBCheckBox;
    dbcbxAltContt: TDBCheckBox;
    dbcbxExcContt: TDBCheckBox;
    dbcbxInsCurso: TDBCheckBox;
    dbcbxAltCurso: TDBCheckBox;
    dbcbxExcCurso: TDBCheckBox;
    dbcbxInsFeria: TDBCheckBox;
    dbcbxAltFeria: TDBCheckBox;
    dbcbxExcFeria: TDBCheckBox;
    dbcbxEmprgIns: TDBCheckBox;
    dbcbxEmprgAlt: TDBCheckBox;
    dbcbxEmprgExc: TDBCheckBox;
    dbcbxAltCtSal: TDBCheckBox;
    TabSheet1: TTabSheet;
    rgTipDurContr: TDBRadioGroup;
    gbxTamMatric: TGroupBox;
    wwDBSpinEdit1: TwwDBSpinEdit;
    dbrgNumeraMatric: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbrgNumeraMatricChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    CtrlParamRH: TCtrlParamRH;

    procedure Sel;
    function  GravarRegistro: boolean;
  end;

var
  frmCadParam: TfrmCadParam;

implementation

uses uMensErro, uCtrlPadroes, uSistema;

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

  pgctrlPaginas.ActivePageIndex := 0;
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := true;
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

procedure TfrmCadParam.dbrgNumeraMatricChange(Sender: TObject);
begin
  gbxTamMatric.Visible := (dbrgNumeraMatric.ItemIndex = 0);
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

end.

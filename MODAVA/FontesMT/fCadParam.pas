unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT, 
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  CmEventosCadastro, ImgList, DBClient, uCMClientDataSet, uCtrlParamRH;

type
  TfrmCadParam = class(TFrmCadastroMT)
    gbxDoisCargos: TDBRadioGroup;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
  private
    CtrlParamRH: TCtrlParamRH;

    procedure Sel;
    function  GravarRegistro: boolean;
  end;

var
  frmCadParam: TfrmCadParam;

implementation

uses uCtrlPadroes;

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

end.

unit fCadPeso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, Mask, MAHlpBtn, TB97Tlbr, StdCtrls,
  Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ImgList, TabControlDetalhe, ExtCtrls,
  DBCtrls, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, fCadastroMestreDetMT, DBClient,
  uCMClientDataSet, uCtrlPesoFatGrp, uCtrlFatorAval, uCtrlGrupFunc;

type
  TfrmCadPeso = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label10: TLabel;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    Label2: TLabel;
    dblcFatorAval: TwwDBLookupCombo;
    Label4: TLabel;
    dbedPeso: TDBEdit;
    CdsDet: TCMClientDataSet;
    CdsAval: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblcFatorAvalChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlPesoFatGrp: TCtrlPesoFatGrp;
    CtrlFatorAval: TCtrlFatorAval;
    CtrlGrupFunc: TCtrlGrupFunc;

    procedure Sel(CodGrpFunc: string);
    function  GravarRegistro: boolean;
  end;

var
  frmCadPeso: TfrmCadPeso;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadPeso.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPesoFatGrp := TCtrlPesoFatGrp.Create;
  CtrlPesoFatGrp.InitializeAs(Padroes);
  CtrlPesoFatGrp.CdsDet := CdsDet;

  CtrlFatorAval := TCtrlFatorAval.Create;
  CtrlFatorAval.InitializeAs(Padroes);

  CtrlGrupFunc := TCtrlGrupFunc.Create;
  CtrlGrupFunc.InitializeAs(Padroes);

  sbtnProcurarClick(Sender);
  if not(MontaSelect.RetornouValor) then
    Sel('-1');

  case (Sistema.IdModulo) of
    MODAVA :
    begin
      HelpContext := 700006;
      CdsAval.Data := CtrlFatorAval.ListFatorAval(0, '0,1');
    end;  
    MODCES :
    begin
      HelpContext := 740005;
      CdsAval.Data := CtrlFatorAval.ListFatorAval(0, '0,2');
    end;
  end;
end;

procedure TfrmCadPeso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPesoFatGrp);
  FreeAndNil(CtrlFatorAval);
  FreeAndNil(CtrlGrupFunc);
  inherited;
end;

procedure TfrmCadPeso.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadPeso.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('CODGRPFUNC').asString := Cds.FieldByName('CODGRPFUNC').asString;
  CdsDet.FieldByName('PESO').asInteger := 0;
end;

procedure TfrmCadPeso.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPeso.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPeso.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblcFatorAval.CanFocus) then
    dblcFatorAval.SetFocus;
end;

procedure TfrmCadPeso.dblcFatorAvalChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    if (Trim(dblcFatorAval.Text) = '') then
      CdsDet.FieldByName('DESCRFATORAVAL').Clear
    else
      CdsDet.FieldByName('DESCRFATORAVAL').asString := dblcFatorAval.Text;
end;

procedure TfrmCadPeso.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcFatorAval.Text) = '') then
  begin
    MsgDlg('Selecione um Fator de Avaliação.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcFatorAval.SetFocus;
  end
  else
  if (Trim(dbedPeso.Text) = '') then
  begin
    MsgDlg('Preencha o Peso.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedPeso.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadPeso.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(Sender);
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadPeso.Sel(CodGrpFunc: string);
begin
  Cds.Data := CtrlGrupFunc.ListGrupoFunc(CodGrpFunc);
  CdsDet.Data := CtrlPesoFatGrp.ListPesoXFator(CodGrpFunc);
end;

function TfrmCadPeso.GravarRegistro: boolean;
begin
  Result := CtrlPesoFatGrp.GravarPesoXFator;
  if not(Result) then
    raise Exception.Create(CtrlPesoFatGrp.MessageInfo);
end;

end.

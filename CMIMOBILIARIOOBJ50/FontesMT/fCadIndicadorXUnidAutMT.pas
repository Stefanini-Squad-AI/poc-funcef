unit fCadIndicadorXUnidAutMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Wwdbspin, wwdbedit, Wwdotdot, Wwdbcomb, DBCtrls,
  Mask, wwdbdatetimepicker, CMDateTimePicker, wwdblook, mUnidAutonoma,
  {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
  uCtrlIndicadorImovel, uMensErro, dBaseDados, uSistema, uComunsImobiliario, uVerificaPreenchimento;

type
  TfrmCadIndicadorXUnidAutMT = class(TfrmCadastroGridMTImob)
    Panel1: TPanel;
    dsIndicador: TwwDataSource;
    CdsIndicador: TCMClientDataSet;
    CdsIndicadorINMDESCRICAO: TStringField;
    CdsIndicadorIDINDICADORIMOVEL: TFloatField;
    CdsIndicadorFLGTIPOVALOR: TStringField;
    CdsIndicadorRECPAG: TStringField;
    CdsIndicadorFLGUNIDAUT: TFloatField;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label1: TLabel;
    DBcboIndicador: TwwDBLookupCombo;
    DBedtDataApuracao: TCMDateTimePicker;
    DBrdgPrevReal: TDBRadioGroup;
    DBedtVlr: TDBEdit;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TwwDBComboBox;
    DBrdgTipo: TDBRadioGroup;
    molUnidAutonoma1: TmolUnidAutonoma;
    CdsINMDESCRICAO: TStringField;
    CdsMESCOMPETENCIA: TFloatField;
    CdsANOCOMPETENCIA: TFloatField;
    CdsVLRAPURADO: TFloatField;
    CdsIDINDICADORXAPUR: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsIDUNIDAUT: TFloatField;
    CdsDATAAPURADO: TDateTimeField;
    CdsFLGPREVREAL: TStringField;
    CdsIDINDICADORIMOVEL: TFloatField;
    CdsFLGTIPOVALOR: TStringField;
    CdsRECPAG: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure molUnidAutonoma1btnBuscaUnidautClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlIndicadorImovel : TCtrlIndicadorImovel;

  public
    { Public declarations }
  end;

var
  frmCadIndicadorXUnidAutMT: TfrmCadIndicadorXUnidAutMT;

implementation

{$R *.DFM}

{ TfrmCadIndicadorXUnidAutMT }

procedure TfrmCadIndicadorXUnidAutMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlIndicadorImovel.LookupIndicadorXApur(-1, molUnidAutonoma1.iUnidaut);

  // quando é alteração estes botões estão desabilidados
  molUnidAutonoma1.btnBuscaUnidaut.Enabled := true;
  DBcboIndicador.Enabled := true;
end;

procedure TfrmCadIndicadorXUnidAutMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlIndicadorImovel := TCtrlIndicadorImovel.Create( Sistema.IdEmpresa,
                                                      Sistema.IdModulo,
                                                      Sistema.IdUsuario,
                                                      Sistema.IdEspAcesso,
                                                      Sistema.UsaPlanoPatro );
  CtrlIndicadorImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  CtrlIndicadorImovel.CdsIndicadorXApur := Cds;
  molUnidAutonoma1.iUnidaut := -2;  // para abrir a grid vazia
  FazerRefresh;

  CdsIndicador.Data := CtrlIndicadorImovel.LookupIndicadorImovel('', -1, true);
end;

procedure TfrmCadIndicadorXUnidAutMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil (CtrlIndicadorImovel);
end;

procedure TfrmCadIndicadorXUnidAutMT.molUnidAutonoma1btnBuscaUnidautClick(
  Sender: TObject);
begin
  inherited;
  molUnidAutonoma1.btnBuscaUnidautClick(Sender);
  if (CmeCadastro.Operacao = opIdle) or (CmeCadastro.Operacao = opVazio) then begin
    FazerRefresh;
  end;
end;

procedure TfrmCadIndicadorXUnidAutMT.CmeCadastroApplyInsert(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  CdsIDUNIDAUT.AsInteger := molUnidAutonoma1.iUnidaut;
  Accept := CtrlIndicadorImovel.GravaIndicadorXApur;
end;

procedure TfrmCadIndicadorXUnidAutMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Accept := CtrlIndicadorImovel.GravaIndicadorXApur;
  inherited;
end;

procedure TfrmCadIndicadorXUnidAutMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlIndicadorImovel.LookupIndicadorXApur (-1, molUnidAutonoma1.iUnidaut, CdsIDINDICADORIMOVEL.AsInteger, CdsIDINDICADORXAPUR.AsInteger);
  inherited;
  molUnidAutonoma1.btnBuscaUnidaut.Enabled := false;
  DBcboIndicador.Enabled := false;
end;

procedure TfrmCadIndicadorXUnidAutMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molUnidAutonoma1.iUnidaut        := StrToInt(MontaSelect.ValoresChave[1]);
    molUnidAutonoma1.edtImovel.Text  := MontaSelect.ValoresChave[3] + ' - ' + MontaSelect.ValoresChave[4];
    molUnidAutonoma1.edtUnidaut.Text := MontaSelect.ValoresChave[5];

    Cds.Data := CtrlIndicadorImovel.LookupIndicadorXApur(-1, molUnidAutonoma1.iUnidaut);
  end;
end;

procedure TfrmCadIndicadorXUnidAutMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // quando é alteração estes botões estão desabilidados
  molUnidAutonoma1.btnBuscaUnidaut.Enabled := true;
  DBcboIndicador.Enabled := true;
end;

procedure TfrmCadIndicadorXUnidAutMT.CmeCadastroInsert(Sender: TObject);
var
  iDia, iMes, iAno: word;
begin
  inherited;
  DecodeDate(Date, iAno, iMes, iDia);
  CdsANOCOMPETENCIA.AsInteger := iAno;
  CdsMESCOMPETENCIA.AsInteger := iMes;
  CdsDATAAPURADO.AsDateTime := Date;
end;

procedure TfrmCadIndicadorXUnidAutMT.sbtnInserirClick(Sender: TObject);
begin
  if molUnidAutonoma1.edtImovel.Text = '' then begin
    MsgDlg('É necessário selecionar a unidade autônoma antes.','Aviso',mtWarning,[mbok],0);
    sbtnInserir.Down := false;
  end else inherited;
end;

end.

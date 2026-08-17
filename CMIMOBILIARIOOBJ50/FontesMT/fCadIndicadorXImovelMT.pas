unit fCadIndicadorXImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, mImovelAtivo, Wwdotdot, Wwdbcomb, wwdbedit, Wwdbspin,
  Mask, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook, Provider,
  {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
  DBTables, Wwquery, uCtrlIndicadorImovel, uMensErro, dBaseDados, uSistema,
  uComunsImobiliario, uVerificaPreenchimento;

type
  TfrmCadIndicadorXImovelMT = class(TfrmCadastroGridMTImob)
    Panel1: TPanel;
    DBcboIndicador: TwwDBLookupCombo;
    Label22: TLabel;
    DBedtDataApuracao: TCMDateTimePicker;
    Label24: TLabel;
    DBrdgPrevReal: TDBRadioGroup;
    DBedtVlr: TDBEdit;
    Label25: TLabel;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TwwDBComboBox;
    Label1: TLabel;
    DBrdgTipo: TDBRadioGroup;
    molImovelAtivo1: TmolImovelAtivo;
    CdsIndicador: TCMClientDataSet;
    CdsIndicadorIDINDICADORIMOVEL: TFloatField;
    CdsIndicadorINMDESCRICAO: TStringField;
    CdsIndicadorFLGTIPOVALOR: TStringField;
    CdsIndicadorRECPAG: TStringField;
    CdsIndicadorFLGUNIDAUT: TFloatField;
    CdsIDINDICADORXAPUR: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsIDUNIDAUT: TFloatField;
    CdsMESCOMPETENCIA: TFloatField;
    CdsANOCOMPETENCIA: TFloatField;
    CdsVLRAPURADO: TFloatField;
    CdsDATAAPURADO: TDateTimeField;
    CdsFLGPREVREAL: TStringField;
    CdsIDINDICADORIMOVEL: TFloatField;
    dsIndicador: TwwDataSource;
    CdsINMDESCRICAO: TStringField;
    CdsFLGTIPOVALOR: TStringField;
    CdsRECPAG: TStringField;
    CdsFLGTIPOAPURACAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure molImovelAtivo1btnBuscaImovelClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlIndicadorImovel : TCtrlIndicadorImovel;

  public
    { Public declarations }
  end;

var
  frmCadIndicadorXImovelMT: TfrmCadIndicadorXImovelMT;

implementation

{$R *.DFM}

{ TfrmCadIndicadorXImovelMT }

procedure TfrmCadIndicadorXImovelMT.FormCreate(Sender: TObject);
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
  molImovelAtivo1.iImovel := -2;  // para abrir a grid vazia
  FazerRefresh;
end;

procedure TfrmCadIndicadorXImovelMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil (CtrlIndicadorImovel);
end;

procedure TfrmCadIndicadorXImovelMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlIndicadorImovel.LookupIndicadorXApur(molImovelAtivo1.iImovel);

  // quando é alteração estes botões estão desabilidados
  molImovelAtivo1.btnBuscaImovel.Enabled := true;
  DBcboIndicador.Enabled := true;
end;

procedure TfrmCadIndicadorXImovelMT.molImovelAtivo1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelAtivo1.btnBuscaImovelClick(Sender);
  // O LOOKUP DEPENDE DO TIPO DO IMÓVEL
  CdsIndicador.Data := CtrlIndicadorImovel.LookupIndicadorImovel(molImovelAtivo1.sCodTipoImo);
  if (CmeCadastro.Operacao = opIdle) or (CmeCadastro.Operacao = opVazio) then begin
    FazerRefresh;
  end;
end;

procedure TfrmCadIndicadorXImovelMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsIDIMOVEL.AsInteger := molImovelAtivo1.iImovel;
  Accept := CtrlIndicadorImovel.GravaIndicadorXApur;
end;

procedure TfrmCadIndicadorXImovelMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Accept := CtrlIndicadorImovel.GravaIndicadorXApur;
  inherited;
end;

procedure TfrmCadIndicadorXImovelMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlIndicadorImovel.LookupIndicadorXApur (CdsIDIMOVEL.AsInteger, -1, CdsIDINDICADORIMOVEL.AsInteger, CdsIDINDICADORXAPUR.AsInteger);
  inherited;
  molImovelAtivo1.btnBuscaImovel.Enabled := false;
  DBcboIndicador.Enabled := false;
end;

procedure TfrmCadIndicadorXImovelMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molImovelAtivo1.iImovel        := StrToInt(MontaSelect.ValoresChave[1]);
    molImovelAtivo1.edtImovel.Text := MontaSelect.ValoresChave[3] + ' - ' + MontaSelect.ValoresChave[4];
    molImovelAtivo1.sCodTipoImo    := MontaSelect.ValoresChave[5];

    Cds.Data := CtrlIndicadorImovel.LookupIndicadorXApur(molImovelAtivo1.iImovel);

    // O LOOKUP DEPENDE DO TIPO DO IMÓVEL
    CdsIndicador.Data := CtrlIndicadorImovel.LookupIndicadorImovel(molImovelAtivo1.sCodTipoImo);
  end;
end;

procedure TfrmCadIndicadorXImovelMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // quando é alteração estes botões estão desabilidados
  molImovelAtivo1.btnBuscaImovel.Enabled := true;
  DBcboIndicador.Enabled := true;
end;

procedure TfrmCadIndicadorXImovelMT.sbtnInserirClick(Sender: TObject);
begin
  if molImovelAtivo1.edtImovel.Text = '' then begin
    MsgDlg('É necessário selecionar o imóvel antes.','Aviso',mtWarning,[mbok],0);
    sbtnInserir.Down := false;
  end else inherited;
end;

procedure TfrmCadIndicadorXImovelMT.CmeCadastroInsert(Sender: TObject);
var
  iDia, iMes, iAno: word;
begin
  inherited;
  DecodeDate(Date, iAno, iMes, iDia);
  CdsANOCOMPETENCIA.AsInteger := iAno;
  CdsMESCOMPETENCIA.AsInteger := iMes;
  CdsDATAAPURADO.AsDateTime := Date;
  CdsFLGTIPOAPURACAO.AsString := 'M';
end;

end.

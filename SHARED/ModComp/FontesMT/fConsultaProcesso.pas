unit fConsultaProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FSairAjuda,
  wwdbedit, StdCtrls, ExtCtrls, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Wwdbspin, CMProcuraSubTipo, TREdit, CMProcura, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, MontaSelect, uCtrlProcessoTrab, uCtrlEtapaProcesso;

type
  TfrmConsultaProcesso = class(TfrmSairAjuda)
    dsProcesso: TwwDataSource;
    CdsProcesso: TCMClientDataSet;
    pgctrlDetalhe: TPageControl;
    tbsLitisconsortes: TTabSheet;
    tbshOutrosDados: TTabSheet;
    tbsDet: TTabSheet;
    dbgrdDet: TwwDBGrid;
    tbshEncer: TTabSheet;
    tbsEtapas: TTabSheet;
    dbGrdEtapa: TwwDBGrid;
    tbsObsEtp: TTabSheet;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    tbshVinculos: TTabSheet;
    pnlLigado: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    dbrgVinc: TDBRadioGroup;
    dbedNumVinc: TDBEdit;
    gbxVinculados: TGroupBox;
    dbgdProcessosVinc: TwwDBGrid;
    Label1: TLabel;
    dbedNumero: TDBEdit;
    Label2: TLabel;
    dbedDataAju: TDBEdit;
    rgSituacao: TDBRadioGroup;
    Label19: TLabel;
    dbedDataNot: TDBEdit;
    Label30: TLabel;
    dbedNumJCJ: TDBEdit;
    rgAtivo: TDBRadioGroup;
    dbrgMateria: TDBRadioGroup;
    Label9: TLabel;
    dbedNome: TwwDBEdit;
    Label8: TLabel;
    dbreDespesa: TDBRealEdit;
    Label4: TLabel;
    dbedVaraJustica: TDBEdit;
    dbedNumVaraJustica: TwwDBEdit;
    Label3: TLabel;
    dbedPost: TDBEdit;
    Label18: TLabel;
    dbedQtde: TDBEdit;
    Label16: TLabel;
    dbedNumTRT: TDBEdit;
    Label17: TLabel;
    dbedNumTST: TDBEdit;
    Label31: TLabel;
    dbedTipProc: TDBEdit;
    Label33: TLabel;
    dbedTipAcao: TDBEdit;
    Label35: TLabel;
    dbedPasta: TDBEdit;
    Label5: TLabel;
    dbedAdvog1: TDBEdit;
    Label6: TLabel;
    dbedAdvog2: TDBEdit;
    Label7: TLabel;
    dbedAT: TDBEdit;
    Label10: TLabel;
    dbedAdvogCasa: TDBEdit;
    Label36: TLabel;
    dbedUF: TDBEdit;
    bbtnProcurarProc: TBitBtn;
    MontaSelect: TMontaSelect;
    bbtnProcurarProcLitis: TBitBtn;
    dsLitisconsorte: TwwDataSource;
    CdsLitisconsorte: TCMClientDataSet;
    dsObjeto: TwwDataSource;
    CdsObjeto: TCMClientDataSet;
    rgTipEncer: TDBRadioGroup;
    Label15: TLabel;
    dbedPrevEnc: TDBEdit;
    Label11: TLabel;
    sbspeParc: TDBEdit;
    Label12: TLabel;
    dbedEncerr: TDBEdit;
    Label13: TLabel;
    dbedTipSent: TDBEdit;
    dsEtapa: TwwDataSource;
    CdsEtapa: TCMClientDataSet;
    dbgrDet2: TwwDBGrid;
    dsProcVinc: TwwDataSource;
    CdsProcVinc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnProcurarProcClick(Sender: TObject);
    procedure bbtnProcurarProcLitisClick(Sender: TObject);
  private
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlEtapaProcesso: TCtrlEtapaProcesso;

    procedure SelProcesso(NumProcTrab: double);
  end;

procedure ConsultarProcesso(NumProcTrab: double);

var
  frmConsultaProcesso: TfrmConsultaProcesso;

implementation

uses uSistema, uMensErro, uCtrlFuncoesRH, fAguarde, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure ConsultarProcesso(NumProcTrab: double);
begin
  with frmConsultaProcesso.Create(Application) do
  begin
    SelProcesso(NumProcTrab);
    ShowModal;
    Free;
  end;
end;

procedure TfrmConsultaProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);

  CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlEtapaProcesso.InitializeAs(Padroes);

  pgctrlDetalhe.ActivePageIndex := 0;

  if (Sistema.IdModulo = MODCON) then
    HelpContext := 760025
  else
    HelpContext := 1100019;
end;

procedure TfrmConsultaProcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProcessoTrab);
  FreeAndNil(CtrlEtapaProcesso);
  inherited;
end;

procedure TfrmConsultaProcesso.bbtnProcurarProcClick(Sender: TObject);
begin
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA');
  MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');

  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PESSOA');
  MontaSelect.Tabelas.Add('PROCESSOTRAB');
  MontaSelect.Tabelas.Add('VARAJUSTICA');

  if (MontaSelect.Executar = mrOk) and (MontaSelect.RetornouValor) then
    SelProcesso(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmConsultaProcesso.bbtnProcurarProcLitisClick(Sender: TObject);
begin
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR '+
                         '(COPARTPROCTRAB.IDPESSOA   = PESSOA.IDPESSOA)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');

  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PESSOA');
  MontaSelect.Tabelas.Add('PROCESSOTRAB');
  MontaSelect.Tabelas.Add('VARAJUSTICA');
  MontaSelect.Tabelas.Add('COPARTPROCTRAB');

  if (MontaSelect.Executar = mrOk) and (MontaSelect.RetornouValor) then
    SelProcesso(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmConsultaProcesso.SelProcesso(NumProcTrab: double);
begin
  CdsProcesso.Data := CtrlProcessoTrab.ListDadosProcesso(NumProcTrab);
  CdsLitisconsorte.Data := CtrlProcessoTrab.ListLitisconsorte(NumProcTrab);
  CdsObjeto.Data := CtrlProcessoTrab.ListObjetoComTipo(NumProcTrab);
  CdsEtapa.Data := CtrlEtapaProcesso.ListEtapas(NumProcTrab);
  CdsProcVinc.Data := CtrlProcessoTrab.ListProcessosVinculados(NumProcTrab);

  TFloatField(CdsObjeto.FieldByName('VALORRECL')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsObjeto.FieldByName('PERCPROB')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsObjeto.FieldByName('VALORSENTENCA')).DisplayFormat := '###,###,##0.00';
end;

end.

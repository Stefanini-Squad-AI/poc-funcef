unit fParamEtiquetaAlteracaoCTPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Spin,
  fOkCancelar, StdCtrls, IvDictio, IvMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  IniFileEx;

type
  TTipoParamEtiqueta = (tpReajusteSalarial, tpRegEvolFunc);

  TfrmParamEtiquetaAlteracaoCTPS = class(TfrmOkCancelar)
    gbxConfigEtiq: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    spedAltura: TSpinEdit;
    spedQuantCarreiras: TSpinEdit;
    spedQuantLinhas: TSpinEdit;
    spedMargemSuperior: TSpinEdit;
    spedMargEsquerda: TSpinEdit;
    gbxPosicao: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    spedColuna: TSpinEdit;
    spedLinha: TSpinEdit;
    procedure spedQuantCarreirasChange(Sender: TObject);
    procedure spedQuantLinhasChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    ArqConfig: TIniFileEx;

    FTipoParamEtiqueta: TTipoParamEtiqueta;
    FSessaoArqIni: string;
    FSQL: string;

    procedure LerAlteracoes;
    procedure GravarAlteracoes;
  public
    constructor Create(AOwner: TComponent; TipoParamEtiqueta: TTipoParamEtiqueta); reintroduce;
    destructor  Destroy; override;

    procedure Abrir(SQL: string);
  end;

var
  frmParamEtiquetaAlteracaoCTPS: TfrmParamEtiquetaAlteracaoCTPS;

implementation

uses uSistema, fAguarde, uCtrlFuncoesRH, REtiquetaAlteracaoCTPS;

{$R *.dfm}

constructor TfrmParamEtiquetaAlteracaoCTPS.Create(AOwner: TComponent;
  TipoParamEtiqueta: TTipoParamEtiqueta);
begin
  inherited Create(AOwner);
  FTipoParamEtiqueta := TipoParamEtiqueta;
  if (TipoParamEtiqueta = tpReajusteSalarial) then
    FSessaoArqIni := 'REAJUSTE_SALARIAL'
  else
    FSessaoArqIni := 'CAD_REG_EVOL_FUNC';
  LerAlteracoes;
  spedQuantCarreirasChange(nil);
  spedQuantLinhasChange(nil);
end;

procedure TfrmParamEtiquetaAlteracaoCTPS.FormShow(Sender: TObject);
begin
  inherited;
  gbxPosicao.Visible := (FTipoParamEtiqueta = tpRegEvolFunc);
  if (gbxPosicao.Visible) then
    Height := 275
  else
    Height := 225;
end;

destructor TfrmParamEtiquetaAlteracaoCTPS.Destroy;
begin
  GravarAlteracoes;
  inherited;
end;

procedure TfrmParamEtiquetaAlteracaoCTPS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmParamEtiquetaAlteracaoCTPS.spedQuantCarreirasChange(Sender: TObject);
begin
  spedColuna.MaxValue := spedQuantCarreiras.Value;
  if (spedColuna.Value > spedQuantCarreiras.Value) then
    spedColuna.Value := spedQuantCarreiras.Value;
end;

procedure TfrmParamEtiquetaAlteracaoCTPS.spedQuantLinhasChange(Sender: TObject);
begin
  spedLinha.MaxValue := spedQuantLinhas.Value;
  if (spedLinha.Value > spedQuantLinhas.Value) then
    spedLinha.Value := spedQuantLinhas.Value;
end;

procedure TfrmParamEtiquetaAlteracaoCTPS.bbtnConfirmarClick(Sender: TObject);
begin
  RptEtiquetaAlteracaoCTPS := TRptEtiquetaAlteracaoCTPS.Create(Application);
  try
    frmAguarde.Mostra(Translate('Etiquetas para Atualização de CTPS'));
    frmAguarde.pbAguarde.Visible := false;

    with (RptEtiquetaAlteracaoCTPS) do
    begin
      // Alteração dos posicionamentos
      MargemEsq := spedMargEsquerda.Value;
      Altura := Round(spedAltura.Value);
      QuantLinhas := Round(spedQuantLinhas.Value);
      Linha := Round(spedLinha.Value);
      Coluna := Round(spedColuna.Value);
      QuantCarreiras := Round(spedQuantCarreiras.Value);
      MargemSuperior := Round(spedMargemSuperior.Value);

      // Abrir a Query
      sqlEtiquetaAlteracaoCTPS.SQL.Text := FSQL;
      sqlEtiquetaAlteracaoCTPS.Open;

      // Impressão propriamente dita
      SomenteUmaPessoa := true;
      case (Sistema.IdModulo) of
        MODFOL : CrmRptCM.IdReports := 3673;
        MODCES : CrmRptCM.IdReports := 3674;
      end;
      CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
      CrmRptCM.OrigemCM := 1;
      CrmRptCM.IdModulo := Sistema.IdModulo;
      CrmRptCM.IdUsuario := Sistema.IdUsuario;
      CrmRptCM.Print;
    end;
  finally
    frmAguarde.pbAguarde.Visible := true;
    FreeAndNil(RptEtiquetaAlteracaoCTPS);
  end;
end;

procedure TfrmParamEtiquetaAlteracaoCTPS.LerAlteracoes;
begin
  // Recuperar as últimas alterações das opções
  ArqConfig := TIniFileEx.Create('C:\CONFIG_FOLHAPAGTO.INI');

  spedAltura.Value := StrToInt(
    ArqConfig.ReadString(FSessaoArqIni, 'Altura', IntToStr(spedAltura.Value)));
  spedQuantCarreiras.Value := StrToInt(
    ArqConfig.ReadString(FSessaoArqIni, 'Carreiras', IntToStr(spedQuantCarreiras.Value)));
  spedQuantLinhas.Value := StrToInt(
    ArqConfig.ReadString(FSessaoArqIni, 'Linhas', IntToStr(spedQuantLinhas.Value)));
  spedMargemSuperior.Value := StrToInt(
    ArqConfig.ReadString(FSessaoArqIni, 'MargemSuperior', IntToStr(spedMargemSuperior.Value)));
  spedMargEsquerda.Value := StrToInt(
    ArqConfig.ReadString(FSessaoArqIni, 'MargEsquerda', IntToStr(spedMargEsquerda.Value)));
end;

procedure TfrmParamEtiquetaAlteracaoCTPS.GravarAlteracoes;
begin
  ArqConfig.WriteString(FSessaoArqIni, 'Altura', IntToStr(spedAltura.Value));
  ArqConfig.WriteString(FSessaoArqIni, 'Carreiras', IntToStr(spedQuantCarreiras.Value));
  ArqConfig.WriteString(FSessaoArqIni, 'Linhas', IntToStr(spedQuantLinhas.Value));
  ArqConfig.WriteString(FSessaoArqIni, 'MargemSuperior', IntToStr(spedMargemSuperior.Value));
  ArqConfig.WriteString(FSessaoArqIni, 'MargEsquerda', IntToStr(spedMargEsquerda.Value));
  ArqConfig.Free;
end;

procedure TfrmParamEtiquetaAlteracaoCTPS.Abrir(SQL: string);
begin
  FSQL := SQL;
  ShowModal;
end;

end.

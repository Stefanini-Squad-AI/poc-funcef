unit cRelOrcamento;

// -----------------------------------------------------------------------------
//
//      PARAMETROS DO RELATÓRIO DE ORÇAMENTO - ENCARGOS COMUNS  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  06/06/2002
//      Data de Término :  06/06/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, mImovel, Mask,
  wwdbedit, Wwdbspin, fcCombo, fcColorCombo, mImovelouMestre, ComCtrls,
  Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, Db, DBClient, uCMClientDataSet;

type
  TcfgRelOrcamento = class(TfrmParamReports_Padrao)
    molImovelouMestre1: TmolImovelouMestre;
    pcParametros: TPageControl;
    tsParam: TTabSheet;
    tsIndicadores: TTabSheet;
    GroupBox2: TGroupBox;
    cbReceita: TCheckBox;
    cbDespesa: TCheckBox;
    cbDesemp: TCheckBox;
    GroupBox3: TGroupBox;
    cbPrevisto: TCheckBox;
    cbRealizado: TCheckBox;
    rgOrdem: TRadioGroup;
    GroupBox1: TGroupBox;
    spnAno: TwwDBSpinEdit;
    gbMesIni: TGroupBox;
    cboMesInicio: TComboBox;
    gbMesFim: TGroupBox;
    cboMesFim: TComboBox;
    gbGraficos: TGroupBox;
    cbGrafico1: TCheckBox;
    cbGrafico2: TCheckBox;
    cbGrafico3: TCheckBox;
    cbGrafico4: TCheckBox;
    rgGrupo: TRadioGroup;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    dbgrdDet: TwwDBGrid;
    Panel1: TPanel;
    sbSeleciona: TSpeedButton;
    sbDesmarca: TSpeedButton;
    SqlIndicadores: TCMSqlParams;
    cdsIndicadores: TCMClientDataSet;
    dsIndicadores: TDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure sbSelecionaClick(Sender: TObject);
    procedure sbDesmarcaClick(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelOrcamento: TcfgRelOrcamento;

implementation

uses uSistema, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelOrcamento.FormCreate(Sender: TObject);
begin
  inherited;
  molImovelouMestre1.iImovel   := -1;
  cboMesInicio.ItemIndex       :=  0;
  pcParametros.ActivePageIndex :=  0;
  cboMesFim.ItemIndex          := DiasUteis.ExtraiMes(Date) - 1;
  spnAno.Value := DiasUteis.ExtraiAno(Date);
  SqlIndicadores.Open;
end;


procedure TcfgRelOrcamento.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor, iQtdeMeses  : Integer;
    sIndicadores : String;
begin
  inherited;
  if VerificaPreenchimento then begin

    if cboMesFim.ItemIndex > cboMesInicio.ItemIndex then begin
       iQtdeMeses := (cboMesFim.ItemIndex - cboMesInicio.ItemIndex) +1;
    end else if cboMesFim.ItemIndex < cboMesInicio.ItemIndex then begin
       iQtdeMeses := (12 - cboMesInicio.ItemIndex) + cboMesFim.ItemIndex + 1;
    end else begin
       iQtdeMeses := 1;
    end;

    cmp_Padrao.ParamByName('idImovel').AsInteger     := molImovelouMestre1.iImovel;
    cmp_Padrao.ParamByName('iAno').AsFloat           := spnAno.Value;
    cmp_Padrao.ParamByName('flgReceita').AsBoolean   := cbReceita.Checked;
    cmp_Padrao.ParamByName('flgDespesa').AsBoolean   := cbDespesa.Checked;
    cmp_Padrao.ParamByName('flgPrevisto').AsBoolean  := cbPrevisto.Checked;
    cmp_Padrao.ParamByName('flgRealizado').AsBoolean := cbRealizado.Checked;
    cmp_Padrao.ParamByName('flgDesemp').AsBoolean    := cbDesemp.Checked;
    cmp_Padrao.ParamByName('iOrdem').AsInteger       := rgOrdem.ItemIndex + 1;
    cmp_Padrao.ParamByName('iMesIni').AsInteger      := cboMesInicio.ItemIndex + 1;
    cmp_Padrao.ParamByName('iQtdeMeses').AsInteger   := iQtdeMeses;
    cmp_Padrao.ParamByName('sMesIni').AsString       := cboMesInicio.Text;
    cmp_Padrao.ParamByName('sMesFim').AsString       := cboMesFim.Text;    
    cmp_Padrao.ParamByName('bGrafico1').AsBoolean    := cbGrafico1.Checked;
    cmp_Padrao.ParamByName('bGrafico2').AsBoolean    := cbGrafico2.Checked;
    cmp_Padrao.ParamByName('bGrafico3').AsBoolean    := cbGrafico3.Checked;
    cmp_Padrao.ParamByName('bGrafico4').AsBoolean    := cbGrafico4.Checked;
    cmp_Padrao.ParamByName('iGrupo').AsInteger       := rgGrupo.ItemIndex;    

    // Monta Parâmetros dos indicadores
    sIndicadores := '';
    cmp_Padrao.ParamByName('bFiltroIndicador').AsBoolean := False;
    cdsIndicadores.First;
    while not cdsIndicadores.Eof do begin
       if cdsIndicadores.FieldByName('FLGSELECAO').AsInteger = 1 then begin
          sIndicadores := sIndicadores + cdsIndicadores.FieldByName('IDINDICADOR').AsString + ',';
       end else begin
          cmp_Padrao.ParamByName('bFiltroIndicador').AsBoolean := True;
       end;
       cdsIndicadores.Next;
    end;
    if sIndicadores <> '' then sIndicadores := Copy(sIndicadores,1,Length(sIndicadores)-1);
    cmp_Padrao.ParamByName('sIndicadores').AsString := sIndicadores;

    // Carrega variáveis com os parametros de cores de linha e separadores
    iPosCor  := 0;
    CorLinha := cboCorLinha.SelectedColor;
    ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
    cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
    cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
    cmp_Padrao.ParamByName('iCorLinha').AsInteger  := iPosCor;

    if bbtnConfirmar.ModalResult <> mrOk then begin
       bbtnConfirmar.ModalResult := mrOk;
       bbtnConfirmar.Click;
    end;
  end;
end;

function TcfgRelOrcamento.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if molImovelouMestre1.iImovel <= 0 then
        raise EValidacao.CreateVal('Selecione um imóvel',molImovelouMestre1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndABL = -1 then
        raise EValidacao.CreateVal('Parâmetro de ABL não foi definido',molImovelouMestre1.btnBuscaImovel);
     if spnAno.Value <= 0 then
        raise EValidacao.CreateVal('Informe o Ano de Referência',spnAno);
  except
     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;
  end;
  Result := True;
end;

procedure TcfgRelOrcamento.dbgrdDetDblClick(Sender: TObject);
begin
   inherited;
   // Marca ou Desmarca os indicadores
   if not cdsIndicadores.IsEmpty then begin
      cdsIndicadores.Edit;
      cdsIndicadores.FieldByName('FLGSELECAO').AsInteger := (cdsIndicadores.FieldByName('FLGSELECAO').AsInteger Xor 1);
      cdsIndicadores.Post;
   end;
end;

procedure TcfgRelOrcamento.sbSelecionaClick(Sender: TObject);
begin
   inherited;
   // Seleciona todos os indicadores
   cdsIndicadores.DisableControls;
   cdsIndicadores.First;
   while not cdsIndicadores.eof do begin
      cdsIndicadores.Edit;
      cdsIndicadores.FieldByName('FLGSELECAO').AsInteger := 1;
      cdsIndicadores.Post;
      cdsIndicadores.Next;
   end;
   cdsIndicadores.First;
   cdsIndicadores.EnableControls;
end;

procedure TcfgRelOrcamento.sbDesmarcaClick(Sender: TObject);
begin
   inherited;
   // Desmarca todos os indicadores
   cdsIndicadores.DisableControls;
   cdsIndicadores.First;
   while not cdsIndicadores.eof do begin
      cdsIndicadores.Edit;
      cdsIndicadores.FieldByName('FLGSELECAO').Clear;
      cdsIndicadores.Post;
      cdsIndicadores.Next;
   end;
   cdsIndicadores.First;
   cdsIndicadores.EnableControls;
end;

end.

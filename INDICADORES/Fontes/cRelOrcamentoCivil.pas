unit cRelOrcamentoCivil;

// -----------------------------------------------------------------------------
//
//      PARAMETROS DO RELATÓRIO DE ORÇAMENTO - CONDOMÍNIO CIVIL  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  13/08/2002
//      Data de Término :  13/08/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, mImovel, Mask,
  wwdbedit, Wwdbspin, fcCombo, fcColorCombo, mImovelouMestre;

type
  TcfgRelOrcamentoCivil = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    spnAno: TwwDBSpinEdit;
    GroupBox2: TGroupBox;
    cbReceita: TCheckBox;
    cbDespesa: TCheckBox;
    GroupBox3: TGroupBox;
    cbPrevisto: TCheckBox;
    cbRealizado: TCheckBox;
    cbDesemp: TCheckBox;
    rgOrdem: TRadioGroup;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    molImovelouMestre1: TmolImovelouMestre;
    gbMesIni: TGroupBox;
    cboMesInicio: TComboBox;
    gbMesFim: TGroupBox;
    cboMesFim: TComboBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelOrcamentoCivil: TcfgRelOrcamentoCivil;

implementation

uses uSistema, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelOrcamentoCivil.FormCreate(Sender: TObject);
begin
  inherited;
  molImovelouMestre1.iImovel := -1;
  cboMesInicio.ItemIndex     :=  0;
  cboMesFim.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
  spnAno.Value := DiasUteis.ExtraiAno(Date);
end;


procedure TcfgRelOrcamentoCivil.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor, iQtdeMeses : Integer;
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

function TcfgRelOrcamentoCivil.VerificaPreenchimento: Boolean;
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

end.

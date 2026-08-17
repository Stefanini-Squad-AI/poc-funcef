unit cRelGraficoHotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, mIndicador, Mask,
  wwdbedit, Wwdbspin, mHotel;

type
  TcfgRelGraficoHotel = class(TfrmParamReports_Padrao)
    molHotel1: TmolHotel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
    molIndicador1: TmolIndicador;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelGraficoHotel: TcfgRelGraficoHotel;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelGraficoHotel.FormCreate(Sender: TObject);
begin
  inherited;
  molHotel1.InicializaFrame;
  spnAno.Value       := DiasUteis.ExtraiAno(Date);
  cboMes.ItemIndex   := DiasUteis.ExtraiMes(Date) -1;
end;

procedure TcfgRelGraficoHotel.FormDestroy(Sender: TObject);
begin
  molHotel1.DestroiFrame;
  inherited;
end;

function TcfgRelGraficoHotel.VerificaPreenchimento: Boolean;
begin
  Result := False;

  try
    if molHotel1.cdsResult.IsEmpty then
      raise EValidacao.CreateVal('Selecione os Hotéis a serem comparados', molHotel1.chklbHotel);

    if molHotel1.cdsResult.RecordCount > 7 then
      raise EValidacao.CreateVal('Selecione no máximo 7 Hotéis a serem comparados', molHotel1.chklbHotel);

    if molIndicador1.iIndicador <= 0 then
      raise EValidacao.CreateVal('Selecione o Indicador para o Gráfico', molIndicador1.btnBuscaIndicador);

    if cboMes.ItemIndex = -1 then
      raise EValidacao.CreateVal('Informe o Mês de Referência',cboMes);

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

procedure TcfgRelGraficoHotel.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  molHotel1.BuscaResult;

  if (VerificaPreenchimento) then begin
    cmp_Padrao.ParamByName('iMes').AsInteger      := cboMes.ItemIndex+1;
    cmp_Padrao.ParamByName('iAno').AsFloat        := spnAno.Value;
    cmp_Padrao.ParamByName('idIndicador').AsFloat := molIndicador1.iIndicador;

    // Transfere os hotéis selecionados
    with molHotel1.CdsResult do begin
      First;

      while not Eof do begin
        cmp_Padrao.ParamValues[(molHotel1.CdsResult.RecNo+2)].AsInteger := FieldByName('IDIMOVEL').AsInteger;
        Next;
      end;
    end;

    if (bbtnConfirmar.ModalResult<>mrOk) then begin
      bbtnConfirmar.ModalResult := mrOk;
      bbtnConfirmar.Click;
    end;
  end;
end;

end.

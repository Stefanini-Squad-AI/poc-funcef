{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24879
Responsável : Daniel Simões
Data        : 12/07/2007
Descrição   : Implementação do relatório de Resumo da Folha de Receita por
              Vencimento.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit cRelFolhaRecVencimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo,
  fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit,
  Wwdbspin, mImovelMestre, uCtrlRelAdminImob;

type
  TcfgRelFolhaRecVencimento = class(TfrmParamReports_Padrao)
    Bevel1: TBevel;
    molImovelMestre1: TmolImovelMestre;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    chkCompetencia: TCheckBox;
    grpVencimento: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataInicio: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure FormCreate(Sender: TObject);

    function VerificaPreenchimento: boolean;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataInicioChange(Sender: TObject);

  private
    { Private declarations }

    CtrlRelAdminImob : TCtrlRelAdminImob;
  public
    { Public declarations }
  end;

var
  cfgRelFolhaRecVencimento: TcfgRelFolhaRecVencimento;

implementation

uses uSistema, uMensErro, uDatabase, dBaseDados, uComunsImobiliario, uVerificaPreenchimento,
     uDiasInUteis, dMS, uFuncoesImob, dRelFolhaRecVencimento;

{$R *.DFM}

procedure TcfgRelFolhaRecVencimento.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlRelAdminImob := TCtrlRelAdminImob.Create;
  CtrlRelAdminImob.Initialize(dtmBaseDados.DbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True,
                              ComunsImobiliario.MensErroMT);

  DBspnAnoCompetencia.Value   := DiasUteis.ExtraiAno(Date);
  cboMesCompetencia.ItemIndex := DiasUteis.ExtraiMes(Date)-1;
end;

function TcfgRelFolhaRecVencimento.VerificaPreenchimento: boolean;
begin
  Result := False;

  try
    if ( chkCompetencia.Checked ) then begin
      if (Length(Trim(edDataInicio.Text))=0) and (Length(Trim(edDataFim.Text))=0) then
        raise EValidacao.CreateVal('Preencha a Data de Vencimento.',edDataInicio);
    end;
  except
    on ev : EValidacao do begin
      Screen.Cursor := crDefault;

      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;

      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;

procedure TcfgRelFolhaRecVencimento.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;

  if (VerificaPreenchimento) then begin
    { Se tiver marcado para não levar em conta a competência, irá preencher
      apenas as datas de vencimento... }
    if (chkCompetencia.Checked) then begin
      Cmp_Padrao.ParamByName('dAnoComp').AsInteger     := -1;
      Cmp_Padrao.ParamByName('dMesComp').AsInteger     := -1;
    end else begin
      Cmp_Padrao.ParamByName('dAnoComp').AsInteger     := Trunc(DBspnAnoCompetencia.Value);
      Cmp_Padrao.ParamByName('dMesComp').AsInteger     := cboMesCompetencia.ItemIndex+1;
    end;

    Cmp_Padrao.ParamByName('dVencInicial').AsDateTime  := edDataInicio.DateTime;
    Cmp_Padrao.ParamByName('dVencFinal').AsDateTime    := edDataFim.DateTime;
    Cmp_Padrao.ParamByName('IdImovelMestre').AsInteger := molImovelMestre1.iMestre;
    Cmp_Padrao.ParamByName('sNomeImovel').AsString     := molImovelMestre1.edtImovel.Text;
    Cmp_Padrao.ParamByName('IdModulo').AsInteger       := Sistema.IdModulo;

    // Carrega variáveis com os parametros de cores de linha e separadores
    iPosCor  := 0;
    CorLinha := cboCorLinha.SelectedColor;
    ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
    Cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
    Cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
    Cmp_Padrao.ParamByName('iCorLinha').AsInteger  := iPosCor;

    if (bbtnConfirmar.ModalResult<>mrOk) then begin
      bbtnConfirmar.ModalResult := mrOk;
      bbtnConfirmar.Click;
    end;
  end;
end;

procedure TcfgRelFolhaRecVencimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(CtrlRelAdminImob);
end;

procedure TcfgRelFolhaRecVencimento.edDataInicioChange(Sender: TObject);
begin
  inherited;

  chkCompetencia.Checked := (edDataInicio.Date>0);
end;

end.

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24881
Responsável : Daniel Simões
Data        : 06/07/2007
Descrição   : Implementação do relatório de Resumo da Folha de Alugueis por
              Empreendimento ( Imóvel Mestre ) e Segmento ( Tipo de Imóvel ).
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit cRelFolhaRecEmpreendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mImovelMestre, Mask, wwdbedit, Wwdbspin, wwdblook,
  fcCombo, fcColorCombo, mContratoNumero, wwdbdatetimepicker,
  CMDateTimePicker, CRel, CmParamReport, dxCntner, dxEditor, dxExEdtr,
  dxEdLib, mContrato, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlRelAdminImob;

type
  TcfgRelFolhaRecEmpreendimento = class(TfrmParamReports_Padrao)
    molImovelMestre1: TmolImovelMestre;
    lblTipoImovel: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    grpCompetencia: TGroupBox;
    grpVencimento: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    edDataInicio: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    molContrato1: TmolContrato;
    cdsTipoImovel: TCMClientDataSet;
    cdsTipoImovelCODTIPIMOVEL: TStringField;
    cdsTipoImovelDESCTIPOIMOVEL: TStringField;
    cdsTipoImovelIDGRUPOTERRENO: TFloatField;
    cdsTipoImovelIDGRUPOEDIFICACAO: TFloatField;
    cdsTipoImovelIDGRUPOINST: TFloatField;
    cdsTipoImovelIDGRUPOELET: TFloatField;
    cdsTipoImovelIDGRUPOAR: TFloatField;
    cdsTipoImovelIDGRUPOVEICULO: TFloatField;
    cdsTipoImovelIDGRUPOUTILITARIO: TFloatField;
    cdsTipoImovelIDGRUPOMAQUINA: TFloatField;
    cdsTipoImovelIDGRUPOMOVEL: TFloatField;
    cdsTipoImovelCODALTMULTA: TFloatField;
    cdsTipoImovelCODALTJUROS: TFloatField;
    cdsTipoImovelCODALTCORRMON: TFloatField;
    cdsTipoImovelALTERADOR_MULTA: TStringField;
    cdsTipoImovelALTERADOR_JUROS: TStringField;
    cdsTipoImovelALTERADOR_CORRECAO: TStringField;
    dsTipoImovel: TwwDataSource;
    chkCompetencia: TCheckBox;

    function VerificaPreenchimento: boolean;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edDataInicioChange(Sender: TObject);

  private
    { Private declarations }

    CtrlRelAdminImob : TCtrlRelAdminImob;

  public
    { Public declarations }
  end;

var
  cfgRelFolhaRecEmpreendimento: TcfgRelFolhaRecEmpreendimento;

implementation

uses uSistema, uMensErro, uDatabase, dBaseDados, uComunsImobiliario, uVerificaPreenchimento,
     uDiasInUteis, dMS, uFuncoesImob, dRelFolhaRecEmpreendimento;

{$R *.DFM}

{ TcfgRelFolhaRecEmpreendimento }

procedure TcfgRelFolhaRecEmpreendimento.FormCreate(Sender: TObject);
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

procedure TcfgRelFolhaRecEmpreendimento.FormShow(Sender: TObject);
begin
  inherited;

  cdsTipoImovel.Data := CtrlRelAdminImob.LookupTipoImovel;

end;

function TcfgRelFolhaRecEmpreendimento.VerificaPreenchimento: boolean;
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

procedure TcfgRelFolhaRecEmpreendimento.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;

  if (VerificaPreenchimento) then begin
    Cmp_Padrao.ParamByName('IdImovelMestre').AsInteger   := molImovelMestre1.iMestre;
    Cmp_Padrao.ParamByName('IdContratoImovel').AsInteger := molContrato1.iContrato;
    Cmp_Padrao.ParamByName('sCodTipoImovel').AsString    := DBcboTipoImovel.LookupValue;

    { Se tiver marcado para não levar em conta a competência, irá preencher
      apenas as datas de vencimento... }
    if (chkCompetencia.Checked) then begin
      Cmp_Padrao.ParamByName('dAnoComp').AsInteger    := -1;
      Cmp_Padrao.ParamByName('dMesComp').AsInteger    := -1;
    end else begin
      Cmp_Padrao.ParamByName('dAnoComp').AsInteger    := Trunc(DBspnAnoCompetencia.Value);
      Cmp_Padrao.ParamByName('dMesComp').AsInteger    := cboMesCompetencia.ItemIndex+1;
    end;

    Cmp_Padrao.ParamByName('dVencInicial').AsDateTime := edDataInicio.DateTime;
    Cmp_Padrao.ParamByName('dVencFinal').AsDateTime   := edDataFim.DateTime;
    Cmp_Padrao.ParamByName('IdModulo').AsInteger      := Sistema.IdModulo;

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

procedure TcfgRelFolhaRecEmpreendimento.FormClose(Sender:TObject; var Action:TCloseAction);
begin
  inherited;

  FreeAndNil(CtrlRelAdminImob);
end;

procedure TcfgRelFolhaRecEmpreendimento.edDataInicioChange(Sender:TObject);
begin
  inherited;

  chkCompetencia.Checked := (edDataInicio.Date>0);
end;

end.

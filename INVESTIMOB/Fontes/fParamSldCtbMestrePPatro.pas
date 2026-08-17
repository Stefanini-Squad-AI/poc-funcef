{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 17/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fParamSldCtbMestrePPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids, Wwdbigrd,
  Wwdbgrid, fcLabel, wwdblook, wwdbdatetimepicker, CMDateTimePicker, fcCombo,
  fcColorCombo, uModuloImobiliario;

type
  TfrmParamSldCtbMestrePPatro = class(TfrmOkCancelar)
    Label1: TLabel;
    eDataFim: TCMDateTimePicker;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    DBcboPlanoPrev: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    DBcboPatrocinadora: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure eDataFimExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure TotalizaGrupos;
  public
    { Public declarations }
    iIdConjunto : Integer;
  end;

var
  frmParamSldCtbMestrePPatro: TfrmParamSldCtbMestrePPatro;

implementation

uses dRelBalCaf, uSistema, uMensErro, dLookImobiliario, uFuncoesImob;
{$R *.DFM}

procedure TfrmParamSldCtbMestrePPatro.FormActivate(Sender: TObject);
begin
   inherited;
   eDataFim.Date := Date;
   eDataFim.SetFocus;
end;
//========================================================================================
procedure TfrmParamSldCtbMestrePPatro.bbtnConfirmarClick(Sender: TObject);
var iDia, iMes, iAno: Word;
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   with dtmRelBalCaf do
   begin
      // Carrega o Logotipo - Marcio Motta - 28/06/2004
      if ModuloImobiliario.InvestImob.bFlgLogoRelat then
         ppImgLogotipo.Picture := ModuloImobiliario.InvestImob.LogoTipo.Picture
      else
        ppImgLogotipo.Picture := nil;

      DecodeDate(eDataFim.Date, iAno, iMes, iDia);

      qrySldCtbMestrePPatro.Close;
      ppLabel114.Caption := eDataFim.Text;
      qrySldCtbMestrePPatro.ParamByName('PDATASLD').AsDateTime  := eDataFim.Date;
      qrySldCtbMestrePPatro.ParamByName('PDATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);
      qrySldCtbMestrePPatro.ParamByName('PMOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
      qrySldCtbMestrePPatro.ParamByName('PIDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
      qrySldCtbMestrePPatro.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
      if DBcboPlanoPrev.Text <> '' then
        qrySldCtbMestrePPatro.ParamByName('PPrev').AsString := DBcboPlanoPrev.LookupValue
      else
        qrySldCtbMestrePPatro.ParamByName('PPrev').Clear;

      if DBcboPatrocinadora.Text <> '' then
        qrySldCtbMestrePPatro.ParamByName('PPatro').AsString := DBcboPatrocinadora.LookupValue
      else
        qrySldCtbMestrePPatro.ParamByName('PPatro').Clear;

      qrySldCtbMestrePPatro.Open;

      if qrySldCtbMestrePPatro.IsEmpty then begin
        MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
      end else begin
        cdsGrpBem.Close;
        spGrpBem.Open;
        TotalizaGrupos;
      end;

      Screen.Cursor := crDefault;
      dtmRelBalCaf.bSeparador := chkLinhas.Checked;
      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      dtmRelBalCaf.bCorlinha  := chkCorLinha.Checked;
      dtmRelBalCaf.CorLinha   := cboCorLinha.SelectedColor;
   end;
end;
//========================================================================================
procedure TfrmParamSldCtbMestrePPatro.eDataFimExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then exit;
   if eDataFim.Text = '' then
   begin
      MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
      eDataFim.SetFocus;
   end;
end;

procedure TfrmParamSldCtbMestrePPatro.TotalizaGrupos;
begin
  with dtmRelBalCaf do begin
    qrySldCtbMestrePPatro.First;
    while not qrySldCtbMestrePPatro.Eof do begin
      if not cdsGrpBem.Locate('IDGRUPO',qrySldCtbMestrePPatroIDGRUPO.AsInteger,[]) then begin
         cdsGrpBem.Insert;
         cdsGrpBemIDGRUPO.AsInteger  := qrySldCtbMestrePPatroIDGRUPO.AsInteger;
         cdsGrpBemDSC_GRUPO.AsString := qrySldCtbMestrePPatroDESCGRUPO.AsString;
      end else begin
         cdsGrpBem.Edit;
      end;
      cdsGrpBemVLR_CUSTO.AsFloat    := cdsGrpBemVLR_CUSTO.AsFloat    + qrySldCtbMestrePPatroCUSTOCORR0.AsFloat;
      cdsGrpBemVLR_CUSTOACU.AsFloat := cdsGrpBemVLR_CUSTOACU.AsFloat + qrySldCtbMestrePPatroDEPBEMACUM0.AsFloat;
      cdsGrpBemVLR_CUSTOMES.AsFloat := cdsGrpBemVLR_CUSTOMES.AsFloat + qrySldCtbMestrePPatroDEPBEMATU0.AsFloat;
      cdsGrpBemVLR_REAV.AsFloat     := cdsGrpBemVLR_REAV.AsFloat     + qrySldCtbMestrePPatroCUSTOREAV0.AsFloat;
      cdsGrpBemVLR_REAVACU.AsFloat  := cdsGrpBemVLR_REAVACU.AsFloat  + qrySldCtbMestrePPatroDEPREAVACUM0.AsFloat;
      cdsGrpBemVLR_REAVMES.AsFloat  := cdsGrpBemVLR_REAVMES.AsFloat  + qrySldCtbMestrePPatroDEPREAVATU0.AsFloat;
      cdsGrpBemVLR_SLDCTB.AsFloat   := cdsGrpBemVLR_SLDCTB.AsFloat   + qrySldCtbMestrePPatroVALCTB0.AsFloat;
      cdsGrpBem.Post;
      qrySldCtbMestrePPatro.Next;
    end;
    qrySldCtbMestrePPatro.First;
    cdsGrpBem.First;
  end;
end;

procedure TfrmParamSldCtbMestrePPatro.FormShow(Sender: TObject);
begin
  inherited;
   // Marcio Motta - 23/06/2004 - 16862
   LimpaParametros(dtmLookImobiliario.qryLookPatrocinadora);
   dtmLookImobiliario.qryLookPatrocinadora.ParamByName('pIdEmpresa').AsInteger := Sistema.IdEmpresa;
   dtmLookImobiliario.qryLookPatrocinadora.Open;
   // Marcio Motta - 23/06/2004 - 16862
   LimpaParametros(dtmLookImobiliario.qryLookPlanoPrev);
   dtmLookImobiliario.qryLookPlanoPrev.Open;

end;

end.



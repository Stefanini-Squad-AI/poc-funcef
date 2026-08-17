unit fParamRelPatSintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, fcCombo, fcColorCombo;

type
  TfrmParamRelPatSintetico = class(TfrmOkCancelar)
    Label1: TLabel;
    eDataFim: TCMDateTimePicker;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Label8: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    chkValorZero: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure eDataFimExit(Sender: TObject);
  private
    { Private declarations }
    procedure TotalizaGrupos;
  public
    { Public declarations }
    iIdConjunto : Integer;
  end;

var
  frmParamRelPatSintetico: TfrmParamRelPatSintetico;

implementation

uses dRelBalCaf, uSistema, uMensErro, uModuloImobiliario, dLookImobiliario, uFuncoesImob;
{$R *.DFM}

procedure TfrmParamRelPatSintetico.FormActivate(Sender: TObject);
begin
   inherited;
   eDataFim.Date := Date;
   eDataFim.SetFocus;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;
//========================================================================================
procedure TfrmParamRelPatSintetico.bbtnConfirmarClick(Sender: TObject);
var iDia, iMes, iAno : Word;
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   with dtmRelBalCaf do begin
     LimpaParametros(dtmRelBalCaf.qryRelatPatSintetico);
      qryRelatPatSintetico.Close;

      ppLabel160.Caption := eDataFim.Text;

      if DBcboTipoImovel.LookupValue = '' then
           ppLabel172.Caption := 'Segmento: < Todos >'
      else ppLabel172.Caption := 'Segmento: < ' + DBcboTipoImovel.Text + ' >';

      DecodeDate(eDataFim.Date, iAno, iMes, iDia);

      // carrega parâmetros
      qryRelatPatSintetico.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
      qryRelatPatSintetico.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
      qryRelatPatSintetico.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
      qryRelatPatSintetico.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
      qryRelatPatSintetico.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);

      if DBcboTipoImovel.Text <> '' then
         qryRelatPatSintetico.ParamByName('CODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;

      if chkValorZero.Checked then  // imóveis com saldo maior que zero
         qryRelatPatSintetico.ParamByName('PVLRZERO').AsInteger :=1
      else
         qryRelatPatSintetico.ParamByName('PVLRZERO').AsInteger := 0;

      qryRelatPatSintetico.Open;

      if qryRelatPatSintetico.IsEmpty then begin
        MsgDlg('Não existem imóveis com saldo na data informada!','Informação',mtInformation,[mbOk],0);
      end else begin
        cdsRelPatSint.Close;
        sqlRelPatSint.Open;
        TotalizaGrupos;
      end;

      Screen.Cursor := crDefault;
      dtmRelBalCaf.bSeparador := chkLinhas.Checked;
      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      dtmRelBalCaf.bCorlinha  := chkCorLinha.Checked;
      dtmRelBalCaf.CorLinha   := cboCorLinha.SelectedColor;

   end;

   // Carrega o Logotipo
end;
//========================================================================================
procedure TfrmParamRelPatSintetico.eDataFimExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then exit;
   if eDataFim.Text = '' then
   begin
      MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
      eDataFim.SetFocus;
   end;
end;

procedure TfrmParamRelPatSintetico.TotalizaGrupos;
begin
  with dtmRelBalCaf do begin
    qryRelatPatSintetico.First;
    while not qryRelatPatSintetico.Eof do begin
      if not cdsRelPatSint.Locate('IDGRUPO',qryRelatPatSinteticoIDGRUPO.AsInteger,[]) then begin
         cdsRelPatSint.Insert;
         cdsRelPatSintIDGRUPO.AsInteger  := qryRelatPatSinteticoIDGRUPO.AsInteger;
         cdsRelPatSintDSC_GRUPO.AsString := qryRelatPatSinteticoDESCGRUPO.AsString;
      end else begin
         cdsRelPatSint.Edit;
      end;
      cdsRelPatSintVLR_CUSTO.AsFloat    := cdsRelPatSintVLR_CUSTO.AsFloat    + qryRelatPatSinteticoCUSTOCORR0.AsFloat;
      cdsRelPatSintVLR_CM.AsFloat       := cdsRelPatSintVLR_CM.AsFloat       + qryRelatPatSinteticoCMBEM0.AsFloat;
      cdsRelPatSintVLR_REAV.AsFloat     := cdsRelPatSintVLR_REAV.AsFloat     + qryRelatPatSinteticoCUSTOREAV0.AsFloat;
      cdsRelPatSintVLR_REAVACU.AsFloat  := cdsRelPatSintVLR_REAVACU.AsFloat  + qryRelatPatSinteticoDEPREAVACUM0.AsFloat;
      cdsRelPatSintVLR_REAVMES.AsFloat  := cdsRelPatSintVLR_REAVMES.AsFloat  + qryRelatPatSinteticoDEPREAVATU0.AsFloat;
      cdsRelPatSintVLR_SLDCTB.AsFloat   := cdsRelPatSintVLR_SLDCTB.AsFloat   + qryRelatPatSinteticoVALCTB0.AsFloat;
      cdsRelPatSint.Post;

      qryRelatPatSintetico.Next;
    end;
    qryRelatPatSintetico.First;
    cdsRelPatSint.First;
  end;
end;

end.



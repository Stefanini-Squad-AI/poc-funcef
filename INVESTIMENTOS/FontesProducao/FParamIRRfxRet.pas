unit FParamIRRfxRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, wwdblook,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Db, DBTables, Wwquery;

type
  TfrmParamIRRfxRet = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edDataIni: TCMDateTimePicker;
    Label6: TLabel;
    edDataFim: TCMDateTimePicker;
    DblInvestimento: TwwDBLookupCombo;
    Label4: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label1: TLabel;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamIRRfxRet: TfrmParamIRRfxRet;

implementation

uses UMensErro,FDMRelIRRfxRet, UOperComum, UBibliotecaInvest,fPreview;

{$R *.DFM}

procedure TfrmParamIRRfxRet.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if Trim(dblCarteira.Text) = '' then
   begin
      MsgDlg('Selecione uma Carteira.', 'Mensagem do Sistema', mtInformation, [MbOk], 0);
      if dblCarteira.CanFocus then
         dblCarteira.SetFocus;
      Exit;
   end;

   if Trim(edDataIni.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.', 'Mensagem do Sistema', mtInformation, [MbOk], 0);
      if edDataIni.CanFocus then
         edDataIni.SetFocus;
      Exit;
   end;
   if Trim(edDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.', 'Mensagem do Sistema', mtInformation, [MbOk], 0);
      if edDataFim.CanFocus then
         edDataFim.SetFocus;
      Exit;
   end;

   with DMRelIRRfxRet do
   begin
      OperComum.LimpaParametros(DMRelIRRfxRet.qryIRRfxRet);
      qryIRRfxRet.ParamByName('edDataIni').AsString := edDataIni.Text;
      qryIRRfxRet.ParamByName('edDataFim').AsString := edDataFim.Text;
      qryIRRfxRet.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteiraIDCARTEIRAINVEST.AsInteger;

      if Trim(DblInvestimento.Text) <> '' then
         qryIRRfxRet.ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;

      qryIRRfxRet.Open;
      fTotalIR      := 0;
      fTotalIRInv   := 0;
      fTotalRendInv := 0;
      fTotalRend    := 0;
      while not qryIRRfxRet.EOF do
      begin
         fTotalIR      := fTotalIR + qryIRRfxRetVLRIR.AsFloat;
         fTotalRend    := fTotalRend + qryIRRfxRetRENDIMENTO.AsFloat;
         qryIRRfxRet.Next;
      end;

      ppLDtIni.Caption    := edDataIni.Text;
      ppLDtFim.Caption    := edDataFim.Text;
      pplCarteira.Caption := 'Carteira : ' + dblCarteira.Text;

      TFrmPreview.CreateModalPreview(Application,
                                     DMRelIRRfxRet.rptIRRfxRet,
                                     DMRelIRRfxRet.rptIRRfxRet.PrinterSetup.DocumentName);

   end;
end;

procedure TfrmParamIRRfxRet.FormShow(Sender: TObject);
begin
  inherited;
   QryCarteira.Open;
   QryInvestimento.Open;
   edDataIni.Date := pRPI.DATAULTFECHRF;
   edDataFim.Date := pRPI.DATAULTFECHRF;
end;

procedure TfrmParamIRRfxRet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryCarteira.Close;
   QryInvestimento.Close;
end;

end.

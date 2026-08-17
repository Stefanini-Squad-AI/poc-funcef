unit FParamPosicaoFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, wwdblook, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamPosicaoFundo = class(TfrmOkCancelar)
    Label2: TLabel;
    Label3: TLabel;
    edDataRef: TCMDateTimePicker;
    dblFundo: TwwDBLookupCombo;
    qryFundoInvest: TwwQuery;
    qryFundoInvestIDFUNDOINVEST: TFloatField;
    qryFundoInvestDESCFUNDOINVEST: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamPosicaoFundo: TfrmParamPosicaoFundo;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, UBibliotecaInvest, FDmRelatoriosFundos,
     FCadPosicaoFundo;


procedure TfrmParamPosicaoFundo.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TfrmParamPosicaoFundo.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   with DmRelatoriosFundo.qryPosFundo do
   begin
      Close;
      if Trim(edDataRef.Text) = '' then
         ParamByName('DATAREFERENCIA').Clear
      else
         ParamByName('DATAREFERENCIA').AsDateTime := edDataRef.DateTime;

      if Trim(dblFundo.Text) = '' then
         ParamByName('IDFUNDOINVEST').Clear
      else
         ParamByName('IDFUNDOINVEST').AsString := dblFundo.LookupValue;
      Open;
   end;
   with DmRelatoriosFundo.qryPosFundoDet do
   begin
      Close;
      if Trim(edDataRef.Text) = '' then
         ParamByName('DATAREFERENCIA').Clear
      else
         ParamByName('DATAREFERENCIA').AsDateTime := edDataRef.DateTime;
      Open;
   end;

   if Trim(edDataRef.Text) = '' then
      DmRelatoriosFundo.lblPosFundosTitDtRef.Caption := DateToStr(Date)
   else
      DmRelatoriosFundo.lblPosFundosTitDtRef.Caption := edDataRef.Text;

   if Trim(dblFundo.Text) = '' then begin
      DmRelatoriosFundo.lblPosFundosTitFundo.Caption := 'Todos os Fundos';
      DmRelatoriosFundo.srptPosFundo.ExpandAll := False;
   end else begin
      DmRelatoriosFundo.lblPosFundosTitFundo.Caption := ' ';
      DmRelatoriosFundo.srptPosFundo.ExpandAll := True;
   end;

   DmRelatoriosFundo.rptPosFundo.Print;

   bbtnSair.Click;

end;

procedure TfrmParamPosicaoFundo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bbtnSair.Click;
end;

end.

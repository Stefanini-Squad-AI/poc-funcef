unit FParamMapaIOF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, Db, DBTables,
  Wwquery, fPreview, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamMapaIOF = class(TfrmOkCancelarRelInv)
    qryClasseTit: TwwQuery;
    qryClasseTitDESCCLASSETIT: TStringField;
    qryClasseTitIDCLASSETIT: TFloatField;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoPUOPERACAO: TFloatField;
    qryInvestimentoQTDEOPERACAO: TFloatField;
    qryInvestimentoVLROPERACAO: TFloatField;
    qryInvestimentoVENCOPERACAO: TDateTimeField;
    qryInvestimentoIDOPERRENFIXAPLIC: TFloatField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    lblClasse: TLabel;
    dblkClasseTit: TwwDBLookupCombo;
    lblEmissor: TLabel;
    dblkEmissor: TwwDBLookupCombo;
    Label5: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    Label1: TLabel;
    dtFinal: TCMDateTimePicker;
    procedure dblkClasseTitCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function AbreInv: Boolean;
  public
    { Public declarations }
  end;

var
  frmParamMapaIOF: TfrmParamMapaIOF;

implementation

uses FDmRelRenFixMapaIOF, UOperComum;

{$R *.DFM}

function TfrmParamMapaIOF.AbreInv: Boolean;
begin
   try
      OperComum.LimpaParametros(qryInvestimento);
      if Trim(dblkEmissor.Text) <> '' then
         qryInvestimento.ParamByName('IDEMISSOR').AsInteger := StrToInt(dblkEmissor.LookupValue);
      if Trim(dblkClasseTit.Text) <> '' then
         qryInvestimento.ParamByName('IDCLASSETIT').AsInteger := StrToInt(dblkClasseTit.LookupValue);
      qryInvestimento.Open;
      Result := True;
   except
      Result := False;
   end;
end;


procedure TfrmParamMapaIOF.dblkClasseTitCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     AbreInv;
end;

procedure TfrmParamMapaIOF.dblkEmissorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     AbreInv;

end;

procedure TfrmParamMapaIOF.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  with DmRelRenFixMapaIOF, DmRelRenFixMapaIOF.qryMapaIOF do
  begin
     OperComum.LimpaParametros(qryMapaIOF);
     if Trim(dblkClasseTit.Text) <> '' then
        ParamByName('IDCLASSETIT').AsInteger := qryClasseTitIDCLASSETIT.AsInteger;
     if Trim(dblkEmissor.Text) <> '' then
        ParamByName('IDEMISSOR').AsInteger := qryEmissorIDEMISSOR.AsInteger;
     if Trim(dblkInvestimento.Text) <> '' then
     begin
        ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
        ParamByName('IDOPERRENFIXAPLIC').AsInteger := qryInvestimentoIDOPERRENFIXAPLIC.AsInteger;
     end;
     if (Trim(dtInicio.Text) <> '') and (Trim(dtFinal.Text) <> '') then
     begin
        ParamByName('DATAINI').AsString := dtInicio.Text;
        ParamByName('DATAFIM').AsString := dtFinal.Text;
     end;
     Open;
     TFrmPreview.CreateModalPreview(Application,
                                    rptMapaIOF,
                                    rptMapaIOF.PrinterSetup.DocumentName);
     Close;
  end;
end;

procedure TfrmParamMapaIOF.FormShow(Sender: TObject);
begin
  inherited;
   qryClasseTit.Open;
   qryEmissor.Open;
   qryInvestimento.Open;
end;

end.

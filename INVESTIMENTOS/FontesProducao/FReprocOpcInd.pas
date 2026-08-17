//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_3
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
//Data	    : 06/03/2006
//Código    : Al_2
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento
//******************************************************************************
// Data     : 24/05/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************

unit FReprocOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, faMensagem, Db, DBTables, Wwquery, wwdblook, Menus,
  uCtrlInvContab;

type
  TfrmReprocOpcInd = class(TfrmOkCancelarInv)
    Label4: TLabel;
    dteDataInicio: TCMDateTimePicker;
    Label1: TLabel;
    dteDataFinal: TCMDateTimePicker;
    fraReprocOpcInd: TfraMensagem;
    qryBoletas: TwwQuery;
    qryBoletasIDBOLETA: TStringField;
    qryBoletasIDLOTE: TStringField;
    qryBoletasDESCINVESTIMENTO: TStringField;
    dblBoleta: TwwDBLookupCombo;
    Label2: TLabel;
    pmnuTransacao: TPopupMenu;
    mnuTransDia: TMenuItem;
    mnuTransPer: TMenuItem;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dteDataInicioChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuTransDiaClick(Sender: TObject);
    procedure mnuTransPerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReprocOpcInd: TfrmReprocOpcInd;

implementation

uses UOpcaoIndice, UBibliotecaInvest, DBaseDados, URendaVariavel;

{$R *.DFM}

procedure TfrmReprocOpcInd.bbtnConfirmarClick(Sender: TObject);
var sBoleta, sLote: String;
begin
  // AL_2
  if RendaVariavel.VerEmAbertura then
     Exit;
  inherited;
  try
     if mnuTransPer.Checked then
     begin
        if not DtmBaseDados.dbBaseDados.InTransaction then
           DtmBaseDados.dbBaseDados.StartTransaction;
     end;

     if Trim(dblBoleta.Text) = '' then
     begin
        sBoleta := '';
        sLote := '';
     end
     else
     begin
        sBoleta := qryBoletasIDBOLETA.AsString;
        sLote := qryBoletasIDLOTE.AsString;
     end;

     //AL_1
     //AL_3
     if not CtrlInvContab.TestaPeriodo(dteDataInicio.Text, 2, 8) then
        Raise Exception.Create(CtrlInvContab.MessageInfo);

     if not OpcaoIndice.ReprocessaHistOpcInd(dteDataInicio.DateTime,
                                             dteDataFinal.DateTime,
                                             fraReprocOpcInd, sBoleta, sLote) then
        Abort;

     dteDataInicio.DateTime := dteDataFinal.DateTime;
     fraReprocOpcInd.Mes := 'Processamento Concluído com Sucesso';

     if DtmBaseDados.dbBaseDados.InTransaction then
        DtmBaseDados.dbBaseDados.Commit;
  except
     if DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.Rollback;
  end;
end;

procedure TfrmReprocOpcInd.FormShow(Sender: TObject);
begin
  inherited;
  qryBoletas.Open;
  dteDataInicio.DateTime := pRPI.DATAULTFECH;
  dteDataFinal.DateTime := pRPI.DATAULTFECH;
end;

procedure TfrmReprocOpcInd.dteDataInicioChange(Sender: TObject);
begin
  inherited;
  fraReprocOpcInd.Mostra;
end;

procedure TfrmReprocOpcInd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryBoletas.Close;
  inherited;
end;

procedure TfrmReprocOpcInd.mnuTransDiaClick(Sender: TObject);
begin
  inherited;
  mnuTransDia.Checked := True;
  mnuTransPer.Checked := False;
end;

procedure TfrmReprocOpcInd.mnuTransPerClick(Sender: TObject);
begin
  inherited;
  mnuTransDia.Checked := False;
  mnuTransPer.Checked := True;
end;

end.


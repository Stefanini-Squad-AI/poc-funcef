unit CRelTotalItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker;

type
  TcfgRelTotalItem = class(TcfgRel)
    DBcboItemEmptmo: TwwDBLookupCombo;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    DBcboTipoContrato: TwwDBLookupCombo;
    lstPatro: TCheckListBox;
    lstPlano: TCheckListBox;
    btnInvertePatro: TBitBtn;
    btnMarcaTodosPatro: TBitBtn;
    btnInvertePlano: TBitBtn;
    btnMarcaTodosPlano: TBitBtn;
    molContratoEmptmo: TmolContratoEmptmo;
    procedure FormShow(Sender: TObject);
    procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    (* Abre Querys de Tipo de Empreastimo e Tipo de Contrato *)
    procedure AbreQueries;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelTotalItem: TcfgRelTotalItem;

implementation

uses DLookEmptmo,
     UDiasUteis,
     USistema,
     UMensErro,
     UfuncoesEmptmo, dRelParamFin;


{$R *.DFM}


procedure TcfgRelTotalItem.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
   dtmLookEmptmo.qryLookItemEmprestimo.Open;

end;


procedure TcfgRelTotalItem.FormShow(Sender: TObject);
begin
  inherited;
  AbreQueries;

end;

procedure TcfgRelTotalItem.DBcboTipoEmptmoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;

end;

procedure TcfgRelTotalItem.bbtnConfirmarClick(Sender: TObject);
begin
   dtmRelParamFin.cdsParamFin.Close;
   dtmRelParamFin.qryParamFin.Close;
   LimpaParametros(dtmRelParamFin.qryParamFin);

   if Trim(DBcboTipoEmptmo.LookupValue) <> '' then
   begin
      dtmRelParamFin.qryParamFin.ParamByName('pTIPOEMPTMO').AsInteger := dtmLookEmptmo.qryLookTipoEmptmoIDTIPOEMPTMO.AsInteger;
      if DBcboTipoContrato.LookupValue <> '' then
         dtmRelParamFin.qryParamFin.ParamByName('pTIPOCONTREMPTMO').AsInteger := dtmLookEmptmo.qryLookTipoContratoIDTIPOCONTREMPTMO.AsInteger;
   end;

   if Trim(DBcboItemEmptmo.Text) <> '' then
      dtmRelParamFin.qryParamFin.ParamByName('pITEMEMPTMO').AsInteger := dtmLookEmptmo.qryLookItemEmprestimoIDITEMEMPTMO.AsInteger;

   // Retirar depois
   dtmRelParamFin.rptParamFin.Print;
   inherited;
end;

end.






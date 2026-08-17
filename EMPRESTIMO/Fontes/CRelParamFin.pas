unit CRelParamFin;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker;

type
   TcfgRelParamFin = class(TcfgRel)
      DBcboItemEmptmo: TwwDBLookupCombo;
      Label3: TLabel;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBcboTipoEmptmoExit(Sender: TObject);


   private { Private declarations }

      (* Abre Querys de Tipo de Empreastimo e Tipo de Contrato *)
      procedure AbreQueries;

   public { Public declarations }

   end;



var
  cfgRelParamFin: TcfgRelParamFin;



implementation
{$R *.DFM}
uses DLookEmptmo,
     UDiasUteis,
     USistema,
     UMensErro,
     UfuncoesEmptmo, dRelParamFin;




procedure TcfgRelParamFin.AbreQueries;
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



procedure TcfgRelParamFin.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;



procedure TcfgRelParamFin.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;

end;



procedure TcfgRelParamFin.bbtnConfirmarClick(Sender: TObject);
begin
   dtmRelParamFin.cdsParamFin.Close;
   dtmRelParamFin.qryParamFin.Close;
   LimpaParametros(dtmRelParamFin.qryParamFin);

   if Trim(DBcboTipoEmptmo.LookupValue) <> '' then
   begin
      dtmRelParamFin.qryParamFin.ParamByName('pTIPOEMPTMO').AsInteger := dtmLookEmptmo.qryLookTipoEmptmoIDTIPOEMPTMO.AsInteger;
      if DBcboTipoContrato.LookupValue <> '' then
         dtmRelParamFin.qryParamFin.ParamByName('pTIPOCONTREMPTMO').AsInteger := dtmLookEmptmo.qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger;
   end;

   if Trim(DBcboItemEmptmo.Text) <> '' then
      dtmRelParamFin.qryParamFin.ParamByName('pITEMEMPTMO').AsInteger := dtmLookEmptmo.qryLookItemEmprestimoIDITEMEMPTMO.AsInteger;

   dtmRelParamFin.wIsCorLinha := chkCorLinha.Checked;
   dtmRelParamFin.wCorLinha   := cboCorLinha.SelectedColor;

   inherited;
end;



procedure TcfgRelParamFin.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



end.






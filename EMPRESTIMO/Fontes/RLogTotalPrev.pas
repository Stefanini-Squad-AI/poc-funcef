unit RLogTotalPrev;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, mContratoEmptmo, Db,
   Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
   Wwdotdot, Wwdbcomb, mUsuario, wwdbdatetimepicker, DBCtrls;

type
   TfrmRelLogTotalPrev = class(TfrmWizardMTEP)
      chkFiltroOrigem: TCheckBox;
      molContratoEmptmo: TmolContratoEmptmo;
      qryLogTotalPrev: TwwQuery;
      dsLogTotalPrev: TwwDataSource;
      Panel4: TPanel;
      DBgrdHistMov: TwwDBGrid;
      cboOrigem: TwwDBComboBox;
      GroupBox1: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      molUsuario: TMolUsuario;
      qryLogTotalPrevIDLOGTOTALPREV: TFloatField;
      qryLogTotalPrevIDMODULO: TFloatField;
      qryLogTotalPrevIDCONTRATOEMPTMO: TFloatField;
      qryLogTotalPrevIDHISTMOVEMPTMO: TFloatField;
      qryLogTotalPrevORIGEM: TFloatField;
      qryLogTotalPrevDESC_ORIGEM: TStringField;
      qryLogTotalPrevDESCOPERACAO: TStringField;
      qryLogTotalPrevDATA: TDateTimeField;
      qryLogTotalPrevIDUSUARIO: TFloatField;
      qryLogTotalPrevVERSAO: TStringField;
      DBMemo1: TDBMemo;
      Panel2: TPanel;
      qryLogTotalPrevNOMEUSUARIO: TStringField;
      qryLogTotalPrevNOME: TStringField;
      Label3: TLabel;
      DBedtNomeUsuario: TDBEdit;

      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure MolUsuariobtnBuscaUsuarioClick(Sender: TObject);
      procedure MolUsuariobtnLimpaUsuarioClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);


   private  // Private declarations

      procedure AbreLogTotalPrev;


   public   // Public declarations

   end;



var
  frmRelLogTotalPrev: TfrmRelLogTotalPrev;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo;



procedure TfrmRelLogTotalPrev.AbreLogTotalPrev;
begin
   with qryLogTotalPrev do
   begin
      LimpaParametros(qryLogTotalPrev);

      if molContratoEmptmo.IDContrato > 0 then
         ParamByName('PIDCONTRATO').AsFloat     := molContratoEmptmo.IDContrato;

      if molUsuario.iUsuario > 0 then
         ParamByName('PIDUSUARIO').AsInteger    := molUsuario.iUsuario;

      if length(trim(edtDataIni.Text)) > 0 then
         ParamByName('PDATAINI').AsDateTime     := edtDataIni.Date;

      if length(trim(edtDataFim.Text)) > 0 then
         ParamByName('PDATAFIM').AsDateTime     := edtDataFim.Date;

      if (chkFiltroOrigem.Checked) and (StrToInt(cboOrigem.Value) > -1) then
         ParamByName('PORIGEM').AsInteger       := StrToInt(cboOrigem.Value);

      Open;
   end; // with qryTmpDesc
end;


procedure TfrmRelLogTotalPrev.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmRelLogTotalPrev.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmRelLogTotalPrev.MolUsuariobtnBuscaUsuarioClick(Sender: TObject);
begin
   inherited;
   molUsuario.btnBuscaUsuarioClick(Sender);
end;



procedure TfrmRelLogTotalPrev.MolUsuariobtnLimpaUsuarioClick(Sender: TObject);
begin
   inherited;
   molUsuario.btnLimpaUsuarioClick(Sender);
end;



procedure TfrmRelLogTotalPrev.btnContinuarClick(Sender: TObject);
begin
   inherited;
   AbreLogTotalPrev;
end;



end.

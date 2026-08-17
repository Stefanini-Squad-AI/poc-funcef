{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadTipoContrXTipoContr;

interface

uses
   uCMTypes,
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroDetalhe, Db, DBTables, Wwquery, CmEventosCadastro, Wwdatsrc,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, TB97,
   ComCtrls, ExtCtrls, wwdblook, IvDictio, IvMulti, IvEMulti, DBCtrls;

type
   TfrmCadTipoContrXTipoContr = class(TfrmCadastroDetalhe)
      DBcboTipoContr: TwwDBLookupCombo;
      Label2: TLabel;
      Label1: TLabel;
      DBcboTipoContrQuit: TwwDBLookupCombo;
      Bevel1: TBevel;
      Label3: TLabel;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDTIPOCONTRQUIT: TFloatField;
      qryTIPOCONTREMPTMO: TStringField;
      qryTIPOCONTRQUIT: TStringField;
    qryFLGOBRIGATORIO: TFloatField;
    dbckObrigatorio: TDBCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoContrCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoContrQuitCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroInsert(Sender: TObject);


   private  // Private declarations

      procedure Sel(ID: Integer);
      function  VerificaPreenchimento: Boolean;


   public   // Public declarations


   end;



var
  frmCadTipoContrXTipoContr: TfrmCadTipoContrXTipoContr;



implementation
{$R *.DFM}
uses
   uMensErro, uSistema, uModulo, uFuncoesEmptmo, dLookEmptmo, uVerificaPreenchimento;



function  TfrmCadTipoContrXTipoContr.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if DBcboTipoContr.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato!', DBcboTipoContr);

      if DBcboTipoContrQuit.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato Quitável!', DBcboTipoContrQuit);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCadTipoContrXTipoContr.Sel(ID: Integer);
begin
   LimpaParametros(qry);
   qry.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := ID;
   qry.Open;
end;



procedure TfrmCadTipoContrXTipoContr.FormShow(Sender: TObject);
begin
   inherited;

   LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);
   dtmLookEmptmo.qryLookTipoContrato.ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
   dtmLookEmptmo.qryLookTipoContrato.Open;

   LimpaParametros(dtmLookEmptmo.qryLookTipoContr);
   dtmLookEmptmo.qryLookTipoContr.ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
   dtmLookEmptmo.qryLookTipoContr.Open;

   Sel(-1);
end;



procedure TfrmCadTipoContrXTipoContr.DBcboTipoContrCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if DBcboTipoContr.LookupValue <> '' then
   begin
      Sel(StrToInt(DBcboTipoContr.LookupValue));
      CmeCadastro.Operacao := opIdle;
   end
   else
   begin
      CmeCadastro.Operacao := opVazio;
   end;

   CmeCadastro.AtualizaBotoes(self);
end;



procedure TfrmCadTipoContrXTipoContr.DBcboTipoContrQuitCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if qry.State in [dsInsert, dsEdit] then
   begin
      if DBcboTipoContr.LookupValue <> '' then
      begin
         qryIDTIPOCONTREMPTMO.AsInteger   := StrToInt(DBcboTipoContr.LookupValue);
      end;

      if DBcboTipoContrQuit.LookupValue <> '' then
      begin
         qryIDTIPOCONTRQUIT.AsInteger     := StrToInt(DBcboTipoContrQuit.LookupValue);
      end;

      qryTIPOCONTRQUIT.AsString           := DBcboTipoContrQuit.Text;
   end;
end;



procedure TfrmCadTipoContrXTipoContr.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;

   if qry.State in [dsInsert, dsEdit] then
   begin
      if DBcboTipoContr.LookupValue <> '' then
      begin
         qryIDTIPOCONTREMPTMO.AsInteger   := StrToInt(DBcboTipoContr.LookupValue);
      end;

      if DBcboTipoContrQuit.LookupValue <> '' then
      begin
         qryIDTIPOCONTRQUIT.AsInteger     := StrToInt(DBcboTipoContrQuit.LookupValue);
      end;
   end;
end;



procedure TfrmCadTipoContrXTipoContr.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadTipoContrXTipoContr.CmeCadastroInsert(Sender: TObject);
begin
   //Pendência 26323 - 12/09/2007 - Alberto
   if Dock973.CanFocus then
      Dock973.SetFocus;

   inherited;

   if DBcboTipoContrQuit.CanFocus then
      DBcboTipoContrQuit.SetFocus;
end;



end.

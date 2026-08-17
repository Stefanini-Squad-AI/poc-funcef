{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadItemXProcesso;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroGridCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc,
   MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
   StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, wwdbedit, Wwdbspin, Mask, Wwdotdot, Wwdbcomb, wwdblook,
   mFornecedor, DBCtrls;

type
   TfrmCadItemXProcesso = class(TfrmCadastroGridCSImob)
      Label1: TLabel;
      DBcboItem: TwwDBLookupCombo;
      Label2: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      DBcboProcesso: TwwDBComboBox;
      Label3: TLabel;
      DBchkEnvio: TDBCheckBox;
      DBchkNegativo: TDBCheckBox;
    DBedtDescricao: TDBEdit;
      Label5: TLabel;
      qryLookItem: TwwQuery;
      qryLookItemITEDESCRICAO: TStringField;
      qryLookItemIDITEMEMPTMO: TFloatField;
      Label4: TLabel;
      qryDESCRICAO: TStringField;
      qryIDITEMEMPTMO: TFloatField;
      qryITEDESCRICAO: TStringField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryTCEDESCRICAO: TStringField;
      qryIDPROCESSO: TFloatField;
      qryDESC_PROCESSO: TStringField;
      qryFLGENVIO: TFloatField;
      qryFLGNEGATIVO: TFloatField;
      qryFLGTIPOITEM: TFloatField;
      qryIDREGRA: TFloatField;
    DBcboTipoItem: TwwDBComboBox;

      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure FormShow(Sender: TObject);
      procedure DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoContratoExit(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);


   private  // Private declarations

      procedure AbreQueries;
      function  VerificaPreenchimento: Boolean;


   public   // Public declarations

   end;



var
  frmCadItemXProcesso: TfrmCadItemXProcesso;



implementation
{$R *.DFM}



uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uFuncoesEmptmo, UVerificaPreenchimento,
   dEmptmo, DLookEmptmo;



procedure TfrmCadItemXProcesso.AbreQueries;
begin
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



function TfrmCadItemXProcesso.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if qryDESCRICAO.IsNull then
         raise EValidacao.CreateVal('É necessário indicar a Descrição!', DBedtDescricao);

      if DBcboTipoContrato.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato!', DBcboTipoContrato);

      if DBcboItem.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Item!', DBcboItem);

      if DBcboProcesso.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Processo ao qual o item está associado!', DBcboProcesso);
{
      if DBcboTipoItem.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar a Natureza do Item!', DBcboTipoItem);
}
   except
      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmCadItemXProcesso.CmeCadastroConfirma(Sender: TObject);
begin
   try

      try
         inherited;
      except
         Raise;
         Repaint;

         Exit;
      end;

   finally
      // fecha e abre a query para re-ordenar a exibição na grid
      qry.Close;
      qry.Open;
   end;
end;



procedure TfrmCadItemXProcesso.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadItemXProcesso.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;



procedure TfrmCadItemXProcesso.DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with qryLookItem do
   begin
      LimpaParametros(qryLookItem);

      if DBcboTipoContrato.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);
         Open;
         DBcboItem.Enabled := True;
      end
      else
      begin
         qryLookItem.Close;
         DBcboItem.LookupValue   := '';
         DBcboItem.Clear;
         DBcboItem.Enabled       := False;
      end;
   end;
end;



procedure TfrmCadItemXProcesso.DBcboTipoContratoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with qryLookItem do
   begin
      LimpaParametros(qryLookItem);

      if DBcboTipoContrato.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);
         Open;
         DBcboItem.Enabled := True;
      end
      else
      begin
         qryLookItem.Close;
         DBcboItem.LookupValue   := '';
         DBcboItem.Clear;
         DBcboItem.Enabled       := False;
      end;
   end;
end;



procedure TfrmCadItemXProcesso.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with qryLookItem do
   begin
      LimpaParametros(qryLookItem);

      if DBcboTipoContrato.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);
         Open;
         DBcboItem.Enabled := True;
      end
      else
      begin
         qryLookItem.Close;
         DBcboItem.LookupValue   := '';
         DBcboItem.Clear;
         DBcboItem.Enabled       := False;
      end;
   end;
end;



end.

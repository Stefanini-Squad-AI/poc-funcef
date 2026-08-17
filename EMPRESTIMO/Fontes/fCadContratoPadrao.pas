{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadContratoPadrao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
   MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
   StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   TabControlDetalhe, ExtCtrls, wwdblook, DBCtrls, wwdbdatetimepicker, Mask;

type
   TfrmCadastroContratoPadrao = class(TfrmCadMestreDetalheCS)
      Label1: TLabel;
      DBedtDescricao: TDBEdit;
      Label2: TLabel;
      edtDataInicio: TwwDBDateTimePicker;
      DBchkAssinatObrig: TDBCheckBox;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label4: TLabel;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOEMPTMO: TFloatField;
      qryTipoContratoDESCTIPOEMPTMO: TStringField;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qryIDCONTRATOPADRAO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryCTPDESCRICAO: TStringField;
      qryCTPOBRIGATORIO: TFloatField;
      qryCTPDATAINICIO: TDateTimeField;
      qryDet: TwwQuery;
      updDet: TUpdateSQL;
      qryDetIDCONTRATOPADRAO: TFloatField;
      qryDetIDTIPOCONTREMPTMO: TFloatField;
      qryDetTCEDESCRICAO: TStringField;

      procedure FormShow(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);

      
   private  // Private declarations

      procedure AbreQueries;
      procedure Sel(const IDContratoPadrao: Int64);

      function  VerificaPreenchimento: Boolean;
      function  VerificaPreenchimentoDetalhe: Boolean;


   public   // Public declarations

   end;



var
  frmCadastroContratoPadrao: TfrmCadastroContratoPadrao;



implementation
{$R *.DFM}
uses
   USistema,
   UMensErro,
   UDatabase,
   DBaseDados,
   UModulo,
   uFuncoesEmptmo,
   UVerificaPreenchimento;



procedure TfrmCadastroContratoPadrao.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   AbreQueries;
end;



procedure TfrmCadastroContratoPadrao.AbreQueries;
begin
   LimpaParametros(qryTipoContrato);
   qryTipoContrato.ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
   qryTipoContrato.Open;
end;



procedure TfrmCadastroContratoPadrao.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := VerificaPreenchimento;
   inherited;
end;



procedure TfrmCadastroContratoPadrao.CmeCadastroConfirma(Sender: TObject);
begin

   if (qry.State in dsEditModes) then AplicaAlteracoes([qry, qryDet]);

   inherited;
end;



procedure TfrmCadastroContratoPadrao.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Screen.Cursor  := crHourGlass;

      Sel(StrToInt(MontaSelect.ValoresChave[0]));

      Screen.Cursor  := crDefault;
   end;
end;



procedure TfrmCadastroContratoPadrao.CmeCadastroInsert(Sender: TObject);
begin
   Sel(-1);

   inherited;

   if (qry.State = dsInsert) then qryIDCONTRATOPADRAO.asInteger := LeUltRegistro(nil, 'CONTRATOPADRAO');

   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadastroContratoPadrao.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



function  TfrmCadastroContratoPadrao.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if qryCTPDESCRICAO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Descrição do Contrato Padrão!', DBedtDescricao);

      if edtDataInicio.Date = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Início!', edtDataInicio);

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



procedure TfrmCadastroContratoPadrao.Sel(const IDContratoPadrao: Int64);
begin
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOPADRAO').AsInteger  := IDContratoPadrao;
      Open;
   end;

   with qryDet do
   begin
      LimpaParametros(qryDet);
      ParamByName('PIDCONTRATOPADRAO').AsInteger  := IDContratoPadrao;
      Open;
   end;
end;



procedure TfrmCadastroContratoPadrao.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;

   //
end;



function TfrmCadastroContratoPadrao.VerificaPreenchimentoDetalhe: Boolean;
begin
	Result := False;

	try

      if DBcboTipoContrato.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato!', DBcboTipoContrato);

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



procedure TfrmCadastroContratoPadrao.CmeDetalheConfirma(Sender: TObject);
begin
   if qryDet.State = dsInsert       then qryDetIDCONTRATOPADRAO.AsInteger  := qryIDCONTRATOPADRAO.AsInteger;
   if qryDet.State in dsEditModes   then qryDetTCEDESCRICAO.AsString       := DBcboTipoContrato.Text;
   inherited;
end;



procedure TfrmCadastroContratoPadrao.CmeCadastroDelete(Sender: TObject);
begin
  qryDet.First;
  while not qryDet.Eof do qryDet.Delete;
  AplicaAlteracoes([qryDet]);

  inherited;
end;

end.

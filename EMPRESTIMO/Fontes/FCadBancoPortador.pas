{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : combo DBcboPortadorForma
Data      : 21/09/2007
Autor     : Alberto
Pendencia : 26190
Descrição : Alteração da query qryPortadorForma para
            dtmLookEmptmo.qryLookPortadorFormaP
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadBancoPortador;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroGridCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc,
   MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
   StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, wwdbedit, Wwdbspin, Mask, Wwdotdot, Wwdbcomb, wwdblook,
  mFornecedor;

type
   TfrmCadBancoPortador = class(TfrmCadastroGridCSImob)
      lblBanco: TLabel;
      lblPortadorForma: TLabel;
      DBcboBanco: TwwDBLookupCombo;
      DBcboPortadorForma: TwwDBLookupCombo;
      gboxArqElet: TGroupBox;
      Bevel1: TBevel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label1: TLabel;
      lblDiasArquivo: TLabel;
      dbspinCol: TwwDBSpinEdit;
      dbspinTam: TwwDBSpinEdit;
      dbePrefixo: TwwDBEdit;
      qryIDBANCOPORTFORMA: TFloatField;
      qryIDBANCO: TFloatField;
      qryCODPORTFORMA: TFloatField;
      qryDFLOATPAGTO: TFloatField;
      qryCOLVALOR: TFloatField;
      qryTAMVALOR: TFloatField;
      qryPREFIXOARQ: TStringField;
      qryNUMBANCO: TStringField;
      qryNOME: TStringField;
      qryDESCRICAO: TStringField;
      qryBanco: TwwQuery;
      qryPortadorForma: TwwQuery;
      qryBancoIDPESSOA: TFloatField;
      qryBancoNUMBANCO: TStringField;
      qryBancoNOME: TStringField;
      qryVerificaOcorrencia: TwwQuery;
      qryVerificaOcorrenciaIDBANCOPORTFORMA: TFloatField;
      qryVerificaOcorrenciaIDBANCO: TFloatField;
      qryVerificaOcorrenciaCODPORTFORMA: TFloatField;
      qryVerificaFloat: TwwQuery;
      qryVerificaFloatDFLOATPAGTO: TFloatField;
      qryIDMODULO: TFloatField;
    molFornecedor: TmolFornecedor;
    qryIDFAVORECIDO: TFloatField;
    qryFornecedor: TwwQuery;
    qryFornecedorNOME: TStringField;
    Panel1: TPanel;
    Label3: TLabel;
    DBspnFloat: TwwDBSpinEdit;

      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure qryAfterScroll(DataSet: TDataSet);
      procedure FormShow(Sender: TObject);
    procedure DBcboBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure molFornecedorbtnBuscaFornClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);


   private  // Private declarations

      iIndiceAnterior: int64;

      procedure AbreQueries;

      function  VerificaPreenchimento: Boolean;
      function  VerificaOcorrencia: Boolean;
      function  VerificaFloat: Boolean;

   public   // Public declarations

   end;



var
  frmCadBancoPortador: TfrmCadBancoPortador;



implementation
{$R *.DFM}



uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uFuncoesEmptmo, UVerificaPreenchimento,
   dEmptmo, DLookEmptmo;



procedure TfrmCadBancoPortador.AbreQueries;
begin
   //Pendência 26190 - 21/09/2007 - Alberto
   LimpaParametros(dtmLookEmptmo.qryLookBanco);
   dtmLookEmptmo.qryLookBanco.Open;

   with dtmLookEmptmo.qryLookPortadorFormaP do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
   //Fim Pendência 26190
end;



function TfrmCadBancoPortador.VerificaPreenchimento: boolean;
begin
	Result := False;
	try
      if DBcboBanco.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Banco!', DBcboBanco);

      if DBcboPortadorForma.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Conta de Caixa X Forma de Pagamento!', DBcboPortadorForma);

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



// funcão para verificação de duplicidade da descrição digitada
function TfrmCadBancoPortador.VerificaOcorrencia: boolean;
begin
	with qryVerificaOcorrencia do
   begin
      LimpaParametros(qryVerificaOcorrencia);
      ParamByName('PIDBANCO').AsInteger      := StrToInt(DBcboBanco.LookupValue);
      ParamByName('PCODPORTFORMA').AsInteger := StrToInt(DBcboPortadorForma.LookupValue);

    	Open;
	end;

   Result := True;

   try
      // verifica a ocorrência na query e se não é o próprio
      if not(qryVerificaOcorrencia.IsEmpty) then
      begin
		   if qryVerificaOcorrenciaIDBANCOPORTFORMA.AsInteger <> iIndiceAnterior then
         begin
	         Result := False;
    	      raise EValidacao.CreateVal('O Banco indicado já foi associado à Conta de Caixa X Forma de Pagamento indicada!', DBcboBanco);
         end;
      end;
   except
      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
      end;
   end;  // try..except
end;



// funcão para verificação float diferente para o mesmo PortadorForma
function TfrmCadBancoPortador.VerificaFloat: Boolean;
begin
	with qryVerificaFloat do
   begin
      LimpaParametros(qryVerificaFloat);
      ParamByName('PCODPORTFORMA').AsInteger := StrToInt(DBcboPortadorForma.LookupValue);

    	Open;
	end;

   Result := True;

   try
      // verifica a ocorrência na query e se não é o próprio
      if not(qryVerificaFloat.IsEmpty) then
      begin
         qryVerificaFloat.First;
         while not(qryVerificaFloat.EOF) do
         begin
            if qryVerificaFloatDFLOATPAGTO.AsInteger <> Trunc(DBspnFloat.Value) then
            begin
               Result := False;
               raise EValidacao.CreateVal('A Conta de Caixa X Forma de Pagamento indicada já foi cadastrada ' +
                                          'com um Nº de Dias de Antecipação diferente do indicado!', DBspnFloat);
            end;
            qryVerificaFloat.Next;
         end;
      end;
   except
      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
      end;
   end;  // try..except
end;



procedure TfrmCadBancoPortador.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   if DBcboBanco.CanFocus then DBcboBanco.SetFocus;
end;



procedure TfrmCadBancoPortador.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if DBcboBanco.CanFocus then DBcboBanco.SetFocus;
end;



procedure TfrmCadBancoPortador.CmeCadastroConfirma(Sender: TObject);
var
   sMsg		: String;
   bInsert	: Boolean;
begin
   try

      try
         bInsert := False;

         if CmeCadastro.Operacao = opInserir then
         begin
            qryIDBANCOPORTFORMA.AsInteger := LeUltRegistro(nil, 'BANCOPORTFORMA');
            qryIDMODULO.AsInteger         := 15;
            bInsert                       := True;
         end;

         inherited;

      except
         Raise;
         Repaint;

         Exit;
      end;

   finally
      (* fecha e abre a query para re-ordenar a exibição no grid *)
      qry.Close;
      qry.Open;
   end;
end;



procedure TfrmCadBancoPortador.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ( VerificaPreenchimento and VerificaOcorrencia and VerificaFloat );
end;



procedure TfrmCadBancoPortador.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;
	iIndiceAnterior := qryIDBANCOPORTFORMA.asInteger;
end;



procedure TfrmCadBancoPortador.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;



procedure TfrmCadBancoPortador.DBcboBancoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   molFornecedor.edtRazaoSocial.Text := qryBancoNOME.AsString;
   qryIDFAVORECIDO.AsInteger := qryIDBANCO.AsInteger;
end;



procedure TfrmCadBancoPortador.molFornecedorbtnBuscaFornClick(Sender: TObject);
begin
   inherited;
   molFornecedor.btnBuscaFornClick(Sender);
   if qry.State in dsEditModes then qryIDFAVORECIDO.AsInteger := molFornecedor.iFornecedor;
end;



procedure TfrmCadBancoPortador.dsStateChange(Sender: TObject);
begin
   inherited;
   molFornecedor.btnBuscaForn.Enabled := qry.State in dsEditModes;
   molFornecedor.btnLimpaForn.Enabled := molFornecedor.btnBuscaForn.Enabled;
end;



procedure TfrmCadBancoPortador.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   molFornecedor.btnLimpaForn.Click;
end;



procedure TfrmCadBancoPortador.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   LimpaParametros(qryFornecedor);
   qryFornecedor.ParamByName('PIDPESSOA').AsInteger := qryIDFAVORECIDO.AsInteger;
   qryFornecedor.Open;
   molFornecedor.edtRazaoSocial.Text := qryFornecedorNOME.AsString;
end;



end.

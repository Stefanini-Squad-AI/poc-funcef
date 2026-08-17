unit FCadTipoCustoRec;

//	------------------------------------------------------------------------------------------------
//
//	Cadastro de Tipos de Receitas e Despesas
//
//	Autor          :	André Pontes
//	Data de Início	:	21/01/1999
//	Data de Término:	21/01/1999
//
//	Modificações	:	01/02/1999  1) Abrir e fechar a query incluído no CmeCadastro.Confirma(Self) (para re-ordenar
//								      	   a grid)
//    									2) Padronização do tamanho dos frmCadastroGridCS (413 x 296 pixels)
//		      							3) Verificação de descrições duplicadas no CmeCadastro.Confirma(Self)
//				      					4) Conserto da verificação acima para levar em conta alteração do
//						      			   registro corrente (verificado através do OnDataChange)
//                               5) MontaSelect.RetornouValor
//                   17/02/1999  6) TipoDocRecPag
//                   04/06/1999  7) if CmeCadastro.Operacao = opInserir
//                   10/06/1999  8) pnlControles.SendToBack no FormShow
//                   20/07/1999  9) Novo FiltraTipoDoc, com duplo filtro no TipoDocRecPag
//                   20/07/1999 10) Conserto do FiltraTipoDoc (R/C e P/D)
//                   29/01/2000 11) Nova FiltraTipoDoc (em função dos Descontos e Deduções)
//                   07/02/2000 12) Tipo de Documento passa a ser obrigatório
//                   08/06/2000 13) Form redimensionado em função das colunas da grid
//                   14/11/2000 14) Retirada do pnlControles.SendToBack no FormShow (passou para
//                                  o ancestral
//           Alex    04/01/2001 15) Inserido o FLGOBRIGAORC
//           Alex    15/03/2001 16) Inserida a Receita Reembolso
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, ExtCtrls, DBCtrls, wwdblook, Db, MontaSelect,
  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls2, IvDictio, IvMulti, IvEMulti,
  FCadastroGridCSImob, CmEventosCadastro, ImgList, CMwwQuery;

type
  TfrmCadTipoCustoRec = class(TfrmCadastroGridCSImob)
    qryIDTIPOCUSTORECIMO: TFloatField;
    qryDESCCUSTORECIMO: TStringField;
    qryRECCUSTO: TStringField;
    qryVerificaOcorrencia: TwwQuery;
    qryCODTIPDOC: TFloatField;
    qryLookTipoDoc: TwwQuery;
    qryLookTipoDocCODTIPDOC: TFloatField;
    qryLookTipoDocRECPAG: TStringField;
    qryLookTipoDocDESCRICAO: TStringField;
    qryLookTipoDocDEBCRE: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBrdgCustoRec: TDBRadioGroup;
    DBedtDescricao: TDBEdit2;
    DBcboTipoDoc: TwwDBLookupCombo;
    qryVerificaOcorrenciaIDTIPOCUSTORECIMO: TFloatField;
    qryVerificaOcorrenciaDESCCUSTORECIMO: TStringField;
    qryDESCRICAO: TStringField;
    qryTIPO: TStringField;
    qryFLGOBRIGAORC: TFloatField;
    Label3: TLabel;
    DBCboReceitaReembolso: TwwDBLookupCombo;
    qryIDRECEITAREEMB: TFloatField;
    DBRadioGroup1: TDBRadioGroup;
    qryIDMODULO: TFloatField;
    GroupBox1: TGroupBox;
    DBchkObrigaOrc: TDBCheckBox;
    qryFLGCAF: TFloatField;
    qryFLGCAPCAR: TFloatField;
    qryFLGCONTAB: TFloatField;
    panCAF: TPanel;
    Label13: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label8: TLabel;
    qryIDTIPODESPESA: TFloatField;
    qryLookTipoDespesaAV: TwwQuery;
    qryLookTipoDespesaAVIDTIPODESPESA: TFloatField;
    qryLookTipoDespesaAVDESTIPODESPESA: TStringField;

   // procedimentos definidos
   procedure CmeCadastroEdit(Sender: TObject);
   procedure CmeCadastroInsert(Sender: TObject);
   procedure CmeCadastroConfirma(Sender: TObject);

	procedure FazerRefresh; override;

   procedure FiltraTipoDoc;

	function VerificaPreenchimento: boolean;
   function VerificaOcorrencia: boolean;

	// outros procedimentos
   procedure bbtnConfirmarClick(Sender: TObject);
   procedure qryCalcFields(DataSet: TDataSet);
   procedure dsDataChange(Sender: TObject; Field: TField);
   procedure DBrdgCustoRecChange(Sender: TObject);
   procedure FormCreate(Sender: TObject);
   procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }
	iIndiceAnterior: integer;

  public { Public declarations }

  end;



var
  frmCadTipoCustoRec: TfrmCadTipoCustoRec;


implementation
{$R *.DFM}
uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, UVerificaPreenchimento,
  FCadastroCS, uFuncoesImob, dLookImobiliario;



procedure TfrmCadTipoCustoRec.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   FiltraTipoDoc;

   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadTipoCustoRec.CmeCadastroInsert(Sender: TObject);
begin
	inherited;

	// defaults
   qryRECCUSTO.asString := 'C';

   FiltraTipoDoc;
   DBcboTipoDoc.Clear;

   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadTipoCustoRec.CmeCadastroConfirma(Sender: TObject);
begin
   // grava o sequence
   if qry.State = dsInsert then qryIDTIPOCUSTORECIMO.asInteger := LeUltRegistro(nil, 'TIPOCUSTORECIMOV');

   // grava o Módulo, flgCAF, flgContab, flgCAPCAR
   if qry.State in dsEditModes then qryIDMODULO.asInteger   := Sistema.idModulo;

   if Sistema.IdModulo = 64 then begin            // ADMINIMOB
      if qry.State in dsEditModes then qryFLGCAF.asInteger     := 0;
      if qry.State in dsEditModes then qryFLGCONTAB.asInteger  := 1;
      if qry.State in dsEditModes then qryFLGCAPCAR.asInteger  := 1;
   end else if Sistema.IdModulo = 54 then begin   // INVESTIMOB
      if qry.State in dsEditModes then qryFLGCAF.asInteger     := 1;
      if qry.State in dsEditModes then qryFLGCONTAB.asInteger  := 0;
      if qry.State in dsEditModes then qryFLGCAPCAR.asInteger  := 1;
   end;

   inherited;

	// fecha e abre a query para re-ordenar a exibição na grid
   qry.Close;
   qry.Open;
end;


procedure TfrmCadTipoCustoRec.FazerRefresh;
begin
   inherited;
   FiltraTipoDoc;
end;



procedure TfrmCadTipoCustoRec.FiltraTipoDoc;
var
  sCustoRec, sRecPag, sDebCre : string;
begin
   if not(qryRECCUSTO.isNULL) then begin

      sCustoRec := qryRECCUSTO.asString;

      case sCustoRec[1] of
         'C': // custo - aumenta CAP
         begin
            sRecPag := 'P';
            sDebcre := 'C';
         end;
         'D': // desconto - diminui CAR
         begin
            sRecPag := 'R';
            sDebcre := 'C';
         end;
         'R': // receita - aumenta CAR
         begin
            sRecPag := 'R';
            sDebcre := 'D';
         end;
         'U': // dedução - diminui CAP
         begin
            sRecPag := 'P';
            sDebcre := 'D';
         end;
      end;

      with qryLookTipoDoc do begin
         LimpaParametros(qryLookTipoDoc);
         ParamByName('RECPAG').asString := sRecPag;
         ParamByName('DEBCRE').asString := sDebCre;
         Open;
      end;

   end else begin
      qryLookTipoDoc.Close;
   end;
end;



function TfrmCadTipoCustoRec.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if length(trim(DBedtDescricao.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Receita ou Despesa!', DBedtDescricao);

      if qryRECCUSTO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar Despesa/Receita/Dedução/Desconto!', DBrdgCustoRec);

      if ( (length(trim(DBcboTipoDoc.Text)) = 0) or (DBcboTipoDoc.LookupValue = '') or (qryCODTIPDOC.isNULL) ) then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Documento!', DBcboTipoDoc);

      if (qryRECCUSTO.AsString = 'R') and (not qryIDRECEITAREEMB.IsNull) then
         raise EValidacao.CreateVal('Somente para despesas deve ser informada a receita de reembolso!', DBCboReceitaReembolso);

      if (qryRECCUSTO.AsString = 'R') and (not qryIDTIPODESPESA.IsNull) then
         raise EValidacao.CreateVal('Somente para despesas deve ser informada o tipo de despesa do CAF!', wwDBLookupCombo1);

      if qryFLGOBRIGAORC.IsNull then qryFLGOBRIGAORC.AsInteger := 0;

	except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



// funcão para verificação de duplicidade da descrição digitada
function TfrmCadTipoCustoRec.VerificaOcorrencia: boolean;
begin
   with qryVerificaOcorrencia do begin
      LimpaParametros(qryVerificaOcorrencia);
      Params[0].AsString   := DBedtDescricao.Text;
      Params[1].AsInteger  := Sistema.idModulo;
    	Open;
	end;

   Result := True;

   try

	   // verifica a ocorrência na query e se não é o próprio
      if not(qryVerificaOcorrencia.IsEmpty) then begin
		   if qryVerificaOcorrenciaIDTIPOCUSTORECIMO.asInteger <> iIndiceAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Esse Tipo de Receita ou Despesa já foi cadastrado!', DBedtDescricao);
         end;
      end;

   except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
      end;

   end;
end;



procedure TfrmCadTipoCustoRec.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin

      if VerificaOcorrencia then begin

         inherited;
         DBedtDescricao.SetFocus;

      end;
   end;
end;



procedure TfrmCadTipoCustoRec.qryCalcFields(DataSet: TDataSet);
var
   sRecCusto: string;
begin
	inherited;

   sRecCusto := qryRECCUSTO.asString;
   case sRecCusto[1] of
      'C': qryTIPO.asString := 'Despesa';
      'D': qryTIPO.asString := 'Desconto';
      'R': qryTIPO.asString := 'Receita';
      'U': qryTIPO.asString := 'Dedução';
   end;
end;



procedure TfrmCadTipoCustoRec.dsDataChange(Sender: TObject; Field: TField);
begin
	inherited;
	iIndiceAnterior := qryIDTIPOCUSTORECIMO.asInteger;
end;



procedure TfrmCadTipoCustoRec.DBrdgCustoRecChange(Sender: TObject);
begin
   inherited;
   FiltraTipoDoc;
end;




procedure TfrmCadTipoCustoRec.FormCreate(Sender: TObject);
begin
   inherited;

   panCAF.Visible := Sistema.IdModulo = 54;

   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PIDMODULO').AsInteger  := Sistema.idModulo;
      ParamByName('PRECCUSTO').AsString   := 'R';
      Open;
   end;

   qryLookTipoDespesaAV.Open;

   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDMODULO').AsInteger  := Sistema.idModulo;
      Open;
   end;
end;



procedure TfrmCadTipoCustoRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   qryLookTipoDespesaAV.Close;
end;



end.

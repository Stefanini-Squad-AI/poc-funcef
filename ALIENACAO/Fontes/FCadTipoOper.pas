unit FCadTipoOper;

//	-------------------------------------------------------------------------------------------------
//
//	   Cadastro de Operaçoes de Investimento
//
//	Autor             :  André Pontes
//	Data de Início    :  03/06/1999
//	Data de Término   :  03/06/1999
//
//	Modificações :  23/06/1999  1) Tipo de Documento
//                      02/07/1999  2) CriaForCli, TipoCliente, TipoDocRecPag
//                      20/07/1999  3) Novo FiltraRecPag, com duplo filtro no TipoDocCrecPag
//                      23/08/1999  4) Novos tipos de atualização (M e I)
//                      06/11/1999  5) Novos tipos de atualização (G e P)
//                      14/11/2000  6) Retirada do pnlControles.SendToBack no FormShow (passou para
//                                     o ancestral
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, ExtCtrls, DBCtrls, IvDictio,
  IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook,  CmEventosCadastro, ImgList,
  FCadastroGridCS;

type
  TfrmCadTipoOperacao = class(TFrmCadastroGridCS)
    rdgAtualizaCarteira: TDBRadioGroup;
    dbedDescricao: TwwDBEdit;
    Label2: TLabel;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDESCTIPOOPERACAO: TStringField;
    qryNATUREZAOPERACAO: TStringField;
    qryVerificaOcorrencia: TwwQuery;
    qryFLGGERACONTAB: TFloatField;
    qryFLGGERACAPCAR: TFloatField;
    qryRECPAG: TStringField;
    qryCODTIPDOC: TFloatField;
    qryLookTipoCliente: TwwQuery;
    qryLookTipoClienteDESCRICAO: TStringField;
    qryLookTipoClienteIDTIPOCLIENTE: TFloatField;
    qryLookForCli: TwwQuery;
    qryLookForCliIDPESSOA: TFloatField;
    qryLookForCliNOME: TStringField;
    updForCliXTipOper: TUpdateSQL;
    qryForCliXTipOper: TwwQuery;
    qryForCliXTipOperIDTIPOINVEST: TFloatField;
    qryForCliXTipOperIDTIPOOPERACAO: TFloatField;
    qryForCliXTipOperEMPRESAPROP: TFloatField;
    qryForCliXTipOperIDFORCLI: TFloatField;
    DBchkGeraContab: TDBCheckBox;
    DBchkGeraCAPCAR: TDBCheckBox;
    pnlCAPCAR: TPanel;
    lblTipoCliente: TLabel;
    DBcboTipoCliente: TwwDBLookupCombo;
    Label4: TLabel;
    DBcboTipoDoc: TwwDBLookupCombo;
    DBcboForCli: TwwDBLookupCombo;
    lblForCli: TLabel;
    qryForCliXTipOperIDTIPOCLIENTE: TFloatField;
    qryTIPCREDOR: TStringField;
    DBrdgCustoRec: TDBRadioGroup;
    qryLookTipoDoc: TwwQuery;
    qryLookTipoDocDESCRICAO: TStringField;
    qryLookTipoDocCODTIPDOC: TFloatField;
    qryLookTipoDocRECPAG: TStringField;
    qryLookTipoDocDEBCRE: TStringField;
    DBchkGeraCAF: TDBCheckBox;
    qryFLGGERACAF: TFloatField;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image4: TImage;

    // procedimentos definidos
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    procedure FiltraRecPag;

    function VerificaPreenchimento: boolean;
    function VerificaOcorrencia: boolean;

    // outros procedimentos
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBrdgCustoRecClick(Sender: TObject);
    procedure qryBeforeEdit(DataSet: TDataSet);


  private { Private declarations }
	iIndiceAnterior: integer;

  public { Public declarations }

  end;



var
  frmCadTipoOperacao: TfrmCadTipoOperacao;



implementation
{$R *.DFM}
Uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, UVerificaPreenchimento, uDocumento,
   uIntegraBack, FCadastroCS ;



procedure TfrmCadTipoOperacao.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

	// seta os defaults
   qryRECPAG.asString           := 'P';
   qryNATUREZAOPERACAO.asString := 'A';
   qryFLGGERACONTAB.asInteger   := 1;
   qryFLGGERACAPCAR.asInteger   := 0;
   qryFLGGERACAF.asInteger      := 0;

   DBcboForCli.Clear;
   DBcboTipoCliente.Clear;

   FiltraRecPag;
   DBcboTipoDoc.Clear;

   dbedDescricao.SetFocus;
end;

procedure TfrmCadTipoOperacao.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   with qryForCliXTipOper do begin
      LimpaParametros(qryForCliXTipOper);
      Close;
      ParamByName('INVEST').asInteger      := qry.FieldByName('IDTIPOINVEST').asInteger;
      ParamByName('OPERACAO').asInteger    := qry.FieldByName('IDTIPOOPERACAO').asInteger;
      ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;

      Open;
   end;

   if not(qryForCliXTipOper.isEmpty) then begin
      DBcboForCli.LookupValue := IntToStr(qryForCliXTipOper.FieldByName('IDFORCLI').asInteger);
      if not(qryForCliXTipOper.FieldByName('IDTIPOCLIENTE').isNULL) then begin
         DBcboTipoCliente.LookupValue := IntToStr(qryForCliXTipOper.FieldByName('IDTIPOCLIENTE').asInteger);
      end else begin
         DBcboTipoCliente.Clear;
      end;
   end else begin
      DBcboForCli.Clear;
      DBcboTipoCliente.Clear;
   end;

   dbedDescricao.SetFocus;
end;



procedure TfrmCadTipoOperacao.CmeCadastroConfirma(Sender: TObject);
var
  iForCli, iTipoCliente : integer;
begin
   if CmeCadastro.Operacao = opInserir then begin
      qryIDTIPOINVEST.asInteger    := 3;
      qryIDTIPOOPERACAO.asInteger  := LeUltRegistro(nil, 'TIPOOPERACAO');

      qryTIPCREDOR.asString := '';
   end;

   iForCli := -1;
   if DBcboForCli.LookupValue <> '' then iForCli := StrToInt(DBcboForCli.LookupValue);

	inherited;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then begin

      with qryForCliXTipOper do begin
         LimpaParametros(qryForCliXTipOper);
         ParamByName('INVEST').asInteger        := qryIDTIPOINVEST.asInteger;
         ParamByName('OPERACAO').asInteger      := qryIDTIPOOPERACAO.asInteger;
         ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
         Open;
      end;

      if iForCli > 0 then begin

         if qryForCliXTipOper.isEmpty then begin
            qryForCliXTipOper.Insert;
         end else begin
            qryForCliXTipOper.First;
            qryForCliXTipOper.Edit;
         end;

         qryForCliXTipOperEMPRESAPROP.asInteger    := Sistema.idEmpresa;
         qryForCliXTipOperIDTIPOINVEST.asInteger   := qryIDTIPOINVEST.asInteger;
         qryForCliXTipOperIDTIPOOPERACAO.asInteger := qryIDTIPOOPERACAO.asInteger;
         qryForCliXTipOperIDFORCLI.asInteger       := iForCli;

         iTipoCliente := StrToInt(DBcboTipoCliente.LookupValue);

         Documento.ForCli.Inserir(iForCli, Sistema.idEmpresa, -1, IntegraBack.Plano, 0, Sistema.idEmpresa, '', '', '', '', 'F', False);
         Documento.ForCli.Inserir(iForCli, Sistema.idEmpresa, -1, IntegraBack.Plano, iTipoCliente, Sistema.idEmpresa, '', '', '', '', 'C', False);

      end else begin

         if not(qryForCliXTipOper.isEmpty) then qryForCliXTipOper.Delete;

      end;

      AplicaAlteracoes([qryForCliXTipOper]);
   end;

   // fecha e abre a query para re-ordenar a exibição no grid
   qry.Close;
   qry.Open;
end;



procedure TfrmCadTipoOperacao.FiltraRecPag;
var
  sRecPag, sDebCre : string;
begin
   DBchkGeraCAPCAR.Enabled := not(qryRECPAG.isNULL);

   if not(qryRECPAG.isNULL) then begin

      sRecPag := qryRECPAG.asString;

      case sRecPag[1] of
         'P': sDebcre := 'C';
         'R': sDebcre := 'D';
      end;

      with qryLookTipoDoc do begin
         LimpaParametros(qryLookTipoDoc);
         Params[0].asString := sRecPag;
         Params[1].asString := sDebCre;
         Open;
      end;

   end;
end;



function TfrmCadTipoOperacao.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      if length(dbedDescricao.Text) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação!', dbedDescricao);

      if qry.FieldByName('FLGGERACAPCAR').asFloat = 1 then
         if qry.FieldByName('RECPAG').isNULL then
            raise EValidacao.CreateVal('É necessário definir se a Operação será a Pagar ou a Receber!', DBrdgCustoRec);

      if qry.FieldByName('NATUREZAOPERACAO').isNULL then
         raise EValidacao.CreateVal('É necessário indicar a forma de Atualização dos Saldos da Carteira de Investimento!', rdgAtualizaCarteira);

      if DBcboForCli.LookupValue <> '' then
         if DBcboTipoCliente.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar o Tipo do Cliente!', DBcboTipoCliente);

      if qry.FieldByName('FLGGERACAPCAR').asFloat = 1 then
         if DBcboTipoDoc.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Documento!', DBcboTipoDoc);

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
function TfrmCadTipoOperacao.VerificaOcorrencia: boolean;
begin
	with qryVerificaOcorrencia do begin
      LimpaParametros(qryVerificaOcorrencia);
      Params[0].asString := LowerCase(dbedDescricao.Text);
    	Open;
	end;

   Result := True;

   try

      // verifica a ocorrência na query e se não é o próprio
      if not(qryVerificaOcorrencia.IsEmpty) then begin
		   if qryVerificaOcorrencia.FieldByName('IDTIPOOPERACAO').asInteger <> iIndiceAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Esse Tipo de Operação já foi cadastrado!', dbedDescricao);
         end;
      end;

   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
      end;

   end;
end;



procedure TfrmCadTipoOperacao.dsDataChange(Sender: TObject; Field: TField);
begin
   inherited;
	iIndiceAnterior := qry.FieldByName('IDTIPOOPERACAO').asInteger;
end;



procedure TfrmCadTipoOperacao.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      if VerificaOcorrencia then begin
			inherited;
      end;
   end;
end;



procedure TfrmCadTipoOperacao.FormShow(Sender: TObject);
begin
   inherited;
   dbGrd.BringToFront;
   qryLookTipoCliente.Open;
   qryLookForCli.Open;
end;

procedure TfrmCadTipoOperacao.DBrdgCustoRecClick(Sender: TObject);
begin
   inherited;
   if CmeCadastro.Operacao in [opInserir, opAlterar] then begin
      if DBrdgCustoRec.ItemIndex = 0 then begin
         qry.FieldByName('RECPAG').asString := 'P';
      end else begin
         qry.FieldByName('RECPAG').asString := 'R';
      end;
   end;
   FiltraRecPag;
end;



procedure TfrmCadTipoOperacao.qryBeforeEdit(DataSet: TDataSet);
begin
   inherited;
   FiltraRecPag;
end;

end.

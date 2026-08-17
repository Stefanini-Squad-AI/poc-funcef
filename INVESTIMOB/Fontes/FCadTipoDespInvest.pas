unit FCadTipoDespInvest;

//	-------------------------------------------------------------------------------------------------
//
//	   Cadastro de Despesas de Investimento
//
//	Autor             :	André Pontes
//	Data de Início    :  03/06/1999
//	Data de Término   :  03/06/1999
//
//	Modificações      :  10/06/1999  1) Tela passa a ser somente de cadastro de despesas
//                      23/06/1999  2) Tipo de Documento
//                      01/07/1999  3) NaturezaOperacao, CriaForCli, retirada de TipoDocRecPag
//                      23/08/1999  4) Novos tipos de atualização (M e I)
//                      14/11/2000  5) Retirada do pnlControles.SendToBack no FormShow (passou para
//                                     o ancestral
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBCtrls, FCadastroGridCSImob, CmEventosCadastro, ImgList;

type
  TfrmCadTipoDespInvest = class(TfrmCadastroGridCSImob)
    lbl: TLabel;
    LblIdRegra: TLabel;
    dbedDescricao: TwwDBEdit;
    lblForCli: TLabel;
    qryLookMoeda: TwwQuery;
    qryLookMoedaMOESIGLA: TStringField;
    qryLookMoedaMOEDESC: TStringField;
    qryLookMoedaMOECODIGO: TFloatField;
    qryVerificaOcorrencia: TwwQuery;
    DBcboMoeda: TwwDBLookupCombo;
    DBcboForCli: TwwDBLookupCombo;
    qryDespXForCli: TwwQuery;
    qryDespXForCliIDTIPODESPINVEST: TFloatField;
    qryDespXForCliEMPRESAPROP: TFloatField;
    qryDespXForCliIDFORCLI: TFloatField;
    updDespXForCli: TUpdateSQL;
    rdgAtualizaCarteira: TDBRadioGroup;
    qryLookForCli: TwwQuery;
    qryLookForCliIDPESSOA: TFloatField;
    qryLookForCliNOME: TStringField;
    qryIDTIPODESPINVEST: TFloatField;
    qryDESCTIPODESPINV: TStringField;
    qryMOECODIGO: TFloatField;
    qryNATUREZAOPERACAO: TStringField;
    qryTIPCREDOR: TStringField;
    qryMOESIGLA: TStringField;
    Label1: TLabel;
    DBcboTipoCliente: TwwDBLookupCombo;
    qryLookTipoCliente: TwwQuery;
    qryLookTipoClienteDESCRICAO: TStringField;
    qryLookTipoClienteIDTIPOCLIENTE: TFloatField;
    qryDespXForCliIDTIPOCLIENTE: TFloatField;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Image4: TImage;
    Image1: TImage;

    // procedimentos definidos
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    function VerificaPreenchimento: boolean;
    function VerificaOcorrencia: boolean;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);


  private { Private declarations }
	iIndiceAnterior: integer;

  public { Public declarations }

  end;



var
  frmCadTipoDespInvest: TfrmCadTipoDespInvest;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, uComunsImobiliario, uVerificaPreenchimento, uDocumento,
  uIntegraBack, FCadastroCS, uFuncoesImob;



procedure TfrmCadTipoDespInvest.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   DBcboForCli.Clear;
   DBcboTipoCliente.Clear;

   dbedDescricao.SetFocus;
end;



procedure TfrmCadTipoDespInvest.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   with qryDespXForCli do begin
      LimpaParametros(qryDespXForCli);
      ParamByName('DESPESA').asInteger       := qry.FieldByName('IDTIPODESPINVEST').asInteger;
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      Open;
   end;

   if not(qryDespXForCli.isEmpty) then begin
      DBcboForCli.LookupValue := IntToStr(qryDespXForCli.FieldByName('IDFORCLI').asInteger);
      if not(qryDespXForCli.FieldByName('IDTIPOCLIENTE').isNULL) then begin
         DBcboTipoCliente.LookupValue := IntToStr(qryDespXForCli.FieldByName('IDTIPOCLIENTE').asInteger);
      end else begin
         DBcboTipoCliente.Clear;
      end;
   end else begin
      DBcboForCli.Clear;
      DBcboTipoCliente.Clear;
   end;

   dbedDescricao.SetFocus;
end;



procedure TfrmCadTipoDespInvest.CmeCadastroConfirma(Sender: TObject);
var
  iForCli, iTipoCliente : integer;
begin
   if CmeCadastro.Operacao = opInserir then qry.FieldByName('IDTIPODESPINVEST').asInteger := LeUltRegistro(nil, 'TIPODESPINVEST');
   if CmeCadastro.Operacao in [opInserir, opAlterar] then qry.FieldByName('TIPCREDOR').asString := '';

   iForCli := -1;
   if DBcboForCli.LookupValue <> '' then iForCli := StrToInt(DBcboForCli.LookupValue);

	inherited;

   with qryDespXForCli do begin
      Close;
      ParamByName('DESPESA').asInteger       := qry.FieldByName('IDTIPODESPINVEST').asInteger;
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      Open;
   end;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then begin

      if iForCli > 0 then begin

         if qryDespXForCli.isEmpty then begin
            qryDespXForCli.Insert;
         end else begin
            qryDespXForCli.First;
            qryDespXForCli.Edit;
         end;

         qryDespXForCli.FieldByName('EMPRESAPROP').asInteger      := Sistema.idEmpresa;
         qryDespXForCli.FieldByName('IDTIPODESPINVEST').asInteger := qry.FieldByName('IDTIPODESPINVEST').asInteger;
         qryDespXForCli.FieldByName('IDFORCLI').asInteger         := iForCli;

         iTipoCliente := -1;
         if DBcboTipoCliente.LookupValue <> '' then iTipoCliente := StrToInt(DBcboTipoCliente.LookupValue);

         Documento.ForCli.Inserir(iForCli, Sistema.idEmpresa, -1, IntegraBack.Plano, 0, Sistema.idEmpresa, '', '', '', '', 'F', False);
         Documento.ForCli.Inserir(iForCli, Sistema.idEmpresa, -1, IntegraBack.Plano, iTipoCliente, Sistema.idEmpresa, '', '', '', '', 'C', False);

      end else begin

         if not(qryDespXForCli.isEmpty) then qryDespXForCli.Delete;

      end;

      AplicaAlteracoes([qryDespXForCli]);
   end;

   // fecha e abre a query para re-ordenar a exibição no grid
   qry.Close;
   qry.Open;
end;



function TfrmCadTipoDespInvest.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      if length(dbedDescricao.Text) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Despesa!', dbedDescricao);

      if qry.FieldByName('NATUREZAOPERACAO').isNULL then
         raise EValidacao.CreateVal('É necessário indicar a forma de Atualização dos Saldos da Carteira de Investimento!', rdgAtualizaCarteira);

      if DBcboForCli.LookupValue <> '' then
         if DBcboTipoCliente.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar o Tipo do Cliente!', DBcboTipoCliente);

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
function TfrmCadTipoDespInvest.VerificaOcorrencia: boolean;
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
		   if qryVerificaOcorrencia.FieldByName('IDTIPODESPINVEST').asInteger <> iIndiceAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Essa Despesa já foi cadastrada!', dbedDescricao);
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



procedure TfrmCadTipoDespInvest.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      if VerificaOcorrencia then begin
			inherited;
      end;
   end;
end;



procedure TfrmCadTipoDespInvest.dsDataChange(Sender: TObject; Field: TField);
begin
   inherited;
	iIndiceAnterior := qry.FieldByName('IDTIPODESPINVEST').asInteger;
end;



procedure TfrmCadTipoDespInvest.FormShow(Sender: TObject);
begin
   inherited;

   qryLookTipoCliente.Open;
   qryLookForCli.Open;
end;



end.

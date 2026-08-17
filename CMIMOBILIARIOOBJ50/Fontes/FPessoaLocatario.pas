unit FPessoaLocatario;

//	------------------------------------------------------------------------------------------------
//
//	Cadastro de Locatários de Imóveis
//
//	Autor             :	André Pontes
//	Data de Início    :	18/01/1999
//	Data de Término   :	18/01/1999
//
//	Modificações      :  20/04/1999  - Cadastro dos dados relativos a Cliente e Fornecedor (usando as
//                                  funções da UDocumento)
//                      07/05/1999  - MontaSelect para as Contas Contábeis
//                                  - PreencheCamposNovos / LimpaCamposNovos
//                      21/05/1999  - Retirada de contas contábeis, inclusão de Sub-Conta
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97,
  StdCtrls, DBCtrls, checklst, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  ExtCtrls, TabControlDetalhe, Mask, wwdbedit,
  CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Wwdotdot, Wwdbcomb,
  TREdit;

type
  TTipoVerificacao = (tvCliente, tvFornecedor);
  TfrmPessoaLocatario = class(TfrmPessoa)
    tbsCliente: TTabSheet;
    Label14: TLabel;
    lblSubConta: TLabel;
    DBcboTipoCliente: TwwDBLookupCombo;
    DBcboSubConta: TwwDBLookupCombo;
    qryPreencheCliente: TwwQuery;
    qryPreencheClienteTIPOCLIENTE: TStringField;
    qrySubConta: TwwQuery;
    qryTipoCliente: TwwQuery;
    qryTipoClienteDESCRICAO: TStringField;
    qryTipoClienteIDTIPOCLIENTE: TFloatField;
    qrySubTipoIDLOCATARIO: TFloatField;
    qrySubTipoCODSUBCONTA: TFloatField;
    qrySubTipoIDPESSOA: TFloatField;
    wwDBComboBox1: TwwDBComboBox;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;

    // procedimentos definidos
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);

    procedure PreencheCamposNovos;
    procedure LimpaCamposNovos;

    procedure PreencheContaCliente;
    procedure PreencheContaForn;

    procedure GravaCliente;
//    function DeveGravarFornecedor: boolean;
    procedure GravaFornecedor;

    function VerificaPreenchimentoCliente: boolean;

    procedure PreparaQueries(i: integer);
    procedure AbreQueries;

    // outros procedimentos
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);



  private { Private declarations }

  public { Public declarations }

  end;

var
  frmPessoaLocatario: TfrmPessoaLocatario;

implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, FCadastroCS, uComunsImobiliario, UDocumento,
  uIntegraBack;



procedure TfrmPessoaLocatario.CmeCadastroFind(Sender: TObject);
begin
   AbreQueries;
   inherited;
   PreencheCamposNovos;
end;



procedure TfrmPessoaLocatario.CmeCadastroConfirma(Sender: TObject);
begin
   qrySubTipo.FieldByName('IDPESSOA').asInteger := Sistema.idEmpresa;

   inherited;

   // Grava os dados relativos a Cliente
   GravaCliente;
end;



procedure TfrmPessoaLocatario.CmeCadastroInsert(Sender: TObject);
begin
   LimpaCamposNovos;

   AbreQueries;

   inherited;

   dbedNomeFantasia.SetFocus;
end;



procedure TfrmPessoaLocatario.PreencheCamposNovos;
begin
   with qryPreencheCliente do begin
      Close;
      Params[0].asInteger := qry.FieldByName('IDPESSOA').asInteger;
      Open;

      if not(qryPreencheCliente.isEmpty) then begin
//       mskContaCliente.Text          := FieldByName('CONTACCLIENTE').asString;
//       edtContaCliente.Text          := FieldByName('PLANOME').asString;
//       DBcboSubContaForn.Text        := FieldByName('NOMESUBCONTA').asString;
//       DBcboSubContaForn.PerformSearch;
//       DBcboCentroCustoCliente.Text  := FieldByName('CENTROCUSTO').asString;
//       DBcboCentroCustoCliente.PerformSearch;
         DBcboTipoCliente.Text         := FieldByName('TIPOCLIENTE').asString;
         DBcboTipoCliente.PerformSearch;
      end;
      Close;
   end;
{
   with qryPreencheForn do begin
      Close;
      Params[0].asInteger := qry.FieldByName('IDPESSOA').asInteger;
      Params[1].asInteger := IntegraBack.Plano;
      Open;

      if not(isEmpty) then begin
         mskContaForn.Text          := FieldByName('CONTACFORN').asString;
         edtContaForn.Text          := FieldByName('PLANOME').asString;
         DBcboSubContaForn.Text     := FieldByName('NOMESUBCONTA').asString;
         DBcboSubContaForn.PerformSearch;
         DBcboCentroCustoForn.Text  := FieldByName('CENTROCUSTO').asString;
         DBcboCentroCustoForn.PerformSearch;
      end;
      Close;
   end;
}
end;



procedure TfrmPessoaLocatario.LimpaCamposNovos;
begin
//   mskContaCliente.Clear;
//   edtContaCliente.Clear;
//   DBcboSubContaCliente.Clear;
//   DBcboCentroCustoCliente.Clear;
   DBcboTipoCliente.Clear;
{
   mskContaForn.Clear;
   edtContaForn.Clear;
   DBcboSubContaForn.Clear;
   DBcboCentroCustoForn.Clear;
   DBcboRamoForn.Clear;
}
end;



procedure TfrmPessoaLocatario.PreencheContaCliente;
begin
{
   mskContaCliente.Text := qryContaCliente.FieldByName('PLACONTA').asString;
   edtContaCliente.Text := qryContaCliente.FieldByName('PLANOME').asString;
}
end;



procedure TfrmPessoaLocatario.PreencheContaForn;
begin
{
   mskContaForn.Text := qryContaForn.FieldByName('PLACONTA').asString;
   edtContaForn.Text := qryContaForn.FieldByName('PLANOME').asString;
}
end;



procedure TfrmPessoaLocatario.GravaCliente;
var
   sContaContabil, sCentroCusto: string;
   iPlano, iPessoa, iSubConta, iTipoCliente: integer;
begin
   iPessoa := qry.FieldByName('IDPESSOA').asInteger;

   iPlano         := IntegraBack.Plano;
   iSubConta      := -1;
   sContaContabil := '';
   sCentroCusto   := '';
   iTipoCliente   := 0;

//   if Modulo.bIntegraContab then begin
//      iPlano := IntegraBack.Plano;
//      if length(trim(DBcboSubContaCliente.Text)) > 0 then iSubConta := qrySubContaCliente.FieldByName('CODSUBCONTA').asInteger;
//      if length(trim(mskContaCliente.Text)) > 0 then sContaContabil := qryContaCliente.FieldByname('PLACONTA').asString;
//      if length(trim(DBcboCentroCustoCliente.Text)) > 0 then sCentroCusto := qryCentroCustoCliente.FieldByName('CODCENTROCUSTO').asString;
//   end;

   if DBcboTipoCliente.LookupValue <> '' then iTipoCliente := StrToInt(DBcboTipoCliente.LookupValue);

   Documento.ForCli.Inserir(iPessoa, Sistema.idEmpresa, iSubConta, iPlano, iTipoCliente, Sistema.idEmpresa,
                        sCentroCusto, '', sContaContabil, '', 'C', False);
end;


{
function TfrmPessoa1.DeveGravarFornecedor: boolean;
begin
   Result := True;

   if length(trim(mskContaForn.Text)) > 0 then Exit;
   if length(trim(edtContaForn.Text)) > 0 then Exit;
   if length(trim(DBcboSubContaForn.Text)) > 0 then Exit;
   if length(trim(DBcboCentroCustoForn.Text)) > 0 then Exit;
   if length(trim(DBcboRamoForn.Text)) > 0 then Exit;

   Result := False;
end;
}


procedure TfrmPessoaLocatario.GravaFornecedor;
var
   sContaContabil, sCentroCusto: string;
   iPlano, iPessoa, iSubConta, iRamoForn: integer;
begin
//   if DeveGravarFornecedor then begin

      iPessoa := qry.FieldByName('IDPESSOA').asInteger;

      iPlano         := -1;
      iSubConta      := -1;
      sContaContabil := '';
      sCentroCusto   := '';
      iRamoForn      := 0;
{
      if Modulo.bIntegraContab then begin
         iPlano := IntegraBack.Plano;
         if length(trim(DBcboSubContaForn.Text)) > 0 then iSubConta := qrySubContaForn.FieldByName('CODSUBCONTA').asInteger;
         if length(trim(mskContaForn.Text)) > 0 then sContaContabil := qryContaForn.FieldByname('PLACONTA').asString;
         if length(trim(DBcboCentroCustoForn.Text)) > 0 then sCentroCusto := qryCentroCustoForn.FieldByName('CODCENTROCUSTO').asString;
      end;

      if length(trim(DBcboRamoForn.Text)) > 0 then iRamoForn := qryRamoForn.FieldByName('IDRAMOFORNECEDOR').asInteger;
}
      Documento.ForCli.Inserir(iPessoa, Sistema.idEmpresa, iSubConta, iPlano, iRamoForn, Sistema.idEmpresa,
                           sCentroCusto, '', sContaContabil, '', 'F', False);
//   end;
end;



function TfrmPessoaLocatario.VerificaPreenchimentoCliente: boolean;
begin
   Result := False;
	try

      if length(trim(DBcboTipoCliente.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Cliente!', DBcboTipoCliente);

   except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         pgctrlDetalhe.ActivePage   := tbsCliente;
         tbcDetalhe.TabIndex        := 4;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;



procedure TfrmPessoaLocatario.PreparaQueries(i: integer);
begin
   Screen.Cursor := crHourGlass;

	// Conta contábil + árvore
   if Modulo.bIntegraContab then begin

      with qrySubConta do begin
         Close;
         Prepare;
         Params[0].asInteger := i;
      end;

   end;
	Screen.Cursor := crDefault;
end;



procedure TfrmPessoaLocatario.AbreQueries;
begin
	Screen.Cursor := crHourGlass;

   if not(qryTipoCliente.Active) then qryTipoCliente.Open;
	if Modulo.bIntegraContab then if not(qrySubConta.Active) then qrySubConta.Open;

	Screen.Cursor := crDefault;
end;



procedure TfrmPessoaLocatario.FormShow(Sender: TObject);
begin
   PreparaQueries(Sistema.IdEmpresa);

   // habilita/desabilita o cadastro dos dados de integração com Contabilidade
   if Modulo.bIntegraContab then begin
      DBcboSubConta.Enabled := True;
   end else begin
      DBcboSubConta.Enabled := False;
   end;
end;



procedure TfrmPessoaLocatario.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimentoCliente then inherited;
end;



end.

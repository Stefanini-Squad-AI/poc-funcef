unit FCadBem;

//	------------------------------------------------------------------------------------------------
//
//	Cadastro de Bens
//
//	Autor             :  André Pontes
//	Data de Início	   :
//	Data de Término   :  01/10/1999
//
//	Modificações	   :  03/08/1999  1) Classe de Bem
//                      01/10/1999  2) Tela totalmente refeita, visando puramente ao cadastro de Bens NOVOS
//                      06/11/1999  3) Acerto do TabsTop e AutoDropDown de algmas combos
//                      04/02/2000  4) Retirada das referências a cadastro de conjuntos e rateio
//                                     (o cadastro agora depende do Ativo Fixo)
//                      05/04/2000  5) Adequação dos TFields às novas definições dos campos do Ativo Fixo
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, TREdit, wwdblook, IvDictio,
  IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Mask, DBCtrls, wwdbedit,
  Wwdotdot, Wwdbcomb, FCadastroCSImob, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro,
  {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
  ImgList;

type
  TfrmCadBem = class(TfrmCadastroCSImob)
    qryLookSituacao: TwwQuery;
    qryLookSituacaoIDSITUACAO: TFloatField;
    qryLookGrupo: TwwQuery;
    qryLookGrupoIDGRUPO: TFloatField;
    qryLookConjunto: TwwQuery;
    qryLookConjuntoIDCONJUNTO: TFloatField;
    qryDuplicidadePlaca: TwwQuery;
    qryLookGrupoDEPRECIACAO: TFloatField;
    MontaSelectConj: TMontaSelect;
    qryLookClasse: TwwQuery;
    qryLookClasseIDCLASSEBEM: TFloatField;
    qryLookClasseCODHIERARQ: TStringField;
    qryIDBEM: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDSITUACAO: TFloatField;
    qryIDCONJUNTO: TFloatField;
    qryIDGRUPO: TFloatField;
    qryPLACA: TFloatField;
    qryDESBEM: TStringField;
    qryTAXADEP: TFloatField;
    qryCONTROLE: TStringField;
    qryDATAINICIODEP: TDateTimeField;
    qryVALHISTORICO: TFloatField;
    qryCMBEM: TFloatField;
    qryCMDEP: TFloatField;
    qryDEPLANC: TFloatField;
    qryDTAINCLUSAO: TDateTimeField;
    qryDATAULTDEP: TDateTimeField;
    qryVALORG: TFloatField;
    qryREGISTRO: TStringField;
    qryIDCLASSEBEM: TFloatField;
    qryDuplicidadePlacaIDBEM: TFloatField;
    qryDuplicidadePlacaPLACA: TFloatField;
    qryIDMODULO: TFloatField;
    qryLookSituacaoDESCSITUACAO: TStringField;
    qryLookGrupoNOME: TStringField;
    qryLookGrupoCLASSE: TStringField;
    qryLookConjuntoDESCCONJUNTO: TStringField;
    qryLookClasseDESCRICAO: TStringField;
    Label35: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label4: TLabel;
    Label36: TLabel;
    Label58: TLabel;
    DBcboSituacao: TwwDBLookupCombo;
    DBcboConjunto: TwwDBLookupCombo;
    btnNovoConjuntoEdif: TBitBtn;
    btnBuscaConjunto: TBitBtn;
    edtPlaca: TDBRealEdit;
    edtDeprecAnual: TDBRealEdit;
    DBedtDescricao: TDBEdit;
    DBcboGrupo: TwwDBLookupCombo;
    DBcboClasseBem: TwwDBLookupCombo;
    DBedtDataInclusao: TCMDateTimePicker;
    sbtnNovoConj: TToolbarButton97;

    // procedimentos definidos
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    function VerificaPreenchimento: boolean;

    procedure AbreQueries;

    // outros procedimentos
    procedure btnBuscaConjuntoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBcboGrupoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure sbtnNovoConjClick(Sender: TObject);


  private { Private declarations }
   iBem: integer;

  public { Public declarations }

  end;



var
  frmCadBem: TfrmCadBem;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, uComunsImobiliario, uVerificaPreenchimento, FCadastroCS,
  UDocumento, UIntegraBack, uFuncoesImob, FCadConjunto;



procedure TfrmCadBem.CmeCadastroFind(Sender: TObject);
begin
	inherited;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if MontaSelect.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iBem := StrToInt(MontaSelect.ValoresChave[0]);

      qryLookGrupo.Open;

      with qry do begin
         LimpaParametros(qry);
         ParamByName('BEM').asInteger := iBem;
         Open;
      end;

      with qryLookConjunto do begin
         LimpaParametros(qryLookConjunto);
         ParamByName('CONJUNTO').asInteger := qry.FieldByName('IDCONJUNTO').asInteger;
         Open;
      end;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmCadBem.CmeCadastroInsert(Sender: TObject);
begin
	// abre a query principal contendo zero registros
   with qry do begin
      LimpaParametros(qry);
      Params[0].asInteger := 0;
      Open;
   end;

	inherited;

   qry.FieldByName('REGISTRO').asString := 'I';
   qry.FieldByName('CONTROLE').asString := 'F';

	if edtPlaca.CanFocus then edtPlaca.SetFocus;
end;



procedure TfrmCadBem.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

	if edtPlaca.CanFocus then edtPlaca.SetFocus;
end;



procedure TfrmCadBem.CmeCadastroConfirma(Sender: TObject);
begin
   if CmeCadastro.Operacao = opInserir then begin

      iBem := LeUltRegistro(nil, 'BEM');

      qry.FieldByName('IDBEM').asInteger     := iBem;
      qry.FieldByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      qry.FieldByName('IDMODULO').asInteger  := Sistema.idModulo;

   end;

   inherited;
end;



function TfrmCadBem.VerificaPreenchimento: boolean;
begin
   Result := False;
	try

      if edtPlaca.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Nº de Tombamento!', edtPlaca);

      if length(trim(DBedtDescricao.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Descrição do Bem!', DBedtDescricao);

      if ( (qry.FieldByName('IDCONJUNTO').isNULL) or (DBcboConjunto.LookupValue = '') ) then
         raise EValidacao.CreateVal('É necessário indicar o Conjunto ao qual pertence o Bem!', btnBuscaConjunto);

      if ( (qry.FieldByName('IDCLASSEBEM').isNULL) or (DBcboClasseBem.LookupValue = '') ) then
         raise EValidacao.CreateVal('É necessário indicar a Classe à qual pertence o Bem!', DBcboClasseBem);

      if ( (qry.FieldByName('IDGRUPO').isNULL) or (DBcboGrupo.LookupValue = '') ) then
         raise EValidacao.CreateVal('É necessário indicar o Grupo ao qual pertence o Bem!', DBcboGrupo);

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



procedure TfrmCadBem.AbreQueries;
begin
   qryLookSituacao.Open;
   qryLookClasse.Open;
   qryLookGrupo.Open;
end;



procedure TfrmCadBem.btnBuscaConjuntoClick(Sender: TObject);
begin
   inherited;

   if qry.State in [dsInsert, dsEdit] then begin
      MontaSelectConj.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if MontaSelectConj.RetornouValor then begin
         with qryLookConjunto do begin
            Close;
            Params[0].asInteger := StrToInt(MontaSelectConj.ValoresChave[0]);
            Open;
         end;
         qry.FieldByName('IDCONJUNTO').asInteger := StrToInt(MontaSelectConj.ValoresChave[0]);
      end;
   end;
end;



procedure TfrmCadBem.FormCreate(Sender: TObject);
begin
   inherited;

	MontaSelect.Filtro.Add('BEM.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
	MontaSelectConj.Filtro.Add('C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
end;



procedure TfrmCadBem.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TfrmCadBem.FormShow(Sender: TObject);
begin
   inherited;

   AbreQueries;
end;



procedure TfrmCadBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   
   ModalResult := mrCancel;
end;



procedure TfrmCadBem.DBcboGrupoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if edtDeprecAnual.Value = 0 then edtDeprecAnual.Value := qryLookGrupo.FieldByName('DEPRECIACAO').asFloat;
end;



procedure TfrmCadBem.sbtnNovoConjClick(Sender: TObject);
begin

   Screen.Cursor := crHourGlass;

   Application.CreateForm(TfrmCadConjunto, frmCadConjunto);
   sbtnNovoConj.Down := False;
   frmCadConjunto.ShowModal;

   Repaint;

   Screen.Cursor := crDefault;
end;



end.

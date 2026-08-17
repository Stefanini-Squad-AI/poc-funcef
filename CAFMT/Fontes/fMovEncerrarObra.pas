unit fMovEncerrarObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, fcLabel, wwdbdatetimepicker,
  CMDateTimePicker, DBCtrls, Mask, TREdit, wwdbedit, wwdblook
  {$IFNDEF VERSAO0505},uCMTypes{$ENDIF};

type
  TfrmMovEncerrarObra = class(TfrmCadMestreDetalheCS)
    bbtnEstornar: TBitBtn;
    Label1: TLabel;
    dbeDescObra: TDBMemo;
    Label2: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    pgctlBem: TPageControl;
    TabIdent: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label29: TLabel;
    bbtnSelClasse: TBitBtn;
    edDescClasse: TwwDBEdit;
    TabContab: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    bbtnSelGrupo: TBitBtn;
    edDataInicioDep: TCMDateTimePicker;
    bbtnSelAtivProjeto: TBitBtn;
    bbtnSelSubConta: TBitBtn;
    edDescGrupo: TwwDBEdit;
    edDescSubConta: TwwDBEdit;
    edAtivProjeto: TwwDBEdit;
    qryDet: TwwQuery;
    qryConjunto: TwwQuery;
    dsConjunto: TwwDataSource;
    qryRateioCusto: TwwQuery;
    dsRateioCusto: TwwDataSource;
    MSClasse: TMontaSelect;
    MSGrupos: TMontaSelect;
    qryPlaca: TwwQuery;
    qryPlacaPLACA: TFloatField;
    qryPlacaDESBEM: TStringField;
    qryAtivProj: TwwQuery;
    dsAtivProj: TwwDataSource;
    dsSubConta: TwwDataSource;
    qrySubConta: TwwQuery;
    qryGrupo: TwwQuery;
    dsGrupo: TwwDataSource;
    dsSituacao: TwwDataSource;
    qrySituacao: TwwQuery;
    qryClasse: TwwQuery;
    dsClasse: TwwDataSource;
    MSAtivProjeto: TMontaSelect;
    MSSubConta: TMontaSelect;
    TabConjunto: TTabSheet;
    Label3: TLabel;
    dbeDescConjunto: TDBMemo;
    dbgRateio: TwwDBGrid;
    Label6: TLabel;
    Label5: TLabel;
    dbeNomeResponsavel: TwwDBEdit;
    dbeDescLocalizacao: TwwDBEdit;
    Label4: TLabel;
    bbtnGeraConjunto: TBitBtn;
    Label44: TLabel;
    Label9: TLabel;
    edPlaca: TMaskEdit;
    bbtnGeraPlaca: TBitBtn;
    qryLancObra: TwwQuery;
    updDet: TUpdateSQL;
    cmbSituacao: TwwDBLookupCombo;
    Label13: TLabel;
    dbeDtaInclusao: TCMDateTimePicker;
    lblEncerrado: TfcLabel;
    dbeDesBem: TDBMemo;
    dbeValOfi: TDBRealEdit;
    dbeTaxaDep: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
    procedure bbtnSelClasseClick(Sender: TObject);
    procedure bbtnGeraPlacaClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
    procedure qryGrupoAfterOpen(DataSet: TDataSet);
    procedure CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dbeDtaInclusaoExit(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnEstornarClick(Sender: TObject);
  private
    { Private declarations }
    bEdPlaca                        : Boolean;
    ProximoCodigo, CodigoAnterior,
    sCodPlaca                       : String;
    //------------------------------------------------------------------------------------
    Procedure SelObra(iCafObra : Integer);
    Function  PlacaUnica(sPlaca : string) : boolean;
  public
    { Public declarations }
  end;

var
  frmMovEncerrarObra: TfrmMovEncerrarObra;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uDataBase, dBaseDados, dAtivoFixo,
     uAtivoFixo, fCadConjunto;

procedure TfrmMovEncerrarObra.FormCreate(Sender: TObject);
var
   sMascaraEmpresa, sMascaraGrupo,
   sCodPlaca                       : String;
   iAux                            : Integer;

begin
   inherited;
   qry.Prepare;
   qryDet.Prepare;
   qryLancObra.Prepare;
   qryClasse.Prepare;
   qryGrupo.Prepare;
   qryAtivProj.Prepare;
   qrySubConta.Prepare;
   qryConjunto.Prepare;
   qryRateioCusto.Prepare;
   qrySituacao.Prepare;
   qryPlaca.Prepare;
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo do
   begin
      qryParamCAF.Close;
      qryParamCAF.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
      qryParamCAF.Open;
   end;
   //-------------------------------------------------------------------------------------
   sMascaraEmpresa := '';
   for iAux := 1 to length(trim(inttostr(Sistema.IdEmpresa))) do
   begin
      sMascaraEmpresa := sMascaraEmpresa + '9';
   end;
   //-------------------------------------------------------------------------------------
   sMascaraGrupo := dtmAtivoFixo.qryParamCaf.FieldByName('MASCCODGRUPO').AsString;
   while pos('.',sMascaraGrupo) <> 0 do
   begin
      sMascaraGrupo := AtivoFixo.TiraCaracter(sMascaraGrupo,'.');
   end;
   //-------------------------------------------------------------------------------------
   // Seta Forma de geração de código da Placa do Bem
   //-------------------------------------------------------------------------------------
   bEdPlaca := dtmAtivoFixo.qryParamCaf.FieldByName('EDITACODBEM').AsFloat = 1;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.qryParamCAF.FieldByName('SEQBEMEMP').AsFloat = 0 then {sequencial por empresa}
   begin
      sCodPlaca := 'E';
   end else
   if dtmAtivoFixo.qryParamCAF.FieldByName('SEQBEMEMP').AsFloat = 1 then {sequencial por grupo}
   begin
      sCodPlaca := 'G';
   end else
   if dtmAtivoFixo.qryParamCAF.FieldByName('SEQBEMEMP').AsFloat = 2 then {sequencial por classe}
   begin
      sCodPlaca := 'C';
   end else
   if dtmAtivoFixo.qryParamCAF.FieldByName('SEQBEMEMP').AsFloat = 3 then {sequencial}
   begin
      sCodPlaca := 'S';
   end;
   //-------------------------------------------------------------------------------------
   edPlaca.EditMask := '999999999;0; ';
   if bEdPlaca then
   begin
      if (sCodPlaca = 'G') or (sCodPlaca = 'C') then
         edPlaca.EditMask := sMascaraGrupo + '.9999999;0; '
      else
      if (sCodPlaca = 'E') then
         edPlaca.EditMask := sMascaraEmpresa + '.999999999;0; ';
   end;
   //-------------------------------------------------------------------------------------
   qryConjunto.Open;
   qryRateioCusto.Open;
   qryClasse.Open;
   qrySituacao.Open;
   qryGrupo.Open;
   qrySubConta.Open;
   qryAtivProj.Open;
   //-------------------------------------------------------------------------------------
   bbtnEstornar.Enabled := False;
   SelObra(-1);
end;
//========================================================================================
Procedure TfrmMovEncerrarObra.SelObra(iCafObra : Integer);
begin
   //-------------------------------------------------------------------------------------
   // Seleciona a Obra
   //-------------------------------------------------------------------------------------
   qry.Close;
   qry.ParamByName('IDCAFOBRA').AsInteger  := iCafObra;
   qry.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
   qry.Open;
   //-------------------------------------------------------------------------------------
   // Gera os dados para o lançamento dos bens ou Relaciona os bens já lançados
   //-------------------------------------------------------------------------------------
   qryDet.Close;
   if (qry.FieldByName('FLGOBRA').AsInteger = 0) and (not qry.IsEmpty) then
   begin
      lblEncerrado.Caption := 'Em Aberto';
      //----------------------------------------------------------------------------------
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      bbtnEstornar.Enabled  := False;
      TabConjunto.Enabled   := True;
      TabIdent.Enabled      := True;
      TabContab.Enabled     := True;
      sBtnInsDet.Enabled    := True;
      sBtnAltDet.Enabled    := True;
      sBtnExcluiDet.Enabled := True;
      //----------------------------------------------------------------------------------
      qryDet.ParamByName('IDCAFOBRA').AsInteger := -1;
      qryDet.ParamByName('IDPESSOA').AsInteger := -1;
      qryDet.Open;
      TStringField(qryDet.FieldByName('CLASSE')).EditMask     := dtmAtivoFixo.qryParamCaf.FieldByName('MASCCODGRUPO').AsString+';0; ';
      TFloatField(qryDet.FieldByName('VALORG')).DisplayFormat := '#,##0.00;(#,##0.00); ';
      //----------------------------------------------------------------------------------
      // Geração dos Dados para lançamento dos bens por grupo contábil
      //----------------------------------------------------------------------------------
      qryLancObra.Close;
      qryLancObra.ParamByName('IDCAFOBRA').AsInteger := iCafObra;
      qryLancObra.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
      qryLancObra.Open;
      //----------------------------------------------------------------------------------
      while not qryLancObra.EOF do
      begin
         qryGrupo.Close;
         qryGrupo.ParamByName('IDGRUPO').AsFloat  := qryLancObra.FieldByName('IDGRUPO').AsInteger;
         qryGrupo.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
         qryGrupo.Open;
         //-------------------------------------------------------------------------------
         qryDet.Append;
         qryDet.FieldByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
         qryDet.FieldByName('IDMODULO').AsInteger    := Sistema.IdModulo;
         qryDet.FieldByName('REGISTRO').AsString     := 'O';
         qryDet.FieldByName('CONTROLE').AsString     := 'T';
         qryDet.FieldByName('DESBEM').AsString       := qry.FieldByName('DESCCAFOBRA').AsString;
         qryDet.FieldByName('VALHISTORICO').AsFloat  := qryLancObra.FieldByName('SOMAVALOFI').AsFloat;
         qryDet.FieldByName('VALORG').AsFloat        := qryLancObra.FieldByName('SOMAVALOFI').AsFloat;
         qryDet.FieldByName('IDGRUPOOBRA').AsInteger := qryGrupo.FieldByName('IDGRUPO').AsInteger;
         qryDet.FieldByName('CLASSE').AsString       := qryGrupo.FieldByName('CLASSE').AsString;
         qryDet.FieldByName('NOMEGRUPO').AsString    := qryGrupo.FieldByName('NOME').AsString;
         qryDet.FieldByName('TAXADEP').AsFloat       := qryGrupo.FieldByName('DEPRECIACAO').AsFloat;
         qryDet.Post;
         //-------------------------------------------------------------------------------
         qryLancObra.Next;
      end;
      qryDet.First;
   end else
   //-------------------------------------------------------------------------------------
   // Relaciona os bens já lançados
   //-------------------------------------------------------------------------------------
   if qry.FieldByName('FLGOBRA').AsInteger = 1 then
   begin
      lblEncerrado.Caption := 'Encerrado em ' + qry.FieldByName('DTAENCERRAOBRA').AsString;
      //----------------------------------------------------------------------------------
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := True;
      bbtnEstornar.Enabled  := True;
      TabConjunto.Enabled   := False;
      TabIdent.Enabled      := False;
      TabContab.Enabled     := False;
      sBtnInsDet.Enabled    := False;
      sBtnAltDet.Enabled    := False;
      sBtnExcluiDet.Enabled := False;
      //----------------------------------------------------------------------------------
      qryDet.ParamByName('IDCAFOBRA').AsInteger := qry.FieldByName('IDCAFOBRA').AsInteger;
      qryDet.ParamByName('IDPESSOA').AsInteger  := qry.FieldByName('IDPESSOA').AsInteger;
      qryDet.Open;
      TStringField(qryDet.FieldByName('CLASSE')).EditMask     := dtmAtivoFixo.qryParamCaf.FieldByName('MASCCODGRUPO').AsString+';0; ';
      TFloatField(qryDet.FieldByName('VALORG')).DisplayFormat := '#,##0.00;(#,##0.00); ';
      qryDet.First;
   end else
   //-------------------------------------------------------------------------------------
   begin
      qryDet.ParamByName('IDCAFOBRA').AsInteger := -1;
      qryDet.ParamByName('IDPESSOA').AsInteger := -1;
      qryDet.Open;
      lblEncerrado.Caption  := '';
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
      bbtnEstornar.Enabled  := False;
      TabConjunto.Enabled   := False;
      TabIdent.Enabled      := False;
      TabContab.Enabled     := False;
      sBtnInsDet.Enabled    := False;
      sBtnAltDet.Enabled    := False;
      sBtnExcluiDet.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   Application.ProcessMessages;
   if MontaSelect.RetornouValor then
   begin
      SelObra(StrToInt(MontaSelect.ValoresChave[0]));
   end else
   begin
      SelObra(-1);
   end;
   //-------------------------------------------------------------------------------------
   pgctlBem.ActivePage := TabConjunto;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.sbtnAltDetClick(Sender: TObject);
begin
   inherited;
   qryConjunto.Close;
   qryConjunto.ParamByName('IDCONJUNTO').AsInteger := qryDet.FieldByName('IDCONJUNTO').AsInteger;
   qryConjunto.Open;
   qryRateioCusto.Close;
   qryRateioCusto.ParamByName('IDPESSOA').AsInteger   := qryDet.FieldByName('IDPESSOA').AsInteger;
   qryRateioCusto.ParamByName('IDCONJUNTO').AsInteger := qryConjunto.FieldByName('IDCONJUNTO').AsInteger;
   qryRateioCusto.Open;
   qryClasse.Close;
   qryClasse.ParamByName('IDCLASSEBEM').AsInteger := qryDet.FieldByName('IDCLASSEBEM').AsInteger;
   qryClasse.Open;
   edPlaca.Text := qryDet.FieldByName('PLACA').AsString;
   qryGrupo.Close;
   qryGrupo.ParamByName('IDGRUPO').AsFloat  := qryDet.FieldByName('IDGRUPO').AsInteger;
   qryGrupo.ParamByName('IDPESSOA').AsFloat := qryDet.FieldByName('IDPESSOA').AsInteger;
   qryGrupo.Open;
   qrySubConta.Close;
   qrySubConta.ParamByName('CODSUBCONTA').AsInteger := qryDet.FieldByName('CODSUBCONTA').AsInteger;
   qrySubConta.ParamByName('IDPESSOA').AsInteger    := qryDet.FieldByName('IDPESSOA').AsInteger;
   qrySubConta.Open;
   qryAtivProj.Close;
   qryAtivProj.ParamByName('UNIDNEGOC').AsInteger := qryDet.FieldByName('UNIDNEGOC').AsInteger;
   qryAtivProj.ParamByName('IDPESSOA').AsInteger  := qryDet.FieldByName('IDPESSOA').AsInteger;
   qryAtivProj.Open;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnGeraConjuntoClick(Sender: TObject);
var
   iIdConjunto : Integer;
begin
   Application.CreateForm(TfrmCadConjunto,frmCadConjunto);
   frmCadConjunto.FormStyle := FsNormal;
   frmCadConjunto.Visible   := False;
   frmCadConjunto.Top       := 76;
   frmCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   iIdConjunto := frmCadConjunto.qryUltConj.Fieldbyname('IDCONJUNTO').asInteger;
   frmCadConjunto.qryUltConj.Close;
   frmCadConjunto.qryUltConj.UnPrepare;
   frmCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   qryConjunto.Close;
   qryConjunto.ParamByName('IDCONJUNTO').AsInteger := iIdConjunto;
   qryConjunto.Open;
   qryRateioCusto.Close;
   qryRateioCusto.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
   qryRateioCusto.ParamByName('IDCONJUNTO').AsInteger := qryConjunto.FieldByName('IDCONJUNTO').AsInteger;
   qryRateioCusto.Open;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnSelClasseClick(Sender: TObject);
begin
   inherited;
   MSClasse.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSClasse.RetornouValor then
   begin
      qryClasse.Close;
      qryClasse.ParamByName('IDCLASSEBEM').AsInteger := StrToInt(MSClasse.ValoresChave[0]);
      qryClasse.Open;
   end;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnGeraPlacaClick(Sender: TObject);
var
   sDigMascPlaca : String;

begin
   inherited;
   if CmeDetalhe.Operacao = opInserir then
   begin
      if bEdPlaca then
      begin
         //-------------------------------------------------------------------------------
         // Calcula o Número da Próxima Placa de Patrimônio
         //-------------------------------------------------------------------------------
         dtmAtivoFixo.qryAux.Close;
         dtmAtivoFixo.qryAux.SQL.Clear;
         dtmAtivoFixo.qryAux.SQL.Add(' SELECT PROXIMAPLACA, DIGMASCPLACA '+
                                     ' FROM PARAMETROSCAFMANUT '+
                                     ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         dtmAtivoFixo.qryAux.Open;
         if dtmAtivoFixo.qryAux.FieldByName('PROXIMAPLACA').AsFloat <= 0 then
         begin
            ProximoCodigo := '1';
         end else
         begin
            ProximoCodigo := FloatToStr(dtmAtivoFixo.qryAux.FieldByName('PROXIMAPLACA').AsFloat);
         end;
         CodigoAnterior := ProximoCodigo;
         sDigMascPlaca := StringOfChar('0',dtmAtivoFixo.qryAux.FieldByName('DIGMASCPLACA').AsInteger);
         //-------------------------------------------------------------------------------
         dtmAtivoFixo.qryParamCAF.Close;
         dtmAtivoFixo.qryAux.Close;
         dtmAtivoFixo.qryAux.SQL.Clear;
         dtmAtivoFixo.qryAux.SQL.Add(' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' +
                                     floattostr(strtofloat(ProximoCodigo) + 1) +
                                     ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         dtmAtivoFixo.qryAux.ExecSQL;
         dtmAtivoFixo.qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
         dtmAtivoFixo.qryParamCaf.Open;
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'G' then
         begin
            if Length(ProximoCodigo) > 7 then
            begin
               MsgDlg('Número de Bens Cadastrados para o Grupo Terminou!' + #13 +
                      'Crie um Novo Grupo ou mude de Grupo.',
                      'Erro', mtError, [mbOk], 0);
               exit;
            end;
            if qryGrupo.FieldbyName('CLASSE').IsNull then
            begin
               MsgDlg('Selecione um Grupo Contábil!', 'Erro', mtError, [mbOk], 0);
               exit;
            end else
            begin
               edPlaca.Text := floattostr(strtofloat(qryGrupo.FieldbyName('CLASSE').AsString +
                                                     AtivoFixo.ComplZeros(ProximoCodigo,7))) + sDigMascPlaca;
            end;
         end else
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'C' then
         begin
            if Length(ProximoCodigo) > 7 then
            begin
               MsgDlg(' Número de Bens Cadastrados para a Classe Terminou!' + #13 +
                      ' Crie uma Nova Classe ou mude de Classe.',
                      'Erro', mtError, [mbOk], 0);
               exit;
            end;
            if qryClasse.FieldbyName('CODHIERARQ').IsNull then
            begin
               MsgDlg('Selecione uma Classe!', 'Erro', mtError, [mbOk], 0);
               exit;
            end else
            begin
               edPlaca.Text := floattostr(strtofloat(qryClasse.FieldbyName('CODHIERARQ').AsString +
                                                     AtivoFixo.ComplZeros(ProximoCodigo,7))) + sDigMascPlaca;
            end;
         end else
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'E' then
         begin
            edPlaca.Text := floattostr(strtofloat(IntToStr(Sistema.IdEmpresa) +
                                       AtivoFixo.ComplZeros(ProximoCodigo,7))) + sDigMascPlaca;
         end else
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'S' then
         begin
            edPlaca.Text := ProximoCodigo + sDigMascPlaca;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.dbeDtaInclusaoExit(Sender: TObject);
begin
  inherited;
   if edDataInicioDep.Text = '' then
      qryDet.FieldByName('DATAINICIODEP').AsDateTime := dbeDtaInclusao.Date;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupos.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupos.RetornouValor then
   begin
      qryGrupo.Close;
      qryGrupo.ParamByName('IDGRUPO').AsInteger  := StrToInt(MSGrupos.ValoresChave[0]);
      qryGrupo.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryGrupo.Open;
   end;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.qryGrupoAfterOpen(DataSet: TDataSet);
begin
   inherited;
   if (not qryGrupo.IsEmpty) and (dbeTaxaDep.Value = 0) then
      dbeTaxaDep.Value := qryGrupo.FieldByName('DEPRECIACAO').AsFloat;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnSelSubContaClick(Sender: TObject);
begin
   inherited;
   MSSubConta.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSSubConta.RetornouValor then
   begin
      qrySubConta.Close;
      qrySubConta.ParamByName('CODSUBCONTA').AsInteger := StrToInt(MSSubConta.ValoresChave[0]);
      qrySubConta.ParamByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
      qrySubConta.Open;
   end;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnSelAtivProjetoClick(Sender: TObject);
begin
   inherited;
   MSAtivProjeto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSAtivProjeto.RetornouValor then
   begin
      qryAtivProj.Close;
      qryAtivProj.ParamByName('UNIDNEGOC').AsInteger := StrToInt(MSAtivProjeto.ValoresChave[0]);
      qryAtivProj.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
      qryAtivProj.Open;
   end;
end;
//========================================================================================
function TfrmMovEncerrarObra.PlacaUnica(sPlaca : string) : boolean;
var
   sPlacaAux : String;

begin
   Screen.Cursor := crSQLWait;
   sPlacaAux := sPlaca;
   //-------------------------------------------------------------------------------------
   while pos('.',sPlacaAux) <> 0 do
   begin
      sPlacaAux := AtivoFixo.TiraCaracter(sPlacaAux,'.');
   end;
   //-------------------------------------------------------------------------------------
   if not qryPlaca.Prepared then
      qryPlaca.Prepare;
   //-------------------------------------------------------------------------------------
   qryPlaca.Close;
   qryPlaca.ParambyName('PPLACA').AsString := sPlacaAux;
   qryPlaca.Open;
   Result := qryPlaca.IsEmpty ;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   try
      // Grupo
      if qryGrupo.FieldbyName('IDGRUPO').IsNull then
         Raise Exception.Create('É necessário selecionar a Grupo do Bem!');
      // Conjunto
      if qryConjunto.FieldbyName('IDCONJUNTO').IsNull then
         Raise Exception.Create('É necessário selecionar o Conjunto do Bem!');
      // Classe
      if qryClasse.FieldbyName('IDCLASSEBEM').IsNull then
         Raise Exception.Create('É necessário selecionar a Classe do Bem!');
      // Situacao
      if qrySituacao.FieldbyName('IDSITUACAO').IsNull then
         Raise Exception.Create('É necessário selecionar a Situação do Bem!');
      // Descrição do Bem
      if dbeDesBem.Text = '' then
         Raise Exception.Create('É necessário informar a Descrição do Bem!');
      // Numero de Tombamento Patrimonial
      if edPlaca.Text = '' then
         Raise Exception.Create('É necessário informar o Número de Tombamento Patrimonial do Bem!');
      if not PlacaUnica(edPlaca.Text) then
         Raise Exception.Create('O Número de Tombamento Patrimonial do Bem deve ser exclusivo!');
      // Data de Inclusao
      if dbeDtaInclusao.Text = '' then
         Raise Exception.Create('É necessário informar a Data de Entrada do Bem no patrimonio!');
      // Valor Historico de Aquisição
      if dbeValOfi.Value = 0 then
         Raise Exception.Create('É necessário informar o custo inicial do bem!');
      // Data de Inicio da Depreciação
      if edDataInicioDep.Text = '' then
         Raise Exception.Create('É necessário informar a data de inicio da depreciação do bem!');
      //----------------------------------------------------------------------------------
      Accept := True;
   except
      On E : Exception do
      begin
         Accept := False;
         MsgDlg(E.Message,'Erro', mtError, [mbOk], 0);
      end;
   end;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.CmeDetalheConfirma(Sender: TObject);
Var
   iPos : TBookMark;
begin
   qryDet.FieldByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
   qryDet.FieldByName('IDMODULO').AsInteger    := Sistema.IdModulo;
   qryDet.FieldByName('IDCLASSEBEM').AsInteger := qryClasse.FieldByName('IDCLASSEBEM').AsInteger;
   qryDet.FieldByName('PLACA').AsFloat         := StrToFloat(edPlaca.Text);
   qryDet.FieldByName('IDGRUPO').AsInteger     := qryGrupo.FieldByName('IDGRUPO').AsInteger;
   qryDet.FieldByName('REGISTRO').AsString     := 'O';
   qryDet.FieldByName('CONTROLE').AsString     := 'T';
   qryDet.FieldByName('VALHISTORICO').AsFloat  := dbeValOfi.Value;
   //-------------------------------------------------------------------------------------
   if qrySubConta.FieldByName('CODSUBCONTA').IsNull then
      qryDet.FieldByName('CODSUBCONTA').Clear
   else
      qryDet.FieldByName('CODSUBCONTA').AsInteger := qrySubConta.FieldByName('CODSUBCONTA').AsInteger;
   //-------------------------------------------------------------------------------------
   if qryAtivProj.FieldByName('UNIDNEGOC').IsNull then
      qryDet.FieldByName('UNIDNEGOC').Clear
   else
      qryDet.FieldByName('UNIDNEGOC').AsInteger := qryAtivProj.FieldByName('UNIDNEGOC').AsInteger;
   //-------------------------------------------------------------------------------------
   qryDet.Post;
   //-------------------------------------------------------------------------------------
   // Atualiza os outros bens com o mesmo conjunto
   //-------------------------------------------------------------------------------------
   iPos := qryDet.GetBookMark;
   qryDet.First;
   while not qryDet.EOF do
   begin
      qryDet.Edit;
      qryDet.FieldByName('IDCONJUNTO').AsInteger := qryConjunto.FieldByName('IDCONJUNTO').AsInteger;
      qryDet.Post;
      qryDet.Next;
   end;
   qryDet.GotoBookmark(iPos);
   qryDet.FreeBookmark(iPos);
   inherited;
   bbtnVoltarDet.Click;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   sbtnAltDet.Enabled := True;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   sbtnAltDet.Enabled := True;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
Var
   fSomaBens, fSomaObra : Extended;

begin
   inherited;
   try
      //----------------------------------------------------------------------------------
      // Verifica se a soma dos valores iniciais dos bens estão iguais ao custo
      // total da Obra
      //----------------------------------------------------------------------------------
      fSomaBens := 0;
      qryDet.First;
      while not qryDet.EOF do
      begin
         fSomaBens := fSomaBens + qryDet.FieldByName('VALORG').AsFloat;
         qryDet.Next;
      end;
      //----------------------------------------------------------------------------------
      fSomaObra := 0;
      qryLancObra.First;
      while not qryLancObra.EOF do
      begin
         fSomaObra := fSomaObra + qryLancObra.FieldByName('SOMAVALOFI').AsFloat;
         qryLancObra.Next;
      end;
      //----------------------------------------------------------------------------------
      if fSomaBens <> fSomaObra then
         Raise Exception.Create('É necessário que a soma dos valores iniciais dos bens ('+formatfloat('#,##9.99',fSomaBens)+') ' +
                                'seja igual a soma de todos os custos lançados na Obra ('+formatfloat('#,##9.99',fSomaObra)+')!');
      //----------------------------------------------------------------------------------
      Accept := True;
   except
      on E : Exception do
      begin
         Accept := False;
         MsgDlg(E.Message,'Erro', mtError, [mbOk], 0);
      end;
   end;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.CmeCadastroConfirma(Sender: TObject);
var
   iPlanilha : Integer;

begin
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
      //----------------------------------------------------------------------------------
      qryDet.First;
      while not qryDet.EOF do
      begin
         iPlanilha := 0;
         if not AtivoFixo.ExecutaEncerraObra(qryDet.FieldByName('IDMODULO').AsInteger,
                                             qryDet.FieldByName('IDPESSOA').AsInteger,
                                             qry.FieldByName('IDCAFOBRA').AsInteger,
                                             qryDet.FieldByName('IDCONJUNTO').AsInteger,
                                             qryDet.FieldByName('IDGRUPO').AsInteger,
                                             qryDet.FieldByName('IDGRUPOOBRA').AsInteger,
                                             qryDet.FieldByName('CODSUBCONTA').AsInteger,
                                             qryDet.FieldByName('UNIDNEGOC').AsInteger,
                                             qryDet.FieldByName('IDCLASSEBEM').AsInteger,
                                             qryDet.FieldByName('PLACA').AsFloat,
                                             qryDet.FieldByName('IDSITUACAO').AsInteger,
                                             qryDet.FieldByName('DESBEM').AsString,
                                             qryDet.FieldByName('DTAINCLUSAO').AsDateTime,
                                             qryDet.FieldByName('VALORG').AsFloat,
                                             qryDet.FieldByName('DATAINICIODEP').AsDateTime,
                                             qryDet.FieldByName('TAXADEP').AsFloat,
                                             iPlanilha, True) = 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         if iPlanilha <= 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         //-------------------------------------------------------------------------------
         qryDet.Next;
      end;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      MsgDlg('Encerramento Realizado!','Atenção',mtInformation,[mbOk],0);
      SelObra(-1);
   except
      on E : Exception do
      begin
         RollBackTransacao;
         MsgDlg('Encerramento não Realizado!' + #13 + #13 +
                'Causa : ' + E.Message,
                'Erro', mtError, [mbOk], 0);
         bbtnCancelar.Click;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnCancelarClick(Sender: TObject);
begin
   SelObra(-1);
   inherited;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   dtmAtivoFixo.qryParamCAF.Close;
   qry.Close;
   qryDet.Close;
   qryLancObra.Close;
   qryClasse.Close;
   qryGrupo.Close;
   qryAtivProj.Close;
   qrySubConta.Close;
   qryConjunto.Close;
   qryRateioCusto.Close;
   qrySituacao.Close;
   qryPlaca.Close;
   dtmAtivoFixo.qryParamCAF.UnPrepare;
   qry.Unprepare;
   qryDet.Unprepare;
   qryLancObra.Unprepare;
   qryClasse.Unprepare;
   qryGrupo.Unprepare;
   qryAtivProj.Unprepare;
   qrySubConta.Unprepare;
   qryConjunto.Unprepare;
   qryRateioCusto.Unprepare;
   qrySituacao.Unprepare;
   qryPlaca.Unprepare;
end;
//========================================================================================
procedure TfrmMovEncerrarObra.bbtnEstornarClick(Sender: TObject);
begin
   try
      bbtnEstornar.Enabled := False;
      bbtnCancelar.Enabled := False;
      //----------------------------------------------------------------------------------
      StartTransacao;
      //----------------------------------------------------------------------------------
      qryDet.First;
      while not qryDet.EOF do
      begin
         if AtivoFixo.EstornaEncerraObra(qryDet.FieldByName('IDMODULO').AsInteger,
                                         qryDet.FieldByName('IDPESSOA').AsInteger,
                                         qry.FieldByName('IDCAFOBRA').AsInteger,
                                         qryDet.FieldByName('IDBEM').AsInteger,
                                         qry.FieldByName('DTAENCERRAOBRA').AsDateTime,
                                         qry.FieldByName('DTAENCERRAOBRA').AsDateTime,True) <= 0 then
            Raise Exception.Create('Encerramento não Estornado!' + #13 + #13 +
                                   'Descrição : ' + AtivoFixo.MensagemErro);
         //-------------------------------------------------------------------------------
         qryDet.Next;
      end;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      MsgDlg('Encerramento Estornado!','Atenção',mtInformation,[mbOk],0);
      SelObra(-1);
      inherited;
   except
      on E : Exception do
      begin
         RollBackTransacao;
         MsgDlg('Encerramento Estornado!' + #13 + #13 +
                'Causa : ' + E.Message,
                'Erro', mtError, [mbOk], 0);
         bbtnCancelar.Click; 
      end;
   end;
end;

end.

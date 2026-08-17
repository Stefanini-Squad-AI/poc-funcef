// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//N. Atender....: WO8602
//Dt Alteração..: 04/06/2024
//Responsável...: Luis Ferrari
//Descrição.....: Importação de planilha Excel com o rateio por planos de benefícios dos imóveis da FUNCEF.
//------------------------------------------------------------------------------
// Alteração  : qry(dfm)
// Autor(a)   : Andre Imakawa
// Data       : 01/08/2017
// SIG        : 51360
// Descricao  : Contribuição por núcleo familiar não habilita alteração para
//              algumas matriculas.
//------------------------------------------------------------------------------
// Alteração  : (dfm)
// Autor(a)   : Edilaine Ferraresi
// Data       : 30/01/2017
// SIG        : 36752
// Descricao  : Equacionamento - ação judicial / importação arquivo
//------------------------------------------------------------------------------
// Autor(a)  : Helio Lima Custódio
// Data      : 25/02/2016
// Pendencia : 253577/18119  PPM 1298783
// Alteração : Insere Opção de cadastro
//------------------------------------------------------------------------------
// Autor(a)  : Fernando Xavier
// Data      : 14/04/2011
// Pendencia : 141073/3661  KINTANA 1128912
// Alteração : Ajuste no controle de transações no Banco de Dados
//------------------------------------------------------------------------------
//Pendência   : SOL 141073 Kintana 141073
//Responsável : BRUNO AZEVEDO
//Data        : 20/09/2010
//Descrição   : Correção no controle de transação das funcionalidades:
//              "Contribuições por Núcleo Familiar";
//              "Entrada Manual de Contribuições por Núcleo Familiar";
//              "Consulta Geral de Pessoa".
//--------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 21/12/2004
// Alteração   : Erro ao confirmar
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadContribNucleoFamiliar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  wwdbedit, DBCtrls, wwdbdatetimepicker, CMDateTimePicker,
  UImportaArquivoNovo, FMostraResultados, ComObj, FCadContribAcaoJudicial, FTelaAut,   //edilaine - SIG36752  //WO8602
  CmEventosCadastro, ImgList, wwdblook;

type
  TfrmCadContribNucleoFamiliar = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtCodContrib: TwwDBEdit;
    edtContribuicao: TwwDBEdit;
    DBDateEdit1: TCMDateTimePicker;
    DBDateEdit2: TCMDateTimePicker;
    DBCheckBox1: TDBCheckBox;
    cmbPatro: TwwDBLookupCombo;
    qryContribInserir: TwwQuery;
    qryContribInserirIDCONTRIBUICAO: TFloatField;
    qryContribInserirNOMECONTRIBUICAO: TStringField;
    qryContribInserirDATAINICIO: TDateTimeField;
    qryContribInserirDATAINICIOBENEFBCIARIO: TDateTimeField;
    qryContribInserirIDTPCONTRIBUICAO: TFloatField;
    qryContribInserirDATAFINAL: TDateTimeField;
    qryContribInserirFLGCOBRA: TFloatField;
    qryContribInserirIDPLANPREVCONTAB: TFloatField;
    qryContribInserirIDPESSOA: TFloatField;
    qryContribInserirPLANO: TFloatField;
    qryContribInserirIDPLANOPREV: TFloatField;
    qryContribInserirIDBENEFICIO: TFloatField;
    qryContribInserirNUMEROPROCESSO: TFloatField;
    qryContribInserirIDPESSJUR: TFloatField;
    qryContribInserirIDTITULAR: TFloatField;
    qryContribInserirIDPLANOORIGEM: TFloatField;
    qryContribInserirSEQPROPOSTA: TFloatField;
    pnlImportaArq: TPanel;
    lblNomeArq: TLabel;
    edtNomeArq: TEdit;
    btnProcuraArq: TBitBtn;
    btnValida: TBitBtn;
    sbtnAcaoJud: TToolbarButton97;
    qryAux: TwwQuery;
    odAbreArq: TOpenDialog;
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure cmbPatroExit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure btnProcuraArqClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure btnValidaClick(Sender: TObject);
    procedure sbtnAcaoJudClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    //edilaine - SIG36752 - inicio
    lstValidaArquivo : TStringList;
    vColunasArq  : TArrayStr;
    vColunaTipo  : TArrayTipo;
    vColunaOpcao : TArrayOpcao;
    bPermissaoImporta : boolean;
    bPermissaoAcaoJud : boolean;
    iIdNucleoFamilia  : integer;
    //edilaine - SIG36752 - fim

    procedure AbreQryContribInserir;
    function VerificaPreenchimentoInsert: Boolean;
    procedure FiltraQryContribInserir;
    function MontaFiltraQryContribInserir: string;

    //edilaine - SIG36752 - inicio
    procedure HabilitarImportaArquivo(bHabilita : boolean);
    procedure ValidaArquivo(var iNumFalhas : integer; var vDadosProntos : TArrayImportacao);
    procedure ApagaAcaoJudicial(iIdNucleo, iIdContrib : integer);
    //edilaine - SIG36752 - fim

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContribNucleoFamiliar: TfrmCadContribNucleoFamiliar;

implementation

uses UAdmPrev, UMensErro, UDataBase, Usistema, uCMTypes, DBaseDados,
     uVerificaPreenchimento; //Helio - SOL Nº 253577/18119 PPM Nº 1298783

{$R *.DFM}

procedure TfrmCadContribNucleoFamiliar.CmeCadastroFind(Sender: TObject);
begin

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     iIdNucleoFamilia := StrToInt(MontaSelect.ValoresChave[4]);  //edilaine - SIG36752

     qry.Close;
     qry.ParamByName('IdPessJur').Value        := StrToInt(MontaSelect.ValoresChave[0]);
     qry.ParamByName('IdPlanoPrev').Value      := StrToInt(MontaSelect.ValoresChave[1]);
     qry.ParamByName('IdTitular').Value        := StrToInt(MontaSelect.ValoresChave[2]);
     qry.ParamByName('SeqProposta').Value      := StrToInt(MontaSelect.ValoresChave[3]);
     qry.ParamByName('IdNucleoFamiliar').Value := StrToInt(MontaSelect.ValoresChave[4]);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IdNucleoFamiliar').Value := StrToInt(MontaSelect.ValoresChave[4]);
     qryDet.ParamByName('IDPLANOPREV').Value := StrToInt(MontaSelect.ValoresChave[1]);
     qryDet.Open;
  end;
end;

procedure TfrmCadContribNucleoFamiliar.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
end; // CmeCadastro.Confirma(Self)

procedure TfrmCadContribNucleoFamiliar.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;
  //edilaine - SIG36752 - inicio
  sbtnAcaoJud.enabled := (cmeDetalhe.Operacao in [opVazio, opIdle]) and (bPermissaoAcaoJud);
  //edilaine - SIG36752 - fim
end; // CmeDetalhe.Confirma(Self)



procedure TfrmCadContribNucleoFamiliar.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 25.06.2003

  //edilaine - SIG36752 - inicio
  qryDet.Close;
  qryDet.ParamByName('IdNucleoFamiliar').AsInteger := -1;
  qryDet.ParamByName('IDPLANOPREV').AsInteger      := -1;
  qryDet.Open;
  //edilaine - SIG36752 - fim
end;

procedure TfrmCadContribNucleoFamiliar.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IDRESPNUCLEO').AsString := qry.FieldByName('IDRESPNUCLEO').AsString;
end;

procedure TfrmCadContribNucleoFamiliar.bbtnConfirmarClick(Sender: TObject);
begin
  //inherited;
  Try
  //BRUNO AZEVEDO SOL 141073 Kintana 141073
    If Not Sistema.GravaLogOperacoes(Self.Caption, True) Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

  //BRUNO AZEVEDO SOL 141073 Kintana 141073
  try
    if not(dtmBaseDados.dbBaseDados.InTransaction) Then Begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    If QryDet.UpdatesPending Then Begin
      QryDet.ApplyUpdates;
      QryDet.CommitUpdates;
    End;
    dtmBaseDados.dbBaseDados.Commit;
  except
    if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
      dtmBaseDados.dbBaseDados.Rollback;
    end;
  end;
  //BRUNO AZEVEDO SOL 141073 Kintana 141073

  If CmeCadastro.ConfirmaCadastro Then
  Begin
      if qry.IsEmpty then
         CmeCadastro.Operacao := opVazio
      else
          CmeCadastro.Operacao := opIdle;

      CmeCadastro.AtualizaBotoes(Self);
  End;

end;



procedure TfrmCadContribNucleoFamiliar.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.UsaDistinct := True;

  //edilaine - SIG36752 - inicio
  lstValidaArquivo  := TStringList.create;
  bPermissaoImporta := pnlImportaArq.Enabled;
  bPermissaoAcaoJud := sbtnAcaoJud.Enabled;

  HabilitarImportaArquivo(bPermissaoImporta);
  //edilaine - SIG36752 - fim
end;

procedure TfrmCadContribNucleoFamiliar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //BRUNO AZEVEDO SOL 141073 Kintana 141073
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    dtmBaseDados.dbBaseDados.Rollback;
  end;

  FreeAndNil(lstValidaArquivo) ;         //edilaine - SIG36752

  qryContribInserir.Close; //Helio - SOL Nº 253577/18119 PPM Nº 1298783
end;

procedure TfrmCadContribNucleoFamiliar.qryDetBeforePost(DataSet: TDataSet);
begin
   inherited;
   // Fernando xavier   141073/3661  KINTANA 1128912
   Upd.ModifySQL.Clear;
   if qry.state in [DsEdit] then
      qry.CancelUpdates;
   // fernando Xavier  141073/3661  KINTANA 1128912
end;

//Helio - SOL Nº 253577/18119 PPM Nº 1298783
procedure TfrmCadContribNucleoFamiliar.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  //edilaine - SIG36752 - inicio
  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

  cmbPatro.Top  := edtContribuicao.top;
  cmbPatro.left := edtContribuicao.left;
  //edilaine - SIG36752 fim

  cmbPatro.Visible := True;
  AbreQryContribInserir;
  FiltraQryContribInserir;
  //edtCodContrib.Enabled := True;
  //edtCodContrib.Color := clWhite;
end;

//Helio - SOL Nº 253577/18119 PPM Nº 1298783
procedure TfrmCadContribNucleoFamiliar.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  //edilaine - SIG36752 - inicio
  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;
  //edilaine - SIG36752 - fim

  cmbPatro.Visible := False;
  edtCodContrib.Enabled := False;
  edtCodContrib.Color := clSilver;
end;

//Helio - SOL Nº 253577/18119 PPM Nº 1298783
procedure TfrmCadContribNucleoFamiliar.AbreQryContribInserir;
begin
       qryContribInserir.Close;
       qryContribInserir.ParamByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
       qryContribInserir.ParamByName('IDPESSJUR').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
       qryContribInserir.ParamByName('IDTITULAR').AsInteger := qry.FieldByName('IDTITULAR').AsInteger;
       qryContribInserir.ParamByName('IDPLANOORIGEM').AsInteger := qry.FieldByName('IDPLANOORIGEM').AsInteger;
       qryContribInserir.ParamByName('IDPESSOA').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
       qryContribInserir.ParamByName('SEQPROPOSTA').AsInteger := qry.FieldByName('SEQPROPOSTA').AsInteger;
       qryContribInserir.Open;
end;

//Helio - SOL Nº 253577/18119 PPM Nº 1298783
procedure TfrmCadContribNucleoFamiliar.cmbPatroExit(Sender: TObject);
begin
  inherited;
  if qryDet.State in [DsInsert] then
  begin
    qryDet.FieldByName('IDNUCLEOFAMILIAR').AsInteger := StrToInt(MontaSelect.ValoresChave[4]);

    qryDet.FieldByName('IDCONTRIBUICAO').AsInteger :=
         qryContribInserir.FieldByName('IDCONTRIBUICAO').AsInteger;

    qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger :=
         qryContribInserir.FieldByName('IDPLANPREVCONTAB').AsInteger;

    qryDet.FieldByName('IDPESSOA').AsInteger :=
         qryContribInserir.FieldByName('IDPESSOA').AsInteger;

    qryDet.FieldByName('PLANO').AsString :=
         qryContribInserir.FieldByName('PLANO').AsString;

    qryDet.FieldByName('IDPLANOPREV').AsInteger :=
         qryContribInserir.FieldByName('IDPLANOPREV').AsInteger;

    qryDet.FieldByName('IDBENEFICIO').AsInteger :=
         qryContribInserir.FieldByName('IDBENEFICIO').AsInteger;

    qryDet.FieldByName('NUMEROPROCESSO').AsInteger :=
         qryContribInserir.FieldByName('NUMEROPROCESSO').AsInteger;

    qryDet.FieldByName('IDPESSJUR').AsInteger :=
         qryContribInserir.FieldByName('IDPESSJUR').AsInteger;

    qryDet.FieldByName('IDTITULAR').AsInteger :=
         qryContribInserir.FieldByName('IDTITULAR').AsInteger;

    qryDet.FieldByName('IDPLANOORIGEM').AsInteger :=
         qryContribInserir.FieldByName('IDPLANOORIGEM').AsInteger;

    qryDet.FieldByName('SEQPROPOSTA').AsInteger :=
         qryContribInserir.FieldByName('SEQPROPOSTA').AsInteger;
  end;
end;

//Helio - SOL Nº 253577/18119 PPM Nº 1298783
procedure TfrmCadContribNucleoFamiliar.bbtnOkDetClick(Sender: TObject);
begin
  if qryDet.State in [DsInsert] then
  begin
        if VerificaPreenchimentoInsert then
            inherited;
        FiltraQryContribInserir;
  end else
      inherited;
end;

//Helio - SOL Nº 253577/18119 PPM Nº 1298783
function TfrmCadContribNucleoFamiliar.VerificaPreenchimentoInsert : Boolean;
begin
       
   Result := False;
    
   try
      if Trim(cmbPatro.Text) = '' then
         raise EValidacao.CreateVal('É necessário selecionar uma contribuição.', cmbPatro);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;

end;

//Helio - SOL Nº 253577/18119 PPM Nº 1298783
procedure TfrmCadContribNucleoFamiliar.FiltraQryContribInserir;
var
     filtroQryContribInserir : string;
begin
       filtroQryContribInserir := MontaFiltraQryContribInserir;

       qryContribInserir.Filtered := False;
       if Trim(filtroQryContribInserir) = '' then
           Exit;

       qryContribInserir.Filter   := filtroQryContribInserir;
       qryContribInserir.Filtered := true;
end;

//Helio - SOL Nº 253577/18119 PPM Nº 1298783
function TfrmCadContribNucleoFamiliar.MontaFiltraQryContribInserir : string;
var
    str : String;
begin
       str := '';

       qryDet.DisableControls;

       qryDet.First;
       While Not qryDet.Eof do
       begin
             if str <> '' then
                 str := str + ' AND ';

             str := str +
                    'IDCONTRIBUICAO <> ' +
                    qryDet.FieldByName('IDCONTRIBUICAO').AsString;

             qryDet.Next;
       end;

       qryDet.EnableControls;
       qryDet.Insert;

       Result := str;
end;

//Helio - SOL Nº 253577/18119 PPM Nº 1298783
procedure TfrmCadContribNucleoFamiliar.sbtnExcluiDetClick(Sender: TObject);
var
   iIdNucleo  : integer;     //edilaine - SIG36752
   iIdContrib : integer;     //edilaine - SIG36752
begin
  //edilaine - SIG36752 - inicio
  iIdNucleo  := qryDet.FieldByName('IDNUCLEOFAMILIAR').AsInteger;
  iIdContrib := qryDet.FieldByName('IDCONTRIBUICAO').AsInteger;

  if MsgDlg('Esta Contribuição é obrigatória. Confirma exclusão ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo then
     abort;

  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

  inherited;
  {if MsgDlg('Esta Contribuição é obrigatória. Confirma exclusão ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
  then }
  begin
       ApagaAcaoJudicial(iIdNucleo, iIdContrib);
       bbtnConfirmarClick(bbtnConfirmar);
  end;
  //edilaine - SIG36752 - fim
end;


// edilaine - SIG36752 - inicio
procedure TfrmCadContribNucleoFamiliar.btnProcuraArqClick(Sender: TObject);
begin
  inherited;
  if odAbreArq.Execute then
  begin
    edtNomeArq.text := ExtractFileName( odAbreArq.FileName );

    btnValida.enabled := true;

    btnValidaclick(Sender);
  end;
end;

procedure TfrmCadContribNucleoFamiliar.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  //edilaine - SIG36752 - inicio
  HabilitarImportaArquivo( (cmeCadastro.Operacao in [opVazio, opIdle, opProcurar]) and (bPermissaoImporta) );
  sbtnAcaoJud.enabled := (cmeCadastro.Operacao in [opInserir, opAlterar]) and (bPermissaoAcaoJud);
  //edilaine - SIG36752 - fim
end;

procedure TfrmCadContribNucleoFamiliar.btnValidaClick(Sender: TObject);
var
  vDadosProntos : TArrayImportacao;
  bHabImporta   : boolean;
  iNumFalhas    : integer;
begin

  iNumFalhas := 0;
  setlength(vDadosProntos, 0);

  ValidaArquivo(iNumFalhas, vDadosProntos);

  // inicia a importação
  if lstValidaArquivo.count > 0 then
  begin
    bHabImporta := (iNumFalhas = 0) and (length(vDadosProntos) > 0);
    
    if MostraResultados('Validação e Importação do Arquivo', true, bHabImporta, lstValidaArquivo) = mrOk then
    begin
      if ImportaAcaoJudicial(vDadosProntos, true, taPensionista) then
      begin
        MsgDlg('Arquivo importado com sucesso.', 'Informação', mtInformation, [mbOk], 0);

        setlength(vDadosProntos, 0);
        btnValida.enabled := false;
      end;
    end;
  end;
end;

procedure TfrmCadContribNucleoFamiliar.ValidaArquivo(var iNumFalhas: integer; var vDadosProntos: TArrayImportacao);
var
  Excel         : Variant;
  iLinha, iCol  : integer;
  iIndex        : integer;
  sCampo        : string;
  TipoColuna    : TTipoDado;
  TipoOpcao     : TOpcaoColuna;
  sValor        : string;
  sPreparo      : integer;
  sAnoMesVig    : string;
  bDuplicado    : boolean;
  DadosImportacao : TRecDadosNucleo;
  bErro         : boolean;
  sMensagem     : string;
begin
  inherited;

  if odAbreArq.FileName = '' then
     exit;

  Screen.Cursor := crHourGlass;

  lstValidaArquivo.Clear;

  // definindo numero de colunas do arquivo e cabeçalho
  SetLength(vColunasArq, 8);
  for iCol := Low(vColunasArq) to High(vColunasArq) do
  begin
    case iCol of
      0 : sCampo := 'MATRICULA';
      1 : sCampo := 'IDCONTRIBUICAO';
      2 : sCampo := 'FLGPREPARO';
      3 : sCampo := 'PERCENTUAL';
      4 : sCampo := 'ANOMESINICIO';
      5 : sCampo := 'ANOMESFIM';
      6 : sCampo := 'IDMOTIVO';
      7 : sCampo := 'OBS';
    end;
    vColunasArq[iCol] := sCampo;
  end;

  // definindo o tipo das colunas
  SetLength(vColunaTipo, 8);
  for iCol := Low(vColunaTipo) to High(vColunaTipo) do
  begin
    case iCol of
          0,7 : TipoColuna := tdString;
      1,2,3,6 : TipoColuna := tdInteger;
          4,5 : TipoColuna := tdDate;
    end;
    vColunaTipo[iCol] := TipoColuna;
  end;

  // definindo a obrigatoriedade das colunas
  SetLength(vColunaOpcao, 8);
  for iCol := Low(vColunaOpcao) to High(vColunaOpcao) do
  begin
    case iCol of
      3,5,7: TipoOpcao := ocOpcional;
       else  TipoOpcao := ocObrigatoria;
    end;
    vColunaOpcao[iCol] := TipoOpcao;
  end;

  // Cria o objeto
  Excel := CreateOleObject('Excel.application');
  Excel.Visible := False;
  // Abre o Arquivo
  Excel.WorkBooks.Open(ExpandUNCFileName(odAbreArq.FileName),1);

  // Indica a partir de qual linha começar a pegar os registros
  iLinha := 2;

  try
     // Valida o layout do arquivo excel
     if ValidaLayout(Excel, vColunasArq) then
     begin
       lstValidaArquivo.Add('Resultado Validação do Arquivo de Importação:');
       lstValidaArquivo.Add( edtNomeArq.text );
       lstValidaArquivo.Add('');

       if UltimaLinha(Excel, iLinha, 11, length(vColunasArq)) then
       begin
         lstValidaArquivo.Add('O arquivo selecionado não possui informações.');
         inc(iNumFalhas);
       end
       else
       begin

         while not UltimaLinha(Excel, iLinha, 11, length(vColunasArq)) do
         begin
           //zerando valores
           DadosImportacao.iIdPessoa   := -1;
           DadosImportacao.iIdContrib  := -1;
           DadosImportacao.sPreparo    := '';
           DadosImportacao.iPercentual := -1;
           DadosImportacao.sAnoMesIni  := '';
           DadosImportacao.sAnoMesFim  := '';
           DadosImportacao.iIdMotivo   := -1;
           DadosImportacao.sObservacao := '';
           setlength(DadosImportacao.iIdNucleo, 0);

           // validando o tipo de dado das colunas e preenchimento
           for iCol := Low(vColunasArq) to High(vColunasArq) do
           begin
             case iCol of
                2 : DadosImportacao.sPreparo := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLinha, iCol+1].Value));
                3 : if DadosImportacao.sPreparo = '2' then
                       vColunaOpcao[iCol] := ocObrigatoria
                    else
                       vColunaOpcao[iCol] := ocOpcional;
             end;

             if ValidaDadosColuna(iLinha, iCol+1, Excel, vColunasArq[iCol], vColunaTipo[iCol], vColunaOpcao[iCol], lstValidaArquivo, iNumFalhas) then
             begin

               sValor := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLinha, iCol+1].Value));

               // valida regras especificas do campo
               case iCol of
                 0 : begin
                       // Validando a MATRICULA
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT IDPESSOA FROM DEPENTIT WHERE MATRICULA = ' + QuotedStr(sValor));
                       qryAux.Open;

                       if qryAux.IsEmpty then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': A MATRICULA ' + sValor + ' não foi localizado na base de dados..');
                         inc(iNumFalhas);
                         DadosImportacao.iIdPessoa := -1;
                       end
                       else
                         DadosImportacao.iIdPessoa := qryAux.Fields[0].AsInteger;
                     end;
                 1 : begin
                       // Validando IDCONTRIBUICAO
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT  CPN.IDCONTRIBUICAO, NF.IDNUCLEOFAMILIAR, CPN.IDPLANOPREV ');
                       qryAux.SQL.Add('  FROM DEPENTIT DP ');
                       qryAux.SQL.Add('  JOIN NUCLEOFAMILIAR NF ON NF.IDTITULAR = DP.IDTITULAR ');
                       qryAux.SQL.Add('  JOIN CONTRIBPREVNUCLEO CPN ON CPN.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR ');
                       qryAux.SQL.Add(' WHERE DP.IDPESSOA = '+IntToStr(DadosImportacao.iIdPessoa) );
                       qryAux.SQL.Add('   AND CPN.IDCONTRIBUICAO = '+sValor );
                       qryAux.Open;
                       if qryAux.IsEmpty then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo IDCONTRIBUICAO ' + sValor + ' não foi localizado na base de dados.');
                         inc(iNumFalhas);
                         DadosImportacao.iIdContrib := -1;
                       end
                       else
                         DadosImportacao.iIdContrib := qryAux.Fields[0].AsInteger;

                       while not qryAux.eof do
                       begin
                         // quarda os Nucleos encontrados
                         setlength(DadosImportacao.iIdNucleo, high(DadosImportacao.iIdNucleo)+2);
                         DadosImportacao.iIdNucleo[high(DadosImportacao.iIdNucleo)] := qryAux.Fields[1].AsInteger;
                         qryAux.next;
                       end;
                     end;
                 2 : begin
                       //Validando FLGPREPARO
                       if not (StrToInt(DadosImportacao.sPreparo) in [0, 1, 2]) then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo FLGPREPARO ' + sValor + ' está inconsistente.');
                         inc(iNumFalhas);
                         DadosImportacao.sPreparo := '';
                       end;
                     end;
                 3 : begin
                       //Validando PERCENTUAL
                       DadosImportacao.iPercentual := StrToIntDef(sValor, -1);
                       if (DadosImportacao.iPercentual > 100) then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo PERCENTUAL ' + sValor + ' está inconsistente.');
                         inc(iNumFalhas);
                       end
                       else if (DadosImportacao.sPreparo = '2') and (DadosImportacao.iPercentual = -1) then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo PERCENTUAL é obrigatório.');  // + IIF(sValor='', '<vazio>', sValor)+ ' está inconsistente.');
                         inc(iNumFalhas);
                       end;
                     end;
                 4 : begin
                       //Validando ANOMESINICIO
                       if AcaoJudicialVigentePessoa(DadosImportacao.iIdPessoa, DadosImportacao.iIdContrib, sAnoMesVig) then
                       begin
                         if sAnoMesVig > sValor then
                         begin
                           lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo ANOMESINICIO ' + sValor + ' é menor que a ação vigente.');
                           inc(iNumFalhas);
                           DadosImportacao.sAnoMesIni := '';
                         end
                         else
                            DadosImportacao.sAnoMesIni := sValor;
                       end
                       else
                          DadosImportacao.sAnoMesIni := sValor;
                     end;
                 5 : begin
                       //Validando ANOMESFIM
                       if (sValor <> EmptyStr) and (sValor < DadosImportacao.sAnoMesIni) then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo ANOMESFIM ' + sValor + ' é menor que o campo ANOMESINICIO.');
                         inc(iNumFalhas);
                         DadosImportacao.sAnoMesFim := '';
                       end
                       else
                         DadosImportacao.sAnoMesFim := sValor;
                     end;
                 6 : begin
                       //Validando IDMOTIVO
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT COUNT(IDMOTIVO) FROM MOTIVO WHERE  FLGTIPO = ''P'' AND IDMOTIVO = '+sValor );
                       qryAux.open;

                       if qryAux.Fields[0].AsInteger = 0 then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo IDMOTIVO ' + sValor + ' não foi localizado na base de dados.');
                         inc(iNumFalhas);
                         DadosImportacao.iIdMotivo := -1;
                       end
                       else
                         DadosImportacao.iIdMotivo := StrToInt(sValor);
                     end;
                 7 : begin
                       //Validando OBS
                       DadosImportacao.sObservacao := sValor;
                     end;
               end;
             end;
           end;

           // verifica se dados preenchidos corretamente para importacao
           if (DadosImportacao.iIdPessoa <> -1)   and (DadosImportacao.iIdContrib <> -1)  and
              (DadosImportacao.sPreparo <> '')    and (DadosImportacao.iPercentual <> -1) and
              (DadosImportacao.sAnoMesIni <> '')  and (DadosImportacao.iIdMotivo <> -1)   and
              (DadosImportacao.sObservacao <> '') and (length(DadosImportacao.iIdNucleo) > 0) then
           begin
             bDuplicado := true;
             for iIndex := low(DadosImportacao.iIdNucleo) to high(DadosImportacao.iIdNucleo) do
             begin
               if DadosDuplicados('CONTRIBNUCLEOACJUDDEFICIT', qryAux, DadosImportacao, taPensionista, DadosImportacao.iIdNucleo[iIndex]) then
                  DadosImportacao.iIdNucleo[iIndex] := -1
               else
                  bDuplicado := false;
             end;
             
             if bDuplicado then
                lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': Registro duplicado e não importado.')
             else
             begin
               bErro := DadosDuplicados(DadosImportacao, taPensionista, vDadosProntos);
               if bErro then
                  lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': Registro duplicado e não importado.');
             end;

             bErro := VerificaDataIniValida('CONTRIBNUCLEOACJUDDEFICIT', qryAux, DadosImportacao, taPensionista, vDadosProntos, sMensagem);
             if bErro then
                lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) +': '+sMensagem );


             if (not bDuplicado) and (not bErro) then
             begin
               setlength(vDadosProntos, high(vDadosProntos)+2);

               vDadosProntos[high(vDadosProntos)].iIdPessoa   := DadosImportacao.iIdPessoa;
               vDadosProntos[high(vDadosProntos)].iIdContrib  := DadosImportacao.iIdContrib;
               vDadosProntos[high(vDadosProntos)].iIdNucleo   := DadosImportacao.iIdNucleo;
               vDadosProntos[high(vDadosProntos)].sPreparo    := DadosImportacao.sPreparo;
               vDadosProntos[high(vDadosProntos)].iPercentual := DadosImportacao.iPercentual;
               vDadosProntos[high(vDadosProntos)].sAnoMesIni  := DadosImportacao.sAnoMesIni;
               vDadosProntos[high(vDadosProntos)].sAnoMesFim  := DadosImportacao.sAnoMesFim;
               vDadosProntos[high(vDadosProntos)].iIdMotivo   := DadosImportacao.iIdMotivo;
               vDadosProntos[high(vDadosProntos)].sObservacao := DadosImportacao.sObservacao;
             end
             else
               inc(iNumFalhas);

           end;
           // Contador de linha
           inc(iLinha);
         end;
       end;

       lstValidaArquivo.Add('------------------------------------------------------------------');
       lstValidaArquivo.Add('Total de inconsistências: '+IntToStr(iNumFalhas));

     end
     else
     begin
       MsgDlg('Arquivo não está no formato Excel ou não está com o layout correto.', 'Atenção', mtInformation, [mbOk], 0);
     end;

  finally
     Excel.ActiveWorkBook.Saved:= 1;
     Excel.DisplayAlerts:= 0;
     Excel.ActiveWorkBook.Close(SaveChanges:= 0);
     Excel.Workbooks.Close;
     Excel.Quit;
     Excel := Unassigned;
     Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadContribNucleoFamiliar.HabilitarImportaArquivo(bHabilita: boolean);
begin
  if not bHabilita then
     edtNomeArq.color := clSilver
  else
     edtNomeArq.color := clWhite;

  btnProcuraArq.enabled := bHabilita;
  btnValida.enabled     := bHabilita;
end;

procedure TfrmCadContribNucleoFamiliar.sbtnAcaoJudClick(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

  CadastraAcaoJudicial(qryDet.FieldByName('IDCONTRIBUICAO').AsInteger, iIdNucleoFamilia );

  sbtnAcaoJud.Down := False;

end;

procedure TfrmCadContribNucleoFamiliar.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  sbtnAcaoJud.enabled := false;
end;

procedure TfrmCadContribNucleoFamiliar.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  sbtnAcaoJud.enabled := false;
end;

procedure TfrmCadContribNucleoFamiliar.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  sbtnAcaoJud.enabled := (cmeDetalhe.Operacao in [opVazio, opIdle]) and (bPermissaoAcaoJud);
end;

procedure TfrmCadContribNucleoFamiliar.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  sbtnAcaoJud.enabled :=  (not (qryDet.State in [dsEdit,dsInsert])) and (bPermissaoAcaoJud);
end;

procedure TfrmCadContribNucleoFamiliar.ApagaAcaoJudicial(iIdNucleo, iIdContrib: integer);
begin
  try
    qryAux.close;
    qryAux.SQL.text := 'DELETE FROM CONTRIBNUCLEOACJUDDEFICIT '+
                       ' WHERE IDNUCLEOFAMILIAR = '+IntToStr(iIdNucleo)+
                       '   AND IDCONTRIBUICAO = '+IntToStr(iIdContrib);
    qryAux.ExecSQL;
  except
    MsgDlg('Erro ao excluir ação judicial associada.', 'Atenção', mtError, [mbOk], 0);;
  end;
end;

procedure TfrmCadContribNucleoFamiliar.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.rollback;
end;
//edilaine - SIG36752 - fim


end.

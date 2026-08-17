// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 03/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Rotina    : qryDados / UpdDados
// Autor(a)  : Augusto
// Pendência : 21497
// Data      : 08/02/2006
// Alteração : Acerto no UPDATE e SQL
// -----------------------------------------------------------------------------
// Rotina    : qryBciario
// Autor(a)  : Gleyber
// Pendência : 18623
// Data      : 03/02/2005
// Alteração : Adicionei a condição (FLGSTATUS  = 'P')
//             Alterados também objetos UpdBciario e UpdDados 
// -----------------------------------------------------------------------------
// Rotina    : QRYDADOS
// Autor(a)  : Gleyber
// Pendência : 18590
// Data      : 31/01/2005
// Alteração : Adicionei a condição (FLGSTATUS  = 'P')
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : MontaTela
// Autor(a)  : Leo
// Data      : 09.09.2002
// Alteração : aviso caso seja um benefício retido
// -----------------------------------------------------------------------------
// Rotina    : QRYDADOS
// Autor(a)  : Leo
// Data      : 09.09.2002
// Alteração : troquei de   AND (BB.IDSITBENEFICIO = 1)     para
//                          AND (BB.IDSITBENEFICIO IN (1,2))
// -----------------------------------------------------------------------------
// Rotina    : QRYBCIARIO
// Autor(a)  : Leo
// Data      : 09.09.2002
// Alteração : troquei de   AND (BB.IDSITBENEFICIO = 1)     para
//                          AND (BB.IDSITBENEFICIO IN (1,2))
// -----------------------------------------------------------------------------
// Rotina    : CriaLogOcorrencia
// Autor(a)  : Camille
// Data      : 13.08.2002
// Alteração : Gravação do Lote da Movimentacao de Beneficio
// -----------------------------------------------------------------------------
// Rotina          : dbgBeneficio
// Autor(a)        : Camille
// Data            : 12.08.2002
// Alteração       : acrescentei o nome do beneficiário
// -----------------------------------------------------------------------------
// Rotina          : qryDados
// Autor(a)        : Camille
// Data            : 18.07.2002
// Alteração       : substitui idpessoa que recebe parametros por idtitular
//                   pois nao estava trazendo os beneficiarios
// -----------------------------------------------------------------------------
// Rotina          : Pesquisa por inscrição.
// Autor(a)        : Augusto
// Data            : 15.07.2002
// Alteração       : Atualização do FlgStats e Data de Recebimento (15/07)
// -----------------------------------------------------------------------------
//	Rotina          : Recebimento de Cartas de Recadastramento ( Re-escrito )
//	Autor           : Carlos Gleyber
//	Data de Início	 : 21/12/2001
//	Data de Término :

unit FRecebeRecadastramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls, ComCtrls, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, wwdbedit, Wwdotdot, Wwdbcomb,
  wwdblook, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, MontaSelect;

type
  TfrmRecebeRecadastramento = class(TfrmOkCancelar)
    pnlBottom: TPanel;
    pnlTop: TPanel;
    lblBusca: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtBusca: TEdit;
    edtNomeTitular: TEdit;
    edtNomeBeneficiario: TEdit;
    edtPlano: TEdit;
    pgcDados: TPageControl;
    tbsDados: TTabSheet;
    tbsEnderecos: TTabSheet;
    tbsDocumentos: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbgEnd: TwwDBGrid;
    dbgDoc: TwwDBGrid;
    Label15: TLabel;
    Label16: TLabel;
    dbrSexo: TDBRadioGroup;
    dblkpcmbNaturalidade: TwwDBLookupCombo;
    dbcEstCivil: TwwDBComboBox;
    dbdtNasc: TCMDateTimePicker;
    Label29: TLabel;
    qryDados: TwwQuery;
    msBusca: TMontaSelect;
    qryEnd: TwwQuery;
    dsEnd: TwwDataSource;
    qryDoc: TwwQuery;
    dsDoc: TwwDataSource;
    qryPessoal: TwwQuery;
    dsPessoal: TwwDataSource;
    updPessoal: TUpdateSQL;
    dbeNomeMae: TDBEdit;
    qryEstado: TwwQuery;
    qryPais: TwwQuery;
    dblkpcmbNacionalidade: TwwDBLookupCombo;
    updEnd: TUpdateSQL;
    dblkPais: TwwDBLookupCombo;
    dblkEstado: TwwDBLookupCombo;
    qryCidades: TwwQuery;
    dblkCidades: TwwDBLookupCombo;
    updDoc: TUpdateSQL;
    dbeNomePai: TDBEdit;
    dsDados: TwwDataSource;
    updDados: TUpdateSQL;
    qryEndIDPESSOA: TFloatField;
    qryEndIDENDERECO: TFloatField;
    qryEndLOGRADOURO: TStringField;
    qryEndNUMERO: TStringField;
    qryEndCOMPLEMENTO: TStringField;
    qryEndBAIRRO: TStringField;
    qryEndIDCIDADES: TFloatField;
    qryEndCIDADE: TStringField;
    qryEndCODESTADO: TStringField;
    qryEndIDPAIS: TFloatField;
    qryEndPAIS: TStringField;
    qryEndCEP: TStringField;
    qryEndIDTELEFONE: TFloatField;
    qryEndDDD: TStringField;
    qryEndTELEFONE: TStringField;
    qryDocIDDOCUMENTO: TFloatField;
    qryDocIDPESSOA: TFloatField;
    qryDocNOMEDOCUMENTO: TStringField;
    qryDocNUMDOCUMENTO: TStringField;
    qryDocORGAO: TStringField;
    qryDocUF: TStringField;
    qryDocDATAEMISSAO: TDateTimeField;
    qryPessoalIDPESSOA: TFloatField;
    qryPessoalNOMEPAI: TStringField;
    qryPessoalNOMEMAE: TStringField;
    qryPessoalCODESTADO: TStringField;
    qryPessoalIDPAIS: TFloatField;
    qryPessoalESTCIVIL: TStringField;
    qryPessoalSEXO: TStringField;
    qryPessoalDATANASC: TDateTimeField;
    qryCidadesIDCIDADES: TFloatField;
    qryCidadesNOME: TStringField;
    qryCidadesIDESTADO: TFloatField;
    qryCidadesNOMEESTADO: TStringField;
    qryCidadesUF: TStringField;
    qryCidadesIDPAIS: TFloatField;
    qryCidadesNOMEPAIS: TStringField;
    qryPaisIDPAIS: TFloatField;
    qryPaisNOMENACIONALIDADE: TStringField;
    qryPaisNOMEPAIS: TStringField;
    GroupBox1: TGroupBox;
    dbgBeneficio: TwwDBGrid;
    qryElg: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    qry: TwwQuery;
    FloatField4: TFloatField;
    StringField5: TStringField;
    FloatField5: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField6: TFloatField;
    StringField8: TStringField;
    dsBciario: TDataSource;
    qryBciario: TwwQuery;
    qryBciarioIDPESSJUR: TFloatField;
    qryBciarioIDPLANOPREV: TFloatField;
    qryBciarioIDTITULAR: TFloatField;
    qryBciarioIDSITBENEFICIO: TFloatField;
    qryBciarioSEQPROPOSTA: TFloatField;
    qryBciarioIDPESSOA: TFloatField;
    qryBciarioIDBENEFICIO: TFloatField;
    qryBciarioNUMEROPROCESSO: TFloatField;
    qryBciarioIDREGRABENEFICIA: TFloatField;
    qryBciarioVALORBASE1: TFloatField;
    qryBciarioVALORBASE2: TFloatField;
    qryBciarioVALORBASE3: TFloatField;
    qryBciarioDATAINICIOFUND: TDateTimeField;
    qryBciarioDATAINICIO: TDateTimeField;
    qryBciarioDATAFINAL: TDateTimeField;
    qryBciarioDATAFINALPREVISTA: TDateTimeField;
    qryBciarioDATADEMISSAO: TDateTimeField;
    qryBciarioFLGTIPOINSS: TFloatField;
    qryBciarioVALORATUAL: TFloatField;
    qryBciarioVALORTOTAL: TFloatField;
    qryBciarioVALORCOTAS: TFloatField;
    qryBciarioFLGDATAPREVISTA: TFloatField;
    updBciario: TUpdateSQL;
    qryDadosIDTITULAR: TFloatField;
    qryDadosTITULAR: TStringField;
    qryDadosIDPESSOA: TFloatField;
    qryDadosBENEFICIARIO: TStringField;
    qryDadosIDPLANOPREV: TFloatField;
    qryDadosNOMEPLANO: TStringField;
    qryDadosIDBENEFICIO: TFloatField;
    qryDadosBENEFICIO: TStringField;
    qryDadosDATAINICIO: TDateTimeField;
    qryDadosDATAFINAL: TDateTimeField;
    qryDadosVALORATUAL: TFloatField;
    qryDadosBANCOINSS: TStringField;
    qryDadosNUMPROCINSS: TStringField;
    qryDadosMESRECIBOINSS: TFloatField;
    qryDadosANORECIBOINSS: TFloatField;
    qryDadosNUMEROPROCESSO: TFloatField;
    qryDadosFLGSTATUS: TStringField;
    qryDadosIDPESSJUR: TFloatField;
    qryDadosPLANO: TFloatField;
    qryDadosIDRGELEGBENEF: TFloatField;
    qryDadosSEQPROPOSTA: TFloatField;
    qryDadosVALORTOTAL: TFloatField;
    qryDadosVALORCOTAS: TFloatField;
    qryDadosIDSITBENEFICIO: TFloatField;
    Label4: TLabel;
    EdInscricao: TEdit;
    QryAuxiliar: TwwQuery;
    qryDadosNUMCARTARECAD: TStringField;
    qryDadosDATARECEBRECAD: TDateTimeField;
    qryDadosDATAEMISSAORECAD: TDateTimeField;
    qryDadosDATALIMITERECAD: TDateTimeField;
    qryDadosDESCSITBENEFICIO: TStringField;
    qryDadosIDPLANOORIGEM: TFloatField;
    procedure FormPaint(Sender: TObject);
    procedure edtBuscaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MontaTela;
    procedure FechaTela;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbdtNascExit(Sender: TObject);
    procedure dbeNomePaiExit(Sender: TObject);
    procedure dbgEndColExit(Sender: TObject);
    procedure dbgDocColExit(Sender: TObject);
    procedure dblkPaisExit(Sender: TObject);
    procedure dblkEstadoExit(Sender: TObject);
    procedure dblkCidadesExit(Sender: TObject);
    procedure dbgBeneficioCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgBeneficioColExit(Sender: TObject);
    procedure ModificaGridBeneficio(sCampo : String; sValor : String);
    procedure dbcEstCivilChange(Sender: TObject);
    procedure EdInscricaoExit(Sender: TObject);
  private
    { Private declarations }
    qryAux     : TQuery;            
    sSql       : String;            
    iIdPessoa  : Integer;           
    procedure RodaRegraElegibilidade(sCampo, sMotivo : String); 
  public
    { Public declarations }
  end;

var
  frmRecebeRecadastramento: TfrmRecebeRecadastramento;

implementation

{$R *.DFM}

Uses
  USistema, UMensErro, UDatabase, DBaseDados, UBeneficio, fAguarde, DAPrev,
  UFuncoesUteis, UAdmPrev;

procedure TfrmRecebeRecadastramento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
(* Rotina que troca o TAB por ENTER adaptada para componente INFOPOWER *)
  if Key = #13 then
   if not (ActiveControl is TwwDBGrid) then
    begin
     Key := #0;
     Perform(WM_NEXTDLGCTL, 0, 0);
    end
   else if (ActiveControl is TwwDBGrid) then
    with TwwDBGrid(ActiveControl) do
    if selectedindex < (fieldcount -1) then
       selectedindex := selectedindex +1
    else selectedindex := 0;
end;

procedure TfrmRecebeRecadastramento.FormPaint(Sender: TObject);
begin
  inherited;
  WindowState:=wsMaximized;
end;

procedure TfrmRecebeRecadastramento.FormShow(Sender: TObject);
begin
  inherited;
// Uso e configuração da query auxiliar
  qryAux:= TQuery.Create(Self);
  qryAux.DatabaseName:='BaseDados';
// Utiliza variavel para escrever a query para buscar tipo de busca
  sSql:='SELECT FLGCPOBUSCA, TIPODOCBUSCA'+#13+#10+
        'FROM PARAMAPREV';
// Limpa e executa a query
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;
// Verifica resultado para acertar o label de busca
  If qryAux.FieldByName('FLGCPOBUSCA').AsInteger = 0 Then
    lblBusca.Caption:='Pesquisar Matrícula'
  Else Begin
// Utiliza variavel para escrever a query para buscar documento escolhido
    sSql:='SELECT IDDOCUMENTO, NOMEDOCUMENTO'+#13+#10+
          'FROM TIPODOCPESSOA'+#13+#10+
          'WHERE IDDOCUMENTO='+qryDados.FieldByName('TIPODOCBUSCA').AsString;
// Limpa e executa a query
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSql);
    qryAux.Open;
// Acerta o label de busca para documento
    lblBusca.Caption:=qryDados.FieldByName('NOMEDOCUMENTO').AsString;
  End;
  edtBusca.SetFocus;
  pgcDados.ActivePageIndex:=0;
  msBusca.Filtro.Add('EL.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 25.06.2003
end;

procedure TfrmRecebeRecadastramento.edtBuscaExit(Sender: TObject);
begin
  inherited;
  If Trim(edtBusca.Text) = '' Then Exit;
  iIdPessoa:=0;
// Verifica se o foco não está nem no botão sair ou cancelar
  if (ActiveControl.Name <> 'bbtnSair') and (ActiveControl.Name <> 'bbtnCancelar') then
   Begin
// Se a busca for matrícula
   if edtBusca.Text <> '' Then
    if lblBusca.Caption = 'Pesquisar Matrícula'
     Then
      Begin
// Utiliza variavel para escrever a query para buscar matrícula digitada

      sSql:='SELECT PARTPREVPLAN.IDPESSOA, PARTPREVPLAN.INSCRICAONUMERO  '+
             'FROM PARTPREVPLAN, ELEGPATRO '+
             'WHERE ELEGPATRO.MATRICULA = '+QuotedStr(Trim(edtBusca.Text))+' AND '+
             '      ELEGPATRO.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+') AND '+ // CAMILLE - 25.06.2003
             '      PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR AND'+
             '      PARTPREVPLAN.IDPESSOA  = ELEGPATRO.IDPESSOA     '+
             'ORDER BY ELEGPATRO.DATAADMISSAO DESC';


// Limpa e executa a query
       qryAux.SQL.Clear;
       qryAux.SQL.Add(sSql);
       qryAux.Open;
       iIdPessoa:=qryAux.FieldByName('IDPESSOA').AsInteger;
       EdInscricao.Text := QryAux.Fieldbyname('INSCRICAONUMERO').AsString;
       MontaTela;
      End
// Se a busca não for matrícula
     Else
      Begin
// Utiliza variavel para escrever a query para buscar o tipo de documento a buscar
       sSql:='SELECT TIPODOCBUSCA'+#13+#10+
             'FROM PARAMAPREV';
// Limpa e executa a query
       qryAux.SQL.Clear;
       qryAux.SQL.Add(sSql);
       qryAux.Open;
// Utiliza variavel para escrever a query para buscar documento digitado
       sSql:='SELECT IDPESSOA'+#13+#10+
             'FROM DOCPESSOA'+#13+#10+
             'WHERE IDDOCUMENTO = '+ qryAux.FieldByName('TIPODOCBUSCA').AsString +#13+#10+
             'AND NUMDOCUMENO = '''+edtBusca.Text+'''';
// Limpa e executa a query
       qryAux.SQL.Clear;
       qryAux.SQL.Add(sSql);
       qryAux.Open;
       iIdPessoa:=qryAux.FieldByName('IDPESSOA').AsInteger;
       MontaTela;
      End
   Else
     Begin
// Executa MONTASELECT
      msBusca.Executar;
      if msBusca.RetornouValor
       Then
        Begin
         iIdPessoa:=StrToInt(msBusca.ValoresChave[0]);
         MontaTela;
        End;
     End;
     dbgBeneficio.SetFocus;
     dbgBeneficio.SelectedIndex := 4;
   End;
end;

procedure TfrmRecebeRecadastramento.MontaTela;
Var
 I : Integer;
begin
// Abre query de dados
  qryDados.Close;
  qryDados.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
  qryDados.Open;

  
  //testa se situação é retido
  if qrydados.fieldbyname('IDSITBENEFICIO').AsString = '2' then
  begin
     if MsgDlg('Este benefício está retido. Deseja continuar?', 'Confirmação',
               mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     begin
        bbtnCancelarClick(self);
        exit;
     end;
  end;
  


// Se não tiver benefício ativo aborta, fecha a tela e avisa ao usuário
  If qryDados.RecordCount = 0 Then
   Begin
    ShowMessage('Este participante não possui benefício ativo.');
    FechaTela;
    edtBusca.SetFocus;
    edtBusca.Text    := '';
    EdInscricao.Text := '';
    Exit;
   End;
// Abre query de dados
  qryPessoal.Close;
  qryPessoal.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
  qryPessoal.Open;
// Abre query de endereço
  qryEnd.Close;
  qryEnd.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
  qryEnd.Open;
// Abre query de Documento
  qryDoc.Close;
  qryDoc.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
  qryDoc.Open;
// Abre query Estado, Pais e Cidades
  qryEstado.Close;
  qryPais.Close;
  qryCidades.Close;
  qryEstado.Open;
  qryPais.Open;
  qryCidades.Open;
// Abre a query de benefícios / beneficiário
  qryBciario.Close;
  qryBciario.ParamByName('IDPESSJUR').Value   := qryDadosIDPESSJUR.AsInteger;
  qryBciario.ParamByName('IDPLANOPREV').Value := qryDadosIDPLANOPREV.AsInteger;
  qryBciario.ParamByName('IDTITULAR').Value   := qryDadosIDTITULAR.AsInteger;
  qryBciario.ParamByName('SEQPROPOSTA').Value := qryDadosSEQPROPOSTA.AsInteger;
  qryBciario.Open;
// Escreve o conteudo da query nos edit box's
  edtNomeTitular.Text      := qryDadosTITULAR.AsString;
  edtNomeBeneficiario.Text := qryDadosBENEFICIARIO.AsString;
  edtPlano.Text            := qryDadosNOMEPLANO.AsString;
end;

procedure TfrmRecebeRecadastramento.FechaTela;
begin
// fecha as queries e volta a tela ao estado inicial
  pgcDados.ActivePageIndex:=0;
  qryDados.Close;
// query de dados
  qryPessoal.Close;
// query de endereço
  qryEnd.Close;
// query de Documento
  qryDoc.Close;
// query Estado
  qryEstado.Close;
// query Pais
  qryPais.Close;
// query Cidades
  qryCidades.Close;
// Limpa o conteudo dos edit box's
  edtNomeTitular.Text      := '';
  edtNomeBeneficiario.Text := '';
  edtPlano.Text            := '';
  edtBusca.Text            := '';
// Acerta o foco
  edtBusca.SetFocus;
end;

procedure TfrmRecebeRecadastramento.bbtnConfirmarClick(Sender: TObject);
begin
   
   // Grava Alterações na tabela BENEFBFCIARIO
   qryDados.Edit;
   // Tira o status de pendência da benefbfciario
   qryDadosFLGSTATUS.AsString    :='N';
   qryDadosDATARECEBRECAD.AsDateTime := Date;
   qryDados.Post;
   

// Grava Alterações na tabela PESSOAFISICA
   If qryPessoal.State in [dsEdit]
    Then qryPessoal.Post;
// Grava Alterações dos benefícios
   If qryBciario.State in [dsEdit]
    Then qryBciario.Post;
// Grava Alterações na tabela ENDPESS
   If qryEnd.State in [dsEdit] Then
    Begin
     qryEnd.Post;
(*    Para gravar na tabela TELENDPESS foi necessário escrever uma query para fazer um  *)
(*    update, pois não é possível fazer um updatesql com duas ou mais tabelas           *)
     sSql:='UPDATE TELENDPESS'+#13+#10+
           'SET DDD = '''+dbgEnd.Fields[8].AsString+''','+#13+#10+
           '    NUMERO = '''+dbgEnd.Fields[9].AsString+''''+#13+#10+
           'WHERE IDTELEFONE = '+qryEnd.FieldByName('IDTELEFONE').AsString+' AND'+#13+#10+
           '      IDENDERECO = '+qryEnd.FieldByName('IDENDERECO').AsString;
// Limpa e executa a query
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     qryAux.ExecSql;
    End;
// Grava Alterações na tabela DOCUMENTO
   If qryDoc.State in [dsEdit]
    Then qryDoc.Post;
// Aplica as alterações
   AplicaAlteracoes([qryDados,qryPessoal,qryEnd,qryDoc,qryBciario]);

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

// Retorna a tela ao seu estado inicial
   FechaTela;
  inherited;
end;

procedure TfrmRecebeRecadastramento.bbtnCancelarClick(Sender: TObject);
begin
  if MsgDlg('Deseja realmente cancelar as modificações efetuadas?', 'Confirmação',
  mtConfirmation, [mbYes, mbNo], 0) = mrNo then Abort;
// Cancela Alterações na tabela BENEFBFCIARIO
  If qryDados.State in [dsEdit]
   Then qryDados.Cancel;
// Cancela Alterações na tabela PESSOAFISICA
  If qryPessoal.State in [dsEdit]
   Then qryPessoal.Cancel;
// Cancela Alterações na tabela ENDPESS
  If qryEnd.State in [dsEdit]
   Then qryEnd.Cancel;
// Grava Alterações na tabela DOCUMENTO
  If qryDoc.State in [dsEdit]
   Then qryDoc.Cancel;
// Retorna a tela ao seu estado inicial
  FechaTela;
  inherited;
end;

procedure TfrmRecebeRecadastramento.dbdtNascExit(Sender: TObject);
begin
  inherited;
  pgcDados.ActivePageIndex:=1;
  dbgEnd.SetFocus;
end;

procedure TfrmRecebeRecadastramento.dbeNomePaiExit(Sender: TObject);
begin
  inherited;
  dbeNomeMae.SetFocus;
end;

procedure TfrmRecebeRecadastramento.dbgEndColExit(Sender: TObject);
begin
  inherited;
  if dbgEnd.SelectedField.FieldName = 'TELEFONE' Then
   Begin
    pgcDados.ActivePageIndex:=2;
    dbgDoc.SetFocus;
   End;
end;

procedure TfrmRecebeRecadastramento.dbgDocColExit(Sender: TObject);
begin
  inherited;
  if dbgDoc.SelectedField.FieldName = 'DATAEMISSAO'
   Then bbtnConfirmar.SetFocus;
end;

procedure TfrmRecebeRecadastramento.dblkPaisExit(Sender: TObject);
begin
  inherited;
  If qryEndIDPAIS.AsInteger <> qryPaisIDPAIS.AsInteger
   Then
//   País escolhido é diferente da sequencia Cidade - UF
    Begin
     qryEndCIDADE.AsString    := '';
     qryEndCODESTADO.AsString := '';
    End
   Else
//   País escolhido é idêntico da sequencia Cidade - UF
    Begin
     qryEndIDPAIS.AsString      := qryCidadesIDPAIS.AsString;
     qryEndPAIS.AsString        := qryCidadesNOMEPAIS.AsString;
     dblkPais.Text              := qryCidadesNOMEPAIS.AsString;
    End;
// Foco para próxima célula ativa
  dbgEnd.SelectedField.Value := dblkPais.DisplayValue;
  dbgEnd.SetFocus;
  dbgEnd.SelectedIndex:=7;

end;

procedure TfrmRecebeRecadastramento.dblkEstadoExit(Sender: TObject);
begin
  inherited;
// Foco para próxima célula ativa
  dbgEnd.SetFocus;
  dbgEnd.SelectedIndex:=6;
end;

procedure TfrmRecebeRecadastramento.dblkCidadesExit(Sender: TObject);
begin
  inherited;
//  A partir da cidade escolhida, é alterado para a UF e País correspondente
  dbgEnd.SelectedField.Value := dblkCidades.DisplayValue;
  qryEndCODESTADO.AsString   := qryCidadesUF.AsString;
  qryEndIDPAIS.AsString      := qryCidadesIDPAIS.AsString;
  qryEndPAIS.AsString        := qryCidadesNOMEPAIS.AsString;
// Foco para próxima célula ativa
  dbgEnd.SetFocus;
  dbgEnd.SelectedIndex      := 5;
end;

procedure TfrmRecebeRecadastramento.dbgBeneficioCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if (Field.FieldName = 'BENEFICIO') or
     (Field.FieldName = 'DATAINICIO') or
     (Field.FieldName = 'DATAFINAL') or
     (Field.FieldName = 'VALORATUAL')
   Then
    Begin
     ABrush.Color := clInactiveCaption;
     AFont.Color  := clWhite;
     AFont.Style  := [fsBold];
    End;
end;

procedure TfrmRecebeRecadastramento.dbgBeneficioColExit(Sender: TObject);
Var
 sNewValor : String;
begin
  inherited;

  sNewValor := dbgBeneficio.SelectedField.AsString;
  If dbgBeneficio.SelectedField.Name  = 'qryDadosBANCOINSS' Then
   Begin
    if qryDados.State = dsEdit
     Then ModificaGridBeneficio('BANCOINSS',sNewValor);
    dbgBeneficio.SetFocus;
    dbgBeneficio.SelectedIndex := 5;
    Abort;
   End;

  If dbgBeneficio.SelectedField.Name = 'qryDadosNUMPROCINSS' Then
   Begin
    if qryDados.State = dsEdit
     Then ModificaGridBeneficio('NUMPROCINSS',sNewValor);
    dbgBeneficio.SetFocus;
    dbgBeneficio.SelectedIndex := 6;
    Abort;
   End;

  If dbgBeneficio.SelectedField.Name = 'qryDadosMESRECIBOINSS' Then
   Begin
    if qryDados.State = dsEdit
     Then ModificaGridBeneficio('MESRECIBOINSS',sNewValor);
    dbgBeneficio.SetFocus;
    dbgBeneficio.SelectedIndex := 7;
    Abort;
   End;

  If dbgBeneficio.SelectedField.Name = 'qryDadosANORECIBOINSS' Then
   Begin
    if qryDados.State = dsEdit
     Then ModificaGridBeneficio('ANORECIBOINSS',sNewValor);
    pgcDados.ActivePageIndex:=0;
    dbeNomePai.SetFocus;
    Abort;
   End;
end;

procedure TfrmRecebeRecadastramento.ModificaGridBeneficio(sCampo,
  sValor: String);
begin
  dbgBeneficio.DataSource:=Nil;
  qryDados.First;
  While Not qryDados.Eof do
   Begin
    qryDados.Edit;
    qryDados.FieldByName(sCampo).AsString:=sValor;
    qryDados.Next;
   End;
  qryDados.First;
  dbgBeneficio.DataSource:=dsDados;
end;

procedure TfrmRecebeRecadastramento.RodaRegraElegibilidade(sCampo,
  sMotivo: String);
var
  bElegivel,
  bOk,
  bErro     : boolean;
  sMsgErro,
  sData     : string;
begin
// Mostra a mensagem da verificação da regra de elegibilidade
  frmAguarde.Mostra('Verificando Elegibilidade Benefício ...');

//  Verifica se há benefício ativo
  
  If (qryBciario.Active) and (qryBciario.RecordCount > 0) Then
//  Se houver roda regra de elegiblidade
    With qryBciario do
     Begin
      While not Eof do
       Begin
        bOk := ExecutaRegraElegibilidadeBfciario(dtmAPrev.qry,
                                                 FieldByName('IDREGRABENEFICIA').AsInteger,
                                                 FieldByName('IDPESSJUR').AsInteger,
                                                 FieldByName('IDPLANOPREV').AsInteger,
                                                 FieldByName('IDTITULAR').AsInteger,
                                                 FieldByName('IDPESSOA').AsInteger,
                                                 FieldByName('SEQPROPOSTA').AsInteger,
                                                 FieldByName('IDBENEFICIO').AsInteger,
                                                 FieldByName('VALORBASE1').AsFloat,
                                                 FieldByName('VALORBASE2').AsFloat,
                                                 FieldByName('VALORBASE3').AsFloat,
                                                 FieldByName('DATAINICIOFUND').AsString,
                                                 FieldByName('DATAINICIO').AsString,
                                                 FieldByName('DATADEMISSAO').AsString,
                                                 bErro,
                                                 sMsgErro,
                                                 FieldByName('FLGTIPOINSS').AsInteger);
//
//      Se não for elegível
//
        If (Not bOk) Then
         Begin
//
//        Suspende o benefício
//
          Edit;
          FieldByName('IDSITBENEFICIO').AsInteger := 2;
          FieldByName('DATAFINALPREVISTA').AsDateTime := Date;
          Post;
//
//        Gera o log
//
          If FieldByName('FLGDATAPREVISTA').AsInteger = 0
           Then sData := FieldByName('DATAFINAL').AsString
           Else sData := FieldByName('DATAFINALPREVISTA').AsString;

          CriaLogOcorrencia(qryDadosIDPLANOPREV.AsString,
                            qryDadosIDPESSJUR.AsString,
                            qryDadosIDTITULAR.AsString,
                            FieldByName('IDBENEFICIO').AsString,
                            FieldByName('NUMEROPROCESSO').AsString,
                            qryDadosIDPESSOA.AsString,
                            qryDadosSEQPROPOSTA.AsString,
                            '3',   // TIPO = RETENÇÃO
                            DateToStr(Date),
                            FieldByName('VALORATUAL').AsString,
                            FieldByName('VALORTOTAL').AsString,
                            FieldByName('VALORCOTAS').AsString,
                            FieldByName('DATAINICIO').AsString,
                            sData,
                            FieldByName('VALORATUAL').AsString,
                            FieldByName('DATAINICIO').AsString,
                            sData,
                            FieldByName('IDSITBENEFICIO').AsString,
                            0,
                            qry,
                            sMotivo,
                            -1,
                            iIdCalculoGeral
                            );

         End;
        Next;
       End;
     End;

// Apaga mensagem
  frmAguarde.Apaga;
end;

procedure TfrmRecebeRecadastramento.dbcEstCivilChange(Sender: TObject);
Var
 bErro,
 BoK       : Boolean;
 sMsgErro  : String;
 iPont     : Integer;
begin
  inherited;

// Roda a Regra de Elegibilidade
  RodaRegraElegibilidade('Estado Civil','4');
end;

procedure TfrmRecebeRecadastramento.EdInscricaoExit(Sender: TObject);
begin
  inherited;
  iIdPessoa := 0;
  If Trim(EdInscricao.Text) = '' Then Exit;
  { Verifica origem da chamada }
  if (ActiveControl.Name <> 'bbtnSair') and
     (ActiveControl.Name <> 'bbtnCancelar')
  then begin

      { Utiliza variavel para escrever a query para buscar matrícula digitada }
      sSql:='SELECT PARTPREVPLAN.IDPESSOA, ELEGPATRO.MATRICULA '+
            'FROM PARTPREVPLAN, ELEGPATRO '+
            'WHERE PARTPREVPLAN.INSCRICAONUMERO = '+QuotedStr(Trim(EdInscricao.Text))+' AND '+
            '      PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+') AND '+ // CAMILLE - 25.06.2003
            '      PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR AND '+
            '      PARTPREVPLAN.IDPESSOA  = ELEGPATRO.IDPESSOA      '+
            'ORDER BY PARTPREVPLAN.INSCRICAODATA DESC ';
      QryAuxiliar.SQL.Clear;
      QryAuxiliar.SQL.Add(sSql);
      QryAuxiliar.Open;

      iIdPessoa := QryAuxiliar.FieldByName('IDPESSOA').AsInteger;
      MontaTela;
      edtBusca.Text := QryAuxiliar.FieldByName('MATRICULA').AsString;



     dbgBeneficio.SetFocus;
     dbgBeneficio.SelectedIndex := 4;
   End;
end;

end.

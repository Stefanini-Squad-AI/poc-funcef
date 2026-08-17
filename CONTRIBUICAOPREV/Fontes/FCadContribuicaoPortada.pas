Unit FCadContribuicaoPortada;
// Alterações:
{ -------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Nº WO             : WO11235
//Data da Alteração : 12/06/2024
//Alteração Form    : -
//Responsável       : Helen V Bianchi
//Descrição         : Retirado a obrigatoriedade Data Opção de IR/REGRESSIVO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Nº SIG            : 131206
//Data da Alteração : 03/02/2023
//Alteração Form    : Inclusão do tipo de hostorico para o campo flagdevolucao
//Responsável       : Leandro Pocebon
//Descrição         : Tratamento para testar e flagdevolucao é permitir valor esperado negativo
                      Novos campos idcontribuicao e flgdevolucao no arquivo de importação
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Nº SIG            : 85342
//Data da Alteração : 26/04/2019
//Alteração Form    : Não houve
//Responsável       : Darivaldo Alencar
//Descrição         : Inclusão de campo IDTITULAR no INSERT da tabela HSTCONTRIBPREV
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Nº SOL            : 208796
//Nº KINTANA        : 2017611
//Data da Alteração : 06/01/2015
//Alteração Form    : Inclusão de componentes no dfm, criação das funções no form
//Responsável       : William Santana
//Descrição         : criação de opção para importar arquivo excel
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Autor(a)       :  Felipe Azevedo dos Santos
// Data           :  12/03/2013
// Pendência      :  SOL 185758 KTN 1743062
// Descricao      :  Inclusão da busca de entidadeorigem, alteração nas rotinas :
                     insereportabilidade, alteraportabilidade. os campos
                     nome, cnpj, tipo e cnpbsusep não serão mais gravados na
                     tabela de portabilidadeprev. Alteração na consulta principal
                     relacionando portabilidadeprev com entidadeorigem.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Autor(a)       :  Otacilio Aquino
// Data           :  09/07/2012
// Pendência      :  SOL 184328 KINTANA 1724777
// Descricao      :  Inconsistência na gravação da data no campo: Data Opção IR Reg
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Autor(a)       :  Wylliam Leite da Silva
// Data           :  12/01/2012
// Pendência      :  SOL 1541516 KINTANA 171495
// Descricao      :  Foi efetuado a alteração na opção IR Regressivo e Progressivo
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Autor(a)       :  Vinicius Ferreira - Bruno Azevedo
// Data           :  26/14/2011
// Pendência      :  SOL 151400 KINTANA 1109408
// Descricao      :   Alteração qryDet, Inclusão Data Opção IR Regressivo
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Autor(a)       :  Vinicius Ferreira - Bruno Azevedo
// Data           :  26/14/2011
// Pendência      :  SOL 151400 KINTANA 1109408
// Descricao      :   Alteração qryDet, Inclusão Data Opção IR Regressivo
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Autor(a)       :  Fernando Xavier
// Data           :  22/11/2010
// Pendência      :  SOL 137378 Kintana 834829
// Descricao      :   alimentação das reservas portadas
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Autor(a)       :  Fernando Santana
// Data           :  21/06/2010
// Pendência      :  SOL 137628 Kintana 834745
// Descricao      :  erro na procedure ValidaCamposHistorico ao validar o campo EdtValorEsperado
//                        Almentar o tamanho do campo edtcnpb para 20 caracteres.
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
}
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
   MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
   StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   TabControlDetalhe, ExtCtrls, DBGrids, DBCtrls, Mask, uCMTypes, UDataBase,
   TREdit, wwdbdatetimepicker, CMDateTimePicker, ComObj;

Type
   TfrmCadContribuicaoPortada = Class(TfrmCadMestreDetalheCS)
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      GroupBox1: TGroupBox;
      Label13: TLabel;
      Label14: TLabel;
      Label15: TLabel;
      Label16: TLabel;
      GroupBox4: TGroupBox;
      DtDataRecebimento: TDateTimePicker;
      Label17: TLabel;
      Label18: TLabel;
      Label19: TLabel;
      DBGrid1: TDBGrid;
      Label20: TLabel;
      LblParticipante: TLabel;
      LblMatricula: TLabel;
      LblInscricao: TLabel;
      LblPatrocinadora: TLabel;
      LblPlanoPrevidenciario: TLabel;
      LblContribuicao: TLabel;
      QryPortabilidade: TQuery;
      DsPortabilidade: TDataSource;
      UpdPortabilidade: TUpdateSQL;
      edtentidade: TEdit;
      GroupBox2: TGroupBox;
      RbAberta: TRadioButton;
      RbFechada: TRadioButton;
      edtcnpb: TEdit;
      GroupBox3: TGroupBox;
      RbRegressivo: TRadioButton;
      RbProgressivo: TRadioButton;
      edtanos: TEdit;
      edtmeses: TEdit;
      edtempomeses: TEdit;
      QryDet: TQuery;
      dbgrdDetIButton: TwwIButton;
      GroupBox5: TGroupBox;
      GroupBox6: TGroupBox;
      EdtAnoReferencia: TEdit;
      EdtMesReferencia: TEdit;
      EdtAnoCobranca: TEdit;
      EdtMesCobranca: TEdit;
      Label21: TLabel;
      Label22: TLabel;
      Label23: TLabel;
      Label24: TLabel;
      EdtValorEsperado: TRealEdit;
      GroupBox7: TGroupBox;
      RbBancaria: TRadioButton;
      GroupBox8: TGroupBox;
      RbNaoEnviado: TRadioButton;
      GroupBox9: TGroupBox;
      RbMotivo: TRadioButton;
      GroupBox10: TGroupBox;
      RbCodForma: TRadioButton;
      edtdataprevisao: TEdit;
      QryAux: TwwQuery;
      QryAux1: TwwQuery;
      MskCNPJ: TMaskEdit;
    QryMesEntreData: TwwQuery;
    QryMesEntreDataqtdeanos: TFloatField;
    QryMesEntreDatameses: TFloatField;
    dtDatainicio: TCMDateTimePicker;
    Label26: TLabel;
    dtDatafim: TCMDateTimePicker;
    Label25: TLabel;
    DtDataOpcaoIrReg: TCMDateTimePicker;
    Label27: TLabel;
    MontaEntidadeOrigem: TMontaSelect;
    sbtnProcurarEntidade: TToolbarButton97;
    lblImportaArquivo: TLabel;
    edtImportaArquivo: TEdit;
    btnImportaArquivo: TToolbarButton97;
    Dialog: TOpenDialog;
    tbsLog: TTabSheet;
    mmoLog: TMemo;
    rgDevolucao: TRadioGroup;
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure qryAfterScroll(DataSet: TDataSet);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure QryPortabilidadeAfterScroll(DataSet: TDataSet);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      Procedure DBGrid1KeyUp(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure edtanosExit(Sender: TObject);
      Procedure edtmesesExit(Sender: TObject);
      Procedure edtcnpjKeyPress(Sender: TObject; Var Key: Char);
      Procedure edtcnpbKeyPress(Sender: TObject; Var Key: Char);
      Procedure edtanosKeyPress(Sender: TObject; Var Key: Char);
      Procedure edtmesesKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure sbtnInsDetClick(Sender: TObject);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure sbtnAltDetClick(Sender: TObject);
      Procedure sbtnExcluiDetClick(Sender: TObject);
      Procedure bbtnCancelarDetClick(Sender: TObject);
      Procedure bbtnVoltarDetClick(Sender: TObject);
      Procedure QryDetAfterScroll(DataSet: TDataSet);
      Procedure edtcnpjChange(Sender: TObject);
    procedure EdtAnoReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMesReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMesReferenciaExit(Sender: TObject);
    procedure EdtAnoReferenciaChange(Sender: TObject);
    procedure dtDatainicioExit(Sender: TObject);
    procedure dtDatafimExit(Sender: TObject);
    procedure RbRegressivoClick(Sender: TObject);
    procedure RbProgressivoClick(Sender: TObject);
    procedure QryDetAfterOpen(DataSet: TDataSet);
    procedure sbtnProcurarEntidadeMouseExit(Sender: TObject);
    procedure sbtnProcurarEntidadeClick(Sender: TObject);
    procedure btnImportaArquivoClick(Sender: TObject);
    procedure rgDevolucaoClick(Sender: TObject);
   
   Private
      { Private declarations }
      bInsere: Boolean;
      bAltera: Boolean;
      bExclui: Boolean;
      bInsereHistorico: boolean;
      bAlteraHistorico: Boolean;
      bExcluiHistorico: Boolean;
      Function PortabilidadeTemHistorico(idportabilidade: integer): boolean;
      Function ExcluiPortabilidade: boolean;
      Function AlteraPortabilidade: boolean;
      Function InserePortabilidade: boolean;
      Function InsereHistorico: Boolean;
      Function AlteraHistorico: Boolean;
      Function ExcluiHistorico: Boolean;
      Procedure CalculaTempoTotalVinculo;
      Procedure HabPortabidade(bValor: Boolean);
      Function ValicaCampoObrigatoriosPortabilidade: Boolean;
      Procedure CarregaHistorico;
      Procedure CarregaCamposHistorico;
      Procedure LimpaCamposHistorico;
      Function ValidaCamposHistorico: boolean;
      Function SituacaoParticipante(IdSitPart: integer): String;
      Function TiraPonto(Value: String): String;
      Function ContribuicaoRecebida: boolean;
      Function ContribuicaoRecebidaEnviada: boolean;
      Function GravaLogTOTALPREV(sOperacao: String): boolean;
      Function Mascara(edt: String; str: String): String;
      function entremeses(qry : TwwQuery; Datainicio, datafim :tdatetime; retorno: integer):integer;
      Procedure LimpaCamposPortabilidade;
      Procedure LimpaDadosParticipante;
      procedure HabilitaBotoesDetalhe;
      procedure DesabilitaBotoesDetalhe;
      procedure ValidaCampoNumerico(var Key:char);
      procedure OnMyGetText(Sender: TField; var Text: String; DisplayText: Boolean);
      // Início - William Santana - SOL 208796 PPM 2017611
      function validaArquivoImportacao():boolean;
      function UltimaLinha(Excel : Variant; linha: Integer) : Boolean;
      Function InsereHistoricoViaArquivo: Boolean;
      // Término - William Santana - SOL 208796 PPM 2017611

      procedure PreparadaQueryHSTCONTRIBPREV(QueryHSTCONTRIBPREV: TwwQuery);//SIG85342
   Public
      { Public declarations }
   End;

Var
   frmCadContribuicaoPortada: TfrmCadContribuicaoPortada;

Implementation

Uses DAPrev, USistema;

{$R *.DFM}

Procedure TfrmCadContribuicaoPortada.sbtnProcurarClick(Sender: TObject);
Begin
   // inherited;
   LimpaCamposHistorico;
   LimpaCamposPortabilidade;
   LimpaDadosParticipante;
   QryPortabilidade.Close;
   QryDet.Close;
   MontaSelect.Executar;
   If MontaSelect.RetornouValor Then
      Begin
         LblParticipante.Caption := MontaSelect.ValoresChave[0];
         LblMatricula.Caption := MontaSelect.ValoresChave[1];
         lblInscricao.Caption := MontaSelect.ValoresChave[2];
         LblPatrocinadora.Caption := MontaSelect.ValoresChave[3];
         LblPlanoPrevidenciario.Caption := MontaSelect.ValoresChave[4];
         LblContribuicao.Caption := MontaSelect.ValoresChave[5];
         QryPortabilidade.Close;
         QryPortabilidade.SQL.Clear;
         QryPortabilidade.sql.add(' select ');
         QryPortabilidade.sql.add(' p.idportabilidade, e.identidadeorigem, e.nome, ');
         QryPortabilidade.sql.add(' substr(e.cnpj,1,2)||''.''||substr(e.cnpj,3,3)||''.''||substr(e.cnpj,6,3)||''.''||substr(e.cnpj,9,4)||''-''||substr(e.cnpj,13,2) CNPJFormat ,');
         QryPortabilidade.sql.add(' e.cnpj ');
         QryPortabilidade.sql.add(' ,e.tipo,decode(e.tipo,''A'',''Aberta'',''F'',''Fechada'')DescTipo ');
         QryPortabilidade.sql.add(' ,e.cnpbsusep,p.opcaoir,decode(p.opcaoir,''R'',''Regressivo'',''P'',''Progressivo'')DescOpcaoIR ');
         QryPortabilidade.sql.add(' ,p.datarecebimento,p.dataopcaoir,p.vincano,p.vincmes,p.tempomeses,p.idplanoprev,p.idpessoa,p.idpessjur ');
         QryPortabilidade.sql.add(' from portabilidadeprev p, cm.entidadeorigem e ');
         QryPortabilidade.sql.add(' where p.idpessoa = ' + MontaSelect.ValoresChave[7]);
         QryPortabilidade.sql.add(' and     p.idpessjur = ' + MontaSelect.ValoresChave[8]);
         QryPortabilidade.sql.add(' and     p.idplanoprev = ' + MontaSelect.ValoresChave[9]);
         QryPortabilidade.sql.add(' and     p.idcontribuicao = ' + MontaSelect.ValoresChave[6]);
         QryPortabilidade.sql.add(' and     p.identidadeorigem = e.identidadeorigem'); // Felipe A. Santos SOL 185758 KTN 1743062
         QryPortabilidade.Open;
         sbtnInserir.Enabled := True;
         if QryPortabilidade.RecordCount > 0 then
           begin
             sbtnAlterar.Enabled := True;
             sbtnApagar.Enabled := True;
           end
           else
             begin
                sbtnAlterar.Enabled := False;
                sbtnApagar.Enabled := False;
             end;
      End Else
      Begin
         sbtnInserir.Enabled := false;
         sbtnAlterar.Enabled := false;
         sbtnApagar.Enabled := False;
      End;

      sbtnProcurar.Down:=False;
      bbtnCancelarDetClick(Sender); //Cancela toda e qualquer operação do Detalhe



End;

Procedure TfrmCadContribuicaoPortada.bbtnConfirmarClick(Sender: TObject);
Begin
    //WO11235 - Helen V Bianchi - Inicio Retirado a obrigatoriedade Data Opção de IR/REGRESSIVO
    //if (DtDataOpcaoIrReg.Text <> '') and (RbRegressivo.Checked) or (RbProgressivo.Checked) then  //Wylliam Leite da Silva Kintana 1541516 Sol 171495
   if (RbRegressivo.Checked) or (RbProgressivo.Checked) then
    //WO11235 - Helen V Bianchi - Fim
   begin
     If (bInsere) Or (bAltera) Then
      Begin
         If ValicaCampoObrigatoriosPortabilidade Then
            Begin
               Try
                  If bInsere Then
                     Begin
                        InserePortabilidade;
                        sbtnAlterar.Enabled:=True;
                        sbtnApagar.Enabled :=True;
                        sbtnInserir.Down:=False;
                        sbtnProcurarEntidade.Enabled := False; // Felipe A. Santos SOL 185758 KTN 1743062
                     End;

                  If bAltera Then
                     Begin
                        AlteraPortabilidade;
                        sbtnAlterar.Enabled:=True;
                        sbtnApagar.Enabled :=True;
                        sbtnAlterar.Down :=False;
                        sbtnProcurarEntidade.Enabled := False; // Felipe A. Santos SOL 185758 KTN 1743062
                     End;


                  bInsere := False;
                  bAltera := False;
                  bExclui := False;
                  DBGrid1.Enabled := True;
                  CommitTransacao;
                  QryPortabilidade.close;
                  QryPortabilidade.Open;
                  QryDet.Close;
                  QryDet.Open;
                  HabPortabidade(false);
                  sbtnAlterar.Down := false;
                  sbtnInserir.Down := false;
                  sbtnApagar.Down := false;
                  sbtnAltDet.Enabled := false;
                  sbtnInsDet.Enabled := false;
                  sbtnExcluiDet.Enabled := false;
                  bbtnVoltarDetClick(sender);
                  MessageDlg('Dados gravados com sucesso.', mtInformation, [mbok], 0);
               Except On e: Exception Do
                     Begin
                        MessageDlg('Ocorreu um erro ao efetuar a transação. ' + chr(13) + e.Message, MtError, [mbok], 0);
                        bbtnCancelarClick(sender);
                        LimpaCamposHistorico;
                        LimpaCamposPortabilidade;
                     End;
               End;
            End;
      End;
   end
   else
   begin
    //WO11235 - Helen V Bianchi - Inicio
  // if RbRegressivo.Checked Then  //Wylliam Leite da Silva Kintana 1541516 Sol 171495
  //  MessageDlg('Obrigatorio o preenchimento da Data Opção IR Reg.', mtError, [mbok], 0);
  MessageDlg('Necessário informar a Opção de IR .', mtError, [mbok], 0);
     //WO11235 - Helen V Bianchi - Fim
   end;





End;

Procedure TfrmCadContribuicaoPortada.sbtnInserirClick(Sender: TObject);
Begin
   //  inherited;
   If StrToInt(MontaSelect.ValoresChave[7]) > 0 Then
      Begin
         sbtnProcurarEntidade.Enabled := True; // Felipe A.Santos SOL 185758 KTN 1743062
         dtDatainicio.Enabled := true;//SOL 137378 Kintana 834829
         dtDatafim.Enabled    := true;//SOL 137378 Kintana 834829
         bInsere := True;
         bAltera := False;
         bExclui := False;
         LimpaCamposPortabilidade;
         HabPortabidade(true);
         DBGrid1.Enabled := False;
         QryDet.Close;
         DesabilitaBotoesDetalhe;
         bbtnCancelarDetClick(Sender); //Cancela toda e qualquer operação do Detalhe
         if MontaSelect.ValoresChave[10] = 'A' then
           RbAberta.Checked:=True else RbFechada.Checked:=True;
         edtentidade.SetFocus;
       End
   Else
      Begin
         MessageDlg('Selecione um Participante', mtError, [mbok], 0);
         abort;
      End;

End;

Procedure TfrmCadContribuicaoPortada.sbtnAlterarClick(Sender: TObject);
Begin


   If Not (StrToInt(MontaSelect.ValoresChave[7]) > 0) Then
      Begin
         MessageDlg('Selecione um Participante', mtError, [mbok], 0);
         abort;
      End;
   HabPortabidade(Not PortabilidadeTemHistorico(QryPortabilidade.FieldByName('idportabilidade').asInteger));
   sbtnProcurarEntidade.Enabled := True; // Felipe A.Santos SOL 185758 KTN 1743062
   bInsere := False;
   bAltera := True;
   bExclui := False;
   DbGrid1.Enabled := False;
   HabilitaBotoesDetalhe;
   bbtnCancelarDetClick(Sender); //Cancela toda e qualquer operação do Detalhe


End;

Procedure TfrmCadContribuicaoPortada.FormCreate(Sender: TObject);
Begin

   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
End;

Function TfrmCadContribuicaoPortada.PortabilidadeTemHistorico(idportabilidade: integer): boolean;
Var
   QryAux: TwwQuery;
Begin
   QryAux := TwwQuery.Create(Nil);
   QryAux.Databasename := 'BaseDados';
   QryAux.Close;
   QryAux.SQL.Clear;
   QryAux.SQL.Add('SELECT nvl(COUNT(1),0) Qtde FROM cm.hstcontribprev WHERE idportabilidade = ' + IntToStr(idportabilidade));
   QryAux.Open;

   If QryAux.FieldByName('Qtde').asInteger = 0 Then
      result := False
   Else
      result := True;

   FreeAndNil(QryAux);

End;

Procedure TfrmCadContribuicaoPortada.HabPortabidade(bValor: Boolean);
Begin
   edtEntidade.Enabled := bValor;
   mskCNPJ.Enabled := bValor;
   edtCNPB.Enabled := bValor;
   RbRegressivo.Enabled := bValor;
   RbProgressivo.Enabled := bValor;
   DtDataOpcaoIrReg.Enabled := bValor; // Vinicius Ferreira SOL 151400 KINTANA 1109408
   DtDataRecebimento.Enabled := bValor;
   edtAnos.Enabled := bValor;
   edtMeses.Enabled := bValor;


End;

Procedure TfrmCadContribuicaoPortada.qryAfterScroll(DataSet: TDataSet);
Begin
   //  inherited;

   Begin

   End;
End;

Procedure TfrmCadContribuicaoPortada.sbtnApagarClick(Sender: TObject);
Var
   QryAux: TwwQuery;
Begin
   If Not PortabilidadeTemHistorico(QryPortabilidade.FieldByname('idportabilidade').asinteger) Then
      Begin
         If MessageDlg('Confirma a exclusão dos dados da portabilidade selecionada? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
            Begin
               ExcluiPortabilidade;
               CommitTransacao;
               QryPortabilidade.close;
               QryPortabilidade.open;
               sbtnProcurarEntidade.Enabled := False;  // Felipe A.Santos SOL 185758 KTN 1743062
               //LimpaCamposPortabilidade;  // Felipe A.Santos SOL 185758 KTN 1743062
               if(QryPortabilidade.IsEmpty) then
               begin
                    LimpaCamposPortabilidade;
                    sbtnAlterar.Enabled := False;
                    sbtnApagar.Enabled := False;
               end;
            End;
        bbtnCancelarDetClick(Sender); //Cancela toda e qualquer operação do Detalhe
      End
   Else
      Begin
         MessageDlg('Para excluir esse registro, exclua o cadastro das contribuições, primeiro.', MtInformation, [mbok], 0);
         bbtnCancelarClick(Sender);
      End;

   sbtnApagar.Down := False;


End;

Procedure TfrmCadContribuicaoPortada.QryPortabilidadeAfterScroll(
   DataSet: TDataSet);
Begin
   edtentidade.Text := QryPortabilidade.fieldbyname('nome').asstring;
   mskcnpj.Text := QryPortabilidade.fieldbyname('cnpj').asstring;
   If QryPortabilidade.fieldbyname('tipo').asstring = 'A' Then
      RbAberta.Checked := true Else RbFechada.Checked := true;
   edtcnpb.Text := QryPortabilidade.fieldbyname('cnpbsusep').asstring;
   If QryPortabilidade.fieldbyname('OpcaoIR').asstring = 'R' Then
      RbRegressivo.Checked := true Else RbProgressivo.Checked := true;

   // SOL 184328 KTN 1724777 Otacilio Aquino ** INICIO **
   DtDataOpcaoIrReg.Text := QryPortabilidade.fieldbyname('dataopcaoir').AsString;
   //DtDataOpcaoIrReg.Date := QryPortabilidade.fieldbyname('dataopcaoir').AsDateTime; // Vinicius Ferreira SOL 151400 KINTANA 1109408
   // SOL 184328 KTN 1724777 Otacilio Aquino ** FIM **

   DtDataRecebimento.Date := QryPortabilidade.fieldbyname('datarecebimento').asDateTime;
   edtanos.Text := QryPortabilidade.fieldbyname('vincano').asstring;
   edtmeses.Text := QryPortabilidade.fieldbyname('vincmes').asstring;
   edtempomeses.Text := QryPortabilidade.fieldbyname('tempomeses').asstring;

   HabPortabidade(false);
   CarregaHistorico;



   //HabPortabidade(Not PortabilidadeTemHistorico(QryPortabilidade.FieldByName('idportabilidade').asInteger))
End;

Function TfrmCadContribuicaoPortada.AlteraPortabilidade: boolean;
Var
   sSQL: String;
   Qry: TwwQuery;
Begin
   Qry := TwwQuery.Create(Nil);
   Qry.databasename := 'basedados';

   sSQL := 'UPDATE PORTABILIDADEPREV SET NOME = :NOME ';
   sSQL := sSQL + '                    ,CNPJ = :CNPJ  ';
   sSQL := sSQL + '                    ,TIPO = :TIPO  ';
   sSQL := sSQL + '                    ,CNPBSUSEP = :CNPBSUSEP ';
   sSQL := sSQL + '                    ,OPCAOIR = :OPCAOIR ';
   sSQL := sSQL + '                    ,DATAOPCAOIR = :DATAOPCAOIR '; // Vinicius Ferreira SOL 151400 KINTANA 1109408
   sSQL := sSQL + '                    ,DATARECEBIMENTO = :DATARECEBIMENTO ';
   sSQL := sSQL + '                    ,VINCANO = :VINCANO ';
   sSQL := sSQL + '                    ,VINCMES = :VINCMES ';
   sSQL := sSQL + '                    ,TEMPOMESES = :TEMPOMESES ';
   sSQL := sSQL + '                    ,IDPLANOPREV = :IDPLANOPREV ';
   sSQL := sSQL + '                    ,IDPESSOA = :IDPESSOA ';
   sSQL := sSQL + '                    ,IDPESSJUR = :IDPESSJUR ';
   sSQL := sSQL + '                    ,IDENTIDADEORIGEM = :IDENTIDADEORIGEM ';    // FELIPE A. SANTOS SOL 185758 KTN 1743062
   sSQL := sSQL + ' WHERE IDPORTABILIDADE = :IDPORTABILIDADE ';

   Qry.SQL.Add(sSQL);
   Qry.ParamByName('NOME').DataType := ftString;
   Qry.ParamByName('CNPJ').DataType := ftString;
   Qry.ParamByName('TIPO').DataType := ftString;
   Qry.ParamByName('CNPBSUSEP').DataType := ftstring;
   Qry.ParamByName('OPCAOIR').DataType := ftString;
   Qry.ParamByName('DATAOPCAOIR').DataType := ftDateTime; // Vinicius Ferreira SOL 151400 KINTANA 1109408
   Qry.ParamByName('DATARECEBIMENTO').DataType := ftDateTime;
   Qry.ParamByName('VINCANO').DataType := ftInteger;
   Qry.ParamByName('VINCMES').DataType := ftInteger;
   Qry.ParamByName('TEMPOMESES').DataType := ftInteger;
   Qry.ParamByName('IDPLANOPREV').DataType := ftInteger;
   Qry.ParamByName('IDPESSOA').DataType := ftInteger;
   Qry.ParamByName('IDPESSJUR').DataType := ftInteger;
   Qry.ParamByName('IDPORTABILIDADE').DataType := ftInteger;
   Qry.ParamByName('IDENTIDADEORIGEM').DataType := ftInteger;    // FELIPE A. SANTOS SOL 185758 KTN 1743062

   // FELIPE A. SANTOS SOL 185758 KTN 1743062
   Qry.ParamByName('NOME').asString := '';
   Qry.ParamByName('CNPJ').asString := '';

   //If RbAberta.Checked Then
   Qry.ParamByName('TIPO').asString := '';
   Qry.ParamByName('CNPBSUSEP').AsString := '';
   // FELIPE A. SANTOS SOL 185758 KTN 1743062 - FIM

   If RbRegressivo.Checked Then
      Qry.ParamByName('OPCAOIR').asString := 'R' Else Qry.ParamByName('OPCAOIR').asString := 'P';

   // SOL 184328 KTN 1724777 Otacilio Aquino ** INICIO **
   Qry.ParamByName('DATAOPCAOIR').AsString := Trim(DtDataOpcaoIrReg.Text);
   //Qry.ParamByName('DATAOPCAOIR').AsDateTime := Trim(DtDataOpcaoIrReg.Date); // Vinicius Ferreira SOL 151400 KINTANA 1109408
   // SOL 184328 KTN 1724777 Otacilio Aquino ** FIM **

   Qry.ParamByName('DATARECEBIMENTO').AsDateTime := DtDataRecebimento.Date;
   Qry.ParamByName('VINCANO').AsInteger := StrToInt(edtanos.text);
   Qry.ParamByName('VINCMES').AsInteger := StrToInt(edtmeses.text);
   Qry.ParamByName('TEMPOMESES').AsInteger := StrToInt(edtempomeses.text);
   Qry.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[9]);
   Qry.ParamByName('IDPESSOA').AsInteger := StrToInt(MontaSelect.ValoresChave[7]);
   Qry.ParamByName('IDPESSJUR').AsInteger := StrToInt(MontaSelect.ValoresChave[8]);
   Qry.ParamByName('IDPORTABILIDADE').AsInteger := QryPortabilidade.FieldByname('idportabilidade').asinteger;

   // Felipe A. Santos SOL 185758 KTN 1743062
   if (MontaEntidadeOrigem.RetornouValor) then
      Qry.ParamByName('IDENTIDADEORIGEM').AsInteger := StrToInt(MontaEntidadeOrigem.ValoresChave[0])
   else
      Qry.ParamByName('IDENTIDADEORIGEM').AsInteger := QryPortabilidade.FieldByname('identidadeorigem').asinteger;
   // Felipe A. Santos SOL 185758 KTN 1743062 - FIM

   Qry.ExecSQL;
End;
//SOL 137378 Kintana 834829 criação da procedure
function TfrmCadContribuicaoPortada.entremeses(qry : TwwQuery; Datainicio, datafim :tdatetime; retorno: integer):integer;
Begin
   QryMesEntreData.Close;
   QryMesEntreData.ParamByName('Data1').Asdatetime := Datainicio;
   QryMesEntreData.ParamByName('Data2').Asdatetime := datafim;
   QryMesEntreData.open;
   if retorno = 0 then
      result := QryMesEntreData.FieldByName('qtdeanos').asinteger
   else
      result := QryMesEntreData.FieldByName('meses').asinteger;
end;


Function TfrmCadContribuicaoPortada.ExcluiPortabilidade: boolean;
Var
   Qry: TwwQuery;
Begin

   Qry := TwwQuery.Create(Nil);
   Qry.databasename := 'basedados';
   Qry.Close;
   Qry.SQL.Add('Delete From PortabilidadePrev where idportabilidade = ' + QryPortabilidade.FieldByName('idportabilidade').asstring);
   Qry.ExecSQL;
End;

Function TfrmCadContribuicaoPortada.InserePortabilidade: boolean;
Var
   sSQL: String;
   Qry: TwwQuery;
Begin
   Qry := TwwQuery.Create(Nil);
   Qry.databasename := 'basedados';

   sSQL := ' INSERT INTO PORTABILIDADEPREV (IDPORTABILIDADE,NOME,CNPJ,TIPO,CNPBSUSEP,OPCAOIR,DATAOPCAOIR,DATARECEBIMENTO,VINCANO,VINCMES,TEMPOMESES,IDPLANOPREV,IDPESSOA,IDPESSJUR,IDCONTRIBUICAO, IDENTIDADEORIGEM) ';
   sSQL := sSQL + ' VALUES(SEQPORTABILIDADEPREV.NEXTVAL,:NOME,:CNPJ, :TIPO, :CNPBSUSEP, :OPCAOIR,:DATAOPCAOIR,:DATARECEBIMENTO,:VINCANO,:VINCMES,:TEMPOMESES,:IDPLANOPREV,:IDPESSOA,:IDPESSJUR,:IDCONTRIBUICAO, :IDENTIDADEORIGEM) ';

   Qry.SQL.Add(sSQL);

   Qry.ParamByName('NOME').DataType := ftString;
   Qry.ParamByName('CNPJ').DataType := ftString;
   Qry.ParamByName('TIPO').DataType := ftString;
   Qry.ParamByName('CNPBSUSEP').DataType := ftstring;
   Qry.ParamByName('OPCAOIR').DataType := ftString;
   Qry.ParamByName('DATAOPCAOIR').DataType := ftDateTime; // Vinicius Ferreira SOL 151400 KINTANA 1109408
   Qry.ParamByName('DATARECEBIMENTO').DataType := ftDateTime;
   Qry.ParamByName('VINCANO').DataType := ftInteger;
   Qry.ParamByName('VINCMES').DataType := ftInteger;
   Qry.ParamByName('TEMPOMESES').DataType := ftInteger;
   Qry.ParamByName('IDPLANOPREV').DataType := ftInteger;
   Qry.ParamByName('IDPESSOA').DataType := ftInteger;
   Qry.ParamByName('IDPESSJUR').DataType := ftInteger;
   Qry.ParamByName('IDCONTRIBUICAO').DataType := ftInteger;
   Qry.ParamByName('IDENTIDADEORIGEM').DataType := ftInteger; // FELIPE A. SANTOS SOL 185758 KTN 1743062

   // FELIPE A. SANTOS SOL 185758 KTN 1743062
   Qry.ParamByName('NOME').asString := '';
   Qry.ParamByName('CNPJ').asString := '';

   //If RbAberta.Checked Then
   Qry.ParamByName('TIPO').asString := '';
   Qry.ParamByName('CNPBSUSEP').AsString := '';
   // FELIPE A. SANTOS SOL 185758 KTN 1743062 - FIM

   If RbRegressivo.Checked Then
      Qry.ParamByName('OPCAOIR').asString := 'R' Else Qry.ParamByName('OPCAOIR').asString := 'P';

   // SOL 184328 KTN 1724777 Otacilio Aquino ** INICIO **
   if Trim(DtDataOpcaoIrReg.Text) <> '' then
     Qry.ParamByName('DATAOPCAOIR').AsDateTime := DtDataOpcaoIrReg.Date; // Vinicius Ferreira SOL 151400 KINTANA 1109408
   // SOL 184328 KTN 1724777 Otacilio Aquino ** Fim **

   Qry.ParamByName('DATARECEBIMENTO').AsDateTime := DtDataRecebimento.Date;
   Qry.ParamByName('VINCANO').AsInteger := StrToInt(edtanos.text);
   Qry.ParamByName('VINCMES').AsInteger := StrToInt(edtmeses.text);
   Qry.ParamByName('TEMPOMESES').AsInteger := StrToInt(edtempomeses.text);
   Qry.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[9]);
   Qry.ParamByName('IDPESSOA').AsInteger := StrToInt(MontaSelect.ValoresChave[7]);
   Qry.ParamByName('IDPESSJUR').AsInteger := StrToInt(MontaSelect.ValoresChave[8]);
   Qry.ParamByName('IDCONTRIBUICAO').AsInteger := StrToInt(MontaSelect.ValoresChave[6]);
   Qry.ParamByName('IDENTIDADEORIGEM').AsInteger := StrToInt(MontaEntidadeOrigem.ValoresChave[0]); // FELIPE A. SANTOS SOL 185758 KTN 1743062
   Qry.ExecSQL;
End;

Procedure TfrmCadContribuicaoPortada.bbtnCancelarClick(Sender: TObject);
Begin
   //  inherited;

   RollBackTransacao;
   sbtnProcurarEntidade.Enabled := False; // Felipe A. Santos SOL 185758 KTN 1743062
   DBGrid1.Enabled := True;
   QryPortabilidade.Close;
   QryPortabilidade.Open;
   QryDet.Close;
   QryDet.Open;
   HabPortabidade(false);
   sbtnAlterar.Down      := false;
   sbtnInserir.Down      := false;
   sbtnApagar.Down       := false;
   sbtnAltDet.Enabled    := false;
   sbtnInsDet.Enabled    := false;
   dtDatainicio.Enabled  := false;//SOL 137378 Kintana 834829
   dtDatafim.Enabled     := false;//SOL 137378 Kintana 834829
   sbtnExcluiDet.Enabled := false;
   LimpaCamposHistorico;
   LimpaCamposPortabilidade;
   bbtnVoltarDetClick(sender);
   if not QryPortabilidade.IsEmpty then
      QryPortabilidade.First;



End;

Procedure TfrmCadContribuicaoPortada.FormShow(Sender: TObject);
Begin
   //  inherited;
   pgctrlDetalhe.ActivePage := tbsDet; //William Santana - SOL 208796 PPM 2017611
End;

Procedure TfrmCadContribuicaoPortada.CmeCadastroAtualizaBotoes(
   Sender: TObject);
Begin
   //  inherited;

End;

Procedure TfrmCadContribuicaoPortada.DBGrid1KeyUp(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Begin
   //  inherited;

End;

Procedure TfrmCadContribuicaoPortada.CalculaTempoTotalVinculo;
Var
   iAno, iMes: integer;
Begin

   If Trim(edtanos.Text) = '' Then
      iAno := 0 Else iAno := StrToInt(Trim(edtanos.Text));

   If Trim(edtmeses.Text) = '' Then
      iMes := 0 Else iMes := StrToInt(Trim(edtmeses.text));

   edtempomeses.Text := IntToStr((iAno * 12) + iMes);
End;

Procedure TfrmCadContribuicaoPortada.edtanosExit(Sender: TObject);
Begin
   Inherited;
   If Trim(edtanos.Text) = '' Then
      edtanos.Text := '0';
   CalculaTempoTotalVinculo;
End;

Procedure TfrmCadContribuicaoPortada.edtmesesExit(Sender: TObject);
Begin
   Inherited;
   If Trim(edtmeses.Text) = '' Then
      edtmeses.Text := '0';

   If StrToInt(edtmeses.Text) > 11 Then
      Begin
         MessageDlg('Mêses de Vinculo Inválido.' + Chr(13) + 'Informe o mês entre 0 e 11', mterror, [mbok], 0);
         Abort;
      End;
   CalculaTempoTotalVinculo;
End;

Procedure TfrmCadContribuicaoPortada.edtcnpjKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   Inherited;
   ValidaCampoNumerico(Key);
End;

Procedure TfrmCadContribuicaoPortada.edtcnpbKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   Inherited;
   ValidaCampoNumerico(Key);
End;

Procedure TfrmCadContribuicaoPortada.edtanosKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   Inherited;
    ValidaCampoNumerico(Key);
End;

Procedure TfrmCadContribuicaoPortada.edtmesesKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   ValidaCampoNumerico(Key);
End;

Function TfrmCadContribuicaoPortada.ValicaCampoObrigatoriosPortabilidade: boolean;
Var
   sCampos: String;
   vCampos: Array Of String;
   i: integer;
   iLoop: integer;
Begin
   i := 0;
   CalculaTempoTotalVinculo;
   result := true;
   If Trim(edtempoMeses.Text) = '0' Then
      Begin
         inc(i);
         SetLength(vCampos,i);
         vCampos[i-1] := 'Tempo de Vinculação Entidade Origem';
         edtAnos.SetFocus;
      End;

   If DtDataRecebimento.Date = 0 Then
      Begin
         inc(i);
         SetLength(vCampos,i);
         vCampos[i-1] := 'Data Recebimento';
         DtDataRecebimento.SetFocus;
      End;
   If (Not RbProgressivo.Checked) And (Not RbRegressivo.Checked) Then
      Begin
         inc(i);
         SetLength(vCampos,i);
         vCampos[i-1] := 'Opção IR';
      End;
   If Trim(edtCNPB.Text) = '' Then
      Begin
         inc(i);
         SetLength(vCampos,i);
         vCampos[i-1] := 'CNPB/SUSEP';
         edtCNPB.SetFocus;
      End;
   If Trim(mskCNPJ.Text) = '' Then
      Begin
         inc(i);
         SetLength(vCampos,i);
         vCampos[i-1] := 'CNPJ';
         mskCNPJ.SetFocus;
      End;
   If Trim(edtEntidade.Text) = '' Then
      Begin
         inc(i);
         SetLength(vCampos,i);
         vCampos[i-1] := 'Entidade de Origem';
         edtEntidade.SetFocus;
      End;

   If Length(vCampos) > 0 Then
      Begin
         result := false;
         If Length(vCampos) = 1 Then
            MessageDlg('O campo : ' + vCampos[0] + ' é de preenchimento obrigatório.', mterror, [mbok], 0)
         Else
            Begin
               iLoop := 0;
               sCampos := '';
               While iLoop < i-1 Do
                  Begin
                     sCampos := sCampos + vCampos[iLoop] + ', ';
                     inc(iLoop);
                  End;
               sCampos := sCampos + vCampos[i-1]; //Ultimo Campos, Não coloco virgula
               MessageDlg('Os campos ' + sCampos + ' são de preenchimento obrigatório.', mterror, [mbok], 0);
            End;

      End
End;

Procedure TfrmCadContribuicaoPortada.bbtnSairClick(Sender: TObject);
Begin
   QryPortabilidade.Cancel;
   Inherited;

End;

Procedure TfrmCadContribuicaoPortada.CarregaHistorico;

Begin
   QryDet.Close;
   QryDet.ParamByName('idpessoa').asinteger := QryPortabilidade.fieldbyname('idpessoa').asinteger;
   QryDet.ParamByName('idpessjur').asinteger := QryPortabilidade.fieldbyname('idpessjur').asinteger;
   QryDet.ParamByName('idplanoprev').asinteger := QryPortabilidade.fieldbyname('idplanoprev').asinteger;
   QryDet.ParamByName('idportabilidade').asinteger := QryPortabilidade.fieldbyname('idportabilidade').asinteger;
   QryDet.Open;

End;

Procedure TfrmCadContribuicaoPortada.CarregaCamposHistorico;
Begin
   LimpaCamposHistorico;
   If Not QryDet.IsEmpty Then
      Begin
         EdtAnoReferencia.text := Copy(QryDet.FieldByName('Mesreferencia').asstring, 1, 4);
         EdtMesReferencia.Text := Copy(QryDet.FieldByName('Mesreferencia').asstring, 6, 2);
         EdtAnocobranca.text := Copy(QryDet.FieldByName('Mescobranca').asstring, 1, 4);
         EdtMescobranca.Text := Copy(QryDet.FieldByName('Mescobranca').asstring, 6, 2);
         EdtValorEsperado.Text := QryDet.FieldByName('valoresperado').asstring;
         rgDevolucao.ItemIndex := QryDet.FieldByName('flgdevolucao').asinteger; //Leandro Pocebon SIG131206
         edtdataprevisao.text := QryDet.FieldByName('dataprevisaorece').asstring;
         If QryDet.FieldByName('flgdescfolha').asinteger = 0 Then
            RbBancaria.Checked := true Else RbBancaria.Checked := false;

         If QryDet.FieldByName('sitrecebimento').asinteger = 0 Then
            RbNaoEnviado.Checked := true Else RbNaoEnviado.Checked := false;

         If QryDet.FieldByName('idmotivo').asinteger = 3054 Then
            RbMotivo.Checked := true Else RbMotivo.Checked := false;

         If QryDet.FieldByName('codportforma').asinteger = 10 Then
            RbCodForma.Checked := true Else RbCodForma.Checked := false;
      End;
End;

Procedure TfrmCadContribuicaoPortada.LimpaCamposHistorico;
Begin
   EdtAnoReferencia.text := '';
   EdtMesReferencia.Text := '';
   EdtValorEsperado.Text := '';
   edtDataPrevisao.text := '';
   EdtAnoCobranca.Text := '';
   EdtMesCobranca.Text := '';
   RbBancaria.Checked := true;
   RbNaoEnviado.Checked := true;
   RbMotivo.Checked := true;
   RbCodForma.Checked := true;
   rgDevolucao.ItemIndex := 0; //Leandro Pocebon SIG131206

   edtImportaArquivo.Clear; //William Santana - SOL 208796 PPM 2017611
End;

Procedure TfrmCadContribuicaoPortada.sbtnInsDetClick(Sender: TObject);
Begin
   //   inherited;
   bInsereHistorico := True;
   bAlteraHistorico := False;
   bExcluiHistorico := False;


   LimpaCamposHistorico;
   edtDataPrevisao.text := DateToStr(DtDataRecebimento.date);
   EdtAnoCobranca.Text := copy(edtdataprevisao.Text, 7, 4);
   EdtMesCobranca.Text := copy(edtdataprevisao.Text, 4, 2);


   dbgrdDet.SendToBack;
   tb97Detalhe.Visible := True;
   //dock974.Visible := true;

   btnImportaArquivo.Enabled := True;  //William Santana - SOL 208796 PPM 2017611
  
End;

Function TfrmCadContribuicaoPortada.AlteraHistorico: Boolean;
Begin

   QryAux.Close;
   QryAux.SQL.clear;


   QryAux.SQL.Add(' UPDATE HSTCONTRIBPREV ');
   QryAux.SQL.Add(' SET ');

   QryAux.SQL.Add('   MESREFERENCIA = :MESREFERENCIA, ');
   QryAux.SQL.Add('   FLGSITFUNDACAO = :FLGSITFUNDACAO, ');
   QryAux.SQL.Add('   VALORESPERADO = :VALORESPERADO, ');
   QryAux.SQL.Add('   DATAPREVISAORECE = :DATAPREVISAORECE, ');
   QryAux.SQL.Add('   DATAINICIO = :DATAINICIO, ');
   QryAux.SQL.Add('   DATAFINAL = :DATAFINAL, ');
   QryAux.SQL.Add('   TIPO = :TIPO, '); //Leandro Pocebon SIG131206
   QryAux.SQL.Add('   FLGDEVOLUCAO = :FLGDEVOLUCAO '); //Leandro Pocebon SIG131206
   QryAux.SQL.Add(' WHERE ');
   QryAux.SQL.Add('   NUMRECEBIMENTO = :NUMRECEBIMENTO ');
 
   QryAux.ParambyName('NUMRECEBIMENTO').DataType := ftinteger;
   QryAux.ParambyName('MESREFERENCIA').DataType := ftstring;
   QryAux.ParambyName('FLGSITFUNDACAO').DataType := ftstring;
   QryAux.ParambyName('VALORESPERADO').DataType := ftFloat;
   QryAux.ParambyName('DATAPREVISAORECE').DataType := ftDate;
   QryAux.ParambyName('DATAINICIO').DataType := ftDate;
   QryAux.ParambyName('DATAFINAL').DataType := ftDate;
   QryAux.ParambyName('TIPO').DataType := ftstring;
   QryAux.ParambyName('FLGDEVOLUCAO').DataType := ftInteger;   //Leandro Pocebon SIG131206

   QryAux.ParambyName('NUMRECEBIMENTO').AsInteger := QryDet.FieldByName('numrecebimento').Asinteger; //sol 151400 vinicius ferreira
   QryAux.ParambyName('MESREFERENCIA').AsString := EdtAnoReferencia.Text + '/' + EdtMesReferencia.Text;
   QryAux.ParambyName('FLGSITFUNDACAO').Asstring := SituacaoParticipante(StrToInt(MontaSelect.ValoresChave[11])); //Situacao do Participante na fundação
   QryAux.ParambyName('VALORESPERADO').AsFloat := StrToFloat(TiraPonto(edtValorEsperado.text));
   QryAux.ParambyName('DATAPREVISAORECE').AsString := (edtDataprevisao.text); //vai informar depois do recebimento
   QryAux.ParambyName('DATAINICIO').AsString := (MontaSelect.ValoresChave[12]); //DataInicio
   QryAux.ParambyName('DATAFINAL').AsString := (MontaSelect.ValoresChave[13]); //DataFinal
   QryAux.ParambyName('TIPO').AsString := 'F';
   QryAux.ParambyName('FLGDEVOLUCAO').AsInteger := rgDevolucao.ItemIndex; //Leandro Pocebon SIG131206

   QryAux.ExecSQL;

End;

Function TfrmCadContribuicaoPortada.ExcluiHistorico: Boolean;
Begin

   QryAux.Close;
   QryAux.SQL.clear;
   QryAux.SQL.Add('Delete From HSTCONTRIBPREV WHERE NUMRECEBIMENTO = ' + QryDet.FieldByName('NumRecebimento').Asstring); //sol 151400 vinicius ferreira
   QryAux.ExecSQL;

End;

Function TfrmCadContribuicaoPortada.InsereHistorico: Boolean;

//   Qry: TwwQuery;
Begin
   // Qry := TwwQuery.Create(Nil);
 //   Qry.DataBaseName := 'basedados';

   QryAux.Close;
   QryAux.SQL.clear;

   PreparadaQueryHSTCONTRIBPREV(QryAux);//SIG85342

   QryAux.ParambyName('NUMRECEBIMENTO').AsInteger := LeUltRegistro(dtmAPrev.qryAux, 'HSTCONTRIBPREV');
   QryAux.ParambyName('IDMOTIVO').AsInteger := 3054; //CONTRIBUICAO PORTADA
   QryAux.ParambyName('MESREFERENCIA').AsString := EdtAnoReferencia.Text + '/' + EdtMesReferencia.Text;
   QryAux.ParambyName('MESCOBRANCA').AsString := EdtAnoCobranca.Text + '/' + EdtMesCobranca.Text;
   QryAux.ParambyName('IDPESSJUR').AsInteger := QryPortabilidade.fieldbyname('idpessjur').asinteger;
   QryAux.ParambyName('IDPLANOPREV').AsInteger := QryPortabilidade.fieldbyname('idplanoprev').asinteger;
   QryAux.ParambyName('IDPESSOA').AsInteger := QryPortabilidade.fieldbyname('idpessoa').asinteger;

   QryAux.ParambyName('IDTITULAR').AsInteger := QryPortabilidade.fieldbyname('idpessoa').asinteger; //SIG85342

   QryAux.ParambyName('IDCONTRIBUICAO').AsInteger := StrToInt(MontaSelect.ValoresChave[6]);
   QryAux.ParambyName('SEQPROPOSTA').AsInteger := 1;
   //QryAux.ParambyName('FLGDEVOLUCAO').AsInteger := 0; //é cobrança  - Leandro Pocebon SIG131206
   QryAux.ParambyName('FLGDEVOLUCAO').AsInteger := rgDevolucao.ItemIndex; //é cobrança  - Leandro Pocebon SIG131206
   QryAux.ParambyName('FLGDIVERGENTE').AsInteger := 0; //nao ha divergencia
   QryAux.ParambyName('FLGCONCESSAO').AsInteger := 0; //nao foi gerada pela concessao
   QryAux.ParambyName('FLGEVENTO').AsInteger := 0; //
   QryAux.ParambyName('FLGCALCRESERVA').AsInteger := 0; //CONTRIBUICAO AINDA NAO ALIMENTOU A RESERVA
   QryAux.ParambyName('FLGDESCFOLHA').AsInteger := 0; //BANCARIA
   QryAux.ParambyName('FLGSITFUNDACAO').Asstring := SituacaoParticipante(StrToInt(MontaSelect.ValoresChave[11])); //Situacao do Participante na fundação
   QryAux.ParambyName('FLGAPORTE').AsInteger := 0; //contribuição nao voluntaria
   QryAux.ParambyName('VALORESPERADO').AsFloat := StrToFloat(TiraPonto(edtValorEsperado.text));
   QryAux.ParambyName('VALORRECEBIDO').AsInteger := 0; //será alimentado no recebimento da contribuição
   QryAux.ParambyName('VALORCALCULADO').AsFloat := QryAux.ParambyName('VALORESPERADO').asfloat;
   QryAux.ParambyName('DATAPREVISAORECE').AsDateTime := StrToDate(edtDataprevisao.text); //vai informar depois do recebimento
   //  Qry.ParambyName('DATARECEBIMENTO').AsDateTime := 0; //vai informar depois do recebimento
   QryAux.ParambyName('DATAINICIO').AsDateTime := StrToDate(MontaSelect.ValoresChave[12]); //DataInicio
   If MontaSelect.ValoresChave[13] = '' Then
      QryAux.ParambyName('DATAFINAL').AsDateTime := 0
   Else
      QryAux.ParambyName('DATAFINAL').AsDateTime := StrToDate(MontaSelect.ValoresChave[13]); //DataFinal

   QryAux.ParambyName('IDREGRACALCULO').AsInteger := 0;
   QryAux.ParambyName('SITRECEBIMENTO').AsInteger := 0; //NAO ENVIADO
   QryAux.ParambyName('TIPO').AsString := 'F';
   QryAux.ParambyName('VALOROP1').AsInteger := 0;
   QryAux.ParambyName('VALOROP2').AsInteger := 0;
   QryAux.ParambyName('VALOROP3').AsInteger := 0;
   //  Qry.ParambyName('IDLOTE').DataType  := ftInteger;
   QryAux.ParambyName('FLGMANUAL').AsInteger := 2;
   QryAux.ParambyName('FOLHAORIGEM').AsString := 'C'; //Via Banco
   QryAux.ParambyName('CODPORTFORMA').AsInteger := 10; //CEF-ON LINE
   QryAux.ParambyName('IDPORTABILIDADE').AsInteger := QryPortabilidade.fieldbyname('idportabilidade').asinteger;
   //  Qry.ParambyName('IDTIPORECURSO').AsInteger :=ftinteger;
   //  Qry.ParambyName('ORIGEMRECURSO').AsString:=ftstring;

   QryAux.ExecSQL;


   If Not GravaLogTOTALPREV('Alimentação de contribuições portadas ' + FormatDateTime('yyyy/mm', now) + ' Part. ' + MontaSelect.ValoresChave[0] + ' Contr. ' + MontaSelect.ValoresChave[5])
      Then Begin
         MessageDlg('Erro ao Gravar o Log.', mtError, [mbOK], 0);
      End;

End;

Function TfrmCadContribuicaoPortada.SituacaoParticipante(
   IdSitPart: integer): String;

//Qry: TwwQuery;
Begin

   //   QryAux := TwwQuery.Create(Nil);
   //   QryAux.DataBaseName := 'basedados';
   QryAux1.Close;
   QryAux1.Sql.Clear;
   QryAux1.SQL.Add('select flginterno from SITPART where idsitpart = ' + IntToStr(idsitpart));
   QryAux1.Open;

   result := QryAux1.FieldByName('flginterno').asstring;



End;

Procedure TfrmCadContribuicaoPortada.bbtnOkDetClick(Sender: TObject);
Begin
   Try
      If ValidaCamposHistorico Then
         Begin
            If bInsereHistorico Then
               Begin
                 // Início - William Santana - SOL 208796 PPM 2017611
                 if (edtImportaArquivo.text <> EmptyStr) then
                  InsereHistoricoViaArquivo
                 else
                 // Término - William Santana - SOL 208796 PPM 2017611
                  InsereHistorico;

               End;

            If bAlteraHistorico Then
               Begin
                  AlteraHistorico;
               End;
            bbtnVoltarDetClick(sender);
            QryDet.Close;
            QryDet.Open;
            HabilitaBotoesDetalhe;
         End;

   Except
      Begin
         //LimpaCamposHistorico;
//         LimpaCamposPortabilidade;
      End;
   End;

   Inherited;
End;

Function TfrmCadContribuicaoPortada.ValidaCamposHistorico: boolean;
Begin
   result := true;

 // Início - William Santana - SOL 208796 PPM 2017611
  if (edtImportaArquivo.text <> EmptyStr) then
  begin
    if not validaArquivoImportacao then
    begin
      result := false;
      Abort;
    end;
  end
  else
  begin
  // Término - William Santana - SOL 208796 PPM 2017611

   //Referencia nao pode ser maior que Cobrança
   if (Trim(EdtMesReferencia.Text)='') or   (Trim(EdtAnoReferencia.Text)='') then
      Begin
         MessageDlg('O Ano/Mês de Referencia deve ser informado', mtInformation, [mbok], 0);
         EdtAnoReferencia.SetFocus;
         result := false;
         Abort;
      End;

   If StrToDate('01/' + EdtMesReferencia.Text + '/' + EdtAnoReferencia.Text) > StrToDate('01/' + EdtMesCobranca.Text + '/' + EdtAnoCobranca.Text) Then
      Begin
         MessageDlg('O Ano/Mês de Referencia não pode ser maior que o Ano/Mês de Cobrança', mtInformation, [mbok], 0);
         EdtAnoReferencia.SetFocus;
         result := false;
         Abort;
      End;

   //valida valor esperado

   //If StrToFloat(Trim(EdtValorEsperado.Text)) <= 0 Then    // Fernando Santana SOL 137628 \ Kintana 834829
   //if StrToFloat(TiraPonto(edtValorEsperado.text)) <= 0 Then // Fernando Santana SOL 137628 \ Kintana 834829  - Leandro Pocebon SIG131206
   if (StrToFloat(TiraPonto(edtValorEsperado.text)) <= 0) and (rgDevolucao.ItemIndex = 0) Then // Fernando Santana SOL 137628 \ Kintana 834829  - Leandro Pocebon SIG131206
      Begin
         MessageDlg('O campo Valor Esperado deve ser maior que zero.', mtInformation, [mbok], 0);
         EdtValorEsperado.SetFocus;
         result := false;
         Abort;
      End;

  end; // William Santana - SOL 208796 PPM 2017611
End;

Procedure TfrmCadContribuicaoPortada.sbtnAltDetClick(Sender: TObject);
Begin

   If ContribuicaoRecebida Then
      Begin
         MessageDlg('Essa Contribuição já foi Recebida, Alteração não permitida', mterror, [mbok], 0);
         abort;
      End;

   If ContribuicaoRecebidaEnviada Then
      Begin
         MessageDlg('Essa Contribuição já foi Enviada, Alteração não permitida', mterror, [mbok], 0);
         abort;
      End;


   dbgrdDet.SendToBack;
   tb97Detalhe.Visible := True;
   bInsereHistorico := False;
   bAlteraHistorico := True;
   bExcluiHistorico := False;

End;

Procedure TfrmCadContribuicaoPortada.sbtnExcluiDetClick(Sender: TObject);
Begin

   If ContribuicaoRecebida Then
      Begin
         MessageDlg('Essa Contribuição já foi Recebida, Exclusão não permitida', mterror, [mbok], 0);
         abort;
      End;

   If ContribuicaoRecebidaEnviada Then
      Begin
         MessageDlg('Essa Contribuição já foi Enviada, Exclusão não permitida', mterror, [mbok], 0);
         abort;
      End;

   If MessageDlg('Confirma a exclusão contribuição selecionada ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         bInsereHistorico := False;
         bAlteraHistorico := False;
         bExcluiHistorico := True;
         ExcluiHistorico;
      End;
   QryDet.Close;
   QryDet.Open;
End;

Function TfrmCadContribuicaoPortada.TiraPonto(Value: String): String;
Var
   I: Integer;
   wSemPontos: String;
Begin
   wSemPontos := '';
   For I := 1 To Length(Value) Do Begin
         If Value[I] <> '.' Then Begin
               wSemPontos := wSemPontos + Value[I];
            End;
      End;
   Result := wSemPontos;
End;

Procedure TfrmCadContribuicaoPortada.bbtnCancelarDetClick(Sender: TObject);
Begin
   Try
      If QryAux.UpdatesPending Then
         QryAux.CancelUpdates;

      bbtnVoltarDetClick(sender);
      QryDet.Close;
      QryDet.Open;
   Except
      Begin
         LimpaCamposHistorico;
         LimpaCamposPortabilidade;
      End;
   End;
   // inherited;
End;

Procedure TfrmCadContribuicaoPortada.bbtnVoltarDetClick(Sender: TObject);
Begin
   // Inherited;
   tb97Detalhe.Visible := false;
   If DbgrdDet <> Nil Then DbgrdDet.BringToFront;

   //Início - William Santana - SOL 208796 PPM 2017611
   btnImportaArquivo.Enabled := False;
   edtImportaArquivo.Clear;
   mmoLog.Lines.Clear;
   //Término - William Santana - SOL 208796 PPM 2017611
End;

Function TfrmCadContribuicaoPortada.ContribuicaoRecebida: boolean;

Begin
   If QryDet.FieldByName('sitrecebimento').asinteger > 1 Then
      result := true Else result := false;
End;

Function TfrmCadContribuicaoPortada.ContribuicaoRecebidaEnviada: boolean;
Begin
   If (QryDet.FieldByName('sitrecebimento').asinteger > 1) And (QryDet.FieldByName('coddocumentoprev').asstring = '') Then
      result := true Else result := false;
End;

Procedure TfrmCadContribuicaoPortada.QryDetAfterScroll(DataSet: TDataSet);
Begin
   //inherited;
   CarregaCamposHistorico;
End;

Function TfrmCadContribuicaoPortada.GravaLogTOTALPREV(
   sOperacao: String): boolean;
Begin
  result :=True;
 try
   dtmAPrev.qryAux.Close;
   dtmAPrev.qryAux.SQL.Clear;
   dtmAPrev.qryAux.SQL.Add('INSERT INTO LOGTOTALPREV(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA) ');
   dtmAPrev.qryAux.SQL.Add('VALUES  ');
   dtmAPrev.qryAux.SQL.Add('(SEQLOGTOTALPREV.NEXTVAL, 456,' + QuotedStr(sOperacao) + ',' + IntToStr(sistema.idusuario) + ',SYSDATE) ');
   dtmAPrev.qryaux.execsql;
 except
   Result:=False;
 end;


End;



Function TfrmCadContribuicaoPortada.Mascara(edt: String; str: String): String;
Var
   i: integer;
Begin
   For i := 1 To Length(edt) Do
      Begin
         If (str[i] = '9') And Not (edt[i] In ['0'..'9']) And (Length(edt) = Length(str) + 1) Then
            delete(edt, i, 1);
         If (str[i] <> '9') And (edt[i] In ['0'..'9']) Then
            insert(str[i], edt, i);
      End;
   result := edt;
End;

Procedure TfrmCadContribuicaoPortada.edtcnpjChange(Sender: TObject);
Begin
   Inherited;

   //edtcnpj.SelStart := Length(edtcnpj.Text);
End;

Procedure TfrmCadContribuicaoPortada.LimpaCamposPortabilidade;
Begin
   edtentidade.Text := '';
   mskcnpj.Text := '';
//   If MontaSelect.ValoresChave[10] = 'A' Then
      RbAberta.Checked := False;
      RbFechada.Checked := False;
   edtcnpb.Text := '';
   RbRegressivo.Checked := false;
   RbProgressivo.Checked := false;
   DtDataOpcaoIrReg.Text := '';  // Vinicius Ferreira SOL 151400 KINTANA 1109408
   DtDataRecebimento.Date := now;
   edtanos.Text:='';
   edtmeses.Text:='';
   edtempomeses.Text:='';

End;

procedure TfrmCadContribuicaoPortada.HabilitaBotoesDetalhe;
begin

if PortabilidadeTemHistorico(QryPortabilidade.FieldByName('idportabilidade').asInteger) then
     begin
       sbtnAltDet.Enabled := true;
       sbtnExcluiDet.Enabled := true;
     end
     else
     begin
        sbtnAltDet.Enabled := False;
        sbtnExcluiDet.Enabled:= False;
     end;
   sbtnInsDet.Enabled := true;
end;

procedure TfrmCadContribuicaoPortada.EdtAnoReferenciaKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  ValidaCampoNumerico(Key);
end;

procedure TfrmCadContribuicaoPortada.EdtMesReferenciaKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  ValidaCampoNumerico(Key);
end;

procedure TfrmCadContribuicaoPortada.DesabilitaBotoesDetalhe;
begin
    sbtnAltDet.Enabled := False;
    sbtnExcluiDet.Enabled:= False;
    sbtnInsDet.Enabled := False;
end;

procedure TfrmCadContribuicaoPortada.LimpaDadosParticipante;
begin
   edtanos.Text := '0';
   edtmeses.Text := '0';
   edtempomeses.Text := '';
   LblParticipante.Caption:='';
   LblInscricao.Caption:='';
   LblMatricula.Caption:='';
   LblPatrocinadora.Caption:='';
   LblPlanoPrevidenciario.Caption:='';
   LblContribuicao.Caption:='';

end;

procedure TfrmCadContribuicaoPortada.EdtMesReferenciaExit(Sender: TObject);
begin
  inherited;
  if Trim(EdtMesReferencia.text) <>'' then
   begin
     if (StrToInt(EdtMesReferencia.text) > 12) or (StrToInt(EdtMesReferencia.text) < 1) then
       begin
       MessageDlg('Mês Inválido',mtError,[mbok],0);
       EdtMesReferencia.SetFocus;
       abort;
      end;
   end;

end;

procedure TfrmCadContribuicaoPortada.ValidaCampoNumerico(var Key: char);
begin
  if key<>'' then
   begin
      if not (Key = #8 ) then
       begin
        If Not (Key In ['0'..'9'] )  Then
          KEY := #0;
       end;
   end;

end;

procedure TfrmCadContribuicaoPortada.EdtAnoReferenciaChange(
  Sender: TObject);
begin
  inherited;
   edtDataPrevisao.text := DateToStr(DtDataRecebimento.date);
   EdtAnoCobranca.Text := copy(edtdataprevisao.Text, 7, 4);
   EdtMesCobranca.Text := copy(edtdataprevisao.Text, 4, 2);
end;
//SOL 137378 Kintana 834829 criação da procedure
procedure TfrmCadContribuicaoPortada.dtDatainicioExit(Sender: TObject);
begin
   inherited;
   if (dtDatainicio.Text <> '') and (dtDatafim.Text <> '') then
   begin
      edtanos.Text   := inttostr(entremeses(QryMesEntreData,strtodate(dtDatainicio.Text), strtodate(dtDatafim.Text),0));
      edtmeses.Text  := inttostr(entremeses(QryMesEntreData,strtodate(dtDatainicio.Text), strtodate(dtDatafim.Text),1));
   end;
   CalculaTempoTotalVinculo;
end;
//SOL 137378 Kintana 834829 criação da procedure
procedure TfrmCadContribuicaoPortada.dtDatafimExit(Sender: TObject);
begin
   inherited;
   if (dtDatainicio.Text <> '') and (dtDatafim.Text <> '') then
   begin
      edtanos.Text   := inttostr(entremeses(QryMesEntreData,strtodate(dtDatainicio.Text), strtodate(dtDatafim.Text),0));
      edtmeses.Text  := inttostr(entremeses(QryMesEntreData,strtodate(dtDatainicio.Text), strtodate(dtDatafim.Text),1));
   end;
   CalculaTempoTotalVinculo;
end;


procedure TfrmCadContribuicaoPortada.RbRegressivoClick(Sender: TObject);
begin
  inherited;
   DtDataOpcaoIrReg.Enabled := True;
end;

procedure TfrmCadContribuicaoPortada.RbProgressivoClick(Sender: TObject);
begin
  inherited;
   DtDataOpcaoIrReg.Enabled := False;
end;


procedure TfrmCadContribuicaoPortada.QryDetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('VALORESPERADO').OnGetText := OnMyGetText;
  qryDet.FieldByName('VALORRECEBIDO').OnGetText := OnMyGetText;
  qryDet.FieldByName('VALORPARARESERVA').OnGetText := OnMyGetText;
  //qryDet.FieldByName('VALORTOTAL').OnGetText := OnMyGetText;
end;

procedure TfrmCadContribuicaoPortada.OnMyGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if (Sender.AsString <> '') then begin
    Text := FormatFloat('###0.00',Sender.AsFloat);
  end;
  //Sender.asFloat := 2000;
end;

procedure TfrmCadContribuicaoPortada.sbtnProcurarEntidadeMouseExit(
  Sender: TObject);
begin
  inherited;
  if (bInsere) or (bAltera) then
     sbtnProcurarEntidade.Enabled := True
  else
     sbtnProcurarEntidade.Enabled :=  False;
end;

procedure TfrmCadContribuicaoPortada.sbtnProcurarEntidadeClick(
  Sender: TObject);
begin
  //inherited;
  MontaEntidadeOrigem.Executar;

  if (MontaEntidadeOrigem.RetornouValor) then
  begin
       edtentidade.Text := MontaEntidadeOrigem.ValoresChave[1];
       MskCNPJ.Text := MontaEntidadeOrigem.ValoresChave[2];
       if(MontaEntidadeOrigem.ValoresChave[3] = 'A') then
         RbAberta.Checked
       else
         RbFechada.Checked;
       edtcnpb.Text := MontaEntidadeOrigem.ValoresChave[4];  
  end;

  sbtnProcurarEntidade.Down := False;
end;
// Início - William Santana - SOL 208796 PPM 2017611

procedure TfrmCadContribuicaoPortada.btnImportaArquivoClick(
  Sender: TObject);
begin
  inherited;
  if not dialog.Execute then
    Exit
  else
      edtImportaArquivo.Text := ExtractFileName(dialog.FileName);
      btnImportaArquivo.Down := false;       
end;

function TfrmCadContribuicaoPortada.validaArquivoImportacao():boolean;

  function ValidaInt_Float(texto, tipo : String): Boolean;
  var
    x : Double;
    i: integer;
  begin
    //valida se texto informado é integer ou float
    result := False;

    if tipo = 'int' then
    begin
      for i := 1 to length(texto) do
      if not(texto[i] in ['0'..'9']) then
        exit;
    end
    else
    if tipo = 'float' then
    begin
      if (copy(texto,1,1) = '-') then
        texto := copy(texto,2,999);
    for i := 1 to length(texto) do
        if not(texto[i] in ['0'..'9',DecimalSeparator]) then
        exit;     
    end;
    try
     x := StrToFloat(texto);
     result := True ;
    except
     result := False;
    end;
  end;

  function ValidaAnoMes(anomes : String): Boolean;
  begin
   //valida formato MMMM/AA
    try
      result := true;
      anomes := trim(anomes);
      if Length(anomes) <> 7 then
       begin
        result := false;
        exit;
       end
      else
      if ((Copy(anomes,5,1)) <> '/' ) then
       begin
        result := false;
        exit;
       end;

      if not(ValidaInt_Float(Copy(anomes,1,4),'int') and ValidaInt_Float(Copy(anomes,6,2),'int')) then
      begin
        result := false;
        exit;
      end;

      if (StrToInt(Copy(anomes,6,2)) < 1) or (StrToInt(Copy(anomes,6,2)) > 12)  then
      begin
        result := false;
        exit;
      end;

    except
      result := false;
      exit;
    end ;

  end;

  function validaLayoutExcel(Excel: Variant):boolean;
  begin
    result := false;

    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,1].Value)))  = 'INDEXADOR' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,2].Value)))  = 'MESREFERENCIA' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,3].Value)))  = 'VALOR' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,4].Value)))  = 'CNPB/SUSEP' then
    //Leandro Pocebon - SIG131206 - Inicio
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,5].Value)))  = 'FLGDEVOLUCAO' then
    if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,6].Value)))  = 'IDCONTRIBUICAO' then
    //Leandro Pocebon - SIG131206 - Fim
    Result := True;

  end;

  function ValidaDadosArquivo(Excel: Variant):boolean;
  var
  linha, contErros: integer;
  anoMes : String;
  begin
    result:= false;
    contErros :=0;
    linha:=2;

    while not UltimaLinha(Excel,linha) do
    begin

     anoMes := VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value);

     if not(ValidaAnoMes(anoMes)) then
     begin
       //valida se MESREFERENCIA está no formato MMMM/AA
       mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - Mês inválido.');
       inc(contErros);
     end
     else
     If StrToDate('01/' +Copy(anoMes,6,2) + '/' + Copy(anoMes,1,4)) > StrToDate('01/' + EdtMesCobranca.Text + '/' + EdtAnoCobranca.Text) Then
     Begin
       //valida se MESREFERENCIA é menor que MESCOBRANCA
       mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - O Ano/Mês de Referencia não pode ser maior que o Ano/Mês de Cobrança');
       inc(contErros);
     end;
     if not(ValidaInt_Float(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value),'float'))  then
     begin
       mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - Valor inexistente ou inválido.');
       inc(contErros);
     end
     else
     //Leandro Pocebon - SIG131206 - Inicio
     //if (StrToFloat(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) <=0) then
     //begin
     //  mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - O campo Valor Esperado deve ser maior que zero.');
     //  inc(contErros);
     //end;
     //Leandro Pocebon - SIG131206 - Fim

     if not(ValidaInt_Float(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value),'int')) then
     begin
       //valida se CNPB/SUSEP é número
       mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - SUSEP/CNPB inexistente ou inválido.');
       inc(contErros);
     end
     else
     begin
      //valida se CNPB/SUSEP existe e está associado à pessoa selecionada

      qryAux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT 1 FROM ENTIDADEORIGEM E, PORTABILIDADEPREV P  ');
      qryAux.SQL.Add(' WHERE E.IDENTIDADEORIGEM = P.IDENTIDADEORIGEM      ');
      qryAux.SQL.Add(' AND P.IDPESSOA = '  + MontaSelect.ValoresChave[7]    );
      qryAux.SQL.Add(' AND E.CNPBSUSEP = ' + QuotedStr(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)) );
      qryAux.SQL.Add(' AND E.IDENTIDADEORIGEM = '+ QryPortabilidade.FieldByname('identidadeorigem').AsString );
      qryAux.open;

      if qryAux.IsEmpty then
      begin
        mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - SUSEP/CNPB inexistente ou inválido.');
        inc(contErros);
      end;
     end;

     //Leandro Pocebon - SIG131206 - Inicio
     if not(ValidaInt_Float(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value),'int')) then
     begin
       //valida se FLGDEVOLUCAO é número
       mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - FLGDEVOLUCAO inexistente ou inválido.');
       inc(contErros);
     end
     else
     begin
       //valida se FLGDEVOLUCAO é 0 ou 1
       if (StrToFloat(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) <0) or
          (StrToFloat(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) >1) then
       begin
         mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - O campo FLGDEVOLUCAO deve conter 0 ou 1.');
         inc(contErros);
       end;
     end;

     if (StrToFloat(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) = 0) then
     begin
       if (StrToFloat(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) <=0) then
       begin
         mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - O campo Valor Esperado deve ser maior que zero.');
         inc(contErros);
       end;
     end;

     if not(ValidaInt_Float(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value),'int')) then
     begin
       //valida se IDCONTRIBUICAO é número
       mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - IDCONTRIBUICAO inexistente ou inválido.');
       inc(contErros);
     end
     else
     begin
      //valida se IDCONTRIBUICAO existe e está associado

      qryAux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT count(*) as total FROM CONTRIBPREVPARTP C, PORTABILIDADEPREV P  ');
      qryAux.SQL.Add(' WHERE C.IDCONTRIBUICAO = P.IDCONTRIBUICAO      ');
      qryAux.SQL.Add(' AND   C.IDPESSOA = P.IDPESSOA       ');
      qryAux.SQL.Add(' AND P.IDPESSOA = '  + MontaSelect.ValoresChave[7]    );
      qryAux.SQL.Add(' AND C.IDCONTRIBUICAO = ' + QuotedStr(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value)) );
      qryAux.open;

      if qryAux.fieldbyname('total').asfloat <= 0 then
      begin
        mmoLog.Lines.Add('Linha '+IntToStr(linha)+ ' - IDCONTRIBUICAO inexistente ou inválido.');
        inc(contErros);
      end;
     end;
     //Leandro Pocebon - SIG131206 - Fim

     inc(linha);
    end;

    if contErros = 0 then
     result := true
    else
     pgctrlDetalhe.ActivePage := tbsLog;

  end;

var
  ext : string;
  Excel : Variant;
begin

  mmoLog.Lines.Clear;

  result := false;
  ext := AnsiUpperCase(ExtractFileExt(edtImportaArquivo.text));

  if not((ext = '.XLS') or (ext = '.XLSX')) then
  begin
    MessageDlg('O arquivo deverá ser em formato excel.', mtError, [mbok], 0);
    exit;
  end;

  Excel := CreateOleObject('Excel.application');
  Excel.Visible := False;
  //abre arquivo em modo somente leitura
  Excel.WorkBooks.Open(ExpandUNCFileName(dialog.FileName),1);

  try

    if not(validaLayoutExcel(Excel)) then
    begin
      MessageDlg('O arquivo não está no layout correto para importação.', mtError, [mbok], 0);
      exit;
    end;

    if not (ValidaDadosArquivo(Excel)) then
    exit;

    result := True;

  finally
    Excel.ActiveWorkBook.Saved:= 1;
    Excel.DisplayAlerts:= 0;
    Excel.ActiveWorkBook.Close(SaveChanges:= 0);
    Excel.Workbooks.Close;
    Excel.Quit;
    Excel := Unassigned;
  end;                 

end;

function TfrmCadContribuicaoPortada.UltimaLinha(Excel : Variant; linha: Integer) : Boolean;
var
  cont : integer;
begin
  Result := False;
  if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)) = '') then
  Result := True;

end;

Function TfrmCadContribuicaoPortada.InsereHistoricoViaArquivo: Boolean;
var
 Excel : Variant;
 linha : integer;
 anomes, valorEsperado, FlgDevolucao, IdContribuicao: string;
begin

  Excel := CreateOleObject('Excel.application');
  Excel.Visible := False;
  //abre arquivo em modo somente leitura
  Excel.WorkBooks.Open(ExpandUNCFileName(dialog.FileName),1);

  linha:=2;
  try

   while not UltimaLinha(Excel,linha) do
   begin

     anoMes := VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value);
     valorEsperado  := VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value);
     FlgDevolucao   := VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value);   //Leandro Pocebon SIG131206
     IdContribuicao := VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value);   //Leandro Pocebon SIG131206

     //Leandro Pocebon - SIG131260 - Inicio
     //QryAux.Close;
     //QryAux.SQL.clear;
     //QryAux.SQL.Add(' SELECT 1 FROM HSTCONTRIBPREV H  ');
     //QryAux.SQL.Add(' WHERE H.MESREFERENCIA =  '+ QuotedStr(Copy(anoMes,1,4) + '/' + Copy(anoMes,6,2)));
     //QryAux.SQL.Add(' AND H.MESCOBRANCA = '     + QuotedStr(EdtAnoCobranca.Text + '/' + EdtMesCobranca.Text));
     //QryAux.SQL.Add(' AND H.IDMOTIVO = 3054  ');
     //QryAux.SQL.Add(' AND H.IDPESSOA = '+ QryPortabilidade.fieldbyname('idpessoa').AsString );
     //QryAux.SQL.Add(' AND H.VALORESPERADO = '+ QuotedStr(valorEsperado) );
     //QryAux.Open;

     //if QryAux.isEmpty then
     //begin
     //Leandro Pocebon - SIG131260 - Fim

       QryAux.Close;
       QryAux.SQL.clear;

       PreparadaQueryHSTCONTRIBPREV(QryAux); //SIG85342

       QryAux.ParambyName('MESREFERENCIA').AsString := Copy(anoMes,1,4) + '/' + Copy(anoMes,6,2);
       QryAux.ParambyName('VALORESPERADO').AsFloat := StrToFloat(TiraPonto(valorEsperado));

       QryAux.ParambyName('NUMRECEBIMENTO').AsInteger := LeUltRegistro(dtmAPrev.qryAux, 'HSTCONTRIBPREV');
       QryAux.ParambyName('IDMOTIVO').AsInteger := 3054; //CONTRIBUICAO PORTADA
       QryAux.ParambyName('MESCOBRANCA').AsString := EdtAnoCobranca.Text + '/' + EdtMesCobranca.Text;
       QryAux.ParambyName('IDPESSJUR').AsInteger := QryPortabilidade.fieldbyname('idpessjur').asinteger;
       QryAux.ParambyName('IDPLANOPREV').AsInteger := QryPortabilidade.fieldbyname('idplanoprev').asinteger;
       QryAux.ParambyName('IDPESSOA').AsInteger := QryPortabilidade.fieldbyname('idpessoa').asinteger;

       QryAux.ParambyName('IDTITULAR').AsInteger := QryPortabilidade.fieldbyname('idpessoa').asinteger;//SIG85342

       //QryAux.ParambyName('IDCONTRIBUICAO').AsInteger := StrToInt(MontaSelect.ValoresChave[6]); //Leandro Pocebon - SIG131260
       QryAux.ParambyName('IDCONTRIBUICAO').AsInteger := StrToInt(IdContribuicao); //Leandro Pocebon - SIG131260
       QryAux.ParambyName('SEQPROPOSTA').AsInteger := 1;
       //QryAux.ParambyName('FLGDEVOLUCAO').AsInteger := 0; //é cobrança //Leandro Pocebon - SIG131260
       QryAux.ParambyName('FLGDEVOLUCAO').AsInteger := StrToInt(FlgDevolucao); //é cobrança //Leandro Pocebon - SIG131260
       QryAux.ParambyName('FLGDIVERGENTE').AsInteger := 0; //nao ha divergencia
       QryAux.ParambyName('FLGCONCESSAO').AsInteger := 0; //nao foi gerada pela concessao
       QryAux.ParambyName('FLGEVENTO').AsInteger := 0; //
       QryAux.ParambyName('FLGCALCRESERVA').AsInteger := 0; //CONTRIBUICAO AINDA NAO ALIMENTOU A RESERVA
       QryAux.ParambyName('FLGDESCFOLHA').AsInteger := 0; //BANCARIA
       QryAux.ParambyName('FLGSITFUNDACAO').Asstring := SituacaoParticipante(StrToInt(MontaSelect.ValoresChave[11])); //Situacao do Participante na fundação
       QryAux.ParambyName('FLGAPORTE').AsInteger := 0; //contribuição nao voluntaria

       QryAux.ParambyName('VALORRECEBIDO').AsInteger := 0; //será alimentado no recebimento da contribuição
       QryAux.ParambyName('VALORCALCULADO').AsFloat := QryAux.ParambyName('VALORESPERADO').asfloat;
       QryAux.ParambyName('DATAPREVISAORECE').AsDateTime := StrToDate(edtDataprevisao.text); //vai informar depois do recebimento
       QryAux.ParambyName('DATAINICIO').AsDateTime := StrToDate(MontaSelect.ValoresChave[12]); //DataInicio
       If MontaSelect.ValoresChave[13] = '' Then
          QryAux.ParambyName('DATAFINAL').AsDateTime := 0
       Else
          QryAux.ParambyName('DATAFINAL').AsDateTime := StrToDate(MontaSelect.ValoresChave[13]); //DataFinal

       QryAux.ParambyName('IDREGRACALCULO').AsInteger := 0;
       QryAux.ParambyName('SITRECEBIMENTO').AsInteger := 0; //NAO ENVIADO
       QryAux.ParambyName('TIPO').AsString := 'F';
       QryAux.ParambyName('VALOROP1').AsInteger := 0;
       QryAux.ParambyName('VALOROP2').AsInteger := 0;
       QryAux.ParambyName('VALOROP3').AsInteger := 0;
       QryAux.ParambyName('FLGMANUAL').AsInteger := 2;
       QryAux.ParambyName('FOLHAORIGEM').AsString := 'C'; //Via Banco
       QryAux.ParambyName('CODPORTFORMA').AsInteger := 10; //CEF-ON LINE
       QryAux.ParambyName('IDPORTABILIDADE').AsInteger := QryPortabilidade.fieldbyname('idportabilidade').asinteger;


       QryAux.ExecSQL;
          If Not GravaLogTOTALPREV('Alimentação de contribuições portadas ' + FormatDateTime('yyyy/mm', now)
                  + ' Part. ' + MontaSelect.ValoresChave[0] + ' Contr. ' + MontaSelect.ValoresChave[5])
          Then Begin
             MessageDlg('Erro ao Gravar o Log.', mtError, [mbOK], 0);
          End;
     //end; //Leandro Pocebon - SIG131260
     inc(linha);

   End;

  finally
    Excel.ActiveWorkBook.Saved:= 1;
    Excel.DisplayAlerts:= 0;
    Excel.ActiveWorkBook.Close(SaveChanges:= 0);
    Excel.Workbooks.Close;
    Excel.Quit;
    Excel := Unassigned;
  end;


end;

// Término - William Santana - SOL 208796 PPM 2017611

//SIG85342 -inicio
procedure TfrmCadContribuicaoPortada.PreparadaQueryHSTCONTRIBPREV(QueryHSTCONTRIBPREV: TwwQuery);
begin
   QueryHSTCONTRIBPREV.SQL.Add(' INSERT INTO HSTCONTRIBPREV(');
   QueryHSTCONTRIBPREV.SQL.Add('   NUMRECEBIMENTO, IDMOTIVO, MESREFERENCIA, MESCOBRANCA, IDPESSJUR, IDPLANOPREV, ');
   QueryHSTCONTRIBPREV.SQL.Add('   IDPESSOA, IDCONTRIBUICAO, SEQPROPOSTA, FLGDEVOLUCAO, FLGDIVERGENTE, ');
   QueryHSTCONTRIBPREV.SQL.Add('   FLGCONCESSAO, FLGEVENTO, FLGCALCRESERVA, FLGDESCFOLHA, FLGSITFUNDACAO, ');
   QueryHSTCONTRIBPREV.SQL.Add('   FLGAPORTE, VALORESPERADO, VALORRECEBIDO, VALORCALCULADO,');
   QueryHSTCONTRIBPREV.SQL.Add('   DATAINICIO, DATAFINAL, IDREGRACALCULO, SITRECEBIMENTO, ');
   QueryHSTCONTRIBPREV.SQL.Add('   TIPO, VALOROP1, VALOROP2, VALOROP3, FLGMANUAL, FOLHAORIGEM, CODPORTFORMA ,IDPORTABILIDADE,DATAPREVISAORECE,');
   QueryHSTCONTRIBPREV.SQL.Add('   IDTITULAR');//SIG85342
   QueryHSTCONTRIBPREV.SQL.Add(' )');
   QueryHSTCONTRIBPREV.SQL.Add(' VALUES(');
   QueryHSTCONTRIBPREV.SQL.Add('    :NUMRECEBIMENTO, :IDMOTIVO, :MESREFERENCIA, :MESCOBRANCA, :IDPESSJUR, ');
   QueryHSTCONTRIBPREV.SQL.Add('    :IDPLANOPREV, :IDPESSOA, :IDCONTRIBUICAO, :SEQPROPOSTA, :FLGDEVOLUCAO, ');
   QueryHSTCONTRIBPREV.SQL.Add('    :FLGDIVERGENTE, :FLGCONCESSAO, :FLGEVENTO, :FLGCALCRESERVA, :FLGDESCFOLHA, ');
   QueryHSTCONTRIBPREV.SQL.Add('    :FLGSITFUNDACAO, :FLGAPORTE, :VALORESPERADO, :VALORRECEBIDO, :VALORCALCULADO, ');
   QueryHSTCONTRIBPREV.SQL.Add('    :DATAINICIO, :DATAFINAL, :IDREGRACALCULO, ');
   QueryHSTCONTRIBPREV.SQL.Add('    :SITRECEBIMENTO, :TIPO, :VALOROP1, :VALOROP2, :VALOROP3,:FLGMANUAL, ');
   QueryHSTCONTRIBPREV.SQL.Add('    :FOLHAORIGEM, :CODPORTFORMA,:IDPORTABILIDADE,:DATAPREVISAORECE, ');
   QueryHSTCONTRIBPREV.SQL.Add('    :IDTITULAR'); //SIG85342
   QueryHSTCONTRIBPREV.SQL.Add(' )');

   QueryHSTCONTRIBPREV.ParambyName('NUMRECEBIMENTO').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('IDMOTIVO').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('MESREFERENCIA').DataType := ftstring;
   QueryHSTCONTRIBPREV.ParambyName('MESCOBRANCA').DataType := ftstring;
   QueryHSTCONTRIBPREV.ParambyName('IDPESSJUR').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('IDPLANOPREV').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('IDPESSOA').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('IDCONTRIBUICAO').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('SEQPROPOSTA').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('FLGDEVOLUCAO').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('FLGDIVERGENTE').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('FLGCONCESSAO').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('FLGEVENTO').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('FLGCALCRESERVA').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('FLGDESCFOLHA').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('FLGSITFUNDACAO').DataType := ftstring;
   QueryHSTCONTRIBPREV.ParambyName('FLGAPORTE').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('VALORESPERADO').DataType := ftFloat;
   QueryHSTCONTRIBPREV.ParambyName('VALORRECEBIDO').DataType := ftFloat;
   QueryHSTCONTRIBPREV.ParambyName('VALORCALCULADO').DataType := ftFloat;
   QueryHSTCONTRIBPREV.ParambyName('DATAPREVISAORECE').DataType := ftDate;
   QueryHSTCONTRIBPREV.ParambyName('DATAINICIO').DataType := ftDate;
   QueryHSTCONTRIBPREV.ParambyName('DATAFINAL').DataType := ftDate;
   QueryHSTCONTRIBPREV.ParambyName('IDREGRACALCULO').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('SITRECEBIMENTO').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('TIPO').DataType := ftstring;
   QueryHSTCONTRIBPREV.ParambyName('VALOROP1').DataType := ftFloat;
   QueryHSTCONTRIBPREV.ParambyName('VALOROP2').DataType := ftFloat;
   QueryHSTCONTRIBPREV.ParambyName('VALOROP3').DataType := ftFloat;
   QueryHSTCONTRIBPREV.ParambyName('FLGMANUAL').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('FOLHAORIGEM').DataType := ftstring;
   QueryHSTCONTRIBPREV.ParambyName('CODPORTFORMA').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('IDPORTABILIDADE').DataType := ftinteger;
   QueryHSTCONTRIBPREV.ParambyName('IDTITULAR').DataType := ftinteger;//SIG85342
end;
//SIG85342 -fim

procedure TfrmCadContribuicaoPortada.rgDevolucaoClick(Sender: TObject);
begin
  inherited;
  //Leandro Pocebon - SIG131206 - Inicio
  if rgDevolucao.Itemindex = 0 then
  begin
    EdtValorEsperado.Signal := false;
    EdtValorEsperado.Value  := EdtValorEsperado.Value * -1;
  end  
  else
    EdtValorEsperado.Signal := true;
  //Leandro Pocebon - SIG131206 - Fim  
end;

End.


unit fManutReembolsoINSS;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : - (qry2)
Data      : 26/09/2006
Autor     : André Pontes
Pendência : 23329
Descrição : Exibição do plano do registro na DetConc, uma vez que não é possível fazer o especificado
            originalmente na pendência, já que a tela permite editar os registros
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, Wwdatsrc, Menus, ComCtrls, Mask, wwdbedit, wwdblook,
  Spin, Wwdotdot, Wwdbcomb, wwdbdatetimepicker, uDataBase, uMensErro,
  DBCtrls;

type
  TfrmManutReembolsoINSS = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    MontaSelect1: TMontaSelect;
    qry2: TwwQuery;
    qryBenefbfciario: TwwQuery;
    dsBenefbfciario: TwwDataSource;
    ds2: TwwDataSource;
    qryHeader: TwwQuery;
    popup1: TPopupMenu;
    popup2: TPopupMenu;
    AlteraRegistro1: TMenuItem;
    AlteradadosdaConciliao1: TMenuItem;
    pgctrl: TPageControl;
    tabBeneficio: TTabSheet;
    Panel2: TPanel;
    Label2: TLabel;
    dbg1: TwwDBGrid;
    Panel3: TPanel;
    Label3: TLabel;
    dbg2: TwwDBGrid;
    tabLocaliza: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    Bevel1: TBevel;
    qryPessoa: TwwQuery;
    grpTipo: TRadioGroup;
    pnlEditaBenef: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cmbBeneficio: TwwDBLookupCombo;
    qryBeneficio: TwwQuery;
    Label10: TLabel;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    pnlEditaRubrica: TPanel;
    label34: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dsPessoa: TwwDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    lblParticipante: TStaticText;
    lblMant: TStaticText;
    lblOrgaoMant: TStaticText;
    edtMatricula: TEdit;
    edtnumBenef: TEdit;
    wwDBGrid2: TwwDBGrid;
    Label4: TLabel;
    Label17: TLabel;
    qryTempConcINSS: TwwQuery;
    GroupBox1: TGroupBox;
    cboxMes: TComboBox;
    spAno: TSpinEdit;
    dsTempConcINSS: TwwDataSource;
    qryTempConcINSSNOME: TStringField;
    Button1: TBitBtn;
    qryTempConcINSSMOTIVO: TStringField;
    btnIdentPessoa: TBitBtn;
    pnlAlteraPessoa: TPanel;
    Dock973: TDock97;
    Toolbar973: TToolbar97;
    ToolbarSep974: TToolbarSep97;
    btnOkAlteracao: TBitBtn;
    BitBtn8: TBitBtn;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lblPessoaExcecao: TStaticText;
    lblPessoaSistema: TStaticText;
    lblCPF: TStaticText;
    lblDataNasc: TStaticText;
    edtMatrPessoa: TEdit;
    qryOrgaoMant: TwwQuery;
    edtNumBenefPessoa: TEdit;
    Label24: TLabel;
    lblMotivo: TStaticText;
    Label25: TLabel;
    cmbDataInicial: TwwDBDateTimePicker;
    cmbDataFinal: TwwDBDateTimePicker;
    cmbDataFinalPrev: TwwDBDateTimePicker;
    dbedtValorINSS: TwwDBEdit;
    Label27: TLabel;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    dbedNumBeneficio: TwwDBEdit;
    Label30: TLabel;
    qryPessoaNOME: TStringField;
    qryPessoaDATANASC: TDateTimeField;
    qryPessoaNUMDOCUMENTO: TStringField;
    qryBenefbfPP: TwwQuery;
    dsBenefbfPP: TwwDataSource;
    updBenefbfPP: TUpdateSQL;
    updBenefbfciario: TUpdateSQL;
    updqry2: TUpdateSQL;
    Label14: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Label15: TLabel;
    Label16: TLabel;
    wwDBEdit1: TwwDBEdit;
    mmObs: TMemo;
    Label31: TLabel;
    qryTempConcINSSNUMPROCINSS: TStringField;
    spAnoRef: TSpinEdit;
    cboxMesRef: TComboBox;
    Label33: TLabel;
    Label35: TLabel;
    cboxAtiva: TCheckBox;
    qryTempConcINSSIDPESSOA: TFloatField;
    qryTempConcINSSESPECIE: TStringField;
    qryTempConcINSSCODCONCESSORINSS: TStringField;
    qryTempConcINSSCODMANTENEDORINSS: TStringField;
    qryTempConcINSSMATRICULA: TStringField;
    GroupBox2: TGroupBox;
    edtCodRubrica1: TEdit;
    edtVlrRubrica1: TEdit;
    Label9: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    edtCodRubrica2: TEdit;
    edtVlrRubrica2: TEdit;
    Label40: TLabel;
    edtCodRubrica3: TEdit;
    edtVlrRubrica3: TEdit;
    Label41: TLabel;
    edtCodRubrica4: TEdit;
    edtVlrRubrica4: TEdit;
    qryTempConcINSSCODRUBRICA1: TFloatField;
    qryTempConcINSSCODRUBRICA2: TFloatField;
    qryTempConcINSSCODRUBRICA3: TFloatField;
    qryTempConcINSSCODRUBRICA4: TFloatField;
    qryTempConcINSSVLRRUBRICA1: TFloatField;
    qryTempConcINSSVLRRUBRICA2: TFloatField;
    qryTempConcINSSVLRRUBRICA3: TFloatField;
    qryTempConcINSSVLRRUBRICA4: TFloatField;
    edtOrgaoMant: TEdit;
    edtEspecie: TEdit;
    qryPessoaMATRICULA: TStringField;
    qryPessoaIDPESSOA: TFloatField;
    qry2MESREFERENCIA: TStringField;
    qry2CODMANTENEDORINSS: TStringField;
    qry2CODCONCESSORINSS: TStringField;
    qry2NUMPROCINSS: TStringField;
    qry2IDPESSOA: TFloatField;
    qry2IDBENEFICIO: TFloatField;
    qry2IDRUBRICA: TFloatField;
    qry2PLANO: TStringField;
    qry2DESCRICAO: TStringField;
    qry2CODPROVDESC: TStringField;
    qry2VALORMANT: TFloatField;
    qry2RUBRICAINSS: TFloatField;
    qry2VALORINSS: TFloatField;
    qry2NOME: TStringField;
    qry2NOMEBENEF: TStringField;
    qry2DIF: TFloatField;
    qry2GRUPO: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure AlteraRegistro1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure AlteradadosdaConciliao1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure grpTipoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure qryTempConcINSSAfterScroll(DataSet: TDataSet);
    procedure btnIdentPessoaClick(Sender: TObject);
    procedure btnOkAlteracaoClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtValorMantKeyPress(Sender: TObject; var Key: Char);
    procedure cboxMesRefChange(Sender: TObject);
    procedure cboxAtivaClick(Sender: TObject);
  private
    { Private declarations }
    sIdPessoa,
    sAnoMesRef,
    sTexto         : String;
    bEParticipante : Boolean;

    Procedure MontaQuery(pEParticipante: Boolean);
    Procedure AlinhaPanel;
    Procedure MudaNumProcINSS(Sender: TField);

    Function EParticipante(pIdpessoa: String;
                            var psPatro: String;
                            var psPlano: String): Boolean;

    {* Verifica os dados do participante no mês anterior, para os casos
       que possuam Sal. Mater. ou Aux. Doe.  (FLGATIVO = 1) *}
    Function BuscaDadosMesAnterior :Boolean;

    Procedure LimpaPainel;

    Function VerificaCampos: Boolean;

    Function ValidaRubrica(pCodRubricaINSS: String; var psIdRubrica: String):Boolean;


  public
    { Public declarations }
  end;

var
  frmManutReembolsoINSS: TfrmManutReembolsoINSS;

implementation

uses uAdmPrev;

{$R *.DFM}

procedure TfrmManutReembolsoINSS.BitBtn1Click(Sender: TObject);
Var
  bAchou        : Boolean;
begin
  inherited;
  qryBenefbfciario.Close;
  qryBenefbfPP.Close;
  qry2.Close;

  bAchou := False;

  // MATRICULA PREENCHIDA
  If Trim(edtMatricula.Text) <> '' Then
  Begin
    With qryAux Do
    Begin
      // Se a pessoa estiver na elegpatro E possuir um benefício do inss na benefbfciario,
      // então preenche as vairáveis e termina a procura.
      // FUNDAÇÃO /////
      Sql.Clear;
      Sql.Add(' SELECT DISTINCT E.IDPESSOA  ' +
              ' FROM ELEGPATRO E, BENEFBFCIARIO BF ' +
              ' WHERE E.MATRICULA LIKE ''' + Trim(EdtMatricula.Text)+ '%''' +
              '   AND ((BF.IDPESSOA = E.IDPESSOA) OR ' +
              '        (BF.IDTITULAR = E.IDPESSOA)) ' +
              '   AND BF.NUMPROCINSS IS NOT NULL ');
      Open;
      If Not IsEmpty Then
      Begin
        // atribuições
        sIdPessoa     := FieldByName('IDPESSOA').AsString;
        bEParticipante := True;
        bAchou := True;
      End Else
      Begin
        // MANTENEDORA /////
        Sql.Clear;
        Sql.Add(' SELECT BPP.IDBENEFICIARIOPP AS IDPESSOA ' +
                ' FROM BENEFICIARIOPP BPP, BENEFBFPP B ' +
                ' WHERE BPP.MATRICULA LIKE ''' + Trim(EdtMatricula.Text)+ '%''' +
                '   AND B.IDBENEFICIARIOPP = BPP.IDBENEFICIARIOPP ');
        Open;
        If Not IsEmpty Then
        Begin
          // atribuições
          sIdPessoa     := FieldByName('IDPESSOA').AsString;
          bAchou := True;
          bEParticipante := False;
        End Else
        Begin
          Sql.Clear;
          Sql.Add(' SELECT DISTINCT E.IDPESSOA  ' +
                  ' FROM DEPENTIT E, BENEFBFCIARIO BF ' +
                  ' WHERE E.MATRICULA LIKE ''' + Trim(EdtMatricula.Text)+ '%''' +
                  '   AND BF.IDPESSOA = E.IDPESSOA ' +
                  '   AND BF.NUMPROCINSS IS NOT NULL ');
          Open;
          If Not IsEmpty Then
          Begin
            // atribuições
            sIdPessoa     := FieldByName('IDPESSOA').AsString;
            bAchou := True;
            bEParticipante := True;
          End;
        End;
      End;
    End;

  // NUMERO BENEFÍCIO PREENCHIDO
  End Else If Trim(edtNumBenef.Text) <> '' Then
  Begin
    With qryAux Do
    Begin
      // Se a pessoa estiver na elegpatro E possuir um benefício do inss na benefbfciario,
      // então preenche as vairáveis e termina a procura.
      // FUNDAÇÃO /////
      Sql.Clear;
      Sql.Add(' SELECT IDPESSOA ' +
              ' FROM BENEFBFCIARIO  ' +
              ' WHERE NUMPROCINSS LIKE ''' + trim(edtNumBenef.Text) + '%''' );
      Open;
      If Not IsEmpty Then
      Begin
        // atribuições
        sIdPessoa     := FieldByName('IDPESSOA').AsString;
        bAchou := True;
        bEParticipante := True;
      End Else
      Begin
        // MANTENEDORA /////
        Sql.Clear;
        Sql.Add(' SELECT IDBENEFICIARIOPP AS IDPESSOA ' +
                ' FROM BENEFBFPP BF ' +
                ' WHERE BF.NUMPROCINSS LIKE ''' + trim(edtNumBenef.Text) + '%''' );
        Open;
        If Not IsEmpty Then
        Begin
          // atribuições
          sIdPessoa     := FieldByName('IDPESSOA').AsString;
          bAchou := True;
          bEParticipante := False;
        End;
      End;
    End;
  End Else
  Begin
    MontaSelect1.Executar;
    If MontaSelect1.RetornouValor Then
    Begin
      sIdPessoa := MontaSelect1.valoresChave[0];
      bAchou := True;
      // MS retorna de pessoa, por isso pode ser tanto participante quanto PP
      bEParticipante := True;
    End;
  End;

  If bAchou Then
  Begin
    // abrir a DETCONCINSS e Pais
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT NOME FROM PESSOA ' +
                   ' WHERE IDPESSOA = ' + sIdPessoa  );
    qryAux.Open;
    If Not qryAux.IsEmpty then
      lblParticipante.Caption := qryAux.FieldByName('NOME').AsString;

    MontaQuery(bEParticipante);

    If Not qry2.IsEmpty Then
    Begin
      If bEParticipante Then
        lblMant.Caption := 'FUNCEF'
      Else lblMant.Caption := '';

      edtnumBenef.Text := qry2.FieldByName('NUMPROCINSS').AsString;
      lblOrgaoMant.Caption := qry2.FieldByname('CODMANTENEDORINSS').AsString;
    End Else
    Begin
      lblMant.Caption := '';
      lblOrgaoMant.Caption := '';
      qry2.Close;
      MsgDlg('Não existem dados na tabela de conciliação para esta pessoa.',
             'Atenção',mtWarning,[mbOK],0);
    End
  End Else
  Begin
    lblParticipante.Caption := '';
    edtnumBenef.Text := '';
    edtMatricula.Text := '';
  End;

end;

procedure TfrmManutReembolsoINSS.MontaQuery(pEParticipante: Boolean);
begin
  // Monta query da pessoa de acordo com o caso: Participante ou Posto Prisma.
  // Se for Participante exibe tabelas dos benefícios da Fundação
  // Se for do Posto Prisma exibe as tabelas referentes ao PP.
  If pEParticipante Then
  Begin // Participante

    qryBenefbfciario.Prepare;
    qryBenefbfciario.Close;
    qryBenefbfciario.ParamByName('IDPESSOA').AsString := sIdPessoa;

    // ajusta componentes de acesso a dados.
    dbedtValorINSS.DataField := 'VLRINFINSS';
    dbedNumBeneficio.DataSource := dsBenefbfciario;
    cmbDataInicial.DataSource := dsBenefbfciario;
    cmbDataFinal.DataSource := dsBenefbfciario;
    cmbDataFinalPrev.DataSource := dsBenefbfciario;
    cmbBeneficio.DataSource := dsBenefbfciario;
    dbg1.DataSource := dsBenefbfciario;
    qryBenefbfciario.Open;

  End Else
  Begin // Posto Prisma
    qryBenefbfPP.Prepare;
    qryBenefbfPP.Close;
    qryBenefbfPP.ParamByName('IDPESSOA').AsString := sIdPessoa;

    // ajusta componentes de acesso a dados.
    dbedtValorINSS.DataField := 'VALORATUAL';
    dbedtValorINSS.DataSource := dsBenefbfPP;
    dbedNumBeneficio.DataSource := dsBenefbfPP;
    cmbDataInicial.DataSource := dsBenefbfPP;
    cmbDataFinal.DataSource := dsBenefbfPP;
    cmbDataFinalPrev.DataSource := dsBenefbfPP;
    cmbBeneficio.DataSource := dsBenefbfPP;
    dbg1.DataSource := dsBenefbfPP;
    qryBenefbfPP.Open;
  End;

  // montar updsql de acordo com pEParticipante

  // habilita controles de acordo com a tabela.
  cmbDataInicial.Enabled := dbg1.DataSource = dsBenefbfPP;
  cmbDataFinal.Enabled := dbg1.DataSource = dsBenefbfPP;
  cmbDataFinalPrev.Enabled := dbg1.DataSource = dsBenefbfPP;
  cmbBeneficio.Enabled := dbg1.DataSource = dsBenefbfPP;

  qry2.Close;
  qry2.ParamByName('IDPESSOA').AsString := sIdPessoa;
  qry2.Open;

end;

procedure TfrmManutReembolsoINSS.AlteraRegistro1Click(Sender: TObject);
begin
  inherited;
  If (qryBenefbfciario.Active or qryBenefbfPP.Active) And
    ((Not qryBenefbfciario.IsEmpty) or (Not qryBenefbfPP.IsEmpty)) Then
  Begin
    pnlEditaBenef.BringToFront;
    If bEParticipante Then
      qryBenefbfciario.Edit
    Else qryBenefbfPP.Edit;
  End;
end;

procedure TfrmManutReembolsoINSS.FormShow(Sender: TObject);
var
 dAno, dMes, dDia: Word;
begin
  inherited;
  WindowState := wsMaximized;

  // alinha os paineis
  pnlEditaBenef.Top        := dbg1.Top;
  pnlEditaBenef.Height     := dbg1.Height;
  pnlEditaBenef.Width      := dbg1.Width;

  pnlEditaRubrica.Top      := dbg2.Top;
  pnlEditaRubrica.Height   := dbg2.Height;
  pnlEditaRubrica.Width    := dbg2.Width;

  pnlEditaBenef.SendToBack;
  pnlEditaRubrica.SendToBack;

  DecodeDate(Now,dAno,dMes,dDia);
  spAno.Value              := dAno;
  spAnoRef.Value           := dAno;

  cboxMes.ItemIndex        := dMes - 1;
  cboxMesRef.ItemIndex     := dMes - 1;

  pnlAlteraPessoa.Visible  := False;
  pgctrl.ActivePageIndex   := 0;

  qryBeneficio.Open;
  qryOrgaoMant.Open;
end;

procedure TfrmManutReembolsoINSS.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  // aborta e volta a grid.
  pnlEditaBenef.SendToBack;
  Abort;
end;

procedure TfrmManutReembolsoINSS.AlteradadosdaConciliao1Click(
  Sender: TObject);
begin
  inherited;
  If (qry2.Active) And (Not qry2.IsEmpty) Then
  Begin
    dbg2.SendToBack;
    qry2.Edit;
  End;
end;

procedure TfrmManutReembolsoINSS.BitBtn4Click(Sender: TObject);
begin
  inherited;
  dbg2.BringToFront;
  Abort;
end;

procedure TfrmManutReembolsoINSS.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  pnlEditaBenef.SendToBack;
  Abort;
end;

procedure TfrmManutReembolsoINSS.BitBtn3Click(Sender: TObject);
begin
  inherited;
  pnlEditaRubrica.SendToBack;
  Abort;
end;

procedure TfrmManutReembolsoINSS.grpTipoClick(Sender: TObject);
var
  i,j   : Integer;
  Nome1,
  Nome2 : String;
begin
  inherited;
  If grpTipo.ItemIndex < 0 Then Exit;

  i := Pos(' ', qryTempConcINSS.FieldByName('NOME').AsString);
  Nome1 := Trim(Copy(qryTempConcINSS.FieldByName('NOME').AsString, 1,i - 1));

  If  grpTipo.ItemIndex = 1 Then
  Begin
    j := Pos(' ', Copy(qryTempConcINSS.FieldByName('NOME').AsString, i + 1,
        length(qryTempConcINSS.FieldByName('NOME').AsString)));
    Nome2 := Trim(Copy(qryTempConcINSS.FieldByName('NOME').AsString,i + 1 ,j ));
    Nome1 := Nome1 + ' ' + Nome2;
  End;

  If Trim(Nome1) <> '' Then
  Begin
    qryPessoa.Close;
    qryPessoa.Prepare;
    qryPessoa.ParamByName('NOME').AsString := Nome1 + '%';
    qryPessoa.Open;
    btnIdentPessoa.Enabled := True;
  End;

end;

procedure TfrmManutReembolsoINSS.Button1Click(Sender: TObject);
var
  sAnoMes       : String;
begin
  inherited;

 sAnoMes := spAno.Text;
  If (cboxMes.ItemIndex) <= 9 Then
    sAnoMes := sAnoMes + '/0' + IntToStr(cboxMes.ItemIndex + 1)
  Else  sAnoMes := sAnoMes + '/' + IntToStr(cboxMes.ItemIndex + 1);

  qryTempConcINSS.Close;
  qryTempConcINSS.ParamByName('MESREFERENCIA').AsString :=  sAnoMes;
  qryTempConcINSS.Open;

  btnIdentPessoa.Enabled := False;

  grpTipo.OnClick(Self);
end;

procedure TfrmManutReembolsoINSS.qryTempConcINSSAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  grpTipo.OnClick(Self);
end;

procedure TfrmManutReembolsoINSS.btnIdentPessoaClick(Sender: TObject);
var
  sPatro,
  sPLano: String;
begin
  inherited;
  LimpaPainel;

  // chama penal para edição do registro
  // caso não seja localizado pessoa no sistema, deve-se inseri em PESSOA um novo registro.
  lblPessoaExcecao.Caption := qryTempConcINSS.FieldByName('NOME').AsString;
  lblPessoaSistema.Caption := qryPessoa.FieldByName('NOME').AsString;
  lblCPF.Caption           := qryPessoa.FieldByName('NUMDOCUMENTO').AsString;
  lblDataNasc.Caption      := qryPessoa.FieldByName('DATANASC').AsString;
  lblMotivo.Caption        := qryTempConcINSS.FieldByName('MOTIVO').AsString;
  edtMatrPessoa.Text       := qryPessoa.FieldBYName('MATRICULA').AsString;

  edtCodRubrica1.Text := qryTempConcInss.FieldByName('CODRUBRICA1').AsString;
  edtCodRubrica2.Text := qryTempConcInss.FieldByName('CODRUBRICA2').AsString;
  edtCodRubrica3.Text := qryTempConcInss.FieldByName('CODRUBRICA3').AsString;
  edtCodRubrica4.Text := qryTempConcInss.FieldByName('CODRUBRICA4').AsString;

  edtVlrRubrica1.Text := qryTempConcInss.FieldByname('VLRRUBRICA1').AsString;
  edtVlrRubrica2.Text := qryTempConcInss.FieldByname('VLRRUBRICA2').AsString;
  edtVlrRubrica3.Text := qryTempConcInss.FieldByname('VLRRUBRICA3').AsString;
  edtVlrRubrica4.Text := qryTempConcInss.FieldByname('VLRRUBRICA4').AsString;

  qryOrgaoMant.Locate('CODORGAOLOCAL',qryTempConcInss.FieldByName('CODMANTENEDORINSS').AsString,[]);
  edtOrgaoMant.Text := qryOrgaoMant.FieldByName('DESCRICAO').AsString;

  qryBeneficio.Locate('CODBENEFICIO',qryTempConcInss.FieldByName('ESPECIE').AsString,[]);
  edtEspecie.Text := qryBeneficio.FieldByName('CODBENEFICIO').AsString + ' - ' +
                     qryBeneficio.FieldByName('NOME').AsString;

  // campos pra edição.
  edtNumBenefPessoa.Text := qryTempConcINSS.FieldByName('NUMPROCINSS').AsString;


  // se for participante não permitir altaração por esta tela, e sim pela tela de participante/beneficiário
  If EParticipante(qryPessoa.FieldByName('IDPESSOA').AsString, sPatro, sPlano) Then
  Begin
    mmObs.Lines.Clear;
    mmObs.Lines.Add('Atenção!');
    mmObs.Lines.Add('Esta pessoa é um participante da ' + sPatro + ' no plano ' + sPlano);
    mmObs.Lines.Add('A manutenção deverá ser feita na Tela de Manutenção de Processo.');
    btnOkAlteracao.Enabled := False;
    bEParticipante := True;

  End Else
  Begin
    mmObs.Lines.Clear;
    mmObs.Lines.Add('Esta pessoa percente à Mantenedora '+ sPatro);
    btnOkAlteracao.Enabled := True;
    bEParticipante := False;
  End;
  AlinhaPanel;
  pnlAlteraPessoa.Visible  := True;
  sTexto := '';
end;

procedure TfrmManutReembolsoINSS.btnOkAlteracaoClick(Sender: TObject);
var
  bOk         : boolean;
  sCodRubrica,
  sVlrRubrica : String;
  i           : Integer;
Begin
  inherited;
  // verifica, grava e hiding a tela.
  If Not VerificaCampos Then Exit;

  cboxMesRef.OnChange(Self);

  If (bEParticipante) And (Not cboxAtiva.checked) Then
  Begin
    // BENEFBFCIARIO
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT 1 FROM BENEFBFCIARIO '+
                   ' WHERE IDTITULAR = ' + qryBenefbfciario.FieldByName('IDPESSOA').AsString +
                   '   AND IDPESSOA  = ' + qryBenefbfciario.FieldByName('IDPESSOA').AsString +
                   '   AND NUMPROCINSS = ' + qryBenefbfciario.FieldByName('NUMPROCINSS').AsString );
  End Else
  Begin

    If cboxAtiva.checked Then
    // Pessoas ATIVA da Fundação com benefícios no INSS.
    Begin

      // Fazer um laço das 4 rubricas
      For i := 1 To 4 Do
      Begin
        sVlrRubrica := '';
        Case i of
          1:
          Begin
            // Verifica se a rubrica á válida;
            If ValidaRubrica(edtCodRubrica1.Text, sCodRubrica) Then
              sVlrRubrica := edtVlrRubrica1.Text
            Else Break;
          End;
          2:
          Begin
            If ValidaRubrica(edtCodRubrica2.Text, sCodRubrica) Then
              sVlrRubrica := edtVlrRubrica2.Text
            Else Break;
          End;
          3:
          Begin
            If ValidaRubrica(edtCodRubrica3.Text, sCodRubrica) Then
              sVlrRubrica := edtVlrRubrica3.Text
            Else Break;
          End;
          4:
          Begin
            If ValidaRubrica(edtCodRubrica4.Text, sCodRubrica) Then
              sVlrRubrica := edtVlrRubrica4.Text
            Else Break;
          End;
        End;// case;
        // Gera o registro para o  mês indicado e marca o FLGATIVO = 1 para processar
        // corretamente no mês seguinte.
        qryAux.Sql.Clear;
        qryAux.Sql.Add(
            ' INSERT INTO DETCONCINSS ( ' +
            '    MESREFERENCIA, MESCOBRANCA, NUMPROCINSS, IDBENEFICIO, SEQUENCIAL, ' +
            '    IDPESSOA, VALORINSS, CODCONCESSORINSS, IDRUBRICA, FLGATIVO ) ' +
            '    VALUES ( ' +
                 QuotedStr(sAnoMesRef) + ', '+
                 QuotedStr(sAnoMesRef) + ', '+
                 QuotedStr(Trim(edtNumBenefPessoa.Text)) + ', '+
                 qryBeneficio.FieldByName('IDBENEFICIO').AsString + ', '+
                 '0'  + ', '+
                 qryPessoa.FieldByName('IDPESSOA').AsString  + ', '+
                 OraNumero(Trim(sVlrRubrica))  + ', '+
                 qryOrgaoMant.FieldByName('CODORGAOLOCAL').AsString  + ', '+
                 sCodRubrica  + ', '+
                 '1 )');
        try
          qryAux.ExecSql;
          bOk := True;
        Except
          bOk := False;
          MsgDlg('Problemas ao gravar registro na tabela de Conciliação','Erro',mtError,[mbOK],0);
        End;
      End; // for
      // FIM DO 1º PASSO
    End Else
    // Participante de Mantenedora.
    Begin
      // BENEFBFPP

      // Fazer um laço das 4 rubricas
      For i := 1 To 4 Do
      Begin
        sVlrRubrica := '';
        Case i of
          1:
          Begin
            // Verifica se a rubrica á válida;
            If ValidaRubrica(edtCodRubrica1.Text, sCodRubrica) Then
              sVlrRubrica := edtVlrRubrica1.Text
            Else Break;
          End;
          2:
          Begin
            If ValidaRubrica(edtCodRubrica2.Text, sCodRubrica) Then
              sVlrRubrica := edtVlrRubrica2.Text
            Else Break;
          End;
          3:
          Begin
            If ValidaRubrica(edtCodRubrica3.Text, sCodRubrica) Then
              sVlrRubrica := edtVlrRubrica3.Text
            Else Break;
          End;
          4:
          Begin
            If ValidaRubrica(edtCodRubrica4.Text, sCodRubrica) Then
              sVlrRubrica := edtVlrRubrica4.Text
            Else Break;
          End;
        End;// case;

        // 1º PASSO
        // Insere registro na DETCONINSS
        qryAux.Sql.Clear;
        qryAux.Sql.Add(
            ' INSERT INTO  DETCONCINSS ( ' +
            '    MESREFERENCIA, MESCOBRANCA, NUMPROCINSS, IDBENEFICIO, SEQUENCIAL, ' +
            '    IDPESSOA, VALORINSS, CODCONCESSORINSS, IDRUBRICA ) ' +
            '    VALUES ( ' +
                 QuotedStr(sAnoMesRef) + ', '+
                 QuotedStr(sAnoMesRef) + ', '+
                 QuotedStr(Trim(edtNumBenefPessoa.Text)) + ', '+
                 qryBeneficio.FieldByName('IDBENEFICIO').AsString + ', '+
                 '0'  + ', '+
                 qryPessoa.FieldByName('IDPESSOA').AsString  + ', '+
                 OraNumero(Trim(sVlrRubrica))  + ', '+
                 qryOrgaoMant.FieldByName('CODORGAOLOCAL').AsString  + ', '+
                 sCodRubrica +')');
        try
          qryAux.ExecSql;
          bOk := True;
        Except
          bOk := False;
          MsgDlg('Problemas ao gravar registro na tabela de Conciliação','Erro',mtError,[mbOK],0);
        End;
        // FIM DO 1º PASSO
      End; // For

      // 2º PASSO
      // Verifica se existe na BENEFICIARIOPP, caso afirmativo
      // Insere registro na BENEFICIARIOPP e BENEFBFPP.
      If bOk Then
      Begin
        qryAux.Sql.Clear;
        qryAux.Sql.Add(' SELECT 1 FROM BENEFICIARIOPP ' +
                       ' WHERE IDBENEFICIARIOPP = ' + qryPessoa.FieldByName('IDPESSOA').AsString);
        qryAux.Open;
        If qryAux.IsEmpty Then
        begin
          // INSERI
          qryAux.Sql.Clear;
          qryAux.Sql.Add(' INSERT INTO  BENEFICIARIOPP (IDBENEFICIARIOPP, '+
                         '   MATRICULA ) VALUES  (' +
                           qryPessoa.FieldByName('IDPESSOA').AsString +' , '+
                           QuotedStr(edtMatrPessoa.Text) + ')');
          try
            qryAux.ExecSql;
            bOk := True;
          Except
            bOk := False;
            MsgDlg('Problemas ao gravar registro na tabela de Beneficiário das Mantenedoras.','Erro',mtError,[mbOK],0);
          End;
        End Else
        Begin
          // ATUALIZA
        end;
      End;
      // FIM DO 2º PASSO
    End;
  End;


  // Exclui registro na tabela temporária.
  If bOk Then
  Begin
    qryAux.Sql.Clear;
    qryAux.Sql.Add(
          ' DELETE FROM TEMPCONCINSS ' +
          ' WHERE (NOME = ''' + qryTempConcINSS.FieldByName('NOME').AsString + ''''+
          '     OR IDPESSOA = ' + IntToStr(qryTempConcINSS.FieldByName('IDPESSOA').AsInteger) + ')' +  
          '   AND MESREFERENCIA = '''+ sAnoMesRef +'''' );
    try
      qryAux.ExecSql;
    Except
      MsgDlg('Problemas ao Excluir registro na tabela Temporária','Erro',mtError,[mbOK],0);
    End;
  End;
  // atualuza a tabela BENEFBFPP

  // atualiza tabela
  qryTempConcINSS.Close;
  qryTempConcINSS.open;

  pnlAlteraPessoa.Visible := False;
end;


procedure TfrmManutReembolsoINSS.BitBtn8Click(Sender: TObject);
begin
  inherited;
  // Descarta e hiding a tela.

  pnlAlteraPessoa.Visible := False
end;

procedure TfrmManutReembolsoINSS.AlinhaPanel;
begin
  pnlAlteraPessoa.Left := (self.Width div 2) - (pnlAlteraPessoa.Width div 2);
  pnlAlteraPessoa.Top  := ((self.Height div 2) - (pnlAlteraPessoa.height div 2) - 40);
end;


procedure TfrmManutReembolsoINSS.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  If bEParticipante Then
    qryBenefbfciario.Post
  Else qryBenefbfPP.Post;

  pnlEditaBenef.SendToBack;
end;

procedure TfrmManutReembolsoINSS.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // aplica alterações
  If bEParticipante Then
    AplicaAlteracoes([qryBenefbfciario,qry2])
  Else AplicaAlteracoes([qryBenefbfPP,qry2])
end;

procedure TfrmManutReembolsoINSS.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qry2.UpdatesPending Then
    qry2.Post;
  pnlEditaRubrica.SendToBack;
end;

procedure TfrmManutReembolsoINSS.MudaNumProcINSS(Sender: TField);
begin
  MsgDlg(' O Número do Processo foi alterado!. '+
         ' Certifíque-se que o Número de Processo '+ TField(Sender).AsString +
         ' esteja correto. ','Atenção',mtWarning,[mbOK],0);

  // grava logopcoes.
end;

function TfrmManutReembolsoINSS.EParticipante(pIdpessoa: String;
                    var psPatro: String;
                    var psPlano: String): Boolean;
var
  sSql,
  sPatro,
  sPlano: String;
begin
  {Localiza na PARTPREVPLAN a pessoa para saber se ela é uma participante ou um MANTIDOPP}
  qryAux.Sql.Clear;
  sSql :=  ' SELECT IDPESSJUR, IDPLANOPREV FROM PARTPREVPLAN ' +
           ' WHERE IDPESSOA = ' + pIdPessoa ;
  qryAux.Sql.Add(sSql);
  qryAux.Open;

  If Not qryAux.IsEmpty Then
  Begin
    Result := True;

    sPlano := qryAux.FieldByName('IDPLANOPREV').AsString;
    sPatro := qryAux.FieldByName('IDPESSJUR').AsString;

    // Patro
    sSql :=  ' SELECT NOME FROM PESSOA WHERE '+
             ' IDPESSOA = ' + sPatro;
    qryAux.SQL.Clear;
    qryAux.Sql.Add(sSql);
    qryAux.Open;
    psPatro := qryAux.FieldByName('NOME').AsString;
    // Plano
    sSql :=  ' SELECT NOME FROM PLANPREV WHERE '+
             ' IDPLANOPREV = ' + sPlano;
    qryAux.SQL.Clear;
    qryAux.Sql.Add(sSql);
    qryAux.Open;
    psPlano := qryAux.FieldByName('NOME').AsString;
  End Else
  Begin
    Result := False;

    sSql :=  ' SELECT DISTINCT M.NOME ' +
             ' FROM BENEFICIARIOPP B, MANTENEDORA M ' +
             ' WHERE M.CODMANTENEDORA = B.CODMANTENEDORA ' +
             '   AND B.IDBENEFICIARIOPP = ' + pIdPessoa;
    qryAux.SQL.Clear;
    qryAux.Sql.Add(sSql);

    qryAux.Open;
    If Not qryAux.IsEmpty Then
      psPatro := qryAux.FieldByName('NOME').AsString;
    psPlano := '';
  End;
  qryAux.Close;
end;

procedure TfrmManutReembolsoINSS.edtValorMantKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmManutReembolsoINSS.cboxMesRefChange(Sender: TObject);
begin
  inherited;
  sAnoMesRef := spAnoRef.Text;
  If (cboxMesRef.ItemIndex) <= 9 Then
    sAnoMesRef := sAnoMesRef + '/0' + IntToStr(cboxMesRef.ItemIndex + 1)
  Else  sAnoMesRef := sAnoMesRef + '/' + IntToStr(cboxMesRef.ItemIndex + 1);
end;

function TfrmManutReembolsoINSS.BuscaDadosMesAnterior: Boolean;
begin
//
end;

procedure TfrmManutReembolsoINSS.cboxAtivaClick(Sender: TObject);
begin
  inherited;
  If cboxAtiva.Checked Then
  Begin
    sTexto := mmObs.Lines.Text;
    mmObs.Lines.Clear;
    mmObs.Lines.Add('Este caso é para participante ATIVO que possua benefício do INSS.'+
                    '(Aux. Doença / Sal. Maternidade)');
  end else
  Begin
    mmObs.Lines.Clear;
    mmObs.Lines.Add(Trim(sTexto));
  End;

  // controlar botão de Ok.
  btnOkAlteracao.Enabled := cboxAtiva.Checked OR Not bEParticipante;
end;

procedure TfrmManutReembolsoINSS.LimpaPainel;
var
  i     : Integer;
begin
  //
  For i := 0 To ComponentCount - 1 do
  Begin
    If (Components[i] Is TStaticText) and (Components[i].Tag = 5) Then
      TStaticText(Components[i]).Caption := '';

    If (Components[i] Is TEdit) and (Components[i].Tag = 5) Then
      TEdit(Components[i]).Clear;

    If (Components[i] Is TComboBox) and (Components[i].Tag = 5) Then
      TComboBox(Components[i]).Text := '';

    If (Components[i] Is TwwDBLookupCombo) and (Components[i].Tag = 5) Then
      TwwDBLookupCombo(Components[i]).Text := '';
  End;
                             
  cboxAtiva.Checked := False;
end;

function TfrmManutReembolsoINSS.VerificaCampos: Boolean;
var
  sTexto: String;
begin
  //
  Result := True;
  If trim(cboxMesRef.Text) = '' Then
  Begin
    sTexto := 'O Mês de Referência deve ser preenchido.';
    Result := False;
  End;


  If trim(edtMatrPessoa.Text) = '' Then
  Begin
    sTexto := 'A matrícula deve ser preenchida.';
    Result := False;
  End;


  If Not Result Then
    MsgDlg(sTexto,'Atenção',mtWarning,[mbOK],0);
end;

function TfrmManutReembolsoINSS.ValidaRubrica(pCodRubricaINSS: String;
  var psIdRubrica: String): Boolean;
begin
  qryAux.Sql.Clear;
  qryAux.SQL.Add(' SELECT IDRUBRICA        ' +
                 ' FROM RUBRICAXINSS       ' +
                 ' WHERE FLGRUBCENTRAL = 1 ' +
                 '  AND RUBRICAINSS = ' + pCodRubricaINSS );
  QryAux.Open;
  Result := Not qryAux.IsEmpty;
  If Result Then
    psIdRubrica := qryAux.FieldByName('IDRUBRICA').AsString;
end;



end.
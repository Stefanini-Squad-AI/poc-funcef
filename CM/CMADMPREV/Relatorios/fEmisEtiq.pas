// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)  :
// Data      :
// Pendência :
// Alteração :
//------------------------------------------------------------------------------
// Autor(a)  : ClaudioR
// Data      : 30/03/2007
// Pendência : 22780 (Reabertura)
// Alteração : Perimtir optar em emitir etiqueta para elegível
//------------------------------------------------------------------------------
// Autor(a)  : ClaudioR
// Data      : 21/12/2006
// Pendência : 22196
// Alteração : Perimtir importa lista de IDpessoas para impressão de etiquetas
//------------------------------------------------------------------------------
// Autor(a)  : ClaudioR
// Data      : 21/12/2006
// Pendência : 22780
// Alteração : Perimtir optar em emitir etiqueta para elegível
//------------------------------------------------------------------------------

unit fEmisEtiq;
// ACRESCENTADO O DBLPLANOPREV PARA BENEFICIÁRIOS - SOMENTE
// PARA PODER UTILIZAR O ÍNDICE E SER MAIS RÁPIDO

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, ppProd, ppClass, ppReport, ppComm, ppCache, ppDB,
  ppDBBDE, Wwdatsrc, ComCtrls, uMensErro, ppBands,
  TREdit, ppRelatv, ppDBPipe, wwdbdatetimepicker, CMDateTimePicker, pptypes,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, CheckLst, Wwdbspin;

Const
 vQl = #13+#10;

type
  TFrmEmisEtiq = class(TfrmOkCancelar)
    PnlEtiq: TPanel;
    QryModelo: TwwQuery;
    QryModeloMODELOETIQ: TStringField;
    QryModeloIDETIQUETA: TFloatField;
    QryModeloIDREPORTS: TFloatField;
    QryModeloORIGEMCM: TFloatField;
    GpbEtiq: TGroupBox;
    MemReports: TMemo;
    CkbMatricial: TCheckBox;
    CmbModeloEtiq: TCMDBLookupCombo;
    qryReports: TwwQuery;
    qryReportsTEMPLATE: TBlobField;
    PpEtiq: TppBDEPipeline;
    RptEtiq: TppReport;
    DsEtiq: TwwDataSource;
    QryEtiqParticip: TwwQuery;
    PagEtiq: TPageControl;
    TbsParticip: TTabSheet;
    TbsBenef: TTabSheet;
    QryEtiqBenef: TwwQuery;
    QryEtiqParticipNUMERO: TStringField;
    QryEtiqParticipCOMPLEMENTO: TStringField;
    QryEtiqParticipBAIRRO: TStringField;
    QryEtiqParticipCEP: TStringField;
    QryEtiqParticipCODESTADO: TStringField;
    QryEtiqParticipNOMEPAIS: TStringField;
    QryEtiqBenefNUMERO: TStringField;
    QryEtiqBenefCOMPLEMENTO: TStringField;
    QryEtiqBenefBAIRRO: TStringField;
    QryEtiqBenefCEP: TStringField;
    QryEtiqBenefCODESTADO: TStringField;
    QryEtiqBenefNOMEPAIS: TStringField;
    QryEtiqBenefCIDADE: TStringField;
    QryEtiqParticipCIDADE: TStringField;
    GpMatricula: TGroupBox;
    EdtMatIni: TEdit;
    EdtMatFin: TEdit;
    Label1: TLabel;
    GpNumInsc: TGroupBox;
    Label2: TLabel;
    GpDataInscr: TGroupBox;
    Label3: TLabel;
    DtInscrIni: TCMDateTimePicker;
    DtInscrFin: TCMDateTimePicker;
    GpDataCancela: TGroupBox;
    Label4: TLabel;
    DtCancelaIni: TCMDateTimePicker;
    DtCancelaFin: TCMDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DblSitPatro: TCMDBLookupCombo;
    DblPatro: TCMDBLookupCombo;
    DblSitPlano: TCMDBLookupCombo;
    DblPlano: TCMDBLookupCombo;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    DtBenefIni: TCMDateTimePicker;
    DtBenefFin: TCMDateTimePicker;
    GpBeneficio: TGroupBox;
    DblBeneficio: TCMDBLookupCombo;
    QrySitFundacao: TwwQuery;
    QrySitFundacaoIDSITPART: TFloatField;
    QrySitFundacaoDESCRICAO: TStringField;
    QrySitPlano: TwwQuery;
    QrySitPlanoIDSITPLANOPREV: TFloatField;
    QrySitPlanoDESCRICAO: TStringField;
    QrySitPatro: TwwQuery;
    QrySitPatroIDSITFUNC: TFloatField;
    QryPatro: TwwQuery;
    QryPatroIDPESSOA: TFloatField;
    QryPatroNOMEPESSOA: TStringField;
    QryPlano: TwwQuery;
    QryPlanoIDPLANOPREV: TFloatField;
    QryPlanoNOME: TStringField;
    QryBenef: TwwQuery;
    QryBenefIDBENEFICIO: TFloatField;
    QryBenefNOME: TStringField;
    EdtNumInscIni: TRealEdit;
    EdtNumInscFin: TRealEdit;
    rgrpTipoEnd: TRadioGroup;
    QrySitPatroDESCRICAO: TStringField;
    QryEtiqParticipLOGRADOURO: TStringField;
    QryEtiqBenefLOGRADOURO: TStringField;
    bbtnGeraArquivo: TBitBtn;
    SaveDlg: TSaveDialog;
    QryEtiqParticipIDPESSJUR: TFloatField;
    QryEtiqBenefIDPESSJUR: TFloatField;
    QryEtiqParticipMATRICULA: TStringField;
    QryEtiqParticipNOMETITULAR: TStringField;
    QryEtiqParticipNOMEBENEFICIARIO: TStringField;
    QryEtiqParticipNOMERECEBEDOR: TStringField;
    QryEtiqBenefMATRICULA: TStringField;
    QryEtiqBenefNOMETITULAR: TStringField;
    QryEtiqBenefNOMEBENEFICIARIO: TStringField;
    QryEtiqBenefNOMERECEBEDOR: TStringField;
    QryEtiqParticipNOMEPATRO: TStringField;
    dblPlanoPrev: TCMDBLookupCombo;
    Label11: TLabel;
    dbcAnivPart: TwwDBComboBox;
    Label12: TLabel;
    tbsPensao: TTabSheet;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    dtInicioPensao: TCMDateTimePicker;
    dtFimPensao: TCMDateTimePicker;
    Label14: TLabel;
    dbcAnivBenef: TwwDBComboBox;
    qryPensao: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField1: TFloatField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    QryEtiqParticipNOME: TStringField;
    QryEtiqBenefNOME: TStringField;
    TbsPartDep: TTabSheet;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    dbseano: TwwDBSpinEdit;
    cbmes: TComboBox;
    GroupBox4: TGroupBox;
    chklstPatro: TCheckListBox;
    GroupBox5: TGroupBox;
    chklstSitPlan: TCheckListBox;
    GroupBox6: TGroupBox;
    dbcContribuicao: TwwDBLookupCombo;
    qrySitPlan: TwwQuery;
    qryContrib: TwwQuery;
    tabMatriculas: TTabSheet;
    Panel2: TPanel;
    mmListaMatriculas: TMemo;
    edtMatricula: TEdit;
    Label15: TLabel;
    SpeedButton1: TSpeedButton;
    Label16: TLabel;
    btnTransfere: TButton;
    SpeedButton2: TSpeedButton;
    opDlg: TOpenDialog;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    TabDtEmpto: TTabSheet;
    Panel3: TPanel;
    GroupBox8: TGroupBox;
    dtConcessao: TCMDateTimePicker;
    cmbOperadores: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    grpTipo: TRadioGroup;
    tabIncricao: TTabSheet;
    Panel4: TPanel;
    Label21: TLabel;
    spbApagaTudoInscr: TSpeedButton;
    Label22: TLabel;
    spbImportaArqInsc: TSpeedButton;
    mmListaInscricao: TMemo;
    edtInscricao: TEdit;
    btnTransfereInsc: TButton;
    GroupBox9: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    QryEtiqParticipSITFUNDACAO: TStringField;
    QryEtiqParticipMENSAGEM: TStringField;
    grpMensagem: TGroupBox;
    edMensagem: TEdit;
    QryEtiqBenefMENSAGEM: TStringField;
    GroupBox10: TGroupBox;
    cklstOrdem: TCheckListBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    qrySitBeneficio: TwwQuery;
    dblSitBeneficio: TCMDBLookupCombo;
    Label25: TLabel;
    GroupBox11: TGroupBox;
    chklstSitFundacao: TCheckListBox;
    ckbSoElegivel: TCheckBox;
    rgpTipoImporta: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure PagEtiqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtMatIniExit(Sender: TObject);
    procedure EdtNumInscIniExit(Sender: TObject);
    procedure bbtnGeraArquivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnTransfereClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnTransfereInscClick(Sender: TObject);
    procedure spbImportaArqInscClick(Sender: TObject);
    procedure spbApagaTudoInscrClick(Sender: TObject);
    procedure QryEtiqParticipCalcFields(DataSet: TDataSet);
    procedure QryEtiqBenefCalcFields(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ckbSoElegivelClick(Sender: TObject);
    procedure rgpTipoImportaClick(Sender: TObject);
  private
    { Private declarations }
    function PreencheQRY: Boolean;
    Function MontaSQL(Mes, ListaPatro, ListaSitPlano,
                      sIdEndereco : String): String;
    procedure HabilitaParticipante(Condicao:Boolean);                  
  public
    { Public declarations }
  end;
  Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
            Lista: TStringList; Chave, Descricao:String);

var
  FrmEmisEtiq: TFrmEmisEtiq;
  LstPatro, LstSitPlan, lstSitFundacao:TStringList;
  wDia,wMes,wAno : Word;
  sPatro, sSitPlan, sSitFundacao, sSQL: String;

implementation

{$R *.DFM}

Uses uEtiquetaCM, uModeloRelatCM, uSistema, uFuncaoGeral, UFuncoesUteis,
     fAguarde, fPreview;

function TFrmEmisEtiq.PreencheQRY: Boolean;
Var
  sSql, wMes, sIdEndereco : String;
  I                       : Integer;
  sOperador,
  sInscricao,
  sOrdem,
  sMatriculas : String;
Begin
  sSQL := '';
  case rgrpTipoEnd.ItemIndex of
       0 : sIdEndereco := 'IDENDCORRESP';
       1 : sIdEndereco := 'IDENDCOMERCIAL';
       2 : sIdEndereco := 'IDENDENTREGA';
       3 : sIdEndereco := 'IDENDRESIDENCIAL';
       4 : sIdEndereco := 'IDENDCOBRANCA';
       else sIdEndereco := 'IDENDCOBRANCA';
  end;

  Try
    Screen.Cursor := CrHourGlass;
    If (DsEtiq.DataSet as TwwQuery).Active Then
      (DsEtiq.DataSet as TwwQuery).Close;

    // etiqueta para participante
    If PagEtiq.ActivePage = TbsParticip Then
    Begin
      sSitFundacao := '';
      For I := 0 To chklstSitfundacao.Items.Count - 1 Do
      begin
          If chklstSitfundacao.Checked[I] = True then
             sSitFundacao := sSitFundacao + lstSitFundacao.Strings[I]+',';
      End;

      If sSitFundacao <> '' Then
         sSitFundacao := Copy( sSitFundacao, 1, Length(sSitFundacao)-1);


      If ckbSoElegivel.Checked Then
      Begin
        
        sSql := ' SELECT DISTINCT ' + #13 +
                '        EL.IDPESSJUR, PT.NOME AS NOMEPATRO, ' + #13 +
                '        EL.MATRICULA, ' + #13 +
                '        P.NOME, ' + #13 +
                '        E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, ' + #13 +
                '        C.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS, ' + #13 +
                '        '' '' AS SITFUNDACAO, '' '' AS NOMETITULAR, '' '' AS NOMEBENEFICIARIO, ' + #13 +
                '        '' '' AS NOMERECEBEDOR ' + #13 +
                ' FROM ' + #13 +
                '   ELEGPATRO EL, PESSOA P, PESSOA PT, ENDPESS E, ' + #13 +
                '   CIDADES C, ESTADO ES, PAIS PA, PESSOAFISICA PF';
      End
      Else
      Begin
        sSql := ' SELECT DISTINCT ' + #13 +
                '        EL.IDPESSJUR, EL.MATRICULA,P.NOME, PTIT.NOME AS NOMETITULAR,  ' + #13 +
                '        P.NOME AS NOMEBENEFICIARIO, P.NOME AS NOMERECEBEDOR, PT.NOME AS NOMEPATRO, ' +  #13 +
                '        E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, ' +  #13 +
                '        C.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS, ' +  #13 +
                '        SPART.DESCRICAO AS SITFUNDACAO   ' + #13 +
                ' FROM ' + #13 +
                '   PESSOA P, PESSOA PTIT, PESSOAFISICA PF, ENDPESS E, CIDADES C, ' + #13 +
                '   ESTADO ES, PAIS PA, PESSOA PT, ELEGPATRO EL, PARTPREVPLAN PP, SITPART SPART, ' + #13 +
                '   SITFUNC SFUNC, SITPLANOPREV SPLANO ' + #13;
      End;

      sSQL := sSQL + ' WHERE ' +
              FuncaoGeral.Decode(Trim(EdtMatIni.Text)     ,'','', ' (EL.MATRICULA >= ''' + EdtMatIni.Text + ''') AND ')+ #13 +
              FuncaoGeral.Decode(Trim(EdtMatFin.Text)     ,'','', ' (EL.MATRICULA <= ''' + EdtMatFin.Text + ''') AND ')+ #13 +
              FuncaoGeral.Decode(Trim(dbcAnivPart.Text)   ,'','', ' (SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YY''),4,2) = '+dbcAnivPart.Value+') AND ');

      If Not ckbSoElegivel.Checked Then
      Begin
        sSQL := sSQL + FuncaoGeral.Decode(Trim(DtInscrIni.Text)    ,'','', ' (PP.INSCRICAODATA >= TO_DATE(''' + DtInscrIni.Text + ''',''DD/MM/YYYY'')) AND ') + #13 +
                       FuncaoGeral.Decode(Trim(DtInscrFin.Text)    ,'','', ' (PP.INSCRICAODATA <= TO_DATE(''' + DtInscrFin.Text + ''',''DD/MM/YYYY'')) AND ') + #13 +
                       FuncaoGeral.Decode(Trim(DtCancelaIni.Text)  ,'','', ' (PP.DATACANCELAMENTO >= TO_DATE(''' + DtCancelaIni.Text + ''',''DD/MM/YYYY'')) AND ') + #13 +
                       FuncaoGeral.Decode(Trim(DtCancelaFin.Text)  ,'','', ' (PP.DATACANCELAMENTO <= TO_DATE(''' + DtCancelaFin.Text + ''',''DD/MM/YYYY'')) AND ') + #13 +
                       FuncaoGeral.Decode(EdtNumInscIni.Value      ,0 ,'', ' (PP.INSCRICAONUMERO >= ' + EdtNumInscIni.Text + ') AND ') + #13 +
                       FuncaoGeral.Decode(EdtNumInscFin.Value      ,0 ,'', ' (PP.INSCRICAONUMERO <= ' + EdtNumInscFin.Text + ') AND ') + #13 +
                       FuncaoGeral.Decode(Trim(DblSitPatro.Text)   ,'','', ' (EL.IDSITFUNC = ' + DblSitPatro.LookupValue + ') AND ') + #13 +
                       FuncaoGeral.Decode(Trim(DblSitPlano.Text)   ,'','', ' (PP.IDSITPLANOPREV = ' + DblSitPlano.LookupValue + ') AND ' ) + #13 +
                       FuncaoGeral.Decode(Trim(DblPatro.Text)      ,'','', ' (PP.IDPESSJUR = ' + DblPatro.LookupValue + ') AND ' ) + #13 +
                       FuncaoGeral.Decode(Trim(DblPlano.Text)      ,'','', ' (PP.IDPLANOPREV = ' + DblPlano.LookupValue + ') AND ' ) + #13 +
                       FuncaoGeral.Decode(Trim(sSitFundacao)       ,'','', ' (PP.IDSITPART IN (' + sSitFundacao + ')) AND ' );
      End;

      sSQL := sSQL + '   (P.'+sIdEndereco+' = E.IDENDERECO(+)) AND ' + #13 +
                     '   (E.IDCIDADES       = C.IDCIDADES(+))  AND ' + #13 +
                     '   (C.IDESTADO        = ES.IDESTADO(+))  AND ' + #13 +
                     '   (ES.IDPAIS         = PA.IDPAIS(+))    AND ' ;


      If ckbSoElegivel.Checked Then
      Begin
        sSQL := sSQL + ' (P.IDPESSOA   = EL.IDPESSOA) AND ' + #13 +
                       ' (EL.IDPESSJUR = PT.IDPESSOA) AND ' + #13 +
                       ' (PF.IDPESSOA  = P.IDPESSOA) AND  ' + #13 +
                       ' (NOT EXISTS (SELECT 1 ' + #13 +
                       '               FROM PARTPREVPLAN PP ' + #13 +
                       '               WHERE (PP.IDPESSOA  = EL.IDPESSOA) ' + #13 +
                       '                 AND (PP.IDPESSJUR = EL.IDPESSJUR))) ';
      End
      Else
      Begin
        sSQL := sSQL + '   (PTIT.IDPESSOA     = PP.IDPESSOA) AND ' + #13 +
                       '   (P.IDPESSOA        = PP.IDPESSOA) AND ' + #13 +
                       '   (PF.IDPESSOA       = P.IDPESSOA) AND  ' + #13 +
                       '   (PP.IDPESSJUR      = EL.IDPESSJUR) AND ' + #13 +
                       '   (PP.IDPESSOA       = EL.IDPESSOA) AND ' + #13 +
                       '   (PP.IDPESSJUR      = PT.IDPESSOA) AND ' + #13 +
                       '   (PP.IDSITPART      = SPART.IDSITPART) AND ' + #13 +
                       '   (PP.IDSITPLANOPREV = SPLANO.IDSITPLANOPREV) AND ' + #13 +
                       '   (PP.FLGDESATIVADO  = 0 ) AND ' + #13 +
                       '   (EL.IDSITFUNC      = SFUNC.IDSITFUNC) ';
      End;

      sSQL := sSQL + 'ORDER BY E.CEP ';
    End
    Else
      If PagEtiq.ActivePage = TbsBenef Then // etiqueta para beneficiario
         sSql := 'SELECT DISTINCT  BF.IDPESSJUR, EL.MATRICULA,P.NOME AS NOME, P.NOME AS NOMETITULAR, PT.NOME AS NOMEPATRO,'+ vQl +
                 '  PBEN.NOME AS NOMEBENEFICIARIO, PRESP.NOME AS NOMERECEBEDOR,  '+ vQl +
                 '  E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, '+ vQl +
                 '  C.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS,  '+ vQl +
                 '  ' + QuotedStr('  ') + ' AS SITFUNDACAO   ' +
                 'FROM BENEFBFCIARIO BF, BFCIARIOTITPLAN BFTIT, PESSOA P, PESSOA PRESP, '+ vQl +
                 '  PESSOA PBEN, PESSOAFISICA PF, ELEGPATRO EL, PESSOA PT, '+ vQl +
                 '  ENDPESS E, CIDADES C, ESTADO ES, PAIS PA, BENEFICIO B '+ vQl +
                 'WHERE '+ vQl +
                 FuncaoGeral.Decode(Trim(DblPlanoPrev.Text),'','', ' (BF.IDPLANOPREV = ' + DblPlanoPrev.LookupValue + ') AND '+ vQl)+
                 FuncaoGeral.Decode(Trim(DblBeneficio.Text),'','', ' (BF.IDBENEFICIO = ' + DblBeneficio.LookupValue + ') AND '+ vQl)+
                 FuncaoGeral.Decode(Trim(dblSitBeneficio.Text),'','  (BF.IDSITBENEFICIO IN (1,2)) AND ' + vQl, ' (BF.IDSITBENEFICIO = ' + dblSitBeneficio.LookupValue + ') AND '+ vQl)+
                 FuncaoGeral.Decode(Trim(DtBenefIni.Text)  ,'','', ' (BF.DATAINICIOFUND >= TO_DATE(''' + DtBenefIni.Text + ''',''DD/MM/YYYY'')) AND '+ vQl)+
                 FuncaoGeral.Decode(Trim(DtBenefFin.Text)  ,'','', ' (BF.DATAINICIOFUND <= TO_DATE(''' + DtBenefFin.Text + ''',''DD/MM/YYYY'')) AND '+ vQl)+
                 FuncaoGeral.Decode(Trim(dbcAnivBenef.Text)   ,'','', ' (SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YY''),4,2) = '+dbcAnivBenef.Value+') AND '+ vQl)+
                 '  (BFTIT.IDPESSJUR = BF.IDPESSJUR) AND '+ vQl +
                 '  (BFTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM) AND '+ vQl +
                 '  (BFTIT.IDPLANOPREV = BF.IDPLANOPREV) AND '+ vQl +
                 '  (BFTIT.IDTITULAR = BF.IDTITULAR) AND '+ vQl +
                 '  (BFTIT.IDPESSOA = BF.IDPESSOA) AND '+ vQl +
                 '  (BFTIT.IDBENEFICIO = BF.IDBENEFICIO) AND '+ vQl +
                 '  (BFTIT.SEQPROPOSTA = BF.SEQPROPOSTA) AND '+ vQl +
                 '  (BF.IDTITULAR = P.IDPESSOA) AND '+ vQl +
                 '  (BF.IDPESSOA = PBEN.IDPESSOA) AND '+ vQl +
                 '  (PF.IDPESSOA = PBEN.IDPESSOA) AND '+ vQl +
                 '  (BFTIT.IDRESPONSAVEL = PRESP.IDPESSOA) AND '+ vQl +
                 '  (BF.IDPESSJUR = EL.IDPESSJUR) AND '+ vQl +
                 '  (BF.IDTITULAR = EL.IDPESSOA) AND '+ vQl +
                 '  (BF.IDPESSJUR = PT.IDPESSOA) AND '+ vQl +
                 '  (PRESP.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND '+ vQl +
                 '  (E.IDCIDADES = C.IDCIDADES(+)) AND '+ vQl +
                 '  (C.IDESTADO = ES.IDESTADO(+)) AND '+ vQl +
                 '  (ES.IDPAIS = PA.IDPAIS(+)) AND '+ vQl +
                 '  (BF.IDBENEFICIO = B.IDBENEFICIO) ORDER BY E.CEP '
      Else
      If PagEtiq.ActivePage = tbsPensao Then // etiqueta para Favorecidos de Pensão Alimentícia
      Begin
      sSql := 'SELECT DISTINCT  EL.IDPESSJUR, EL.MATRICULA, PT.NOME AS NOME,  PT.NOME AS NOMETITULAR, ' + vQl +
              '  PF.NOME AS NOMEBENEFICIARIO, PR.NOME AS NOMERECEBEDOR, PP.NOME AS NOMEPATRO,' + vQl +
              '  EP.LOGRADOURO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, ' +
              '  CD.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS, ' +
              '  ' + QuotedStr('  ') + ' AS SITFUNDACAO   ' +
              'FROM ' +
              ' PESSOA PT, PESSOA PF, PESSOA PR, PESSOA PP, ' +
              ' ELEGPATRO EL, RUBRICAINDIV  RI, ENDPESS EP, ' +
              ' CIDADES CD, ESTADO ES, PAIS PA' + vQl +
              'WHERE ' +
              FuncaoGeral.Decode(Trim(DtInicioPensao.Text)    ,'','', '   (RI.DATAINICIO    >= TO_DATE(''' + dtInicioPensao.Text + ''',''DD/MM/YYYY'')) AND '+ vQl)+
              FuncaoGeral.Decode(Trim(DtFimPensao.Text)       ,'','', '   (RI.DATAFINAL     <= TO_DATE(''' + dtFimPensao.Text    + ''',''DD/MM/YYYY'')) AND '+ vQl);

      Case grpTipo.ItemIndex Of
        0: sSql := sSql + ' (RI.IDFAVORECIDO = PF.IDPESSOA) AND ';
        1: sSql := sSql + ' (RI.IDALIMENTADO = PF.IDPESSOA) AND ';
        2: sSql := sSql + ' ((RI.IDFAVORECIDO = PF.IDPESSOA) OR  (RI.IDALIMENTADO = PF.IDPESSOA)) AND ';
      End;

      sSql := sSql +
              '   (PF.IDENDRESIDENCIAL = EP.IDENDERECO(+)) AND' +
              '   (EP.IDCIDADES        = CD.IDCIDADES(+))  AND' +
              '   (CD.IDESTADO         = ES.IDESTADO(+))   AND' +
              '   (ES.IDPAIS           = PA.IDPAIS(+))     AND' +
              '   (RI.IDTITULAR        = PT.IDPESSOA)      AND' +
              '   (RI.IDPESSOA         = PR.IDPESSOA)      AND' +
              '   (RI.FLGPENSAOALIM    = 1)                AND' +
              '   (PT.IDPESSOA         = EL.IDPESSOA)      AND' +
              '   (EL.IDPESSJUR        = PP.IDPESSOA)  ORDER BY EP.CEP       ';
    End
    Else If PagEtiq.ActivePage = TbsPartDep Then Begin
      { Critica parametros }
      If cbMes.ItemIndex = -1 then begin
        MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
        cbMes.SetFocus;
        Exit;
      End;

      If  dbseAno.Value = 0 then begin
        MsgDlg('Ano de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
        dbseAno.Value := wAno;
        dbseano.SetFocus;
        Exit;
      End;

      { Preenche parametros }
      sPatro       := '';
      sSitPlan     := '';
      sSitFundacao := '';

      if (cbMes.ItemIndex+1) <= 9 then
        wMes := Trim(dbseano.Text)+'/0'+IntToStr(cbMes.ItemIndex+1)
      else
        wMes := Trim(dbseano.Text)+'/'+IntToStr(cbMes.ItemIndex+1);

      For I := 0 To ChkLstPatro.Items.Count - 1 Do begin
        If ChkLstPatro.Checked[I] = True then
          SPatro := SPatro + LstPatro.Strings[I]+',';
      End;

      For I := 0 To ChkLstSitPlan.Items.Count - 1 Do begin
        If ChkLstSitPlan.Checked[I] = True Then
          SSitPlan := SSitPlan + lstSitFundacao.Strings[I]+',';
      End;

      sPatro   := Trim(Copy(SPatro,1,((Length(SPatro)-1))));
      sSitPlan := Trim(Copy(SSitPlan,1,((Length(SSitPlan)-1))));

      { Monta SQL }
      sSQL := MontaSQL(wMes,sPatro, sSitPlan, sIdEndereco);

    End Else If PagEtiq.ActivePage = TabMatriculas Then
    Begin
      // se o memo estiver vazio não pode executar a query
      If mmListaMatriculas.Lines.Text = '' Then
      Begin
        If rgpTipoImporta.ItemIndex = 0 Then
           MsgDlg('Não há matrículas inseridas. ','Erro',mtError,[mbOk,mbHelp],0)
        Else
           MsgDlg('Não há IDPEssoas inseridos. ','Erro',mtError,[mbOk,mbHelp],0);

        Result := False;
      End;

      // Passa as matrículas para uma variável.
      For i := 0 To mmListaMatriculas.Lines.Count - 1 Do
      Begin
        If mmListaMatriculas.Lines.Count - 1 = i Then
          sMatriculas := sMatriculas + QuotedStr(Copy(mmListaMatriculas.Lines.Strings[i],1,
                                                 length(mmListaMatriculas.Lines.Strings[i])))
        Else
          sMatriculas := sMatriculas + QuotedStr(mmListaMatriculas.Lines.Strings[i]) + ',';
      End;

      sSql := 'SELECT DISTINCT EL.IDPESSJUR, EL.MATRICULA,P.NOME, PTIT.NOME AS NOMETITULAR,  ' + #13 +
              '   P.NOME AS NOMEBENEFICIARIO, P.NOME AS NOMERECEBEDOR, PT.NOME AS NOMEPATRO, ' + #13 +
              '   E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, ' + #13 +
              '   C.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS, ' + #13 +
              '   SPART.DESCRICAO AS SITFUNDACAO   ' + #13 +
              'FROM ' + #13 +
              '   PESSOA P, PESSOA PTIT, PESSOAFISICA PF, ENDPESS E, CIDADES C, ' + #13 +
              '   ESTADO ES, PAIS PA, PESSOA PT, ' + #13 +
              '   ELEGPATRO EL, DEPENTIT DP, PARTPREVPLAN PP, SITPART SPART, ' + #13 +
              '   SITFUNC SFUNC, SITPLANOPREV SPLANO ' + #13 +
              'WHERE ';

      If rgpTipoImporta.ItemIndex = 0 Then
        sSql := sSql + '   (((DP.IDPESSOA =  DP.IDTITULAR) AND EL.MATRICULA IN (' +sMatriculas+ ')) OR ' +  #13 +
                       '    ((DP.IDPESSOA <> DP.IDTITULAR) AND DP.MATRICULA IN (' +sMatriculas+ '))) AND '
      Else
        sSql := sSql + '   (EL.IDPESSOA IN (' +sMatriculas+ ')) AND '; 

      sSql := sSql + '   (EL.IDPESSOA = DP.IDTITULAR) AND ' +  #13 +
                     '   (P.'+sIdEndereco+' = E.IDENDERECO(+)) AND  ' + #13 +
                     '   (PTIT.IDPESSOA     = PP.IDPESSOA) AND ' +
                     '   (P.IDPESSOA        = NVL(DP.IDPESSOA,EL.IDPESSOA)) AND ' + #13 +
                     '   (PF.IDPESSOA       = P.IDPESSOA) AND ' + #13 +
                     '   (E.IDCIDADES       = C.IDCIDADES(+)) AND ' + #13 +
                     '   (C.IDESTADO        = ES.IDESTADO(+)) AND ' + #13 +
                     '   (ES.IDPAIS         = PA.IDPAIS(+)) AND ' + #13 +
                     '   (PP.IDPESSJUR      = EL.IDPESSJUR) AND ' + #13 +
                     '   (PP.IDPESSOA       = EL.IDPESSOA) AND ' + #13 +
                     '   (PP.IDPESSJUR      = PT.IDPESSOA) AND ' + #13 +
                     '   (PP.IDSITPART      = SPART.IDSITPART) AND ' + #13 +
                     '   (PP.IDSITPLANOPREV = SPLANO.IDSITPLANOPREV) AND ' + #13 +
                     '   (PP.FLGDESATIVADO  = 0 ) AND ' + #13 +
                     '   (EL.IDSITFUNC      = SFUNC.IDSITFUNC) ' + #13 +
                     'AND ((SPART.FLGINTERNO <> ''AS'') OR ((SPART.FLGINTERNO = ''AS'') AND ' + #13 +
                     ' EXISTS ( ' + #13 +
                     '  SELECT 1 ' + #13 +
                     '  FROM BENEFBFCIARIO BBF ' + #13 +
                     '  WHERE BBF.IDTITULAR = DP.IDTITULAR ' + #13 +
                     '  AND BBF.IDPESSOA = DP.IDPESSOA) ' + #13 +
                     ')) ' + #13 +
                     ' ORDER BY E.CEP ';

    End Else If PagEtiq.ActivePage = tabIncricao Then
    Begin
      // se o memo estiver vazio não pode executar a query
      If mmListaInscricao.Lines.Text = '' Then
      Begin
        MsgDlg('Não há inscrições inseridas. ','Erro',mtError,[mbOk,mbHelp],0);
        Result := False;
      End;

      // Passa as inscrições para uma variável.

      For i := 0 To mmListaInscricao.Lines.Count - 1 Do
      Begin
        If mmListaInscricao.Lines.Count - 1 = i Then
          sInscricao := sInscricao + Copy(mmListaInscricao.Lines.Strings[i],1, length(mmListaInscricao.Lines.Strings[i]))
        Else
          sInscricao := sInscricao + mmListaInscricao.Lines.Strings[i] + ',';
      End;

      sSql := 'SELECT DISTINCT EL.IDPESSJUR, EL.MATRICULA,P.NOME, PTIT.NOME AS NOMETITULAR,  '+     
              '   P.NOME AS NOMEBENEFICIARIO, P.NOME AS NOMERECEBEDOR, PT.NOME AS NOMEPATRO, '+     
              '   E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, ' +
              '   C.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS, ' +
              '   SPART.DESCRICAO AS SITFUNDACAO   ' + 
              'FROM ' +
              '   PESSOA P, PESSOA PTIT, PESSOAFISICA PF, ENDPESS E, CIDADES C, '+
              '   ESTADO ES, PAIS PA, PESSOA PT, '+
              '   ELEGPATRO EL, PARTPREVPLAN PP, SITPART SPART, '+
              '   SITFUNC SFUNC, SITPLANOPREV SPLANO ' +
              'WHERE ' +
              '   (PP.INSCRICAONUMERO IN ('+ sInscricao +')) AND '+
              '   (EL.IDPESSOA = PP.IDPESSOA) AND '+
              '   (PP.FLGDESATIVADO = 0) AND '+

              '   (P.'+sIdEndereco+' = E.IDENDERECO(+)) AND  ' +
              '   (PTIT.IDPESSOA     = PP.IDPESSOA) AND '+
              '   (P.IDPESSOA        = PP.IDPESSOA) AND '+
              '   (PF.IDPESSOA       = P.IDPESSOA) AND '+
              '   (E.IDCIDADES       = C.IDCIDADES(+)) AND '+
              '   (C.IDESTADO        = ES.IDESTADO(+)) AND '+
              '   (ES.IDPAIS         = PA.IDPAIS(+)) AND '+
              '   (PP.IDPESSJUR      = EL.IDPESSJUR) AND '+
              '   (PP.IDPESSOA       = EL.IDPESSOA) AND '+
              '   (PP.IDPESSJUR      = PT.IDPESSOA) AND '+
              '   (PP.IDSITPART      = SPART.IDSITPART) AND '+
              '   (PP.IDSITPLANOPREV = SPLANO.IDSITPLANOPREV) AND '+
              '   (PP.FLGDESATIVADO  = 0 ) AND ' + 
              '   (EL.IDSITFUNC      = SFUNC.IDSITFUNC) '+
              'AND ((SPART.FLGINTERNO <> ''AS'') OR ((SPART.FLGINTERNO = ''AS'') AND '+
              ' EXISTS ( '+
              '  SELECT 1 '+
              '  FROM BENEFBFCIARIO BBF '+
              '  WHERE BBF.IDTITULAR = PP.IDPESSOA) '+
              ')) '+
              ' ORDER BY E.CEP ';

    End Else If PagEtiq.ActivePage = TabDtEmpto Then
    Begin

      // Operador selecionado.
      Case cmbOperadores.ItemIndex Of
        0 : sOperador := '=';
        1 : sOperador := '>';
        2 : sOperador := '>=';
        3 : sOperador := '<';
        4 : sOperador := '<=';
        5 : sOperador := '<>';
      End;

      sSql := 'SELECT DISTINCT EL.IDPESSJUR, EL.MATRICULA,P.NOME, PTIT.NOME AS NOMETITULAR,  '+   
              '   P.NOME AS NOMEBENEFICIARIO, P.NOME AS NOMERECEBEDOR, PT.NOME AS NOMEPATRO, '+   
              '   E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, ' +
              '   C.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS, ' +
              '   SPART.DESCRICAO AS SITFUNDACAO   ' + 
              'FROM ' +
              '   PESSOA P, PESSOA PTIT, PESSOAFISICA PF, ENDPESS E, CIDADES C, '+
              '   ESTADO ES, PAIS PA, PESSOA PT, ELEGPATRO EL, PARTPREVPLAN PP, SITPART SPART, '+
              '   SITFUNC SFUNC, SITPLANOPREV SPLANO, CONTRATOEMPTMO EMP ' +
              'WHERE ' +
              '   (EMP.DATACREDITO ' + sOperador + ' TO_DATE('''+dtConcessao.Text+''',''DD/MM/YYYY'')) AND '+
              '   (EMP.IDPESSOA      = EL.IDPESSOA) AND  ' +
              '   (P.'+sIdEndereco+' = E.IDENDERECO(+)) AND  ' +
              '   (PTIT.IDPESSOA     = PP.IDPESSOA) AND '+
              '   (P.IDPESSOA        = PP.IDPESSOA) AND '+
              '   (PF.IDPESSOA       = P.IDPESSOA) AND '+
              '   (E.IDCIDADES       = C.IDCIDADES(+)) AND '+
              '   (C.IDESTADO        = ES.IDESTADO(+)) AND '+
              '   (ES.IDPAIS         = PA.IDPAIS(+)) AND '+
              '   (PP.IDPESSJUR      = EL.IDPESSJUR) AND '+
              '   (PP.IDPESSOA       = EL.IDPESSOA) AND '+
              '   (PP.IDPESSJUR      = PT.IDPESSOA) AND '+
              '   (PP.IDSITPART      = SPART.IDSITPART) AND '+
              '   (PP.IDSITPLANOPREV = SPLANO.IDSITPLANOPREV) AND '+
              '   (PP.FLGDESATIVADO  = 0 ) AND ' +  
              '   (EL.IDSITFUNC      = SFUNC.IDSITFUNC) '+
              ' ORDER BY E.CEP ';
    End;


    sOrdem := '';

    For I:=0 to cklstOrdem.Items.Count -1 do
       if cklstOrdem.checked[i] then
         sOrdem := sOrdem + cklstOrdem.Items[i] + ', ';

    If sOrdem <> '' Then
    Begin
       sOrdem := ' ORDER BY ' + Copy(sOrdem, 1, Length(sOrdem) -2);
       sSql := Copy(sSql, 1, Pos(' ORDER BY ', sSQL)) + sOrdem;
    End;                                   

    (DsEtiq.DataSet as TwwQuery).Close;
    (DsEtiq.DataSet as TwwQuery).Sql.Clear;
    (DsEtiq.DataSet as TwwQuery).Sql.Text := sSql;
    (DsEtiq.DataSet as TwwQuery).Open;
    Result := Not (DsEtiq.DataSet as TwwQuery).IsEmpty;
  finally
    Screen.Cursor := CrDefault;
  End;
End;

procedure TFrmEmisEtiq.FormCreate(Sender: TObject);
Var
  X: Integer;
begin
  inherited;

  For X:=0 To ComponentCount - 1 Do
     If (Components[x] is TWWQUery) Then
     Begin
        If (Components[x] as TWWQUery).Active Then (Components[x] as TWWQUery).Close;
        (Components[x] as TWWQUery).Open;
     End;
end;

procedure TFrmEmisEtiq.PagEtiqChange(Sender: TObject);
begin
  inherited;

  If QryEtiqParticip.Active Then QryEtiqParticip.Close;
  If QryEtiqBenef.Active    Then QryEtiqBenef.Close;
  // Gleyber - 08/04/2002
  If qryPensao.Active    Then qryPensao.Close;

  If PagEtiq.ActivePage = TbsParticip Then
    DsEtiq.DataSet := QryEtiqParticip
  Else If PagEtiq.ActivePage = tabMatriculas Then
  Begin
    mmListaMatriculas.Lines.Clear;
    EdtMatricula.Clear
  End

  Else If PagEtiq.ActivePage = tabIncricao Then
  Begin
    mmListaInscricao.Lines.Clear;
    edtInscricao.Clear
  End

  Else If PagEtiq.ActivePage = TbsBenef Then
      DsEtiq.DataSet := QryEtiqBenef
  Else If PagEtiq.ActivePage = TabDtEmpto Then
    cmbOperadores.ItemIndex := 0
  Else If PagEtiq.ActivePage = TbsBenef Then
        DsEtiq.DataSet := qryPensao
  Else DsEtiq.DataSet := QryEtiqParticip;

end;

procedure TFrmEmisEtiq.bbtnConfirmarClick(Sender: TObject);
Var
  sAtencao: String;
  MemReports :TMemo;
begin
  inherited;
  MemReports         := TMemo.Create(Self);
  Try
    MemReports.parent  := Self;
    MemReports.Visible := False;
    Application.ProcessMessages;

    If CmbModeloEtiq.Text = ''  Then
       MsgDlg('Favor informar o modelo de etiqueta','Atenção',MtInformation,[MbOk],0)
    Else
    Begin

       If PreencheQRY Then
       Begin
         If CkbMatricial.Checked Then
         Begin
            EtiquetaCm := TEtiquetaCm.Create;
            EtiquetaCm.ModeloEtiq := StrToInt(CmbModeloEtiq.LookupValue);
            EtiquetaCm.Imprime((DsEtiq.DataSet as TwwQuery),sAtencao);
            EtiquetaCm.Free;
            ModalResult :=  MrCancel;
         End
         Else
         Begin
            qryReports.Close;
            If Not qryReports.Prepared Then qryReports.Prepare;
            qryReports.Params[0].AsInteger := QryModeloIDREPORTS.AsInteger;
            qryReports.Params[1].AsInteger := QryModeloORIGEMCM.AsInteger;
            qryReports.Open;
            MemReports.Lines.Clear;
            MemReports.Lines.Text := qryReportsTEMPLATE.AsString;
            //Substitui o Pipeline do Template pelo Pipeline do Report
            ModeloRelatCM.SetaDataPipeline('FrmEmisEtiq','PpEtiq','FrmConfigEtiq','ppConsulta',MemReports);
            MemReports.Lines.SaveToFile(Sistema.TempDir + ArqCmEtiqueta);

            RptEtiq.Template.Format   := ftASCII;
            RptEtiq.Template.Saveto   := stFile;
            RptEtiq.Template.FileName := Sistema.TempDir + ArqCmEtiqueta;
            RptEtiq.Template.LoadFromFile;
            //RptEtiq.Print;

            TFrmPreview.CreateModalPreview(Application, RptEtiq, 'AdmPREV - Etiquetas');
         End;
       end
       else
       Begin
         Msgdlg('Não há registros para serem impressos.','Atenção',MtWarning,[MbOk],0);
       End;
    End;
  Finally
    MemReports.Free;
  End;
end;

procedure TFrmEmisEtiq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LstPatro.Free;
  LstSitPlan.Free;
  lstSitFundacao.Free;


  inherited;
  FuncaoGeral.FechaQry([QryModelo, QryBenef, QrySitFundacao, QrySitPatro,
                        QryPlano, QrySitPlano, QryPatro, QryModelo,
                        QryEtiqParticip, qryReports, QryEtiqBenef],false,True);
end;

procedure TFrmEmisEtiq.EdtMatIniExit(Sender: TObject);
begin
  inherited;
  EdtNumInscIni.Text := '';
  EdtNumInscFin.Text := '';
end;

procedure TFrmEmisEtiq.EdtNumInscIniExit(Sender: TObject);
begin
  inherited;
  EdtMatIni.Text := '';
  EdtMatFin.Text := '';
end;

procedure TFrmEmisEtiq.bbtnGeraArquivoClick(Sender: TObject);
var F           : TextFile;
    sLinha      : string;
    iSequencial : longint;
begin
  inherited;

  if not SaveDlg.Execute then Exit;

  if not PreencheQry
  then begin
     MsgDlg('Erro ao buscar os dados.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  try
     frmAguarde.Mostra('Gerando arquivo ...');
     AssignFile(F, SaveDlg.FileName);
     Rewrite(F);

     with dsEtiq.DataSet do
     begin
        // Escrever cabecalho
        sLinha := PreparaStr('NOMETITULAR',            60)+
                  PreparaStr('NOMEBENEFICIARIO',       60)+
                  PreparaStr('NOMERECEBEDOR',          60)+
                  PreparaStr('MATRICULA',              15)+
                  PreparaStr('IDPESSJUR',              15)+
                  PreparaStr('NOMEPATRO',              15)+
                  PreparaStr('LOGRADOURO',             60)+
                  PreparaStr('NUMERO',                 15)+
                  PreparaStr('COMPLEMENTO',            20)+
                  PreparaStr('BAIRRO',                 30)+
                  PreparaStr('CEP',                    20)+
                  PreparaStr('CIDADE',                 30)+
                  PreparaStr('CODESTADO',              04)+
                  PreparaStr('NOMEPAIS',               30)+
                  PreparaStr('SEQUENCIAL',             10);
        writeln(F, sLinha);

        First;
        iSequencial := 0;
        while not Eof do
        begin
           inc(iSequencial);
           // Escrever detalhe
           sLinha := PreparaStr(FieldByName('NOMETITULAR').AsString,     60)+
                     PreparaStr(FieldByName('NOMEBENEFICIARIO').AsString,60)+
                     PreparaStr(FieldByName('NOMERECEBEDOR').AsString,   60)+
                     PreparaStr(FieldByName('MATRICULA').AsString,       15)+
                     PreparaStr(FieldByName('IDPESSJUR').AsString,       15)+
                     PreparaStr(FieldByName('NOMEPATRO').AsString,       15)+
                     PreparaStr(FieldByName('LOGRADOURO').AsString,      60)+
                     PreparaStr(FieldByName('NUMERO').AsString,          15)+
                     PreparaStr(FieldByName('COMPLEMENTO').AsString,     20)+
                     PreparaStr(FieldByName('BAIRRO').AsString,          30)+
                     PreparaStr(FieldByName('CEP').AsString,             20)+
                     PreparaStr(FieldByName('CIDADE').AsString,          30)+
                     PreparaStr(FieldByName('CODESTADO').AsString,       04)+
                     PreparaStr(FieldByName('NOMEPAIS').AsString,        30)+
                     PreparaStr(IntToStr(iSequencial),                   10);

           writeln(F, sLinha);
           Next;
        end;
     end; // with
  finally
     CloseFile(F);
     frmAguarde.Apaga;
  end;

  MsgDlg('Arquivo gerado com sucesso.','Informação', mtInformation, [mbOk],0);
end;

procedure TFrmEmisEtiq.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;

  LstPatro       := TStringList.Create;
  LstSitPlan     := TStringList.Create;
  lstSitFundacao := TStringList.Create;
  QryPatro.Close;
  QryPatro.Open;
  CriaLista(ChkLstPatro,QryPatro,LstPatro,'IDPESSOA','NOMEPESSOA');
  QrySitPlan.Close;
  QrySitPlan.Open;
  CriaLista(ChkLstSitPlan,QrySitPlan,LstSitPlan,'IDSITPLANOPREV','DESCRICAO');

  QrySitFundacao.Close;
  QrySitFundacao.Open;
  CriaLista(chklstSitFundacao,QrySitFundacao,lstSitFundacao,'IDSITPART','DESCRICAO');  

  QryContrib.Close;
  QryContrib.Open;

  PagEtiq.ActivePageIndex := 0;


end;

Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                           Lista: TStringList; Chave, Descricao:String);
Begin
  Lista.Clear;
  While Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  End;
End;

function TFrmEmisEtiq.MontaSQL(Mes, ListaPatro, ListaSitPlano,
                               sIdEndereco: String): String;
Var
  sSQL : String;
begin
  sSQL := 'SELECT DISTINCT '+
          ' EP.IDPESSJUR, EP.MATRICULA, P.NOME AS NOME,  P.NOME AS NOMETITULAR, '+
          ' P.NOME AS NOMEBENEFICIARIO, P.NOME AS NOMERECEBEDOR, PT.NOME AS NOMEPATRO, '+
          ' E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, ' +
          ' CD.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS, ' +
          ' SPART.DESCRICAO AS SITFUNDACAO   ' + 
          'FROM   PESSOA PJ,  PESSOA PFL, PESSOA P, HSTCONTRIBPREV HCP, ELEGPATRO EP,  '+
          '       SITFUNC SF, SITPLANOPREV SP, SITPART SPART, PARTPREVPLAN PPP,        '+
          '       CONTRIBUICAO C, ENDPESS E, CIDADES CD, ESTADO ES, PAIS PA, PESSOA PT  '+
          'WHERE (HCP.MESCOBRANCA = '''+Mes+''') ';

  if (sPatro <> '')
  then ssql := ssql + 'AND (HCP.IDPESSJUR IN ('+ListaPatro+')) ';
  if (sSitPlan <> '')
  then ssql := ssql + 'AND (SP.IDSITPLANOPREV IN ('+ListaSitPlano+'))  ';

  if Trim(dbcContribuicao.Text) <> '' then
    ssql := ssql + 'AND (HCP.IDCONTRIBUICAO = '+ qryContrib.FieldByName('IDCONTRIBUICAO').AsString +')  ';

  ssql := ssql +'AND   (HCP.VALORRECEBIDO  IS NULL ) '+
                'AND   (HCP.FLGDEVOLUCAO   = 0 ) '+
                'AND   (HCP.IDPESSOA       = EP.IDPESSOA) '+
                'AND   (HCP.IDPESSJUR      = EP.IDPESSJUR) '+
                'AND   (EP.IDPESSJUR       = PJ.IDPESSOA) '+
                'AND   (EP.IDESTAB         = PFL.IDPESSOA(+)) '+
                'AND   (EP.IDPESSOA        = P.IDPESSOA) '+
                'AND   (EP.IDSITFUNC       = SF.IDSITFUNC) '+
                'AND   (HCP.IDPESSJUR      = PPP.IDPESSJUR) '+
                'AND   (HCP.IDPLANOPREV    = PPP.IDPLANOPREV) '+
                'AND   (HCP.IDPESSOA       = PPP.IDPESSOA) '+
                'AND   (HCP.SEQPROPOSTA    = 1) '+
                'AND   (PPP.IDSITPLANOPREV = SP.IDSITPLANOPREV) '+
                'AND   (HCP.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
                'AND   (PPP.IDSITPART      = SPART.IDSITPART)  AND '+
                '   (P.'+sIdEndereco+' = E.IDENDERECO(+)) AND  ' +
                '   (E.IDCIDADES  = CD.IDCIDADES(+)) AND ' +
                '   (CD.IDESTADO   = ES.IDESTADO(+)) AND ' +
                '   (ES.IDPAIS    = PA.IDPAIS(+)) AND ' +
                '   (PPP.IDPESSOA  = P.IDPESSOA) AND ' +
                '   (PPP.IDPESSJUR = EP.IDPESSJUR) AND ' +
                '   (PPP.IDPESSOA  = EP.IDPESSOA) AND ' +
                '   (PPP.FLGDESATIVADO  = 0 ) AND ' +
                '   (PPP.IDPESSJUR = PT.IDPESSOA)  '+                         
                'ORDER BY E.CEP ';

  Result := sSQL;
end;

procedure TFrmEmisEtiq.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  mmListaMatriculas.Lines.Clear;
end;

procedure TFrmEmisEtiq.btnTransfereClick(Sender: TObject);
begin
  inherited;
  //  transfere a matrícula digidata para o memo, com a vírgula.
  If EdtMatricula.Focused Or btnTransfere.Focused Then
  Begin
    mmListaMatriculas.Lines.Add(EdtMatricula.text);
    EdtMatricula.Clear;
    EdtMatricula.SetFocus;
  End;
end;

procedure TFrmEmisEtiq.SpeedButton2Click(Sender: TObject);
var
  aArq      : TextFile;
  sLinha    : String;
begin
  inherited;
  // abre o arquivo e alimenta o memo.

  If opDlg.Execute Then
  Begin
    AssignFile(aArq, opDlg.FileName);
    Reset(aArq);

    // loop no arquivo
    While Not EOF(aArq) Do
    Begin
      ReadLn(aArq,sLinha);
      sLinha:=trim(sLinha);
      if sLinha <> '' then
        mmListaMatriculas.Lines.Add(sLinha);
    End;
  End;
end;

procedure TFrmEmisEtiq.btnTransfereInscClick(Sender: TObject);
begin
  inherited;
  //  transfere a inscrição digidata para o memo, com a vírgula.
  If edtInscricao.Focused Or btnTransfereInsc.Focused Then
  Begin
    mmListaInscricao.Lines.Add(edtInscricao.text);
    edtInscricao.Clear;
    edtInscricao.SetFocus;
  End;
end;

procedure TFrmEmisEtiq.spbImportaArqInscClick(Sender: TObject);
var
  aArq      : TextFile;
  sLinha    : String;

begin
  inherited;
  // abre o arquivo e alimenta o memo.

  If opDlg.Execute Then
  Begin
    AssignFile(aArq, opDlg.FileName);
    Reset(aArq);

    // loop no arquivo
    While Not EOF(aArq) Do
    Begin
      ReadLn(aArq,sLinha);
      sLinha:=trim(sLinha);
      if sLinha <> '' then
        mmListaInscricao.Lines.Add(sLinha);
    End;
  End;
end;

procedure TFrmEmisEtiq.spbApagaTudoInscrClick(Sender: TObject);
begin
  inherited;
  mmListaInscricao.Lines.Clear;
end;

procedure TFrmEmisEtiq.QryEtiqParticipCalcFields(DataSet: TDataSet);
begin
   inherited;
   QryEtiqParticip.FieldByName('MENSAGEM').AsString := edMensagem.Text;
end;

procedure TFrmEmisEtiq.QryEtiqBenefCalcFields(DataSet: TDataSet);
begin
  inherited;
  QryEtiqBenef.FieldByName('MENSAGEM').AsString := edMensagem.Text;
end;

procedure TFrmEmisEtiq.SpeedButton3Click(Sender: TObject);
Var Atual, Novo:Integer;
begin
   inherited;

   Atual := cklstOrdem.ItemIndex;
   If Atual = 0 Then Exit;
   Novo := Atual - 1;
   cklstOrdem.Items.Move(Atual, Novo);
   cklstOrdem.ItemIndex := Novo;
end;

procedure TFrmEmisEtiq.SpeedButton4Click(Sender: TObject);
Var Atual, Novo:Integer;
begin
  inherited;

   Atual := cklstOrdem.ItemIndex;       
   If Atual = cklstOrdem.Items.Count -1 Then Exit;
   Novo := Atual + 1;
   cklstOrdem.Items.Move(Atual, Novo);
   cklstOrdem.ItemIndex := Novo;
end;

procedure TFrmEmisEtiq.HabilitaParticipante(Condicao: Boolean);
begin
  DtInscrIni.Enabled        := Condicao;
  DtInscrFin.Enabled        := Condicao;

  chklstSitFundacao.Enabled := Condicao;

  EdtNumInscIni.Enabled     := Condicao;
  EdtNumInscFin.Enabled     := Condicao;

  DtCancelaIni.Enabled      := Condicao;
  DtCancelaFin.Enabled      := Condicao;

  Label8.Enabled            := Condicao;
  DblPatro.Enabled          := Condicao;

  Label6.Enabled            := Condicao;
  DblSitPatro.Enabled       := Condicao;

  Label9.Enabled            := Condicao;
  DblPlano.Enabled          := Condicao;

  Label7.Enabled           := Condicao;
  DblSitPlano.Enabled       := Condicao;
end;

procedure TFrmEmisEtiq.ckbSoElegivelClick(Sender: TObject);
begin
  inherited;

  HabilitaParticipante(Not ckbSoElegivel.Checked);
end;

procedure TFrmEmisEtiq.rgpTipoImportaClick(Sender: TObject);
begin
  inherited;

  If mmListaMatriculas.Lines.Count > 0 Then
    If (MsgDlg('Deseja realmente alterar a opção de importção? a lista será excluida',
               'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
      Exit;

  mmListaMatriculas.Clear;

  If rgpTipoImporta.ItemIndex = 0 Then
  Begin
     Label15.Caption := 'Digite a matrícula + [ENTER]';
     Label16.Caption := 'Matrículas inseridas';
  End
  Else
  Begin
     Label15.Caption := 'Digite o IDPessoa + [ENTER]';
     Label16.Caption := 'IDPessoas inseridos';
  End
end;

end.

//------------------------------------------------------------------------------
// Alterações :
//
// --- *** ---
//  Autor    : Carlos Gleyber Macedo de Mesquita
//  Data     : 08/04/2002
//  Descrição: Inclusão do Filtro de Aniversariantes do Mês na pasta PARTICIPANTES e
//             BENEFICIÁRIOS
//             Inclusão de uma nova pasta para emissão de etiquetas de FAVORECIDOS DE
//             PENSÃO ALIMENTÍCIA - Pendência 5791
// --- *** ---
//------------------------------------------------------------------------------
unit fEmisEtiq;
// FDIAS - REFER - 25.07.2001 - ACRESCENTADO O DBLPLANOPREV PARA BENEFICIÁRIOS - SOMENTE
// PARA PODER UTILIZAR O ÍNDICE E SER MAIS RÁPIDO

{  Augusto 11/07/2002 - Aba por Participantes em débito                     }
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
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DblSitfundacao: TCMDBLookupCombo;
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
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure PagEtiqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtMatIniExit(Sender: TObject);
    procedure EdtNumInscIniExit(Sender: TObject);
    procedure bbtnGeraArquivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function PreencheQRY: Boolean;
    Function MontaSQL(Mes, ListaPatro, ListaSitPlano,
                      sIdEndereco : String): String;
  public
    { Public declarations }
  end;
  Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
            Lista: TStringList; Chave, Descricao:String);

var
  FrmEmisEtiq: TFrmEmisEtiq;
  LstPatro, LstSitPlan:TStringList;
  wDia,wMes,wAno : Word;
  sPatro, sSitPlan, sSQL: String; 

implementation

{$R *.DFM}

Uses uEtiquetaCM, uModeloRelatCM, uSistema, uFuncaoGeral, UFuncoesUteis,
     fAguarde;

function TFrmEmisEtiq.PreencheQRY: Boolean;
Var
  sSql, wMes, sIdEndereco : String;
  I : Integer;
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
    If (DsEtiq.DataSet as TwwQuery).Active Then (DsEtiq.DataSet as TwwQuery).Close;

    If PagEtiq.ActivePage = TbsParticip Then Begin // etiqueta para participante
      {FDIAS - REFER - 25.07.2001 - ACERTAR FIELDSEDITOR DAS QUERIES: QryEtiqBenef e QryEtiqParticip}
      sSql := 'SELECT DISTINCT EL.IDPESSJUR, EL.MATRICULA,P.NOME AS NOME,  P.NOME AS NOMETITULAR, '+  // FDIAS - REFER - 25.07.2001
              '   P.NOME AS NOMEBENEFICIARIO, P.NOME AS NOMERECEBEDOR, PT.NOME AS NOMEPATRO, '+     // FDIAS - REFER - 25.07.2001
              '   E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, ' +
              '   C.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS,  '''' AS CONTATO ' +
              'FROM ' +
              // Gleyber - 08/04/2002
              '   PESSOA P, PESSOAFISICA PF, ENDPESS E, CIDADES C, ESTADO ES, PAIS PA, PESSOA PT,   ' +
              '   ELEGPATRO EL, PARTPREVPLAN PP, SITPART SPART, SITFUNC SFUNC, SITPLANOPREV SPLANO  ' ;


        sSQL := sSQL +
              'WHERE ' +
              FuncaoGeral.Decode(Trim(DtInscrIni.Text)    ,'','', ' (PP.INSCRICAODATA >= TO_DATE(''' + DtInscrIni.Text + ''',''DD/MM/YYYY'')) AND ')+
              FuncaoGeral.Decode(Trim(DtInscrFin.Text)    ,'','', ' (PP.INSCRICAODATA <= TO_DATE(''' + DtInscrFin.Text + ''',''DD/MM/YYYY'')) AND ')+
              FuncaoGeral.Decode(Trim(DtCancelaIni.Text)  ,'','', ' (PP.DATACANCELAMENTO >= TO_DATE(''' + DtCancelaIni.Text + ''',''DD/MM/YYYY'')) AND ')+
              FuncaoGeral.Decode(Trim(DtCancelaFin.Text)  ,'','', ' (PP.DATACANCELAMENTO <= TO_DATE(''' + DtCancelaFin.Text + ''',''DD/MM/YYYY'')) AND ')+
              FuncaoGeral.Decode(Trim(EdtMatIni.Text)     ,'','', ' (EL.MATRICULA >= ''' + EdtMatIni.Text + ''') AND ')+
              FuncaoGeral.Decode(Trim(EdtMatFin.Text)     ,'','', ' (EL.MATRICULA <= ''' + EdtMatFin.Text + ''') AND ')+
              FuncaoGeral.Decode(EdtNumInscIni.Value      ,0 ,'', ' (PP.INSCRICAONUMERO >= ' + EdtNumInscIni.Text + ') AND ')+
              FuncaoGeral.Decode(EdtNumInscFin.Value      ,0 ,'', ' (PP.INSCRICAONUMERO <= ' + EdtNumInscFin.Text + ') AND ')+
              FuncaoGeral.Decode(Trim(DblSitfundacao.Text),'','', ' (PP.IDSITPART = ' + DblSitfundacao.LookupValue + ') AND ')+
              FuncaoGeral.Decode(Trim(DblSitPatro.Text)   ,'','', ' (EL.IDSITFUNC = ' + DblSitPatro.LookupValue + ') AND ')+
              FuncaoGeral.Decode(Trim(DblSitPlano.Text)   ,'','', ' (PP.IDSITPLANOPREV = ' + DblSitPlano.LookupValue + ') AND ' )+
              FuncaoGeral.Decode(Trim(DblPatro.Text)      ,'','', ' (PP.IDPESSJUR = ' + DblPatro.LookupValue + ') AND ' )+
              FuncaoGeral.Decode(Trim(DblPlano.Text)      ,'','', ' (PP.IDPLANOPREV = ' + DblPlano.LookupValue + ') AND ' )+
              // Gleyber - 08/04/2002
              FuncaoGeral.Decode(Trim(dbcAnivPart.Text)   ,'','', ' (SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YY''),4,2) = '+dbcAnivPart.Value+') AND ')+
              '   (P.'+sIdEndereco+' = E.IDENDERECO(+)) AND  ' +
              '   (E.IDCIDADES = C.IDCIDADES(+)) AND ' +
              '   (C.IDESTADO = ES.IDESTADO(+)) AND ' +
              '   (ES.IDPAIS = PA.IDPAIS(+)) AND ' +
              '   (PP.IDPESSOA = P.IDPESSOA) AND ' +
              // Gleyber - 08/04/2002
              '   (PF.IDPESSOA = P.IDPESSOA) AND ' +
              '   (PP.IDPESSJUR = EL.IDPESSJUR) AND ' +
              '   (PP.IDPESSOA = EL.IDPESSOA) AND ' +
              '   (PP.IDPESSJUR = PT.IDPESSOA) AND '+     // FDIAS - REFER - 25.07.2001
              '   (PP.IDSITPART = SPART.IDSITPART) AND ' +
              '   (PP.IDSITPLANOPREV = SPLANO.IDSITPLANOPREV) AND ' +
              '   (EL.IDSITFUNC = SFUNC.IDSITFUNC) ';

      sSQL := sSQL + 'ORDER BY E.CEP ';

    // Gleyber - 08/04/2002
    End Else If PagEtiq.ActivePage = TbsBenef Then // etiqueta para beneficiario
       sSql := 'SELECT DISTINCT  BF.IDPESSJUR, EL.MATRICULA,P.NOME AS NOME, P.NOME AS NOMETITULAR, PT.NOME AS NOMEPATRO,'+ vQl +
               '  PBEN.NOME AS NOMEBENEFICIARIO, PRESP.NOME AS NOMERECEBEDOR,  '+ vQl +
               '  E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, '+ vQl +
               '  C.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS  '+ vQl +
               'FROM BENEFBFCIARIO BF, BFCIARIOTITPLAN BFTIT, PESSOA P, PESSOA PRESP, '+ vQl +
               '  PESSOA PBEN, PESSOAFISICA PF, ELEGPATRO EL, PESSOA PT, '+ vQl +
               '  ENDPESS E, CIDADES C, ESTADO ES, PAIS PA, BENEFICIO B '+ vQl +
               'WHERE '+ vQl +
              FuncaoGeral.Decode(Trim(DblPlanoPrev.Text),'','', ' (BF.IDPLANOPREV = ' + DblPlanoPrev.LookupValue + ') AND '+ vQl)+
              FuncaoGeral.Decode(Trim(DblBeneficio.Text),'','', ' (BF.IDBENEFICIO = ' + DblBeneficio.LookupValue + ') AND '+ vQl)+
              '  (BF.IDSITBENEFICIO IN (1,2)) AND ' + vQl +
              FuncaoGeral.Decode(Trim(DtBenefIni.Text)  ,'','', ' (BF.DATAINICIOFUND >= TO_DATE(''' + DtBenefIni.Text + ''',''DD/MM/YYYY'')) AND '+ vQl)+
              FuncaoGeral.Decode(Trim(DtBenefFin.Text)  ,'','', ' (BF.DATAINICIOFUND <= TO_DATE(''' + DtBenefFin.Text + ''',''DD/MM/YYYY'')) AND '+ vQl)+
               // Gleyber - 08/04/2002
              FuncaoGeral.Decode(Trim(dbcAnivBenef.Text)   ,'','', ' (SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YY''),4,2) = '+dbcAnivBenef.Value+') AND '+ vQl)+
              '  (BFTIT.IDPESSJUR = BF.IDPESSJUR) AND '+ vQl +
              // FERNANDO - 11/06/2002
              '  (BFTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM) AND '+ vQl +
              '  (BFTIT.IDPLANOPREV = BF.IDPLANOPREV) AND '+ vQl +
              '  (BFTIT.IDTITULAR = BF.IDTITULAR) AND '+ vQl +
              '  (BFTIT.IDPESSOA = BF.IDPESSOA) AND '+ vQl +
              '  (BFTIT.IDBENEFICIO = BF.IDBENEFICIO) AND '+ vQl +
              '  (BFTIT.SEQPROPOSTA = BF.SEQPROPOSTA) AND '+ vQl +
              '  (BF.IDTITULAR = P.IDPESSOA) AND '+ vQl +
              '  (BF.IDPESSOA = PBEN.IDPESSOA) AND '+ vQl +
               // Gleyber - 08/04/2002
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
    // Gleyber - 08/04/2002
    Else If PagEtiq.ActivePage = tbsPensao Then // etiqueta para Favorecidos de Pensão Alimentícia { Augusto 11/07/2002 }
      sSql := 'SELECT DISTINCT  EL.IDPESSJUR, EL.MATRICULA, PT.NOME AS NOME,  PT.NOME AS NOMETITULAR, ' + vQl +
              '  PF.NOME AS NOMEBENEFICIARIO, PR.NOME AS NOMERECEBEDOR, PP.NOME AS NOMEPATRO,' + vQl +
              '  EP.LOGRADOURO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, ' +
              '  CD.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS ' +
              'FROM ' +
              ' PESSOA PT, PESSOA PF, PESSOA PR, PESSOA PP, ' +
              ' ELEGPATRO EL, RUBRICAINDIV  RI, ENDPESS EP, ' +
              ' CIDADES CD, ESTADO ES, PAIS PA' + vQl +
              'WHERE ' +
              FuncaoGeral.Decode(Trim(DtInicioPensao.Text)    ,'','', '   (RI.DATAINICIO    >= TO_DATE(''' + dtInicioPensao.Text + ''',''DD/MM/YYYY'')) AND '+ vQl)+
              FuncaoGeral.Decode(Trim(DtFimPensao.Text)       ,'','', '   (RI.DATAFINAL     <= TO_DATE(''' + dtFimPensao.Text    + ''',''DD/MM/YYYY'')) AND '+ vQl)+
              '   (PF.IDENDRESIDENCIAL = EP.IDENDERECO(+)) AND' +
              '   (EP.IDCIDADES        = CD.IDCIDADES(+))  AND' +
              '   (CD.IDESTADO         = ES.IDESTADO(+))   AND' +
              '   (ES.IDPAIS           = PA.IDPAIS(+))     AND' +
              '   (RI.IDTITULAR        = PT.IDPESSOA)      AND' +
              '   (RI.IDPESSOA         = PR.IDPESSOA)      AND' +
              '   (RI.IDFAVORECIDO     = PF.IDPESSOA)      AND' +
              '   (RI.FLGPENSAOALIM    = 1)                AND' +
              '   (PT.IDPESSOA         = EL.IDPESSOA)      AND' +
              '   (EL.IDPESSJUR        = PP.IDPESSOA)  ORDER BY E.CEP       '
    { Inicio Augusto 11/07/2002 }
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
      sPatro  := '';
      sSitPlan:= '';

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
          SSitPlan := SSitPlan + LstSitPlan.Strings[I]+',';
      End;
      sPatro   := Trim(Copy(SPatro,1,((Length(SPatro)-1))));
      sSitPlan := Trim(Copy(SSitPlan,1,((Length(SSitPlan)-1))));
      { Monta SQL }
      sSQL := MontaSQL(wMes,sPatro, sSitPlan, sIdEndereco);
{***********************}
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
  Else
    If PagEtiq.ActivePage = TbsBenef Then
      DsEtiq.DataSet := QryEtiqBenef
     Else
      If PagEtiq.ActivePage = TbsBenef Then
        DsEtiq.DataSet := qryPensao
      Else
        DsEtiq.DataSet := QryEtiqParticip; 

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
            RptEtiq.Print;
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
  { Inicio Augusto 11/02/2002 }
  LstPatro.Free;
  LstSitPlan.Free;
  { Fim Augusto 11/02/2002    }

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
                  PreparaStr('CODESTADO',              04)+  // FDIAS - REFER - 25.07.2001
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
                     PreparaStr(FieldByName('CODESTADO').AsString,       04)+  // FDIAS - REFER - 25.07.2001
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
  { Inicio Augusto 11/07/2002 }
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;

  LstPatro   := TStringList.Create;
  LstSitPlan := TStringList.Create;
  QryPatro.Close;
  QryPatro.Open;
  CriaLista(ChkLstPatro,QryPatro,LstPatro,'IDPESSOA','NOMEPESSOA');
  QrySitPlan.Close;
  QrySitPlan.Open;
  CriaLista(ChkLstSitPlan,QrySitPlan,LstSitPlan,'IDSITPLANOPREV','DESCRICAO');

  QryContrib.Close;
  QryContrib.Open;
  { Fim Augusto 11/07/2002 }


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
          ' CD.NOME AS CIDADE, ES.CODESTADO, PA.NOMEPAIS ' +

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
                '   (PPP.IDPESSJUR = PT.IDPESSOA)  '+
                'ORDER BY E.CEP ';

  Result := sSQL;
end;

end.

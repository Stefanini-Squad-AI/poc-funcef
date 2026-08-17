// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 07/11/2007
// Pendência   : 26637
// Rotina      : PreparaSqlPatro
// Descricao   : Acerto no insert que estava gravando idpessoa e idtitular = 0.
//------------------------------------------------------------------------------
// Autor(a)    : Hugo Luna
// Data        : 07/11/2007
// Pendência   : 26714
// Rotina      : bbtnEnviarClick
// Descricao   : Acerto na nas condições que usam o FLGCOBCARNE
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 23/01/2006
// Pendência   : 19224
// Rotina      : FazEnvio e FolhaFazCobranca
// Descricao   : Acerto na parametrização contabil. 
//------------------------------------------------------------------------------
unit FCobraContribAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Wwquery,
  checklst, Spin, wwdblook, OpenArqText, ComCtrls, TB97, FOkCancelar,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, USincronismo, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc, UCtrlDocumento, UCtrlLancamento;

type
  TfrmCobraContribuicao = class(TfrmOkCancelar)
    Panel2: TPanel;
    qryPatro: TwwQuery;
    qry: TwwQuery;
    SaveDlg: TSaveDialog;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    pnlOpcoes: TPanel;
    pnlProgresso: TPanel;
    lblPainel: TLabel;
    btncancelaprogress: TBitBtn;
    Animacao: TAnimate;
    lContador: TLabel;
    qryBanco: TwwQuery;
    GroupBox1: TGroupBox;
    rgrpTipoCobranca: TRadioGroup;
    bbtnEnviar: TBitBtn;
    bbtnVerResultado: TBitBtn;
    pnllistapatro: TPanel;
    GroupBox3: TGroupBox;
    chklstPatro: TCheckListBox;
    qryAux: TwwQuery;
    dsInf: TwwDataSource;
    pnlintegracao: TPanel;
    LabelIntegracao: TLabel;
    qryAcumulo: TwwQuery;
    qryInf: TwwQuery;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    grpbJurosBoleta: TGroupBox;
    edtJurosBoleta: TEdit;
    GroupBox4: TGroupBox;
    dblkProduto: TwwDBLookupCombo;
    qryProduto: TwwQuery;
    btnInf: TBitBtn;
    pnlInformaEnvio: TPanel;
    dbgInf: TwwDBGrid;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    lbInfEnvio: TLabel;
    qryDesfaz: TwwQuery;
    qryBuscaLanc: TwwQuery;
    lblExclui: TLabel;
    Marca: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure bbtnEnviarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure btncancelaprogressClick(Sender: TObject);
    procedure rgrpTipoCobrancaClick(Sender: TObject);
    procedure cmbMesCobChange(Sender: TObject);
    procedure spedAnoCobChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInfClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MarcaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sPatro,                 (* variável que guarda o nome da patrocinadora *)
    sMesCobranca,           (* variável que guarda o mês de cobrança *)
    sDataVencimento,        (* variável que guarda a Data de Vencimento da Cobrança *)
    sNumRecebimento,        (* variável que guarda o número de recebimento do documento *)
    sCodPortForma: String;  (* variável que guarda o código da Forma de Pagamento *)
    iPatro,           (* variável que guarda a patrocinadora *)
    iPlnCodigo,       (* variável que guarda o Código da Planilha *)
    iContInsTMPDESC,  (* variável que acumula quantos registros foram para TMPDESC *)
    contador,         (* variável que acumula quantos registros estão no processo *)
    idLote : Integer; (* variável que guarda o lote da patrocinadora *)

    liEmpresa,          (* variável que guarda a Empresa Proprietária *)
    liExercicio,        (* variável que guarda o Exercício Contábil *)
    liPeriodo: Longint; (* variável que guarda o Período Contábil *)

    dTotalContribuicaoPatro, (* variável que guarda o somatório dos valores de todas as contribuições de uma patrocinadora *)
    dTotalContribuicaoBanco,
    dJuros,                  (* variável que guarda o Juros da Boleta *)
    dValor : Double;         (* variável que guarda o somatório dos valores de todas as contribuições de um participante *)

    bAlguma,         (* variável que sinaliza se houve o envio de alguma contribuição *)
    bcancelaenvio,   (* variável que sinaliza que o usuário deseja cancelar a operação *)
    bErro : Boolean; (* variável que sinaliza que houve erro no processamento *)
    dTotalVlCobranca: Double;  (* Guarda o Total de Valor da Cobrança em Banco *)
    iTotalCobranca  : Integer; (* Guarda o Total de Registros da Cobrança em Banco *)
    dAcumuloValor: Double;     (* Acumula o valor total da cobranca em banco *)
    iTotalAcumulo: Integer;    (* Acumula o total de registros da cobranca em banco *)

    vMES,
    vCODCENTROCUSTOD,
    vCODCENTROCUSTOC,
    vCODTIPDESEMBDEVOL,
    vPLACONTAC,
    vPLACONTAD,

    vCODTIPRECDES,
    vCODCENTRORESPON,
    vFLGINTERNO,
    vNUMRECEBIMENTO,
    vNOMEPRODASS,
    vNOMEPLANOPREV,
    vNOMEPLANOASSIST,
    vPATROCINADORA,
    vIDPLANASS,
    vMATRICULA,
    vCODPORTFORMA,
    vIDPROVENTO,
    vFLGATRASODEVOL,
    vCODUNIDNEGOC,
    vPLACONTADAUTPATR,
    vCONTACFORNECEDOR,
    vCODCCUSTOFORNECEDOR: String;
    vIDTITULAR,
    vIDPESSJUR,
    vIDFORNECEDOR,
    vIDCONTASS,
    vCODSUBCONTA,
    vSUBCONTAFORNECEDOR,
    vIDPLANOPREV: Integer;
    iTotalFBenef,
    iTotalFPag,
    iTotalCBanco: Integer;
    sLinSel,
    sTipoPagador,
    sIdProduto: String;
    FezPlanilha: Boolean;

    sNoDocumento            : String;
    iCodForma,
    iNumLancto,
    iCodLancCAPCAR          : Integer;


    CtrlDocumento           : TCtrlDocumento;
    CtrlLancamento          : TCtrlLancamento;


    Function BuscaInformacao(Nv1,Nv2,Nv3:String):String;
    Function ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
    Function InformacoesOK: boolean;
    Function ContasAPagar   : Boolean;
    Function ContasAPagarTotal : Boolean;
    Function ContasAReceber : Boolean;
    Function BuscaRamoForCli(sSituacao: string; cRecPag: char): longint;
    Function SelOk: Boolean;
    Procedure VerifAltSituacao;
    Procedure PegaAnoMesCobranca;
    procedure InformaEnvio;
    Procedure GravaErros(Ms: String;Md:Char);
    Procedure BuscaParametros(pIdPessJur:String);
    Procedure BuscaParametrosFornecedor;
    Procedure BuscaNomePatro(pIdPessJur:String);
    Procedure BuscaNomePlano(pIdPlanoPrev:String);
    Procedure BuscaNomePlanoAssist(pIdPlano:String);
    procedure FazLancamentoContabil;
    Procedure AcumulaValores;
    procedure BancoFazCobranca;
    procedure FolhaFazCobranca;
    procedure FazEnvio(ISBanco : Boolean;
           EnviaPatro : Boolean; Filtro: String; pTipoCobranca: Char);
    procedure FazUpdateHSTContribass(ISBanco : Boolean);
//    function ExcluiFinanceiro(Mes : String) : Integer;

  public
    { Public declarations }
  end;

var
  frmCobraContribuicao: TfrmCobraContribuicao;

implementation

uses UMensErro, UAdmAss, UAutorizacao, ULancContab, UDataBase,
     USistema, DBaseDados, UIntegraBack, UModulo, UContribuicaoPrev;

{$R *.DFM}

Function TfrmCobraContribuicao.BuscaInformacao(Nv1,Nv2,Nv3:String):String;
begin
  If Trim(Nv1)<>'' then Result:=Trim(Nv1)
  else If Trim(Nv2)<>'' then Result:=Trim(Nv2)
  else Result:=Trim(Nv3);
end;

Function TfrmCobraContribuicao.ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
begin
  Result:=False;
  If StrToIntDef(Copy(sSt,1,4),0)>0 then
     If StrToIntDef(Copy(sSt,6,2),0) In [1..12+bNum] then
        Result:=True;
end;

Procedure TfrmCobraContribuicao.GravaErros(Ms: String;Md:Char);
begin
  memResult.Lines.Add(Ms);
  If Md='0' then
     memResult.Lines.Add('Matricula: '+vMATRICULA);
  memResult.Lines.Add('-------------------------------------------------------------------------------');
end;

Procedure TfrmCobraContribuicao.PegaAnoMesCobranca;
Var sAnoAux,sMesAux: String;
begin
  sMesCobranca:='';
  sMesAux:='';
  sAnoAux := spedAnoCob.Text;
  If CmbMesCob.Text = '' then
     CmbMesCob.Text:=CmbMesCob.Items[CmbMesCob.ItemIndex];

  if CmbMesCob.ItemIndex <= 8 then
     sMesAux := '0'+IntToStr(CmbMesCob.ItemIndex+1)
  else
  begin
    if CmbMesCob.ItemIndex <> 12 then
      sMesAux := IntToStr(CmbMesCob.ItemIndex+1)
    else
      sMesAux := '12';
  end;

  If (sAnoAux<>'') And (sMesAux<>'') then
     sMesCobranca := sAnoAux + '/' + sMesAux;

  If Not ValidaAnoMes(sMesCobranca,0) then sMesCobranca:='';
  (* Mostra Quantidade do envio por patrocinadora *)
end;

procedure TfrmCobraContribuicao.InformaEnvio;
{Var sLin, sSql: String;}
begin
  {}EXIT; {OTIMIZAR QRY}
  {
  If ValidaAnoMes(sMesCobranca,0) then
    With qryInf do
    begin
      Case rgrpTipoCobranca.ItemIndex Of
        0: sLin:= 'HT.IDPESSJUR <> FD.IDPESSOA AND HT.FLGCOBCARNE <> 1 ';
        1: sLin:= 'HT.IDPESSJUR = FD.IDPESSOA AND HT.FLGCOBCARNE <> 1  ';
        2: sLin:= 'HT.FLGCOBCARNE = 1 ';
        3: sLin:= 'HT.FLGCOBCARNE <> 1 ';
        else Exit;
      end;

      Case rgrpTipoCobranca.ItemIndex Of
        0: sSql:= 'TD.FLGDESCFOLHA = ''P'' AND TD.IDPESSJUR <> FD.IDPESSOA ';
        1: sSql:= 'TD.FLGDESCFOLHA = ''P'' AND TD.IDPESSJUR = FD.IDPESSOA ';
        2: sSql:= '';
        3: sSql:= 'TD.FLGDESCFOLHA = ''B''';
      end;

      Case rgrpTipoCobranca.ItemIndex Of
        0: lbInfEnvio.Caption:= 'Folha de Pagamento da Patrocinadora';
        1: lbInfEnvio.Caption:= 'Folha de Pagamento da Fundação';
        2: lbInfEnvio.Caption:= 'Cobrança Bancária';
        3: lbInfEnvio.Caption:= 'Folha de Benefícios';
      end;

      If rgrpTipoCobranca.ItemIndex = 2 then
        sSql:= '(SELECT COUNT(*) FROM HSTCONTRIBASS '+
               ' WHERE IDPESSJUR = HT.IDPESSJUR AND '+
               ' IDTITULAR = HT.IDTITULAR AND '+
               ' MESCOBRANCA = '+QuotedStr(sMesCobranca)+' AND '+
               ' SITRECEBIMENTO <> 0 AND '+
               ' FLGCOBCARNE = 1 AND '+
                sLin+') AS TOTALENVIO '
      else
        sSql:=' (SELECT COUNT(*) '+
       '  FROM HSTCONTRIBASS H, TMPDESC TD '+
       '  WHERE H.IDPESSJUR = HT.IDPESSJUR AND '+
       '  H.IDTITULAR = HT.IDTITULAR AND '+
       '  H.MESCOBRANCA = '+QuotedStr(sMesCobranca)+' AND '+
       '  H.IDPESSJUR = TD.IDPESSJUR AND '+
       '  TD.FLGTIPODESC = ''A'' AND '+
       sSql+' AND '+
       '  TD.IDMODULO = '+IntToStr(Sistema.IdModulo)+') AS TOTALENVIO ';


      Close;
      Sql.Clear;
      Sql.Add(
       'SELECT DISTINCT PJ.NOME, '+
       '(SELECT COUNT(*) FROM HSTCONTRIBASS '+
       ' WHERE IDPESSJUR = HT.IDPESSJUR AND '+
        sLin+' AND '+
       ' MESCOBRANCA = '+QuotedStr(sMesCobranca)+') AS TOTALCALCULO, '+
       sSql+
       ' FROM HSTCONTRIBASS HT, PESSOA PJ, FUNDACAO FD '+
       ' WHERE HT.MESCOBRANCA = '+QuotedStr(sMesCobranca)+' AND '+
        sLin+' AND '+
       ' FD.IDPESSOA = FD.IDPESSOA AND '+
       ' HT.IDPESSJUR = PJ.IDPESSOA ');
      Open;
    end; }

end;

procedure TfrmCobraContribuicao.FormActivate(Sender: TObject);
var AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12) then
  begin
       cmbMesCob.ItemIndex := AMonth - 1;
       cmbMesCob.Text  := cmbMesCob.Items[cmbMesCob.ItemIndex];
       spedAnoCob.Text := IntToStr(AYear);
  end;(* if *)
  (* Seleciona o Tipo de cobrança para Nenhum *)
  rgrpTipoCobranca.ItemIndex := -1;
  qryProduto.Close;
  qryProduto.Open;
  (* Preencher chkList da Patrocinadora *)
  qryPatro.Close;
  qryPatro.Open;
  chkLstPatro.Items.Clear;

  while not qryPatro.EOF do
  begin
       chkLstPatro.Items.Add(qryPatro.FieldByName('NOME').AsString);
       qryPatro.Next;
  end;(* while *)

  bbtnVerResultado.Visible := False;
  pnlProgresso.Visible     := False;
end;

Procedure TfrmCobraContribuicao.VerifAltSituacao;
Var qryTmp: TQuery;
    bErroAtual: Boolean;
begin
{otimizar qry}

    bErroAtual:=False;
    qryTmp:=Tquery.Create(Application);
    qryTmp.DatabaseName:='BaseDados';
    qryTmp.Close;
    qryTmp.Sql.Clear;
    qryTmp.Sql.Add(
    'SELECT PV.INSCRICAONUMERO, HT.IDTITULAR, HT.IDDEPENDENTE, HT.IDPLANASS,'+
    ' HT.IDCONTASS, HT.MESCOBRANCA '+
    ' FROM TMPDESC TD, PARTPREVPLAN PV, HSTCONTRIBASS HT, SITPART ST '+
    ' WHERE '+
    ' TD.FLGTIPODESC = ''A'' AND '+
    ' TD.FLGDESCFOLHA = ''P'' AND '+
    ' TD.IDMODULO = '+IntToStr(Sistema.IdModulo)+' AND '+
    ' TD.MESCOBRANCA = '+QuotedStr(sMesCobranca)+' AND '+
    ' TD.IDTITULAR = HT.IDTITULAR AND '+
    ' TD.IDDESCONTO = HT.IDCONTASS AND '+
    ' TD.IDPESSOA = HT.IDDEPENDENTE AND '+
    ' HT.MESCOBRANCA = TD.MESCOBRANCA AND '+
    ' PV.IDPESSOA = TD.IDTITULAR AND '+
    ' PV.IDPESSOA = HT.IDTITULAR AND '+
    ' PV.IDSITPART = ST.IDSITPART AND '+
    ' ST.FLGINTERNO = ''AS'' ');
    qryTmp.Open;
    If not dtmBaseDados.dbBaseDados.Intransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    While (Not qryTmp.Eof)And(Not bErroAtual) do
    begin
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add(
         'UPDATE HSTCONTRIBASS SET SITRECEBIMENTO = NULL '+
         ' WHERE IDTITULAR = '+qryTmp.FieldByName('IDTITULAR').AsString+' AND '+
         ' IDDEPENDENTE = '+qryTmp.FieldByName('IDDEPENDENTE').AsString+' AND '+
         ' IDPLANASS = '+qryTmp.FieldByName('IDPLANASS').AsString+' AND '+
         ' IDCONTASS = '+qryTmp.FieldByName('IDCONTASS').AsString+' AND '+
         ' MESCOBRANCA = '+QuotedStr(qryTmp.FieldByName('MESCOBRANCA').AsString));

         Try
            qryAux.ExecSql;
            memResult.Lines.Add('COBRANÇAS ENVIADAS PARA PATROCINADORA COM MUDANÇA DE SITUAÇÃO PARA ASSISTIDO');
            memResult.Lines.Add('Inscrições: '+qryTmp.FieldByName('INSCRICAONUMERO').AsString);
            memResult.Lines.Add('- VÁ AO CADASTRO DE PARTICIPANTES E ALTERE O TIPO DE COBRANÇA PARA');
            memResult.Lines.Add('DESCONTO EM FOLHA DE BENEFÍCIOS PARA AS INSCRIÇÕES LISTADAS.');
            memResult.Lines.Add('- FAZER NOVO CÁLCULO COM AS INSCRIÇÕES LISTADAS E ENVIAR NOVAMENTE.');
            memResult.Lines.Add('-------------------------------------------------------------------------------');
            bErro:=True;

         except
            bErroAtual:=True;
         end;
         qryTmp.Next;
    end; {While}
    If (Not bErroAtual)And(Not qryTmp.IsEmpty) then
       dtmBaseDados.dbBaseDados.Commit
    else dtmBaseDados.dbBaseDados.Rollback;
    qryTmp.Close;
    qryTmp.Free;
end;

function TfrmCobraContribuicao.InformacoesOk: boolean;
var sMsgErro : string;
begin
     Result := false;
     (* verifica se o usuário preencheu o Mês de Cobrança *)
     If Not ValidaAnoMes(sMesCobranca,0) then
     begin
          pnlProgresso.Visible := false;
          MsgDlg('Ano/Mês da Cobrança não preenchido. ','Erro', mtError, [mbOk,mbHelp], 0);
          cmbMesCob.SetFocus;
          Exit;
    end;(* if sMesCobranca *)
    (* verifica se o Tipo de cobrança foi preenchido *)
    if rgrpTipoCobranca.ItemIndex < 0 then
    begin
         pnlProgresso.Visible := false;
         MsgDlg('Selecione o Tipo de Cobrança.','Erro', mtError, [mbOk,mbHelp], 0);
         rgrpTipoCobranca.SetFocus;
         Exit;
    end
    else
    begin
         (* verifica se o Tipo de cobrança não é folha, isto é, tem cobrança bancária *)
         if rgrpTipoCobranca.ItemIndex = 2 then
         begin
              (* verifica se o Juros da boleta foi preenchido *)
              if Trim(edtJurosBoleta.Text) = '' then
              begin
                   pnlProgresso.Visible := false;
                   MsgDlg('Juros da boleta não preenchido.', 'Erro', mtError, [mbOk,mbHelp], 0);
                   edtJurosBoleta.SetFocus;
                   Exit;
              end
              else
              begin
                   (* Verifica se está integrado com Contabilidade *)
                   if (IntegraBack.Contabilidade = 'N') then
                   begin
                        pnlProgresso.Visible := false;
                        MsgDlg('O sistema não está integrado com a Contabilidade.' +
                        ' As cobranças de contribuição não serão contabilizadas.',
                        'Erro', mtError, [mbOk,mbHelp], 0);
                        Exit;
                   end;(* if Contabilidade = N *)
                   (* Verifica se está integrado com CAP/CAR *)
                   if (IntegraBack.Financeiro = 'N') then
                   begin
                        pnlProgresso.Visible := false;
                        MsgDlg('O sistema não está integrado com o Contas a Receber.' +
                               ' As cobranças de contribuição não podem ser enviadas.',
                               'Erro', mtError, [mbOk,mbHelp], 0);
                        Exit;
                   end;(* if Financeiro = N *)
                   (* verifica se o Juros da boleta é numérico *)
                   try
                      dJuros := StrFloat(edtJurosBoleta.Text,1);
                   except
                         pnlProgresso.Visible := false;
                         MsgDlg('Juros da boleta não é numérico.','Erro', mtError, [mbOk,mbHelp], 0);
                         edtJurosBoleta.SetFocus;
                         Exit;
                   end;(* try .. except *)
              end;(* if edJurosBoleta = '' *)
         end;(* if rgrpTipoCobranca = 2 *)
    end;(* if rgrpTipoCobranca < 0 *)
    (* Existe a integração com a Contabilidade. Deve-se testar período contábil
     pois, se o período contábil foi encerrado, não pode mais ser feito o envio

    Zera as variáveis para poder receber da função TestaPeriodo o Exercício e o Período Contábil *)
    liExercicio := 0;
    liPeriodo   := 0;
    liEmpresa   := Sistema.IdEmpresa;
    (* Esta função é encarregada de testar uma data fornecida,
    verificando se ela pertence a um período/exercício contábil. Retornando:
    0 - data testada com sucesso. Período e Exercícios retornados.
    1 - a data não pertence a nenhum período
    2 - a data pertence a mais de um período
    3 - período bloqueado na Contabilidade
    4 - período já integrado. Lançamentos bloqueados
    Se pertence, isto é, a função retornou Zero, retorna também para uso em
    forma de variáveis(iPeriodo e iExercicio) passadas por referência.
    Caso contrário, isto é a função retornou diferente de Zero, retorna também
    uma mensagem de erro para uso em forma de variável(sMensagem) passada por referência.
    Esta função SEMPRE deve ser chamada antes de se realizar um lançamento (LancaContabR),
    para que a Contabilidade possa retornar os valores corretos de período e
    exercício para a data desejada. *)

    if TestaPeriodo( False,                     (* Exibe ou não as mensagens de erro retornadas pela função*)
                     'BaseDados',               (* Nome do Banco de Dados *)
                     DateToStr(Date),           (* Data a ser testada *)
                     IntToStr(Sistema.IdModulo),(* Código do Sistema de Origem *)
                     liExercicio,               (* Exercício Contábil retornada a partir da data *)
                     liPeriodo,                 (* Período Contábil retornada a partir da data *)
                     liEmpresa,                 (* Empresa proprietária *)
                     sMsgErro) <> 0             (* Mensagem de Erro retornada pela função *)
    then
    begin
         MsgDlg('Erro no período contábil - '+ sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
         Exit;
    end;(* if TestaPeriodo *)
    Result := True;
end;

Function TfrmCobraContribuicao.SelOk: Boolean;
Var Ind     : Integer;
    CheckLst: Boolean;
begin
     CheckLst:=False;
     sLinSel:='';
     (* PATROCINADORAS *)
     With chkLstPatro do
     begin
          If Items.Count>0 then
             For Ind:=0 to Items.Count-1 do
                 If Checked[Ind] then
                 begin
                      CheckLst:=True;
                      sLinSel:=sLinSel+Trim(Items[Ind])+', ';
                 end;
     end; {With}
     sLinSel:=Copy(sLinSel,1,Length(sLinSel)-2);
     If Not checkLst then
        MsgDlg('Nenhum item foi selecionado!','Atenção',mtWarning,[mbOk,mbHelp],0);
     Result:=CheckLst;
end;

procedure TfrmCobraContribuicao.bbtnEnviarClick(Sender: TObject);
var  i: Integer;
     cTipoEnvPrev : Char;
     sSqlFiltro : String;
begin
     If bErro then
     begin
         (* traz o painel de resultado com o memo para frente *)
         pnlResult.BringToFront;
         (* leva o painel das patrocinadoras para traz *)
         pnlOpcoes.SendToBack;
         Exit;
     end;

     sIdProduto:= dblkProduto.LookupValue;

     If Trim(sIdProduto)='' then Exit;

     If Not SelOk then Exit;
     inherited;
     (* variável que sinaliza se houve o envio de alguma contribuição *)
     bAlguma       := False;
     (* variável que sinaliza que o usuário deseja cancelar a operação *)
     bcancelaenvio := False;
     (* variável que sinaliza que houve erro no processamento *)
     bErro         := False;
     (* verifica se o usuário forneceu todas as informações para o envio e preenche variáveis *)
     if not InformacoesOK then Exit;
     (* Verifica se participante ativo mudou situação para assistido *)
     (* Se mudou, cálculo deverá ser refeito para o participante     *)
     VerifAltSituacao;
     If bErro then
     begin
          (* traz o painel de resultado com o memo para frente *)
          pnlResult.BringToFront;
          (* leva o painel das patrocinadoras para traz *)
          pnlOpcoes.SendToBack;
          Exit;
     end;
     (* ============================================================ *)
     contador := 0;

     (* Impede repetir procedimento FazLancamentoContabil *)
     FezPlanilha:=False;
     (* ================================================= *)

     (* Variaveis para acumular valores para saber se inclui planilha *)
     dTotalVlCobranca:= 0;
     iTotalCobranca:= 0;
     dAcumuloValor:= 0;
     iTotalAcumulo:= 0;
     (* ============================================================= *)


     (* Codigo da Planilha Contábil *)
     (* Inciar com zero para criar nova planilha *)
     iPlnCodigo:=0;
     (* =========================== *)

     (* SE INTEGRADO A CONTABILIDADE *)
     If (IntegraBack.Contabilidade = 'N') then
        iPlnCodigo:= -1;
     (* ====================== *)

     pnlProgresso.Visible := True;
     pnlProgresso.BringToFront;
     Animacao.Active := True;
     btnCancelaProgress.SetFocus;
     lblPainel.Caption := 'Iniciando o processamento...';
     lContador.Caption := '';
     Application.ProcessMessages;
     (* Adiciona informações ao memo que será exibido no final do processamento *)
     memResult.Lines.Clear;
     memResult.Lines.Add('###############################################################################');
     memResult.Lines.Add('ASSISTENCIAL        Data: '+DateTimeToStr(Now));
     memResult.Lines.Add('Envio de Cobrança - Mês de Referência: '+sMesCobranca);
     memResult.Lines.Add('###############################################################################');
     memResult.Lines.Add(' ');

     (* Inicia uma nova transação *)
     if not dtmBaseDados.dbBaseDados.Intransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

     (* Este "for" verifica se o CCP já enviou a cobranca deste mes, *)
     (* se ainda não foi enviada, é chamada a função "FazEnvio" *)
     For i := 0 to chklstPatro.Items.Count - 1 do
     begin
          if (not chklstPatro.Checked[i]) then
             Continue;
          if not qryPatro.Locate('Nome', chklstPatro.Items[i], [loPartialKey]) then
             Continue;
          (* variável que guarda o nome da patrocinadora *)
          sPatro := chklstPatro.Items[i];
          (* variável que guarda a patrocinadora *)
          iPatro := qryPatro.FieldByName('IDPESSOA').AsInteger;
          (* variável que acumula quantos registros foram para TMPDESC *)
          iContInsTMPDESC :=  0;
          (* variável que guarda o somatório dos valores de todas as contribuições de uma patrocinadora *)
          dTotalContribuicaoPatro := 0;
          dTotalContribuicaoBanco := 0;

          memResult.Lines.Add(' ');
          memResult.Lines.Add(' ');
          memResult.Lines.Add('*** PATROCINADORA: ' + sPatro+' ***');
          memResult.Lines.Add(' ');

          (* Verifica se o tipo de cobrança tem FOLHA e se a PATROCINADORA já fechou o ciclo -
             a funçao VerificaFechamento da unit uSincronismo tem por objetivo verificar se
             determinado módulo já fechou determinado ciclo (envio ou recebimento), isto é
             se retornou True é porque o o CCP já fez o envio para este mês *)
          if ( rgrpTipoCobranca.ItemIndex <> 2) and
             ( VerificaFechamento(iPatro,         (* Identificador da Patrocinadora *)
                                  cteIdModuloCCP, (* Constante do identificador do módulo do CCP - ver unit UAdmAss *)
                                  sMesCobranca,   (* mês de cobrança *)
                                  'E',            (* Tipo de Operação - Envio *)
                                  cTipoEnvPrev))  (* Tipo retornada pela função por referência *)
          then
          begin
                memResult.Lines.Add(' Envio da patrocinadora ' + sPatro + ' encerrado.');
                if MsgDlg('O Envio do InterfacePrev para a patrocinadora "' + sPatro +
                          '" já foi executado e encerrado para o mês ' + sMesCobranca + '.'+#13+
                          'Deseja continuar o processamento ?',
                          'Confirmação',mtConfirmation, [mbYes,mbNo,mbHelp],0) = mrNo then
                begin
                     bcancelaenvio := True;
                     Break;
                end;(* if MsgDlg *)
          end;(* if rgrpTipoCobranca e VerificaFechamento *)

          pnlProgresso.Visible := True;
          Animacao.Active := True;
          btnCancelaProgress.SetFocus;
          lblPainel.Caption := 'Processando: ' + sPatro + '...';
          lContador.Caption := '';
          Application.ProcessMessages;

          (* Rotinas que fazem efetivamente o envio para uma determinada patrocinadora
          =========================================================================
          ========================================================================= *)
          Case rgrpTipoCobranca.ItemIndex of
               (* Obs: FazEnvio(Cobranca em banco, Via Patrocinadora, Filtro *)
               0: begin
                       sSqlFiltro:= ' (NVL(HT.FLGCOBCARNE,0)  = 0) AND ';
                       (* Cobranca em Folha da Patrocinadora *)
                       FazEnvio(False, False, sSqlFiltro,'0');
                  end;(* 0 *)
               1: begin
                       sSqlFiltro:= ' (NVL(HT.FLGCOBCARNE,0)  = 0) AND ';
                       (* Cobranca em Folha da Fundacao *)
                       FazEnvio(False, False, sSqlFiltro,'1');
                  end;(* 1 *)
               2: begin
                       sSqlFiltro    := ' (NVL(HT.FLGCOBCARNE,0)  = 1) AND';
                       (* Cobranca em Banco *)
                       FazEnvio(True, False, sSqlFiltro,'2');
                  end;(* 1 *)
               3: begin
                       sSqlFiltro := '  (NVL(HT.FLGCOBCARNE,0)  = 0) AND';
                       (* Cobranca em Folha de Beneficios *)
                       FazEnvio(False, False, sSqlFiltro,'3');
                  end;(* 3 *)
          end;(* Case *)
          FezPlanilha := False; //Bruno Bastos - Pend. 17090 - 08/10/2004
     end;(* For - CheckList das Patrocinadoras *)

     pnlProgresso.Visible := False;
     (* verifica se foi enviada alguma contribuição *)
     if bAlguma = False then
     begin
          MsgDlg('Não há contribuições a serem enviadas nos parâmetros correntes.','Informação', mtInformation, [mbOk], 0);
          bbtnVerResultado.Visible := False;
          dtmBaseDados.dbBaseDados.Rollback;
          (* Adaptacao para tirar o icone de SQL *)
          TiraQuery(qryAux);
          Exit;
     end;
     (* verifica se o usuário NÃO está cancelando a operação *)
     if not bcancelaenvio then
     begin
          (* Verifica se Envio foi total *)
          If (Trunc(dAcumuloValor)=Trunc(dTotalVlCobranca))And
             (iTotalAcumulo=iTotalCobranca)And
             (iTotalAcumulo>0)And(dAcumuloValor>0) And
             (iPlnCodigo>0)And(Not bErro)And
             (rgrpTipoCobranca.ItemIndex=2) then
          begin
               (* CONTAS A PAGAR COM O VALOR TOTAL DA COBRANCA *)
               (* Pega Parametros Contábeis do Fornecedor *)
               BuscaParametrosFornecedor;
               (* Faz contas a pagar com valor total para o fornecedor *)
               ContasAPagarTotal;
               (* ============================================ *)

               (* Atualiza TMPDESC com o Valor do iPlnCodigo *)
               (* Número da planilha resultante da contabilização *)
               If (iPlnCodigo > 0)And(Not bErro) then
               begin
                    qry.First;
                    While Not qry.Eof do
                    begin
                         qryAux.Close;
                         qryAux.SQL.Clear;
                         qryAux.SQL.Add(
                         'UPDATE TMPDESC SET PLNCODIGOPREV = '+IntToStr(iPlnCodigo)+
                         ' WHERE IDTITULAR = '+qry.FieldByName('IDTITULAR').AsString+' AND '+
                         ' IDDESCONTO = '+qry.FieldByName('IDCONTASS').AsString+' AND '+
                         ' MESCOBRANCA = '+QuotedStr(sMesCobranca)+' AND '+
                         ' IDMODULO = '+IntToStr(Sistema.IdModulo)+' AND '+
                         ' IDPROVENTO = '+qry.FieldByName('IDPROVENTO').AsString+' AND '+
                         ' FLGATRASODEVOL = '+QuotedStr(qry.FieldByName('FLGATRASODEVOL').AsString)+' AND '+
                         ' FLGTIPODESC = '+QuotedStr('A'));
                    try
                       qryAux.ExecSQL;
                    except
                          memResult.Lines.Add('Erro na atualização do código da planilha na TmpDesc.');
                          bErro:=True;
                          Exit;
                    end;
                        qry.Next;
                    end; {While}
               end else
                   bErro:=True;
          end else
              If rgrpTipoCobranca.ItemIndex=2 then
                 bErro:=True;

          (* traz o painel de resultado com o memo para frente *)
          pnlResult.BringToFront;
          (* leva o painel das patrocinadoras para traz *)
          pnlOpcoes.SendToBack;
          (* verifica se houve erro no processamento *)
          If not bErro then
          begin
               If MsgDlg('Envio de Contribuições efetuado com sucesso.'+#13+
                         'Deseja efetivar o envio?','Informação',
                         mtConfirmation, [mbyes,mbno], 0) = mrYes then
               (* Confirma todas as operações realizadas *)
                           dtmBaseDados.dbBaseDados.Commit
               else
                   dtmBaseDados.dbBaseDados.Rollback;

               bbtnVerResultado.Visible := False;
          end
          (* Houve erro *)
          else
          begin
          (* Desfaz todas as operações realizadas *)
             dtmBaseDados.dbBaseDados.Rollback;
             MsgDlg('Houve erro, envio não foi realizado!!!',
             'Confirmação', mtConfirmation, [mbOk], 0);
          end;(* bErro *)
     end
     (* Usuário cancelou o processamento *)
     else
     begin
          if dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.RollBack;
     end;(* if not bcancelaenvio *)
     (* Mostra Quantidade enviados por patrocinadora *)
end;

Procedure TfrmCobraContribuicao.AcumulaValores;
begin
     qryAcumulo.Close;
     qryAcumulo.Sql.Clear;
     qryAcumulo.Sql.Add(
     'SELECT /*+ INDEX (HSTCONTRIBASS XPKCONTRIB) */'+
     ' COUNT(*) AS TOTALREG, '+
     ' SUM(HT.VALORESPERADO) AS TOTALVALOR, '+
     ' HT.IDPESSJUR, '+
     ' HT.IDPLANOPREV, '+
     ' PA.IDPLANASS '+
     ' FROM '+
     ' ELEGPATRO     EP, '+
     ' PARTPREVPLAN  PP, '+
     ' CONTASS       CO, '+
     ' HSTCONTRIBASS HT, '+
     ' PROVDESC      PV, '+
     ' RUBRICAXPESS  RP, '+
     ' CONTRIBASS    CB, '+
     ' CONTRIBPLANPREVA CP, '+
     ' SITPART       ST, '+
     ' CONTRIBUICAO  CT, '+
     ' PLANASS       PA, '+
     ' PRODASS       PD, '+
     ' FUNDACAO      FD  '+
     ' WHERE '+
     ' (EP.IDPESSJUR    = ' + IntToStr(iPatro) + ') AND' +//Bruno Bastos - Pend. 17090 - 08/10/2004
     ' (PP.IDPESSJUR    = EP.IDPESSJUR) '+
     ' AND (PP.IDPESSOA     = EP.IDPESSOA) '+
     ' AND (PP.IDPLANOPREV  = PP.IDPLANOPREV) '+
     ' AND (CO.IDPLANASS    = CO.IDPLANASS) '+
     ' AND (CO.IDPLANOPREV  = PP.IDPLANOPREV) '+
     ' AND (CO.IDPESSJUR    = PP.IDPESSJUR) '+
     ' AND (CO.IDTITULAR    = PP.IDPESSOA) '+
     ' AND (HT.SEQPROPOSTA  = CO.SEQPROPOSTA) '+
     ' AND (HT.IDPLANASS    = CO.IDPLANASS) '+
     ' AND (HT.MESCOBRANCA = '+QuotedStr(sMesCobranca)+') '+
     ' AND (HT.IDPLANOPREV  = CO.IDPLANOPREV) '+
     ' AND (HT.IDPESSJUR    = CO.IDPESSJUR) '+
     ' AND (HT.IDCONTASS    = CO.IDCONTASS) '+
     ' AND (HT.IDTITULAR    = CO.IDTITULAR) '+
     ' AND (HT.IDDEPENDENTE = CO.IDDEPENDENTE) '+
     ' AND (HT.FLGCOBCARNE  = 1) '+
     ' AND (HT.SITRECEBIMENTO = 0) '+
     ' AND (HT.VALORESPERADO > 0) '+
     ' AND (HT.IDPESSJUR = CP.IDPESSJUR) '+
     ' AND (HT.IDPLANOPREV = CP.IDPLANOPREV) '+
     ' AND (HT.IDPLANASS = CP.IDPLANASS) '+
     ' AND (HT.IDCONTASS = CP.IDCONTASS) '+
     ' AND (CB.IDPLANASS    = HT.IDPLANASS) '+
     ' AND (CB.IDCONTASS    = HT.IDCONTASS) '+
     ' AND (CB.PAGADOR = '+QuotedStr(sTipoPagador)+') '+
     ' AND (PV.IDPROVENTO   = CB.IDPROVENTO) '+
     (* NÄO SOMA RUBRICA DE DEVOLUÇÃO *)
     ' AND (PV.FLGATRASODEVOL <> ''D'') '+
     (* ============================= *)
     ' AND (RP.IDRUBRICA    = CB.IDPROVENTO(+)) '+
     ' AND (RP.IDPESSOA     = HT.IDPESSJUR) '+
     ' AND (ST.IDSITPART    = PP.IDSITPART) '+
     ' AND (CT.IDCONTRIBUICAO    = CB.IDCONTASS) '+
     ' AND (PA.IDPLANASS    = HT.IDPLANASS) '+
     ' AND (PA.IDPRODASS    = '+sIdProduto+') '+
     ' AND (PA.IDPRODASS    = PD.IDPRODASS) '+
     ' AND (FD.IDPESSOA = FD.IDPESSOA) '+

     ' GROUP BY HT.IDPESSJUR, HT.IDPLANOPREV, PA.IDPLANASS '+

     ' ORDER BY HT.IDPESSJUR, HT.IDPLANOPREV, PA.IDPLANASS ');
     qryAcumulo.Open;
end; {Acumula Valores}

procedure TfrmCobraContribuicao.FazEnvio(ISBanco : Boolean;
           EnviaPatro : Boolean; Filtro: String; pTipoCobranca: Char);
var sSql : String;
begin
     iTotalFBenef:=0;
     iTotalFPag:=0;
     iTotalCBanco:=0;

     If EnviaPatro then
     begin
          sTipoPagador:='P';
          memResult.Lines.Add('Parte paga pela Patrocinadora');
     end else sTipoPagador:='C';

     (* esta qry seleciona os participantes que vão participar do envio *)
     sSql := ' SELECT /*+ INDEX (HSTCONTRIBASS XPKCONTRIB) */'+
            (* HT HSTCONTRIBASS *)
            '  HT.VALORESPERADO VALOR,' +
            '  HT.IDCONTASS,'           +
            '  HT.IDPESSJUR,'           +
            '  HT.IDPLANOPREV,'         +
            '  HT.IDTITULAR,'           +
            '  EP.IDPESSOA,'            + //CPrev - 26637
            '  HT.IDDEPENDENTE,'        +
            '  HT.IDPLANASS,'           +
            '  HT.IDPAGADOR,'           +
            '  HT.IDMOTIVO,'            +
            '  HT.MES,'                 +
            '  HT.MESCOBRANCA,'         +
            '  HT.NUMRECEBIMENTO,'      +
            '  HT.DATAPREVISAO,'        +
            '  HT.SEQPROPOSTA,'         +
            '  HT.FLGCOBCARNE,'         +
            '  HT.CODPORTFORMA,'        +
            (* EP ELEGPATRO *)
            '  EP.MATRICULA,'           +
            (* PP PARTPREVPLAN *)
            '  PP.INSCRICAONUMERO,'     +
            (* PA PLANASS *)
            '  PA.IDFORNSERV,'          +
            (* PD PRODASS *)
            '  PD.NOME NOMEPRODASS,'    +
            (* CT CONTRIBUICAO *)
            '  CT.NOME NOMECONTRIB,'    +
            (* ST SITPART *)
            '  ST.FLGINTERNO,'          +
            (* CP CONTRIBPLANPREVA *)
            '  CP.RECPAGDEVOL       AS CP_RECPAGDEVOL,'+
            '  CP.CODPORTFORMA      AS CP_CODPORTFORMA,'+
            '  CP.CODCENTROCUSTOD   AS CP_CODCENTROCUSTOD,'+
            '  CP.CODALTERADORJUROS AS CP_CODALTERADORJUROS,'+
            '  CP.CODTIPDESEMBCAR   AS CP_CODTIPDESEMBCAR,'+
            '  CP.IDEMPRESAPROP     AS CP_IDEMPRESAPROP,'+
            '  CP.IDEMPRESA         AS CP_IDEMPRESA,'+
            '  CP.CODTIPDESEMBDEVOL AS CP_CODTIPDESEMBDEVOL,'+
            '  CP.CODCENTROCUSTOC   AS CP_CODCENTROCUSTOC,'+
            '  CP.RECPAG            AS CP_RECPAG,'+
            '  CP.CODTIPRECDES      AS CP_CODTIPRECDES,'+
            '  CP.PLACONTAD         AS CP_PLACONTAD,'+
            '  CP.PLACONTADAUTPATR  AS CP_PLACONTADAUTPATR,'+
            '  CP.PLANO             AS CP_PLANO,'+
            '  CP.PLACONTAC         AS CP_PLACONTAC,'+
            '  CP.UNIDNEGOC         AS CP_UNIDNEGOC,'+
            '  CP.CODSUBCONTA       AS CP_CODSUBCONTA,'+
            '  CP.CODCENTRORESPON   AS CP_CODCENTRORESPON,'+
            '  CP.TIPCODIGO         AS CP_TIPCODIGO,'+
            '  CP.CODALTERADORCORR  AS CP_CPALTERADORCORR,'+
            '  CP.CODCCUSTOCDEVBAN  AS CP_CODCCUSTOCDEVBAN,'+
            '  CP.CODCCUSTOCDEVPAT  AS CP_CODCCUSTOCDEVPAT,'+
            '  CP.PLACONTACDEVPAT   AS CP_PLACONTACDEVPAT,'+
            '  CP.PLACONTACDEVBANCO AS CP_PLACONTACDEVBANCO,'+
            (* CB CONTRIBASS *)
            '  CB.IDPROVENTO,'          +
            '  CB.IDPROVENTOATRASO,'    +
            '  CB.IDPROVENTODEVOL,'     +
            '  CB.PRIORIDADE,'          +
            '  CB.CODCENTROCUSTOD,'     +
            '  CB.CODCENTROCUSTOC,'     +
            '  CB.PLACONTAD,'           +
            '  CB.PLACONTADAUTPATR,'    +
            '  CB.PLACONTAC,'           +
            '  CB.UNIDNEGOC,'           +
            '  CB.CODSUBCONTA,'         +
            '  CB.CODCENTRORESPON,'     +
            '  CB.CODTIPDESEMBDEVOL,'   +
            '  CB.CODTIPRECDES,'        +
            '  CB.PLACONTACDEVBANCO,'   +
            '  CB.PLACONTACDEVPAT,'     +
            (* RP RUBRICAXPESS *)
            '  RP.CODPROVDESC,'         +
            (* PV HSTCONTRIBASS *)
            '  HT.IDTIPO AS FLGATRASODEVOL,'+
            (* PD PRODUTO *)
            '  PD.NOME AS NOMEPRODASS,';

     // Gleyber - 13/06/2006 - Pendência 21743 - Início
     If pTipoCobranca = '2'
      Then sSql := sSql + '  DECODE(PA.CODPORTFORMA, '''', NVL(CB.CODPORTFORMA, CP.CODPORTFORMA), PA.CODPORTFORMA) AS CODPORTFORMA '
      Else sSql := sSql + '  NVL(CB.CODPORTFORMA, CP.CODPORTFORMA) AS CODPORTFORMA ' ; // Gleyber - 23/01/2005 - Pendência 19224
     sSql := sSQL +
     // Gleyber - 13/06/2006 - Pendência 21743 - Fim
            ' FROM'                     +
            '  ELEGPATRO     EP,'       +
            '  PARTPREVPLAN  PP,'       +
            '  CONTASS       CO,'       +
            '  HSTCONTRIBASS HT,'       +
            '  PROVDESC      PV,'       +
            '  RUBRICAXPESS  RP,'       +
            '  CONTRIBASS    CB,'       +
            '  CONTRIBPLANPREVA CP,'    +
            '  SITPART       ST,'       +
            '  CONTRIBUICAO  CT,'       +
            '  PLANASS       PA,'       +
            '  PRODASS       PD,'       +
            '  FUNDACAO      FD '       +
            ' WHERE '                   +
            (* Filtro para pegar somente uma patrocinadora por vez *)
            '  (EP.IDPESSJUR    = ' + IntToStr(iPatro) + ') AND' +
            (*  JOIN PARTPREVPLAN COM ELEGPATRO *)
//P.RAMOS-05.11.2004-PEND.18058
            '  (CO.IDPESSJUR = EP.IDPESSJUR)      AND' +
            '  (CO.IDTITULAR = EP.IDPESSOA)       AND' +
//P.RAMOS-05.11.2004-PEND.18058-ATÉ AQUI
            '  (PP.IDPESSJUR    = EP.IDPESSJUR)      AND' +
            '  (PP.IDPESSOA     = EP.IDPESSOA)       AND' +
            '  (PP.IDPLANOPREV  = PP.IDPLANOPREV)    AND' +
            (*  JOIN CONTASS COM PARTPREVPLAN *)
            '  (CO.IDPLANASS    = CO.IDPLANASS)      AND' +
            '  (CO.IDPLANOPREV  = PP.IDPLANOPREV)    AND' +
            '  (CO.IDPESSJUR    = PP.IDPESSJUR)      AND' +
            '  (CO.IDTITULAR    = PP.IDPESSOA)       AND' +
            (*  JOIN HSTCONTRIBASS COM CONTASS *)
            (* Filtro do mês de cobrança *)
            '  (HT.SEQPROPOSTA  = CO.SEQPROPOSTA)    AND' +
            '  (HT.IDPLANASS    = CO.IDPLANASS)      AND' +
            '  (HT.MESCOBRANCA = ' + chr(39) + sMesCobranca + chr(39) + ') AND' +
            '  (HT.IDPLANOPREV  = CO.IDPLANOPREV)    AND' +
            '  (HT.IDPESSJUR    = CO.IDPESSJUR)      AND' +
            '  (HT.IDCONTASS    = CO.IDCONTASS)      AND' +
            '  (HT.IDTITULAR    = CO.IDTITULAR)      AND' +
            '  (HT.IDDEPENDENTE = CO.IDDEPENDENTE)   AND';
     sSql := sSql + Filtro;
     sSql := sSql +
            (*  Filtro para pegar somente as contribuições não enviadas *)
            '  (HT.SITRECEBIMENTO = 0)               AND' +

            (* Filtro para pergar somente as contribuições com valores positivos *)
            '  (HT.VALORESPERADO > 0)                AND' +
            (* JOIN HSTCONTRIBASS COM CONTRIBPLANPREVA *)
            '  (HT.IDPESSJUR = CP.IDPESSJUR) AND '+
            '  (HT.IDPLANOPREV = CP.IDPLANOPREV) AND '+
            '  (HT.IDPLANASS = CP.IDPLANASS) AND '+
            '  (HT.IDCONTASS = CP.IDCONTASS) AND '+
            (* JOIN CONTRIBASS COM HSTCONTRIBASS *)
            '  (CB.IDPLANASS    = HT.IDPLANASS)      AND'+
            '  (CB.IDCONTASS    = HT.IDCONTASS)      AND'+
            (* Filtro para pegar somente as contribuições da Patrocinadora *)
            (* ou Participante *)
            '  (CB.PAGADOR = '+QuotedStr(sTipoPagador)+ ') AND'+
            (* JOIN PROVDESC COM CONTRIBASS *)
            '  (PV.IDPROVENTO   = CB.IDPROVENTO)     AND' +
            (* JOIN RUBRICAXPESS COM CONTRIBASS/HSTCONTRIBASS
               IMPORTANTE: só pode usar outer join porque rubrica é opcional no envio para banco
                  e porque há a crítica no cálculo!! *)
            '  (RP.IDRUBRICA    = CB.IDPROVENTO(+))  AND' +
            '  (RP.IDPESSOA     = HT.IDPESSJUR)      AND' +
            (* JOIN SITPART COM PARTPREVPLAN *)
            '  (ST.IDSITPART    = PP.IDSITPART)      AND';

     Case pTipoCobranca Of
          (* Cobrança em Folha de Pagamento da Patrocinadora *)
          '0' : sSql:=sSql+' (ST.FLGINTERNO = ''AT'') AND (HT.IDPESSJUR <> FD.IDPESSOA) AND ';
          (* Cobrança em Folha de Pagamento da Fundação *)
          '1' : sSql:=sSql+' (ST.FLGINTERNO = ''AT'') AND (HT.IDPESSJUR = FD.IDPESSOA) AND ';
          (* Cobranca em Folha de Benefícios *)
          '3' : sSql:=sSql+' (ST.FLGINTERNO = ''AS'') AND ';
     end; {Case}

     sSql := sSql +
            (* JOIN CONTRIBUICAO COM CONTASS *)
            '  (CT.IDCONTRIBUICAO    = CB.IDCONTASS) AND' +
            (* JOIN PLANASS COM HSTCONTRIBASS*)
            '  (PA.IDPLANASS    = HT.IDPLANASS) AND '+
            '  (PA.IDPRODASS    = '+sIdProduto+') AND '+
            '  (PA.IDPRODASS    = PD.IDPRODASS) AND '+
            '  (FD.IDPESSOA = FD.IDPESSOA) ';

     sSql := sSql + ' ORDER BY HT.IDPLANASS, HT.IDCONTASS, HT.MES, CB.IDPROVENTO, '+
                    ' HT.IDPAGADOR, HT.IDTITULAR';
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(sSql);
     qry.Open;

     (* verifica se o usuário cancelou a operação *)
     if bCancelaEnvio then
        Exit;
     (* Verifica se existem contribuições a serem enviadas para determinada patrocinadora *)
     if qry.IsEmpty then
     begin
        If IsBanco then
           memResult.Lines.Add('Não há contribuições a serem enviadas para cobrança em Banco.')
        else memResult.Lines.Add('Não há contribuições a serem enviadas para cobrança em Folha.');
             memResult.Lines.Add('');
        Exit;
     end;(* if qry IsEmpty *)
     pnlProgresso.Update;
     Application.ProcessMessages;

     (* chegando neste ponto a query retornou com registros que serão enviados para a patrocinadora*)
     bAlguma := True; (* Flag Indica que existem contribuições a serem  enviadas *)

     if EnviaPatro then
        lblPainel.Caption := 'Processando: ' + sPatro + ' parte Patrocinadora ...';
     pnlProgresso.Update;
     Application.ProcessMessages;

     If Trim(qry.FieldByName('DATAPREVISAO').AsString) <> '' then
        sDataVencimento  := qry.FieldByName('DATAPREVISAO').AsString
     else
         sDataVencimento := DateToStr(Date);

     (* verifica se a cobrança é em banco ou em folha *)
     If ISBanco then
     begin
          (* Acumula Valores da Cobrança *)
          AcumulaValores;
          (* =========================== *)

          (* Informações necessárias na criação da planilha *)
          vIDFORNECEDOR:=qry.FieldByName('IDFORNSERV').AsInteger;
          vNOMEPRODASS:=qry.FieldByName('NOMEPRODASS').AsString;

          (* ============================================== *)

          (* Pega Parametros Contábeis do Fornecedor *)
          BuscaParametrosFornecedor;

          (* SE INTEGRADO A CONTABILIDADE INCLUI PLANILHA *)
          If (IntegraBack.Contabilidade = 'S')And(pTipoCobranca='2') then
          (* Cria Planilha Contábil *)
             FazLancamentoContabil
          else
              iPlnCodigo:= -1;
          (* ====================== *)

          BancoFazCobranca;
     end else
          FolhaFazCobranca;

     memResult.Lines.Add(' ');
     Case pTipoCobranca Of
          (* Cobrança em Folha de Pagamento da Patrocinadora *)
          '0' : memResult.Lines.Add(' Folha de Pagamento da Patrocinadora: '+
                IntToStr(iTotalFPag)+'  -  '+FormatFloat('###,###,##0.00',dTotalContribuicaoPatro));
          (* Cobrança em Folha de Pagamento da Fundação *)
          '1' : memResult.Lines.Add(' Folha de Pagamento da Fundação: '+
                IntToStr(iTotalFPag)+'  -  '+FormatFloat('###,###,##0.00',dTotalContribuicaoPatro));
          (* Cobrança em Banco *)
          '2' : memResult.Lines.Add(' Cobrança em Banco: '+
              IntToStr(iTotalCBanco)+'  -  '+FormatFloat('###,###,##0.00',dTotalContribuicaoBanco));
          (* Cobrança em Folha de Benefícios *)
          '3' : memResult.Lines.Add(' Folha de Benefícios: '+
              IntToStr(iTotalFBenef)+'  -  '+FormatFloat('###,###,##0.00',dTotalContribuicaoPatro));
     end; {Case}
     memResult.Lines.Add(' ');
end;

(* =============================================================================
    COBRANÇA EM FOLHA
   ============================================================================= *)
procedure TfrmCobraContribuicao.FolhaFazCobranca;
var iUltPagador, iUltContass, iUltPlanass, iUltTitular, iContador: Integer;
    sSql, sFolha, sTotal, sIdProvento, sTipoProvento: String;

    {Sub}
    procedure PreparaSqlPatro;
    var sFlgDesconto : string;
    begin
         //início tavares 09/05/2003
         sflgDesconto := '';
         if (qry.FieldByName('FLGATRASODEVOL').AsString = 'D') then
            sflgDesconto := '0'
         else
             sflgDesconto := '1';
         //Fim tavares 09/05/2003

         // SE FLGINTERNO = AT - ENVIO PARA PATROCINADORA //
         sSql := ' INSERT INTO TMPDESC' +
                 ' (VALOR, IDPESSOA, IDTITULAR, MATRICULA, IDPROVENTO, IDPLANOPREV, CODPROVDESC,'    +
                 ' ORDEM, IDMOTIVO, IDPESSJUR, PLACONTAC, IDDESCONTO, FLGTIPODESC, NODOCUMENTO,'    +
                 ' PLANO, SITENVIO, IDPLANASS, PLACONTAD, IDFUNDACAO, FLGDESCONTO, MESCOBRANCA,'    +
                 ' INSCRICAONUMERO, IDLOTE, DESCRICAO, REFERENCIA, FLGDESCFOLHA, MESREFERENCIA,' +
                 ' NUMDEPENDSEGURO, DATAREFERENCIA, DATACOBRANCA, SISTORIGEM, NUMPRIORIDADE,' +
                 ' COMPLDOCUMENTO, IDMODULO, CODTIPRECDES, RECPAG, IDEMPRESAPROP, CODPORTFORMA,' +
                 ' VALORBASE1, VALORBASE2, VALORBASE3, FLGFORNPAG, FLGFORNCOMISS,' +
                 ' PERIODO, EXERCICIO, FLGATRASODEVOL, IDEMPCOBRANCA, SEQPROPOSTA, FLGEXISTEHST,'+
                 ' IDTMPDESC, '+  // P. 16777
                 ' FONTEPAGADORA)'+
                 ' VALUES (' +
                   OraNumero(FloatToStr(dValor))                                + ', ' + (* VALOR       *)
                   qry.fieldbyname('IDPESSOA').AsString                        + ', ' + (* IDPESSOA    *) //CPrev - 26637
                   qry.fieldbyname('IDTITULAR').AsString                        + ', ' + (* IDTITULAR   *) //CPrev - 26637
                   chr(39) + qry.FieldByName('MATRICULA').AsString + chr(39)               + ', ' + (* MATRICULA   *)
                   (* Provento Normal, Atraso ou Devolução *)
                   sIdProvento                                                  + ', ' + (* IDPROVENTO  *)
                   qry.fieldbyname('IDPLANOPREV').AsString                      + ', ' + (* IDPLANOPREV *)
                   chr(39) + qry.FieldByName('CODPROVDESC').AsString + chr(39)             + ', ' + (* CODPROVDESC *)
                   qry.FieldByName('NUMRECEBIMENTO').AsString                   +  ', ' + (* ORDEM      *)
                   qry.Fieldbyname('IDMOTIVO').AsString                         + ', ' + (* IDMOTIVO    *)
                   qry.Fieldbyname('IDPESSJUR').AsString                        + ', ' + (* IDPESSJUR   *)
                   chr(39) + vPLACONTAC + chr(39)                                          + ', ' + (* PLACONTAC   *)
                   qry.FieldByName('IDCONTASS').AsString                        + ', ' + (* IDDESCONTO  *)
                   chr(39) + 'A' + chr(39)                                                + ', ' + (* FLGTIPODESC *)
                   IntToStr(Sistema.IdModulo) +
                   qry.FieldByName('NUMRECEBIMENTO').AsString                   + ', ' + (* NODOCUMENTO *)
                   IntToStr(IntegraBack.Plano)                                  + ', ' + (* PLANO       *)
                   chr(39) + '0' + chr(39)                                                + ', ' + (* SITENVIO    *)
                   qry.FieldByName('IDPLANASS').AsString                        + ', ' + (* IDPLANASS   *)
                   chr(39) + vPLACONTAD + chr(39)                                         + ', ' + (* PLACONTAD   *)
    {             IntToStr(iIdFundacao)                                        + ', ' + (* IDFUNDACAO  *)}
    { andré tavares 07/07/2003 - resolução da pendência 14456}
                   IntToStr(sistema.IdEmpresa)                                  + ', ' + (* IDFUNDACAO  *)
                   sFlgDesconto                                                 + ', ' + (* FLGDESCONTO *)
                   chr(39) + qry.FieldByName('MESCOBRANCA').AsString + chr(39)  + ', ' + (* MESCOBRANCA     *)
                   qry.FieldByName('INSCRICAONUMERO').AsString                  + ', ' + (* INSCRICAONUMERO *)
                   IntToStr(idLote)                                             + ', ' + (* IDLOTE          *)
                   chr(39) + qry.FieldByName('NOMECONTRIB').AsString + chr(39)            + ', ' + (* DESCRICAO       *)
                   chr(39) + '***' + chr(39)                                              + ', ';  (* REFERENCIA      *)

         sFolha := 'P'; (* Folha da Patrocinadora ou Fundação *)

         sSql := sSql +
              chr(39) + sFolha + chr(39)                                           + ', ' + (* FLGDESCFOLHA    *)
              chr(39) + qry.FieldByName('MES').AsString + chr(39)                  + ', ' + (* MESREFERENCIA   *)
              chr(39) + '' + chr(39)                                               + ', ';  (* NUMDEPENDSEGURO *)
         if Trim(sDataVencimento) <> '' then
         begin
              sSql := sSql +
              'TO_DATE('+chr(39)+ sDataVencimento +chr(39)+','+chr(39)+'DD/MM/YYYY'+chr(39)+'), ' + (* DATAREFERENCIA *)
              'TO_DATE('+chr(39)+ sDataVencimento +chr(39)+','+chr(39)+'DD/MM/YYYY'+chr(39)+'), ';  (* DATACOBRANCA   *)
         end
         else                            
         begin
              sSql := sSql + 'NULL' + ', ' +  (* DATAREFERENCIA *)
                             'NULL' + ', ';   (* DATACOBRANCA   *)
         end;(* if Trim sDataVencimento *)
         sSql := sSql +
         chr(39)+ IntToStr(Sistema.IdModulo) + chr(39)                         + ', ' + (* SISTORIGEM    *)
                  qry.FieldByName('PRIORIDADE').AsString                      + ', ' + (* NUMPRIORIDADE *)
         chr(39)+ Copy(qry.FieldByName('MES').AsString,6,2) +chr(39)           + ', ' + (* COMPLDOCUMENTO*)
         chr(39)+IntToStr(Sistema.IdModulo)+chr(39)                            + ', ' + (* IMODULO       *)
         chr(39)+vCODTIPRECDES+chr(39)                                         + ', ' + (* CODTIPRECDES  *)
         chr(39)+'R'+chr(39)                                                   + ', ' + (* RECPAG        *)
         qry.Fieldbyname('IDPESSJUR').AsString                                 + ', ' + (* IDEMPRESAPROP *)
         chr(39)+''+chr(39)+', ' + (* CODPORTFORMA *)
         '0, '+'0, '+'0, '       + (* VALORBASE1, VALORBASE2, VALORBASE3 *)
         '0, '+'0, '+'-1, '      + (* FLGFORNPAG, FLGFORNCOMISS, PERIODO *)
         '-1, '                  + (* EXERCICIO *)
    //   chr(39)+'N'+chr(39)     + (* FLGATRASODEVOL *)
         chr(39)+sTipoProvento+chr(39)+ (* FLGATRASODEVOL *)
         ', '+qry.Fieldbyname('IDPESSJUR').AsString                            + ', ' + (* IDEMPCOBRANCA *)
         '1, '+'1, '+Inttostr(LeUltRegistro(nil,'TMPDESC'))+','+'1)';    (* SEQPROPOSTA, FLGEXISTHST, FONTEPAGADORA *)
    end; {PreparaSqlPatro}

    {Sub}
    Procedure PreparaSqlFolha;
    var sFlgDesconto : string;
    begin
    //início tavares 09/05/2003
         sflgDesconto := '';
         if (qry.FieldByName('FLGATRASODEVOL').AsString = 'D') then
            sflgDesconto := '0'
         else
             sflgDesconto := '1';
    //fim tavares 09/05/2003

         sSql := ' INSERT INTO TMPDESC(' +
                    '  VALOR, IDPESSOA, IDTITULAR,      MATRICULA,    IDPROVENTO, IDPLANOPREV,  CODPROVDESC,'   +
                    '         IDMOTIVO, IDPESSJUR,      PLACONTAC,    IDDESCONTO, FLGTIPODESC,  NODOCUMENTO,'   +
                    '  PLANO, SITENVIO, IDPLANASS,      PLACONTAD,    IDFUNDACAO, FLGDESCONTO,  MESCOBRANCA,'   +
                    '  INSCRICAONUMERO, IDLOTE,         DESCRICAO,    REFERENCIA, FLGDESCFOLHA, MESREFERENCIA,' +
                    '  NUMDEPENDSEGURO, DATAREFERENCIA, DATACOBRANCA, SISTORIGEM, IDMODULO, CODTIPRECDES,   NUMPRIORIDADE,' +
                    '  ORDEM,  RECPAG, IDTMPDESC ,COMPLDOCUMENTO,' +    // P. 16777
                    '  CODPORTFORMA, CODCENTRORESPON) '+ // Gleyber - 23/01/2005 - Pendência 19224
                  ' VALUES (' +
                              OraNumero(FloatToStr(dValor))                     + ', ' + (* VALOR           *)
                              qry.fieldbyname('IDPAGADOR').AsString             + ', ' + (* IDPESSOA        *)
                              qry.fieldbyname('IDTITULAR').AsString             + ', ' + (* IDTITULAR       *)
                    chr(39) + qry.FieldByName('MATRICULA').AsString + chr(39)   + ', ' + (* MATRICULA       *)
                              sIdProvento (* Normal, Atraso ou Devolução *)     + ', ' + (* IDPROVENTO      *)
                              qry.fieldbyname('IDPLANOPREV').AsString           + ', ' + (* IDPLANOPREV     *)
                    chr(39) + qry.FieldByName('CODPROVDESC').AsString + chr(39) + ', ' + (* CODPROVDESC     *)
                              qry.Fieldbyname('IDMOTIVO').AsString              + ', ' + (* IDMOTIVO        *)
                              qry.Fieldbyname('IDPESSJUR').AsString             + ', ' + (* IDPESSJUR       *)
                    chr(39) + vPLACONTAC + chr(39)                              + ', ' + (* PLACONTAC       *)
                              qry.FieldByName('IDCONTASS').AsString             + ', ' + (* IDDESCONTO      *)
                    chr(39) + 'A' + chr(39)                                     + ', ' + (* FLGTIPODESC     *)
                              qry.FieldByName('NUMRECEBIMENTO').AsString        + ', ' + (* NODOCUMENTO     *)
                              IntToStr(IntegraBack.Plano)                       + ', ' + (* PLANO           *)
                    chr(39) + '0' + chr(39)                                     + ', ' + (* SITENVIO        *)
                              qry.FieldByName('IDPLANASS').AsString             + ', ' + (* IDPLANASS       *)
                    chr(39) + vPLACONTAD + chr(39)                              + ', ' + (* PLACONTAD       *)
        {                      IntToStr(iIdFundacao)                             + ', ' + (* IDFUNDACAO      *)}
        { andré tavares 07/07/2003 - resolução da pendência 14456 }
                              IntToStr(sistema.IdEmpresa)                       + ', ' + (* IDFUNDACAO      *)
                              sFlgDesconto                                      + ', ' + (* FLGDESCONTO     *)
                    chr(39) + qry.FieldByName('MESCOBRANCA').AsString + chr(39) + ', ' + (* MESCOBRANCA     *)
                              qry.FieldByName('INSCRICAONUMERO').AsString       + ', ' + (* INSCRICAONUMERO *)
                              IntToStr(idLote)                                  + ', ' + (* IDLOTE          *)
                    chr(39) + 'ASS - ' +
                              qry.FieldByName('NOMECONTRIB').AsString + chr(39) + ', ' + (* DESCRICAO       *)
                    chr(39) + '***' + chr(39)                                   + ', ';  (* REFERENCIA      *)
              (* verifica se o participante é Ativo ou não para saber se ele vai ser pago
                 pela Folha de pagamento(P) ou Folha de Benefício(B) *)
         if qry.FieldByName('FLGINTERNO').AsString = 'AT' then
            sFolha := 'P'
         else
             sFolha := 'B';
         sSql := sSql +
                  chr(39) + sFolha + chr(39)                                  + ', ' + (* FLGDESCFOLHA    *)
                  chr(39) + qry.FieldByName('MESCOBRANCA').AsString + chr(39) + ', ' + (* MESREFERENCIA   *)
                  chr(39) + '0' + chr(39)                                     + ', ';  (* NUMDEPENDSEGURO *)
         (* Preenchimento da Data previsão de recebimento *)
         if Trim(qry.FieldByName('DATAPREVISAO').AsString) <> '' then
            sDataVencimento    := qry.FieldByName('DATAPREVISAO').AsString
         else
             sDataVencimento := DateToStr(Date);
         sSql := sSql +
         'TO_DATE('+chr(39) + sDataVencimento +chr(39)+','+chr(39)+'DD/MM/YYYY'+chr(39) + '), ' + (* DATAREFERENCIA *)
         'TO_DATE('+chr(39) + sDataVencimento +chr(39)+','+chr(39)+'DD/MM/YYYY'+chr(39) + '), ' + (* DATACOBRANCA   *)
                    chr(39) + IntToStr(Sistema.IdModulo) + chr(39)            + ', ' + (* SISTORIGEM     *)
                    chr(39) + IntToStr(Sistema.IdModulo) + chr(39)            + ', ' + (* IDMODULO       *)
                    chr(39)+vCODTIPRECDES+chr(39)                             + ', ' + (* CODTIPRECDES    *)
                            qry.FieldByName('PRIORIDADE').AsString            + ', ' + (* NUMPRIORIDADE  *)
                           qry.FieldByName('NUMRECEBIMENTO').AsString         + ', ' + (* ORDEM          *)
                 chr(39) +'P'+chr(39)                                         + ', ' + (* RECPAG         *)
                 chr(39) + Inttostr(LeUltRegistro(nil,'TMPDESC')) + chr(39)   + ', ' +  // p. 16777
                 chr(39) + Copy(qry.FieldByName('MES').AsString,6,2) +chr(39) + ', ' +  (* COMPLDOCUMENTO *)
                 vCODPORTFORMA                                                + ', ' +  (* CODPORTFORMA *)     // Gleyber - 23/01/2005 - Pendência 19224
                 QuotedStr(vCODCENTRORESPON)                                  + ') ';   (* CODCENTRORESPON *)  // Gleyber - 23/01/2005 - Pendência 19224
    end; {PreparaSqlFolha}

(* ROTINA PRINCIPAL - FolhaFazCobranca *)
begin
     (* variável que guarda o valor da contribuição de um participante *)
     dValor     :=0;
     iContador  :=0;

     (* GeraLote - Inclui Identifição do Lote na CrtlInterface - Sidnei *)
     If Not qry.IsEmpty then
     begin
     IdLote:=GeraLOTE(qry.FieldByName('idPessJur').AsInteger, True, qry.FieldByName('MES').AsString, 'A',
                    'CONTRIBUICOES ASSISTENCIAIS '+qry.FieldByName('NOMEPRODASS').AsString+' - '+
                    qry.FieldByName('MES').AsString, 'N', '1',
                    '1', '0', '0', '0', '', DateToStr(date), '', DateToStr(date), '',
                    0,0);
     end;
     (* GeraLote *)

     sTotal := ' / ' + IntToStr(qry.RecordCount);
     iUltPagador := qry.FieldByName('IDPAGADOR').AsInteger;
     iUltContass := qry.FieldByName('IDCONTASS').AsInteger;
     iUltPlanass := qry.FieldByName('IDPLANASS').AsInteger;
     iUltTitular := qry.FieldByName('IDTITULAR').AsInteger;
     (* Laço que faz todo a cobrança em Folha *)

     while not qry.EOF do
     begin
          (* Laço que soma contribuições de um participante *)
          dValor:= 0;
          while (iUltPagador = qry.FieldByName('IDPAGADOR').AsInteger) and
                (iUltContass = qry.FieldByName('IDCONTASS').AsInteger) and
                (iUltPlanass = qry.FieldByName('IDPLANASS').AsInteger) and
                (iUltTitular = qry.FieldByName('IDTITULAR').AsInteger) and
                (not qry.EOF) do
          begin
               (* variável que guarda o valor da contribuição de um participante *)
               dValor := dValor + qry.FieldByName('VALOR').AsFloat;
               (* Faz o update na tabela HSTCONTRIBASS
               parâmetro - False - Cobrança em Folha
               - True  - Cobrança em Banco *)
               FazUpdateHSTContribass(False);
               (* Prepara o Sql para inserção na TMPDESC mas,
                só vai inserir quando acabarem as contribuições do participante *)

               sIdProvento:='';
               sTipoProvento:= Trim(qry.FieldByName('FLGATRASODEVOL').AsString);

               If sTipoProvento = 'N' then
                  sIdProvento:=Trim(qry.FieldByName('IDPROVENTO').AsString)
               else
                   If sTipoProvento = 'A' then
                      sIdProvento:=Trim(qry.FieldByName('IDPROVENTOATRASO').AsString)
                   else
                       If sTipoProvento = 'D' then
                          sIdProvento:=Trim(qry.FieldByName('IDPROVENTODEVOL').AsString);

               vMATRICULA:= qry.FieldByName('MATRICULA').AsString;

               (* Pega informações em CONTRIBPLANPREVA OU CONTRIBASS *)
               vPLACONTAC   := BuscaInformacao('',qry.FieldByName('CP_PLACONTAC').AsString,qry.FieldByName('PLACONTAC').AsString);

               (* PARA FOLHA NÃO ESTÁ USANDO PLACONTAD *)
               vPLACONTAD:='';
               (* ==================================== *)

               vCODTIPRECDES:=BuscaInformacao('',qry.FieldByName('CP_CODTIPRECDES').AsString,
                             qry.FieldByName('CODTIPRECDES').AsString);
               (* ================================================== *)

               // Gleyber - 23/01/2005 - Pendência 19224 - Início
               If Trim(qry.fieldbyname('CODPORTFORMA').AsString) = ''
                Then vCODPORTFORMA := ' '''' '
                Else vCODPORTFORMA := qry.fieldbyname('CODPORTFORMA').AsString;
               vCODCENTRORESPON  :=BuscaInformacao('',qry.FieldByName('CP_CODCENTRORESPON').AsString,
                                   qry.FieldByName('CODCENTRORESPON').AsString);
               // Gleyber - 23/01/2005 - Pendência 19224 - Fim


               If (rgrpTipoCobranca.ItemIndex = 3) And  // Gleyber - 23/01/2005 - Pendência 19224
                  (qry.FieldByName('FLGINTERNO').AsString <> 'AT') then
               begin
                   PreparaSqlFolha;
                   Inc(iTotalFBenef,1);
               end
               else
               begin
                    PreparaSqlPatro;
                   Inc(iTotalFPag,1);
               end;

               qry.Next; (* vai para o próximo registro *)

               iContador := iContador + 1;
               lContador.Caption := IntToStr(iContador) + sTotal;
               pnlProgresso.Update;
               Application.ProcessMessages;
          end;(* while que soma contribuições de um participante para um mês *)

          iUltPagador := qry.FieldByName('IDPAGADOR').AsInteger;
          iUltContass := qry.FieldByName('IDCONTASS').AsInteger;
          iUltPlanass := qry.FieldByName('IDPLANASS').AsInteger;
          iUltTitular := qry.FieldByName('IDTITULAR').AsInteger;

          pnlProgresso.Update;
          Application.ProcessMessages;
          (* verifica se o usuário cancelou a operação *)
          if bCancelaenvio then Exit;

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSql);
          (* Inserindo na TMPDESC *)
          try
              qryAux.ExecSql;
              Inc(iContInsTMPDESC); (* Total de Registros inseridos na TMPDESC *)
              (* Acumula os valores da patrocinadora *)
              dTotalContribuicaoPatro := dTotalContribuicaoPatro + dValor;
          except
              on E:exception do
              begin
                   GravaErros('Erro na gravação da TMPDESC: '+E.message,'0');
                   berro := True;
              end;(* on *)
          end;(* try..except *)
          pnlProgresso.Update;
          Application.ProcessMessages;
          frmCobraContribuicao.Update;
          (* verifica se o usuário cancelou a operação *)
          if bCancelaenvio then Exit;
          (* Zera a variável que guarda o valor da contribuição de um participante *)
          dValor := 0;
     end;(* while not qry.EOF *)

     (* Faz UpDate da movimentação na CTRLINTERFACE *)
     if iContInsTMPDESC > 0 then
     begin
        sSql := ' UPDATE CTRLINTERFACE SET NUMREG = '+IntToStr(iContInsTMPDESC)+', '+
                ' VLRTOTAL = '+OraNumero(FloatToStr(dTotalContribuicaoPatro))+
                ' WHERE (IDLOTE = '+IntToStr(IdLote)+') AND (TIPO = '+
                 Chr(39)+'A'+Chr(39)+')';

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        try
          qryAux.ExecSql;
        except
          on E:exception do
          begin
            memResult.Lines.Add('Erro Específico da Patrocinadora - [GRAVAÇÃO DO CONTROLE DE INTERFACE]' +
                                ' - erro : '+ E.message);
            memResult.Lines.Add('-----------------------------------');
            memResult.Lines.Add(' ');
            berro := True;
          end;(* on *)
        end;(* try..except *)
     end;(* if iContInsTMPDESC > 0 *)
end;

(* BUSCA PARAMETROS PARA CONTABILIZAÇÄO *)
Procedure TfrmCobraContribuicao.BuscaParametros(pIdPessJur:String);
Var qryParam: TQuery;
begin
     qryParam:=TQuery.Create(Application);
     qryParam.DatabaseName:='BaseDados';
     qryParam.Close;
     qryParam.Sql.Clear;
     qryParam.Sql.Add(
     'SELECT DISTINCT CB.PLACONTAC, CB.CODCENTROCUSTOC, CB.PLACONTAD, '+
     ' CB.CODCENTROCUSTOD, CB.CODSUBCONTA, CB.UNIDNEGOC, '+
     ' CB.PLACONTADAUTPATR, '+
     ' CP.PLACONTAC AS CP_PLACONTAC, CP.CODCENTROCUSTOC AS CP_CODCENTROCUSTOC, '+
     ' CP.PLACONTAD AS CP_PLACONTAD, CP.PLACONTADAUTPATR AS CP_PLACONTADAUTPATR, '+
     ' CP.CODCENTROCUSTOD AS CP_CODCENTROCUSTOD, '+
     ' CP.CODSUBCONTA AS CP_CODSUBCONTA, CP.UNIDNEGOC AS CP_UNIDNEGOC '+
     ' FROM HSTCONTRIBASS HT, CONTRIBASS CB, CONTRIBPLANPREVA CP '+
     ' WHERE '+
     ' HT.MESCOBRANCA = '+QuotedStr(sMesCobranca)+' AND '+
     ' HT.IDPESSJUR = '+pIdPessJur+' AND '+
     ' HT.IDPESSJUR = CP.IDPESSJUR AND '+
     ' HT.IDCONTASS = CP.IDCONTASS AND '+
     ' HT.IDPLANASS = CP.IDPLANASS AND '+
     ' HT.IDCONTASS = CB.IDCONTASS AND '+
     ' HT.IDPLANASS = CB.IDPLANASS ');

     qryParam.Open;

     vPLACONTAD:= BuscaInformacao('',qryParam.FieldByName('CP_PLACONTAD').AsString,
                                  qryParam.FieldByName('PLACONTAD').AsString);

     vPLACONTADAUTPATR:= BuscaInformacao('',qryParam.FieldByName('CP_PLACONTADAUTPATR').AsString,
                                  qryParam.FieldByName('PLACONTADAUTPATR').AsString);

     vPLACONTAC:= BuscaInformacao('',qryParam.FieldByName('CP_PLACONTAC').AsString,
                                  qryParam.FieldByName('PLACONTAC').AsString);

     vCODSUBCONTA:= StrToIntDef(BuscaInformacao('',qryParam.FieldByName('CP_CODSUBCONTA').AsString,
                               qryParam.FieldByName('CODSUBCONTA').AsString),-1);

     vCODCENTROCUSTOD:= BuscaInformacao('',qryParam.FieldByName('CP_CODCENTROCUSTOD').AsString,
                                  qryParam.FieldByName('CODCENTROCUSTOD').AsString);

     vCODCENTROCUSTOC:= BuscaInformacao('',qryParam.FieldByName('CP_CODCENTROCUSTOC').AsString,
                                  qryParam.FieldByName('CODCENTROCUSTOC').AsString);

     vCODUNIDNEGOC:= BuscaInformacao('',qryParam.FieldByName('CP_UNIDNEGOC').AsString,
                                  qryParam.FieldByName('UNIDNEGOC').AsString);


     (* verifica se o Código da SUB Conta está preenchido *)
     If vCODSUBCONTA<=0 then vCODSUBCONTA:= -1;

      (* Se não é obrigatório a atividade, obrigatoriamente temos que usar
         a atividade cadastrada no global, caso contrário podemos buscar uma
         especifica. Caso não encontre, tambem podemos usar o global *)
     If (IntegraBack.ObrigaAbc = 'N')Or(Trim(vCODUNIDNEGOC) = '') then
         vCODUNIDNEGOC:= IntToStr(prmUnidNegoc);

     qryParam.Close;
     qryParam.Free;
end; {BuscaParametros}

(* BUSCA DESCRICAO DA PATROCINADORA *)
Procedure TfrmCobraContribuicao.BuscaNomePatro(pIdPessJur:String);
Var qryTmp: TQuery;
begin
     vPATROCINADORA:='';
     qryTmp:=Tquery.Create(Application);
     qryTmp.DatabaseName:='BaseDados';
     qryTmp.Sql.Clear;
     qryTmp.Sql.Add('SELECT NOME FROM PESSOA '+
                 ' WHERE IDPESSOA = '+pIdPessJur);
     qryTmp.Open;
     vPATROCINADORA:=qryTmp.FieldByName('NOME').AsString;
     qryTmp.Close;
     If Trim(vPATROCINADORA)=''
        then bErro:=True;
end; {BuscaNomePatro}

(* BUSCA DESCRICAO DO PLANO *)
Procedure TfrmCobraContribuicao.BuscaNomePlano(pIdPlanoPrev:String);
Var qryTmp: TQuery;
begin
     vNOMEPLANOPREV:='';
     qryTmp:=Tquery.Create(Application);
     qryTmp.DatabaseName:='BaseDados';
     qryTmp.Sql.Clear;
     qryTmp.Sql.Add('SELECT NOME FROM PLANPREV '+
                    ' WHERE IDPLANOPREV = '+pIdPlanoPrev);
     qryTmp.Open;
     vNOMEPLANOPREV:=qryTmp.FieldByName('NOME').AsString;
     qryTmp.Close;
     If Trim(vNOMEPLANOPREV)='' then
        bErro:=True;
end; {BuscaNomePlano}

(* BUSCA DESCRICAO DO PLANO ASSISTENCIAL *)
Procedure TfrmCobraContribuicao.BuscaNomePlanoAssist(pIdPlano:String);
Var qryTmp: TQuery;
begin
     vNOMEPLANOASSIST:='';
     qryTmp:=Tquery.Create(Application);
     qryTmp.DatabaseName:='BaseDados';
     qryTmp.Sql.Clear;
     qryTmp.Sql.Add('SELECT NOME FROM PLANASS '+
                    ' WHERE IDPLANASS = '+pIdPlano);
     qryTmp.Open;
     vNOMEPLANOASSIST:=qryTmp.FieldByName('NOME').AsString;
     qryTmp.Close;
     If Trim(vNOMEPLANOASSIST)='' then
        bErro:=True;
end; {BuscaNomePlanoAssist}

Procedure TfrmCobraContribuicao.FazLancamentoContabil;
Var sMsgErro: String;
begin
   (* =========================================================
    |                      LancaContab                       |
    ========================================================= *)
   (* Método da unit ULancaContab é a função principal da contabilidade,
      encarregada de gerar os lançamentos contábeis *)
   If (iPlnCodigo>-1)And(IntegraBack.Contabilidade = 'S')And
      (Not FezPlanilha) then
   begin
        qryAcumulo.First;
        While Not qryAcumulo.Eof do
        begin
             BuscaParametros(qryAcumulo.FieldByName('IDPESSJUR').AsString);
             (* Guarda o Total Valor da Cobrança para testar depois *)
             dTotalVlCobranca:=dTotalVlCobranca+qryAcumulo.FieldByName('TOTALVALOR').AsFloat;
             iTotalCobranca:=iTotalCobranca+qryAcumulo.FieldByName('TOTALREG').AsInteger;
             (* ============================================ *)

             (* Busca descricao da Patrocinadora e PlanoPrev *)
             BuscaNomePatro(qryAcumulo.FieldByName('IDPESSJUR').AsString);
             BuscaNomePlano(qryAcumulo.FieldByName('IDPLANOPREV').AsString);
             BuscaNomePlanoAssist(qryAcumulo.FieldByName('IDPLANASS').AsString);
             (* =============================== *)

{             iPlnCodigo := LancaContab(
                    True,              (* Exibe ou não as mensagens de erro da função em caixas de diálogo *)
                    'BASEDADOS',       (* Nome do Banco de Dados *)
                    DateToStr(Date),   (* sDataLanc (string) - data do Lançamento *)
                    IntToStr(Sistema.IdModulo), (* Código do Sistema de Origem *)
                    '2',               (* '0' = débito   '1' = crédito   '2' = partida dobrada *)
                    'D',               (* 'D' = débito   'C' = crédito *)
                    '',                (* Tipo de conversão utilizado para a moedas oficial. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
                    '',                (* Tipo de conversão utilizado para a moeda gerencial. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
                    '',                (* Tipo de conversão utilizado para a moeda gerencial 1. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
                    '',                (* Tipo de conversão utilizado para a moeda gerencial 2 a Débito (somente se cTipoLanc="0" ou cTipoLanc="2"). Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
                    '',                (* Indica se a conta a débito afeta origem e aplicação *)
                    '',                (* Tipo de conversão utilizado para a moedas oficial. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
                    '',                (* Tipo de conversão utilizado para a moeda gerencial. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
                    '',                (* Tipo de conversão utilizado para a moeda gerencial 1. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
                    '',                (* Tipo de conversão utilizado para a moeda gerencial 2 a Débito (somente se cTipoLanc="0" ou cTipoLanc="2"). Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
                    '',                (* Indica se a conta a crédito afeta origem e aplicação *)
                    '',                (* Indica o número do documento de referência deste lançamento. Caso este lançamento não tenha nenhum número de lançamento este poderá ser NULL. *)
                    'Mensalidade ref. ao mês '+ Copy(sMesCobranca,6,2)+'/'+
                      Copy(sMesCobranca,1,4),(* linha do histórico padrão 1. A primeira linha é obrigatória *)
                    vNOMEPRODASS,      (* linha do histórico padrão 2 *)
                    vNOMEPLANOASSIST,  (* linha do histórico padrão 3 *)
                    vNOMEPLANOPREV,    (* linha do histórico padrão 4 *)
                    vPATROCINADORA,    (* linha do histórico padrão 5 *)
                    prmTpOperCobranca, (* código do Tipo de Operação do Lançamento. É opcional e serve para agrupar lançamentos de uma forma alternativa. Refere-se à tabela TIPOPER *)

                    vCODCENTROCUSTOD,  (* Centro de Custo do Lançamento a débito. *)
                    vPLACONTADAUTPATR, (* Conta Contábil do Lançamento a débito. *)

                    vCODCCUSTOFORNECEDOR,  (* Centro de Custo do Lançamento a crédito. *)
                    vCONTACFORNECEDOR,     (* Conta Contábil do Lançamento a crédito. *)

                    liExercicio,       (* Exercício Contábil do Lançamento *)
                    liPeriodo,         (* Período Contábil do Lançamento *)
                    liEmpresa,         (* Empresa Proprietária selecionada no login *)
                    Sistema.IdUsuario, (* iUsuario (integer) - Usuário corrente *)
                    IntegraBack.Plano, (* código do Plano Contábil corrente *)
                    qryAcumulo.FieldByName('TOTALVALOR').AsFloat,  (* Valor do Lançamento (deve sempre ser passado um valor positivo e diferente de zero) *)
                    0,                 (* Valor do Lançamento a débito na moeda Oficial *)
                    0,                 (* Valor do Lançamento a débito na moeda Gerencial *)
                    0,                 (* Valor do Lançamento a débito na moeda Gerencial 1 *)
                    0,                 (* Valor do Lançamento a débito na moeda Gerencial 2 *)
                    0,                 (* Valor do Lançamento a débito na moeda Oficial *)
                    0,                 (* Valor do Lançamento a débito na moeda Gerencial *)
                    0,                 (* Valor do Lançamento a débito na moeda Gerencial 1 *)
                    0,                 (* Valor do Lançamento a débito na moeda Gerencial 2 *)
                    vCODUNIDNEGOC,     (* Atividade/Projeto do Lançamento. Se for passada vazia, será utilizada a Atividade/Projeto padrão *)
                    False,             (* O default deste campo será False. Caso seja passado True (e o cTipoLanc for diferente de "2" - ou seja, não é uma partida dobrada), a função procurará se existe nesta planilha outro lançamento com cTipoLanc diferente de "2" com a mesma conta, mesmo centro de custo, mesma Atividade/Projeto e mesmo cTipoLanc. A função somará então os valores no mesmo lançamento contábil. *)
                    0,                 (* Valor do Lançamento a Débito na moeda Histórica *)
                    0,                 (* Valor do Lançamento a Crédito na moeda Histórica *)
                    IntToStr(vCODSUBCONTA),(* Código da Sub-Conta do Lançamento a Débito *)
                    '',                (* Código da Sub-Conta do Lançamento a Crédito *)
                    '',                (* Código do Histórico Padrão. Não é obrigatório. *)
                    '',                (* sem uso, passar NULL *)
                    iPlnCodigo,        (* Passar 0 (zero) para criar uma planilha nova. O sistema retornará o então o número da planilha gerada. Para continuar fazendo lançamentos nesta mesma planilha, passar este último número neste parâmetro (é um parâmetro passado por referência). *)
                    sMsgErro,          (* Mensagem de erro retornada pela função. É um parâmetro passado por referência. *)
                    IntegraBack.MascaraPlano,(* Máscara do Plano de Contas *)
                    True,              (* Deve sempre ser passado como True. Apenas a Contabilidade pode passar esse parâmetro como False *)
                    0,                 (* Número do Lançamento a ser criado. Na maioria dos casos este parâmetro deve ser passado como 0, mas no caso de um estorno ou exclusão, pode-se querer criar um lançamento numa planilha com um número específico. *)
                    qryAcumulo.FieldByName('IDPLANOPREV').AsInteger,  (* IdPlanoPrev *)
                    qryAcumulo.FieldByName('IDPESSJUR').AsInteger,    (* IdPessJur *)
                    Sistema.UsaPlanoPatro)(*  *);
}


             CtrlLancamento.InsereLancaContab ( '2',                                              // cTipoLanc
                                                Sistema.IdEmpresa,                                // IdEmpresa
                                                Sistema.IdModulo,                                 // iModuloOrigem
                                                Sistema.IdUsuario,                                // liUsuario
                                                IntegraBack.Plano,                                // liCodPlano
                                                StrToInt(vCODUNIDNEGOC),                          // liUnidNegoc
                                                vCODSUBCONTA,                                     // liSubContaDeb
                                                0,                                                // liSubContaCre
                                                qryAcumulo.FieldByName('IDPLANOPREV').AsInteger,  // iPlanoPrev
                                                qryAcumulo.FieldByName('IDPESSJUR').AsInteger,    // iPatro
                                                iPlnCodigo,                                       // liPlnCodigo
                                                0,                                                // iNumLan
                                                DateToStr(Date),                                  // sDataLanc
                                                '',                                               // sNumDoc
                                                'Mensalidade ref. ao mês '+ Copy(sMesCobranca,6,2)+'/'+
                                                Copy(sMesCobranca,1,4),                           // sHist1
                                                vNOMEPRODASS,                                     // sHist2
                                                vNOMEPLANOASSIST,                                 // sHist3
                                                vNOMEPLANOPREV,                                   // sHist4
                                                vPATROCINADORA,                                   // sHist5
                                                prmTpOperCobranca,                                // sTipoOper
                                                vCODCENTROCUSTOD,                                 // sCCustoD
                                                vPLACONTADAUTPATR,                                // sContaD
                                                vCODCCUSTOFORNECEDOR,                             // sCCustoC
                                                vCONTACFORNECEDOR,                                // sContaC
                                                '',                                               // sCodHist
                                                qryAcumulo.FieldByName('TOTALVALOR').AsFloat,     // rValLanc
                                                False,                                            // bJunta
                                                Sistema.UsaPlanoPatro,                            // bUsaPlanoPatro
                                                -1,                                               // iIdSegregaCriter
                                                -1                                                // dDataSegregaCriter
                                              );

             iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo);

             If iPlnCodigo <= 0 then
             begin
                  memResult.Lines.Add(' Erro na inclusão do lançamento na contabilidade: '+sMsgErro);
                  bErro := True;
                  Exit;
             end else
                 FezPlanilha:=True;
             qryAcumulo.Next;
        end; {While}
   end; {iPlnCodigo}
end; {FazLancamentoContabil}

(* BUSCA PARAMETROS CONTÁBEIS DO FORNECEDOR *)
Procedure TfrmCobraContribuicao.BuscaParametrosFornecedor;
Var qryTmp: TQuery;
begin
     vCONTACFORNECEDOR:='';
     vCODCCUSTOFORNECEDOR:='';
     vSUBCONTAFORNECEDOR:=-1;
     qryTmp:=Tquery.Create(Application);
     qryTmp.DatabaseName:='BaseDados';
     qryTmp.Sql.Clear;
     qryTmp.Sql.Add('SELECT EF.CONTACFORN, EF.CODSUBCONTA, EF.CODCENTROCUSTO '+
                    ' FROM  FORNSERV F, EMPRESAFORN EF '+
                    ' WHERE F.IDPESSOA = '+IntToStr(vIDFORNECEDOR)+' AND '+
                    ' F.IDPESSOA = EF.IDFORCLI ');
     qryTmp.Open;
     vCONTACFORNECEDOR:=qryTmp.FieldByName('CONTACFORN').AsString;
     vSUBCONTAFORNECEDOR:=StrToIntDef(qryTmp.FieldByName('CODSUBCONTA').AsString,-1);
     vCODCCUSTOFORNECEDOR:=qryTmp.FieldByName('CODCENTROCUSTO').AsString;
     qryTmp.Close;
     If Trim(vCONTACFORNECEDOR)='' then
        bErro:=True;
end; {BuscaParametrosFornecedor}

(* CONTAS A PAGAR COM VALOR TOTAL *)
function TfrmCobraContribuicao.ContasAPagarTotal : Boolean;
var cRecPag : Char;
    sCodTipDoc : String;
    iIdRamoForCli : Integer;
begin
     Result := False;
     (* PASSIVO *)
     (* Contas a Pagar -> fornecedor *)
     cRecPag := 'P';
     (* Código do Tipo de documento *)
     sCodTipDoc       := IntToStr(prmTpDocPEnvioBanco);
     (* verifica se o Código do tipo de documento está preenchido *)
     if Trim(sCodTipDoc) = '' then sCodTipDoc := '-1';

     (* Função que busca o identificador do Ramo do tipo do cliente *)
     iIdRamoForCli := BuscaRamoForCli(vFLGINTERNO, cRecPag);
     (* Método da unit UDocumento que transforma o pessoa passado como parâmetro
     num fornecedor para a empresa logada *)
     try
         (* =========================================================
          |               Documento.ForCli.Inserir                 |
            ========================================================= *)

        Ctrldocumento.ForCli.Inserir( vIDFORNECEDOR,               // liIdPessoa
                                      Sistema.IdEmpresa,           // liIdEmpresa
                                      -1,                          // liCodSubConta
                                      IntegraBack.Plano,           // liPlano
                                      iIdRamoForCli,               // liIdRamoTipoCli
                                      vCODCCUSTOFORNECEDOR,        // sCCusto
                                      '',                          // sContaCAdianto
                                      vCONTACFORNECEDOR,           // sContaCForCli
                                      '',                          // sContaCDespesa
                                      tfcFornecedor);              // TipoForCli = (tfcFornecedor, tfcCliente)

     except
        GravaErros('Erro na criação do Fornecedor no Contas a Pagar','1');
        bErro  := True;
        Result := True;
        Exit;
     end;(* try..except *)

     (* variável que guarda o número de recebimento do documento *)
     sNumRecebimento := vNUMRECEBIMENTO;

      (* =========================================================
      |                  Documento.Inserir                     |
         ========================================================= *)
      (* Método da unit UDocumento que insere o Documento na tabela Documento *)

   iCodLancCAPCAR := CtrlDocumento.GetSequenceDocumento;
   sNoDocumento   := IntToStr(iCodLancCAPCAR);

   With qryAux do
    Begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT CODFORMA ');
       SQL.Add('FROM PORTADORFORMA ');
       SQL.Add('WHERE CODPORTFORMA = '+ClienteNumero(sCodPortForma));
       Open;
       If Not IsEmpty
        Then iCodForma := FieldByName('CODFORMA').AsInteger
        Else iCodForma := -1;
    End;


    Try
      CtrlDocumento.Prepare(OpDocumento,odlEfetivo);
      CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
      CtrlDocumento.IdUsuario   := Sistema.IdUsuario;

      CtrlDocumento.SetValues( iCodLancCAPCAR,              // CodDocumento
                               StrToFloat(sNoDocumento),    // NoDocumento
                               '',                          // ComplDocumento
                               '0',                         // sStatus
                               cRecPag,                     // RecPag
                               '2',                         // sOperacao
                               '',                          // sNumslip
                               '',                          // sNumleitcodbarras
                               vCONTACFORNECEDOR,           // PlaConta
                               vCODCCUSTOFORNECEDOR,        // CodCentroCusto
                               '',                          // NossoNumero
                               '',                          // NumDigCodBarras
                               '',                          // GrupoDoc
                               '',                          // sFlgemitelancbaix
                               'N',                         // sFlgconfirmarecpag
                               'N',                         // EmisBloq
                               '',                          // Referencia
                               '',                          // Obs
                               StrToDate(sDataVencimento),  // DataVencto
                               Date,                        // DataEmissao
                               StrToDate(sDataVencimento),  // DataProgramada
                               0,                           // DataRemessa
                               0,                           // DataLimite
                               0,                           // DataCorrecao
                               0,                           // rVlrMulta
                               0,                           // rValorJuros
                               0,                           // rValorDesconto
                               0,                           // rPercJurosSimples
                               0,                           // rPercJurosAtuarial
                               StrToInt(sCodTipDoc),        // CodTipDoc
                               Sistema.IdEmpresa,           // IdPessoa
                               Sistema.IdModulo,            // IdModulo
                               vIDFORNECEDOR,
                               -1,                          // NumFatura
                               -1,                          // IdCBancaria
                               -1,                          // UnidNegoc
                               IntegraBack.Plano,           // Plano
                               -1,                          // NumCPBaixa
                               -1,                          // NumAPGr
                               -1,                          // Moecodigo
                               -1,                          // LoteTransmissao
                               -1,                          // IndiceCorrecao
                               Sistema.IdUsuario,           // IdUsuarioInclusao
                               Sistema.IdEmpresa,           // IdEmpresa
                                1,                          // Flgnaoconciliado
                               -1,                          // Controleremess,
                               -1,                          // Codsubconta
                               StrToInt(sCodPortForma),     // Codportforma
                               -1,                          // Codgrupocnab
                               -1,                          // CodGeradorINSS
                               iCodForma,                   // Codforma
                               -1                           // iIdSegregaCriter
                             );
    Except
      bErro  := True;
    End;

         (* =========================================================
          |                Documento.CriaLanctoDoc                 |
            ========================================================= *)
         (* Método da unit UDocumento que Insere um lançamento de documento na
            tabela LANCTODOCUM com a mesma operação lançada no documento *)

    Try
      CtrlDocumento.LanctoDocum.SetValues( Date ,                  // DataLancto
                                           iCodLancCAPCAR,         // CodDocumento
                                           0,                      // Numlancto
                                           abs(dTotalVlCobranca),  // Vlrliquido
                                           0,                      // ValorOM
                                           abs(dTotalVlCobranca),  // Valor
                                           -1,                     // Unidnegoc
                                           iPlnCodigo,             // liPlncodigo
                                           -1,                     // Numlotemanual
                                           Sistema.IdUsuario,      // Idusuarioinclusao
                                           Sistema.IdEmpresa,      // Idpessoa
                                           -1,                     // Idnflivro,
                                           -1,                     // Estorno
                                           -1,                     // Codtipdoc
                                           -1,                     // Coddocinss
                                           -1,                     // Codalterador
                                           '2',                    // Operacao
                                           '',                     // NumRecibo
                                           '',                     // Numnf
                                           '',                     // Numfatura
                                           'Cobrança Assistencial',// Historicocompl
                                           '',                     // Flgtipofatura
                                           'N',                    // Flgrecebeunf
                                           '',                     // Flgfatemitida
                                           'C',                    // Debcre
                                           Sistema.IdModulo,       // IdModulo
                                           IntegraBack.Plano,      // PlanoConta
                                           True,                   // UsaPlanoPatro
                                           False,                  // Contabiliza
                                           -1,                     // iCodPortForma
                                           0,                      // DiasFloat
                                           '',                     // ContaBaixa
                                           0                       // SubContaBaixa
                                          );
      iNumLancto := CtrlDocumento.Lanctodocum.NumLancto;

   except
      bErro  := True;
   end;

          (* =========================================================
          |                Documento.Rateio.Inserir                |
          ========================================================= *)

    Try

          CtrlDocumento.RateioDocum.SetValues ( dTotalVlCobranca,         // Valor
                                             0,                           // ValorOM
                                             0,                           // Vlrresorcamen
                                             0,                           // Idrateiodocum
                                             Sistema.IdEmpresa,           // Idpessoa
                                             iCodLancCAPCAR,              // Coddocumento
                                             StrToInt(vCODUNIDNEGOC),     // Unidnegoc
                                             0,                           // Moecodigo,
                                             Sistema.IdUsuario,           // Idusuarioinclusao
                                             0,                           // Idreservaorcamen
                                             IntegraBack.Plano,           // Plano
                                             vIDPLANOPREV,                // Idplanoprev
                                             vIDPESSJUR,                  // Idpatro
                                             -1,                          // Idprograma
                                             -1,                          // Idprocesso
                                             Sistema.IdEmpresa,           // IdEmpresa
                                             vCODTIPRECDES,               // Codtiprecdes
                                             cRecPag,                     // Recpag
                                             vCODCENTRORESPON,            // Codcentrorespon
                                             prmCodCentroCusto,           // Codcentrocusto
                                             ''                           // Numimovel
                                            );
    except
      bErro  := True;
    end;(* try..except *)

    If not CtrlDocumento.Insert
     Then Begin
        GravaErros('Erro ao inserir documento no contas a pagar:['+CtrlDocumento.MessageInfo+'].','1');
        bErro  := True;
        Result := True;
        Exit;
     End;
end; (* CONTAS A PAGAR COM VALOR TOTAL *)

(* =============================================================================
    cobrança em BANCO
   ============================================================================= *)
procedure TfrmCobraContribuicao.BancoFazCobranca;
var iUltPagador, iUltContass, iUltPlanass, iContador,
    iUltRubrica : Integer;
    sUltMes: String;
    sSql, sRubrica, sTotal : String;
    bProblem : Boolean;
begin
     qryBanco.Prepare;
     (* variável que guarda o valor da contribuição de um participante *)
     dValor    := 0;
     iContador := 0;
     vMATRICULA:= '';

     (* Posiciona no Primeiro Registro da qry *)
     qry.First;
     (* ===================================== *)
     sTotal := ' / ' + IntToStr(qry.RecordCount);
     iUltPagador := qry.FieldByName('IDPAGADOR').AsInteger;
     iUltContass := qry.FieldByName('IDCONTASS').AsInteger;
     iUltPlanass := qry.FieldByName('IDPLANASS').AsInteger;
     iUltRubrica := qry.FieldByName('IDPROVENTO').AsInteger;
     sUltMes     := qry.FieldByName('MES').AsString;

     (* Laço que faz toda a cobrança em Banco *)
     while not qry.EOF do
     begin
          (* Laço que soma contribuições de um participante *)
          dValor:= 0;
          while (iUltPagador = qry.FieldByName('IDPAGADOR').AsInteger) and
                (iUltContass = qry.FieldByName('IDCONTASS').AsInteger) and
                (iUltPlanass = qry.FieldByName('IDPLANASS').AsInteger) and
                (iUltRubrica = qry.FieldByName('IDPROVENTO').AsInteger) and
                (sUltMes     = qry.FieldByName('MES').AsString) and
                (not qry.EOF) do
          begin
               (* variável que guarda o valor da contribuição de um participante *)
               dValor := dValor + qry.FieldByName('VALOR').AsFloat;
               (* Busca a informação de acordo com o nível de parametrização *)
               vCODCENTROCUSTOD  :=BuscaInformacao('',qry.FieldByName('CP_CODCENTROCUSTOD').AsString,
                                   qry.FieldByName('CODCENTROCUSTOD').AsString);

               vCODCENTROCUSTOC  :=BuscaInformacao('',qry.FieldByName('CP_CODCENTROCUSTOC').AsString,
                                   qry.FieldByName('CODCENTROCUSTOC').AsString);

               vCODTIPDESEMBDEVOL:=BuscaInformacao('',qry.FieldByName('CP_CODTIPDESEMBDEVOL').AsString,
                                   qry.FieldByName('CODTIPDESEMBDEVOL').AsString);

               vPLACONTADAUTPATR :=BuscaInformacao('',qry.FieldByName('CP_PLACONTADAUTPATR').AsString,
                                   qry.FieldByName('PLACONTADAUTPATR').AsString);

               vCODTIPRECDES     :=BuscaInformacao('',qry.FieldByName('CP_CODTIPRECDES').AsString,
                                   qry.FieldByName('CODTIPRECDES').AsString);

               vCODUNIDNEGOC     :=BuscaInformacao('',qry.FieldByName('CP_UNIDNEGOC').AsString,
                                   qry.FieldByName('UNIDNEGOC').AsString);

               vCODCENTRORESPON  :=BuscaInformacao('',qry.FieldByName('CP_CODCENTRORESPON').AsString,
                                   qry.FieldByName('CODCENTRORESPON').AsString);

               (* CODIGO DA SUBCONTA *)
               vCODSUBCONTA:= StrToIntDef(BuscaInformacao('',qry.FieldByName('CP_CODSUBCONTA').AsString,
                                   qry.FieldByName('CODSUBCONTA').AsString),-1);


               vFLGINTERNO       := qry.FieldByName('FLGINTERNO').AsString;
               vIDTITULAR        := qry.FieldByName('IDPAGADOR').AsInteger;
               vIDCONTASS        := qry.FieldByName('IDCONTASS').AsInteger;
               vNUMRECEBIMENTO   := qry.FieldByName('NUMRECEBIMENTO').AsString;
               vNOMEPRODASS      := qry.FieldByName('NOMEPRODASS').AsString;
               vCODPORTFORMA     := qry.fieldbyname('CODPORTFORMA').AsString;
               vIDPESSJUR        := qry.FieldByName('IDPESSJUR').AsInteger;
               vIDFORNECEDOR     := qry.FieldByName('IDFORNSERV').AsInteger;
               vIDPLANOPREV      := qry.FieldByName('IDPLANOPREV').AsInteger;
               vIDPLANASS        := qry.FieldByName('IDPLANASS').AsString;
               vMATRICULA        := qry.FieldByName('MATRICULA').AsString;
               vIDPROVENTO       := qry.FieldByName('IDPROVENTO').AsString;
               vFLGATRASODEVOL   := qry.FieldByName('FLGATRASODEVOL').AsString;
               vMES              := qry.FieldByName('MES').AsString;


               If (vFLGATRASODEVOL<>'N')And(vFLGATRASODEVOL<>'A')And
                  (vFLGATRASODEVOL<>'D') then bErro:=True;

               (* Faz o update na tabela HSTCONTRIBASS
                   parâmetro - False - Cobrança em Folha
                             - True  - Cobrança em Banco *)
               FazUpdateHSTContribass(True);

               (* Se não é obrigatório o centro de responsabilidade, obrigatoriamente temos que usar
                 o centro responsabilidade cadastrado no global, caso contrário podemos buscar um
                 especifico. Caso não encontre, tambem podemos usar o global *)
               If (IntegraBack.ObrigaCRespon = 'N')Or(Trim(vCODCENTRORESPON) = '') then
                   vCODCENTRORESPON := prmCodCentroRespon;

               (* Se não é obrigatório a atividade, obrigatoriamente temos que usar
                   a atividade cadastrada no global, caso contrário podemos buscar uma
                   especifica. Caso não encontre, tambem podemos usar o global *)
               If (IntegraBack.ObrigaAbc = 'N')Or(Trim(vCODUNIDNEGOC) = '') then
                   vCODUNIDNEGOC:= IntToStr(prmUnidNegoc);

               (* Preenchimento da Data previsão de recebimento *)
               If Trim(qry.FieldByName('DATAPREVISAO').AsString) <> '' then
                  sDataVencimento    := qry.FieldByName('DATAPREVISAO').AsString
               else sDataVencimento := DateToStr(Date);

               (* indica o tipo da RUBRICA *)
               sRubrica:= vFLGATRASODEVOL;

               (* vai para o próximo registro *)
               qry.Next;
               iContador := iContador + 1;
               lContador.Caption := IntToStr(iContador) + sTotal;
               pnlProgresso.Update;
               Application.ProcessMessages;
          end;(* while que soma contribuições de um participante para um mês *)

          dTotalContribuicaoBanco := dTotalContribuicaoBanco + dValor;
          Inc(iTotalCBanco,1);

          iUltPagador := qry.FieldByName('IDPAGADOR').AsInteger;
          iUltContass := qry.FieldByName('IDCONTASS').AsInteger;
          iUltPlanass := qry.FieldByName('IDPLANASS').AsInteger;
          iUltRubrica := qry.FieldByName('IDPROVENTO').AsInteger;
          sUltMes     := qry.FieldByName('MES').AsString;

          pnlProgresso.Update;
          Application.ProcessMessages;
          frmCobraContribuicao.Update;
          (* verifica se o usuário cancelou a operação *)
          if bCancelaenvio then Exit;

          (* FLGATRASODEVOL é coluna da PROVDESC e indica se a RUBRICA é de :
             A - Atraso
             D - Devolução
             N - Normal *)
          if sRubrica = 'D' then
            bProblem:= ContasAPagar
          else
            bProblem := ContasAReceber;

          (* Se houve algum problema na execução do Contas a Pagar ou Contas a Receber
             a função retornará como True e o procedimento BancoFazCobrança deve ser abortado *)
          If bProblem then
          begin
              bErro:=True;
              Continue;
          end;

          If Not bErro then
          begin
               sSql := ' UPDATE HSTCONTRIBASS SET' +
                       ' CODDOCPREV = '+IntToStr(iCodLancCAPCAR)+
                       ' WHERE '+
                       ' IDPLANASS = '+vIDPLANASS+
                       ' AND IDPAGADOR = '+ IntToStr(vIDTITULAR) +
                       ' AND IDCONTASS = '+ IntToStr(vIDCONTASS) +
                       ' AND MES = '+QuotedStr(vMES)+
                       ' AND MESCOBRANCA = '+QuotedStr(sMesCobranca);
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(sSql);
               (* grava na tabela de histórico de contribuições o código do documento e a
                  data de emissão da cobrança
                  UPDATE HSTCONTRIBASS *)
               try
                  qryAux.ExecSQL;
               except
                  GravaErros('Documento Nº: '+ vNUMRECEBIMENTO +
                           '- erro na atualização da situação no histórico','0');
                  berro := true;
               end;(* try..except *)
          end; {bErro}

          (* Acumula valores para testar com dTotalVlCobranca no final *)
          If (Not bErro)And(sRubrica<>'D') then
          begin
            dAcumuloValor:=dAcumuloValor+dValor;
            Inc(iTotalAcumulo,1);
          end;

          (* Zera a variável que guarda o valor da contribuição de um participante *)
          dValor := 0;
     end;(* while not qry.EOF *)
     qryBanco.UnPrepare;
end;

procedure TfrmCobraContribuicao.FazUpdateHSTContribass(ISBanco : Boolean);
var sSql : String;
begin
     sSql := ' UPDATE' +
             ' HSTCONTRIBASS SET' +
             '  SITRECEBIMENTO = 1,';
     if IsBanco then
        sSql := sSql + '  CODREFERENCIA = ' + chr(39) + 'Banco' + chr(39)
     else
         sSql := sSql + '  CODREFERENCIA = ' + chr(39) + IntToStr(idLote) + '-' + Copy(DateToStr(Date),1,10) + chr(39) + ',' +
                        '  IDLOTE = ' + IntToStr(idLote);
     sSql := sSql +
             ' WHERE' +
             '  IDMOTIVO   = '       + qry.FieldByName('IDMOTIVO').AsString      +
             '  AND IDCONTASS    = ' + qry.FieldByName('IDCONTASS').AsString     +
             '  AND IDPLANOPREV  = ' + qry.FieldByName('IDPLANOPREV').AsString   +
             '  AND IDPLANASS    = ' + qry.FieldByName('IDPLANASS').AsString     +
             '  AND IDPESSJUR    = ' + qry.FieldByName('IDPESSJUR').AsString     +
             '  AND SEQPROPOSTA  = ' + qry.FieldByName('SEQPROPOSTA').AsString   +
             '  AND IDTITULAR    = ' + qry.fieldbyname('IDTITULAR').AsString     +
             '  AND IDDEPENDENTE = ' + qry.FieldByName('IDDEPENDENTE').AsString  +
             '  AND MES          = ' + chr(39) + qry.FieldByName('MES').AsString + chr(39) +
             '  AND MESCOBRANCA  = ' + chr(39) + qry.FieldByName('MESCOBRANCA').AsString + chr(39);
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     (* grava na tabela de histórico de contribuições que o registro ja foi enviado
     UPDATE HSTCONTRIBASS *)
     try
        qryAux.ExecSQL;
     except
           GravaErros('Erro na atualização da situação no histórico','0');
           berro := true;
     end;(* try..except *)
end;

function TfrmCobraContribuicao.ContasAReceber : Boolean;
var cRecPag : Char;
    sCodTipDoc,
    sHist : String;
    iIdRamoForCli : Integer;
//    dMultaDiaria : Double;
    bIsBoleta : Boolean;
    sMensagens  : Array[1..10] of String;
begin
     Result := False;
     (* Contas a Receber - Cobrança -> cliente *)
     cRecPag := 'R';
     (* Código do Tipo de documento *)
     sCodTipDoc       := IntToStr(prmTpDocRRecBanco);
     (* verifica se o Código do tipo de documento está preenchido *)
     if Trim(sCodTipDoc) = '' then sCodTipDoc := '-1';

     (* Função que busca o identificador do Ramo do tipo do cliente *)
     iIdRamoForCli := BuscaRamoForCli(vFLGINTERNO, cRecPag);

     try
         (* =========================================================
            |               Documento.ForCli.Inserir                |
            ======================================================== *)

        Ctrldocumento.ForCli.Inserir( vIDTITULAR,               // liIdPessoa
                                      Sistema.IdEmpresa,           // liIdEmpresa
                                      -1,                          // liCodSubConta
                                      IntegraBack.Plano,           // liPlano
                                      iIdRamoForCli,               // liIdRamoTipoCli
                                      vCODCCUSTOFORNECEDOR,        // sCCusto
                                      '',                          // sContaCAdianto
                                      vPLACONTADAUTPATR,           // sContaCForCli
                                      '',                          // sContaCDespesa
                                      tfcCliente);                 // TipoForCli = (tfcFornecedor, tfcCliente)

     except
            GravaErros('Erro na criação do Cliente no Contas a Receber','0');
            bErro  := True;
            Result := True;
            Exit;
     end;(* try..except *)

     (* variável que guarda o número de recebimento do documento *)
     sNumRecebimento := vNUMRECEBIMENTO;

     sCodPortForma := vCODPORTFORMA;
     if Trim(sCodPortForma) = '' then
     begin
        qryBanco.ParamByName('IDPAGADOR').AsInteger := vIDTITULAR;
        qryBanco.Open;
        sCodPortForma := qryBanco.FieldByName('CODPORTFORMA').AsString;
        qryBanco.Close;
        bIsBoleta := False;
        (* no caso de ser débito automático, não usar multa nem juros *)
//        dMultaDiaria := 0;
        dJuros       := 0;
     end
     else begin
        bIsBoleta := True;
//        dMultaDiaria := (dValor * (strFloat(edtJurosBoleta.Text,1)/100.0)) / 30;
//        if dMultaDiaria < 0.01 then dMultaDiaria := 0.01;
        dJuros := StrFloat(edtJurosBoleta.Text,1);
     end;

      (* =========================================================
        |                  Documento.Inserir                     |
         ========================================================= *)

   iCodLancCAPCAR := CtrlDocumento.GetSequenceDocumento;
   sNoDocumento   := IntToStr(iCodLancCAPCAR);

   With qryAux do
    Begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT CODFORMA ');
       SQL.Add('FROM PORTADORFORMA ');
       SQL.Add('WHERE CODPORTFORMA = '+ClienteNumero(sCodPortForma));
       Open;
       If Not IsEmpty
        Then iCodForma := FieldByName('CODFORMA').AsInteger
        Else iCodForma := -1;
    End;


    Try
      CtrlDocumento.Prepare(OpDocumento,odlEfetivo);
      CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
      CtrlDocumento.IdUsuario   := Sistema.IdUsuario;

      CtrlDocumento.SetValues( iCodLancCAPCAR,              // CodDocumento
                               StrToFloat(sNoDocumento),    // NoDocumento
                               '',                          // ComplDocumento
                               '0',                         // sStatus
                               cRecPag,                     // RecPag
                               '2',                         // sOperacao
                               '',                          // sNumslip
                               '',                          // sNumleitcodbarras
                               vPLACONTADAUTPATR,           // PlaConta
                               vCODCENTROCUSTOD,            // CodCentroCusto
                               '',                          // NossoNumero
                               '',                          // NumDigCodBarras
                               '',                          // GrupoDoc
                               '',                          // sFlgemitelancbaix
                               'N',                         // sFlgconfirmarecpag
                               'N',                         // EmisBloq
                               '',                          // Referencia
                               '',                          // Obs
                               StrToDate(sDataVencimento),  // DataVencto
                               Date,                        // DataEmissao
                               StrToDate(sDataVencimento),  // DataProgramada
                               0,                           // DataRemessa
                               0,                           // DataLimite
                               0,                           // DataCorrecao
                               0,                           // rVlrMulta
                               0,                           // rValorJuros
                               0,                           // rValorDesconto
                               0,                           // rPercJurosSimples
                               0,                           // rPercJurosAtuarial
                               StrToInt(sCodTipDoc),        // CodTipDoc
                               Sistema.IdEmpresa,           // IdPessoa
                               Sistema.IdModulo,            // IdModulo
                               vIDTITULAR,
                               -1,                          // NumFatura
                               -1,                          // IdCBancaria
                               -1,                          // UnidNegoc
                               IntegraBack.Plano,           // Plano
                               -1,                          // NumCPBaixa
                               -1,                          // NumAPGr
                               -1,                          // Moecodigo
                               -1,                          // LoteTransmissao
                               -1,                          // IndiceCorrecao
                               Sistema.IdUsuario,           // IdUsuarioInclusao
                               Sistema.IdEmpresa,           // IdEmpresa
                                1,                          // Flgnaoconciliado
                               -1,                          // Controleremess,
                               -1,                          // Codsubconta
                               StrToInt(sCodPortForma),     // Codportforma
                               -1,                          // Codgrupocnab
                               -1,                          // CodGeradorINSS
                               iCodForma,                   // Codforma
                               -1                           // iIdSegregaCriter
                             );
    Except
      bErro  := True;
    End;

    sHist := 'Cobrança Assistencial (' + vNOMEPRODASS + ')';
    try
    // =========================================================
    // |                Documento.CriaLanctoDoc                |
    // =========================================================

         CtrlDocumento.LanctoDocum.SetValues( Date ,                  // DataLancto
                                              iCodLancCAPCAR,         // CodDocumento
                                              0,                      // Numlancto
                                              abs(dValor),  // Vlrliquido
                                              0,                      // ValorOM
                                              abs(dValor),  // Valor
                                              -1,                     // Unidnegoc
                                              iPlnCodigo,             // liPlncodigo
                                              -1,                     // Numlotemanual
                                              Sistema.IdUsuario,      // Idusuarioinclusao
                                              Sistema.IdEmpresa,      // Idpessoa
                                              -1,                     // Idnflivro,
                                              -1,                     // Estorno
                                              -1,                     // Codtipdoc
                                              -1,                     // Coddocinss
                                              -1,                     // Codalterador
                                              '2',                    // Operacao
                                              '',                     // NumRecibo
                                              '',                     // Numnf
                                              '',                     // Numfatura
                                              sHist,                  // Historicocompl
                                              '',                     // Flgtipofatura
                                              'N',                    // Flgrecebeunf
                                              '',                     // Flgfatemitida
                                              'D',                    // Debcre
                                              Sistema.IdModulo,       // IdModulo
                                              IntegraBack.Plano,      // PlanoConta
                                              True,                   // UsaPlanoPatro
                                              False,                  // Contabiliza
                                              -1,                     // iCodPortForma
                                              0,                      // DiasFloat
                                              '',                     // ContaBaixa
                                              0                       // SubContaBaixa
                                             );


     except
              bErro  := True;
     end;(* try..except *)

     try
         // =========================================================
         // |                Documento.Rateio.Inserir               |
         // =========================================================

          //CtrlDocumento.RateioDocum.SetValues ( dTotalVlCobranca,         // Valor
          CtrlDocumento.RateioDocum.SetValues ( dValor,                   // Valor  // Gleyber - 20/03/2007 - Pendência 24812
                                             0,                           // ValorOM
                                             0,                           // Vlrresorcamen
                                             0,                           // Idrateiodocum
                                             Sistema.IdEmpresa,           // Idpessoa
                                             iCodLancCAPCAR,              // Coddocumento
                                             StrToInt(vCODUNIDNEGOC),     // Unidnegoc
                                             0,                           // Moecodigo,
                                             Sistema.IdUsuario,           // Idusuarioinclusao
                                             0,                           // Idreservaorcamen
                                             IntegraBack.Plano,           // Plano
                                             vIDPLANOPREV,                // Idplanoprev
                                             vIDPESSJUR,                  // Idpatro
                                             -1,                          // Idprograma
                                             -1,                          // Idprocesso
                                             Sistema.IdEmpresa,           // IdEmpresa
                                             vCODTIPRECDES,               // Codtiprecdes
                                             cRecPag,                     // Recpag
                                             vCODCENTRORESPON,            // Codcentrorespon
                                             prmCodCentroCusto,           // Codcentrocusto
                                             ''                           // Numimovel
                                            );

     except
            bErro  := True;
     end;(* try..except *)

    If not CtrlDocumento.Insert
     Then Begin
        GravaErros('Erro ao inserir documento no contas a receber: ['+CtrlDocumento.MessageInfo+'].','1');
        bErro  := True;
        Result := True;
        Exit;
     End;

     (* caso positivo lançar as mensagens a ser impressa na boleta *)
     if bIsBoleta  then
     begin
          sMensagens[1]  := '*** VALORES EXPRESSOS EM REAIS ***';
          sMensagens[2]  := '';
          sMensagens[3]  := 'NAO RECEBER APOS O VENCIMENTO';
          sMensagens[4]  := '';
          sMensagens[5]  := vNOMEPRODASS; (* Nome do Produto *)
          sMensagens[6]  := '';
          sMensagens[7]  := '';
          sMensagens[8]  := 'MATRICULA '+Trim(vMATRICULA)+'  '+
                            'REFERENCIA '+copy(sMesCobranca,6,2)+'/'+copy(sMesCobranca,1,4);
          sMensagens[9]  := '';
          sMensagens[10] := '';
          (* =========================================================
            |       Documento.IntBanco.SetaMensagensCNAB             |
             ========================================================= *)
          (* Método da unit UDocumento que inclui na tabela MENSAGENSCNAB
             os Registros para a mensagem a ser impressa no documento de cobranca
             do Contas a Receber *)

          If not CtrlDocumento.IntBanco.SetaMensagensCNAB( iCodLancCAPCAR,      // CodDocumento
                                                           -1,                  // lICodGrupo
                                                           sMensagens,          // sMensagens
                                                           true )               // bApagaMensagens


          then
          begin
              GravaErros('Erro na gravação das mensagens CNAB do Contas a Receber : documento nº '+
                           sNumRecebimento,'0');
              bErro  := True;
              Result := True;
              Exit;
          end;
     end;(* if bIsBoleta *)


end;

(* CONTAS A PAGAR PARA DEVOLUÇÃO *)
function TfrmCobraContribuicao.ContasAPagar : Boolean;
var cRecPag : Char;
    sCodTipDoc : String;
    iIdRamoForCli : Integer;
begin
     Result := False;
     (* PASSIVO *)
     (* Contas a Pagar - Devolução -> fornecedor *)
     cRecPag := 'P';
     (* Código do Tipo de documento *)
     sCodTipDoc := IntToStr(prmTpDocPEnvioBanco);
     (* verifica se o Código do tipo de documento está preenchido *)
     if Trim(sCodTipDoc) = '' then
        sCodTipDoc := '-1';

     (* Função que busca o identificador do Ramo do tipo do cliente *)
     iIdRamoForCli := BuscaRamoForCli(vFLGINTERNO, cRecPag);
     (* Método da unit UDocumento que transforma o pessoa passado como parâmetro
        num fornecedor para a empresa logada *)
     try
        (* =========================================================
        |               Documento.ForCli.Inserir                 |
        ========================================================= *)

        Ctrldocumento.ForCli.Inserir( vIDTITULAR,                  // liIdPessoa
                                      Sistema.IdEmpresa,           // liIdEmpresa
                                      -1,                          // liCodSubConta
                                      IntegraBack.Plano,           // liPlano
                                      iIdRamoForCli,               // liIdRamoTipoCli
                                      vCODCENTROCUSTOD,            // sCCusto
                                      '',                          // sContaCAdianto
                                      vPLACONTADAUTPATR,           // sContaCForCli
                                      '',                          // sContaCDespesa
                                      tfcFornecedor);              // TipoForCli = (tfcFornecedor, tfcCliente)

     except
          bErro  := True;
     end;(* try..except *)

     (* variável que guarda o número de recebimento do documento *)
     sNumRecebimento := vNUMRECEBIMENTO;

     iCodLancCAPCAR := CtrlDocumento.GetSequenceDocumento;
     sNoDocumento   := IntToStr(iCodLancCAPCAR);

     With qryAux do
      Begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT CODFORMA ');
         SQL.Add('FROM PORTADORFORMA ');
         SQL.Add('WHERE CODPORTFORMA = '+ClienteNumero(sCodPortForma));
         Open;
         If Not IsEmpty
          Then iCodForma := FieldByName('CODFORMA').AsInteger
          Else iCodForma := -1;
      End;


      Try
        CtrlDocumento.Prepare(OpDocumento,odlEfetivo);
        CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
        CtrlDocumento.IdUsuario   := Sistema.IdUsuario;

        CtrlDocumento.SetValues( iCodLancCAPCAR,              // CodDocumento
                                 StrToFloat(sNoDocumento),    // NoDocumento
                                 '',                          // ComplDocumento
                                 '0',                         // sStatus
                                 cRecPag,                     // RecPag
                                 '2',                         // sOperacao
                                 '',                          // sNumslip
                                 '',                          // sNumleitcodbarras
                                 vPLACONTADAUTPATR,           // PlaConta
                                 vCODCENTROCUSTOD,            // CodCentroCusto
                                 '',                          // NossoNumero
                                 '',                          // NumDigCodBarras
                                 '',                          // GrupoDoc
                                 '',                          // sFlgemitelancbaix
                                 'N',                         // sFlgconfirmarecpag
                                 'N',                         // EmisBloq
                                 '',                          // Referencia
                                 '',                          // Obs
                                 StrToDate(sDataVencimento),  // DataVencto
                                 Date,                        // DataEmissao
                                 StrToDate(sDataVencimento),  // DataProgramada
                                 0,                           // DataRemessa
                                 0,                           // DataLimite
                                 0,                           // DataCorrecao
                                 0,                           // rVlrMulta
                                 0,                           // rValorJuros
                                 0,                           // rValorDesconto
                                 0,                           // rPercJurosSimples
                                 0,                           // rPercJurosAtuarial
                                 StrToInt(sCodTipDoc),        // CodTipDoc
                                 Sistema.IdEmpresa,           // IdPessoa
                                 Sistema.IdModulo,            // IdModulo
                                 vIDTITULAR,
                                 -1,                          // NumFatura
                                 -1,                          // IdCBancaria
                                 -1,                          // UnidNegoc
                                 IntegraBack.Plano,           // Plano
                                 -1,                          // NumCPBaixa
                                 -1,                          // NumAPGr
                                 -1,                          // Moecodigo
                                 -1,                          // LoteTransmissao
                                 -1,                          // IndiceCorrecao
                                 Sistema.IdUsuario,           // IdUsuarioInclusao
                                 Sistema.IdEmpresa,           // IdEmpresa
                                  1,                          // Flgnaoconciliado
                                 -1,                          // Controleremess,
                                 -1,                          // Codsubconta
                                 StrToInt(sCodPortForma),     // Codportforma
                                 -1,                          // Codgrupocnab
                                 -1,                          // CodGeradorINSS
                                 iCodForma,                   // Codforma
                                 -1                           // iIdSegregaCriter
                               );
      Except
        bErro  := True;
      End;

     try
          (* =========================================================
             |                Documento.CriaLanctoDoc                 |
             ========================================================= *)

          CtrlDocumento.LanctoDocum.SetValues( Date ,                                             // DataLancto
                                               iCodLancCAPCAR,                                    // CodDocumento
                                               0,                                                 // Numlancto
                                               abs(dValor),                                       // Vlrliquido
                                               0,                                                 // ValorOM
                                               abs(dValor),                                       // Valor
                                               -1,                                                // Unidnegoc
                                               iPlnCodigo,                                        // liPlncodigo
                                               -1,                                                // Numlotemanual
                                               Sistema.IdUsuario,                                 // Idusuarioinclusao
                                               Sistema.IdEmpresa,                                 // Idpessoa
                                               -1,                                                // Idnflivro,
                                               -1,                                                // Estorno
                                               -1,                                                // Codtipdoc
                                               -1,                                                // Coddocinss
                                               -1,                                                // Codalterador
                                               '2',                                               // Operacao
                                               '',                                                // NumRecibo
                                               '',                                                // Numnf
                                               '',                                                // Numfatura
                                               'Estorno de Cobrança de mensalidade Assistencial', // Historicocompl
                                               '',                                                // Flgtipofatura
                                               'N',                                               // Flgrecebeunf
                                               '',                                                // Flgfatemitida
                                               'C',                                               // Debcre
                                               Sistema.IdModulo,                                  // IdModulo
                                               IntegraBack.Plano,                                 // PlanoConta
                                               True,                                              // UsaPlanoPatro
                                               False,                                             // Contabiliza
                                               -1,                                                // iCodPortForma
                                               0,                                                 // DiasFloat
                                               '',                                                // ContaBaixa
                                               0                                                  // SubContaBaixa
                                              );




     except
          bErro  := True;
     end;(* try..except *)

     try
         (* =========================================================
           |                Documento.Rateio.Inserir                |
            ========================================================= *)

          CtrlDocumento.RateioDocum.SetValues ( dValor,         // Valor
                                                0,                           // ValorOM
                                                0,                           // Vlrresorcamen
                                                0,                           // Idrateiodocum
                                                Sistema.IdEmpresa,           // Idpessoa
                                                iCodLancCAPCAR,              // Coddocumento
                                                StrToInt(vCODUNIDNEGOC),     // Unidnegoc
                                                0,                           // Moecodigo,
                                                Sistema.IdUsuario,           // Idusuarioinclusao
                                                0,                           // Idreservaorcamen
                                                IntegraBack.Plano,           // Plano
                                                vIDPLANOPREV,                // Idplanoprev
                                                vIDPESSJUR,                  // Idpatro
                                                -1,                          // Idprograma
                                                -1,                          // Idprocesso
                                                Sistema.IdEmpresa,           // IdEmpresa
                                                vCODTIPRECDES,               // Codtiprecdes
                                                cRecPag,                     // Recpag
                                                vCODCENTRORESPON,            // Codcentrorespon
                                                prmCodCentroCusto,           // Codcentrocusto
                                                ''                           // Numimovel
                                               );



     except
           bErro  := True;
     end;(* try..except *)

    If not CtrlDocumento.Insert
     Then Begin
        GravaErros('Erro ao inserir documento contas a pagar: ['+CtrlDocumento.MessageInfo+'].','1');
        bErro  := True;
        Result := True;
        Exit;
     End;
end;

function TfrmCobraContribuicao.BuscaRamoForCli(sSituacao: string; cRecPag: char): longint;
begin
     Result := -1;
     if cRecPag = 'R' then
     begin
          (* Cobrança - Contas a Receber - Buscar cliente *)
          if sSituacao = 'AT' then Result := prmIdRamoTipoCliAtivo       else
          if sSituacao = 'PT' then Result := prmIdRamoTipoCliPatro       else
          if sSituacao = 'MA' then Result := prmIdRamoTipoCliMantido     else
          if sSituacao = 'MP' then Result := prmIdRamoTipoCliMantidoParc else
          if sSituacao = 'CA' then Result := prmIdRamoTipoCliAssistido   else
          if sSituacao = 'AS' then Result := prmIdRamoTipoCliAssistido;
     end
     else
     begin
          (* Devolução - Contas a Pagar - Buscar fornecedor *)
          if sSituacao = 'AT' then Result := prmIdRamoTipoForAtivo       else
          if sSituacao = 'PT' then Result := prmIdRamoTipoForPatro       else
          if sSituacao = 'MA' then Result := prmIdRamoTipoForMantido     else
          if sSituacao = 'MP' then Result := prmIdRamoTipoForMantidoParc else
          if sSituacao = 'CA' then Result := prmIdRamoTipoCliAssistido   else
          if sSituacao = 'AS' then Result := prmIdRamoTipoForAssistido;
     end;(* if cRecPag *)
end;

procedure TfrmCobraContribuicao.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlResult.BringToFront;
  pnlOpcoes.SendToBack;
end;

procedure TfrmCobraContribuicao.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  bbtnVerResultado.Visible := true;
end;

procedure TfrmCobraContribuicao.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  (* salva o conteúdo do memo em um arquivo *)
  if SaveDlg.Execute then
    memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmCobraContribuicao.btncancelaprogressClick(Sender: TObject);
begin
     Application.ProcessMessages;
     if MsgDlg('Confirma o cancelamento?', 'Atenção', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
     begin
          bcancelaenvio := True;
          pnlProgresso.Visible := False;
          pnlOpcoes.Enabled := True;
          (* Desfaz todas as operações realizadas *)
          dtmBaseDados.dbBaseDados.RollBack;
     end;
end;

procedure TfrmCobraContribuicao.rgrpTipoCobrancaClick(Sender: TObject);
Var i: Integer;
begin
  inherited;

  edtJurosBoleta.Text := '';

  btnInf.Enabled:=rgrpTipoCobranca.ItemIndex In [0..3];
  (* Cobrança em Banco, marca todas as patrocinadoras *)
  (* Envia todas para evitar vários lançamentos *)

  chklstPatro.Enabled:=True;
  For i:= 0 to chklstPatro.Items.Count - 1 do
  begin
     // FERNANDO P.15236 - INICIO
{
     If rgrpTipoCobranca.ItemIndex = 2 then
     begin
       chklstPatro.Checked[i]:=True;
       chklstPatro.Enabled:=False;
     end else chklstPatro.Checked[i]:=False;
}
      chklstPatro.Checked[i]:=False;
     // FERNANDO P.15236 - FIM
   end;

  if rgrpTipoCobranca.ItemIndex <> 2 then
    (* Cobrança em folha não é necessário preencher juros de boleta
       pois não existirá boleta *)
    grpbJurosBoleta.Visible := False
  else
      grpbJurosBoleta.Visible := True;
end;

procedure TfrmCobraContribuicao.cmbMesCobChange(Sender: TObject);
begin
  inherited;
  PegaAnoMesCobranca;
end;

procedure TfrmCobraContribuicao.spedAnoCobChange(Sender: TObject);
begin
  inherited;
  PegaAnoMesCobranca;
end;

procedure TfrmCobraContribuicao.FormShow(Sender: TObject);
begin
  inherited;
  (* SE INTEGRADO A CONTABILIDADE *)
  If (IntegraBack.Contabilidade = 'N') then
  begin
    LabelIntegracao.Font.Color:=clRed;
    LabelIntegracao.Caption:='Não Integrado com a Contabilidade';
  end
  else
  begin
    LabelIntegracao.Font.Color:=clBlue;
    LabelIntegracao.Caption:='Integrado com a Contabilidade';
  end;
end;

procedure TfrmCobraContribuicao.btnInfClick(Sender: TObject);
begin
  inherited;
  If sMesCobranca<>'' then
  begin
    InformaEnvio;
    pnlInformaEnvio.Visible:= Not qryInf.IsEmpty;
  end;
end;

procedure TfrmCobraContribuicao.BitBtn2Click(Sender: TObject);
begin
  inherited;
  pnlInformaEnvio.Visible:=False;
  qryInf.Close;
end;

{
function TfrmCobraContribuicao.ExcluiFinanceiro(Mes : String) : Integer;
var contaBoleto : Integer;
begin
   Result := 0;
   if Application.MessageBox('Deseja Realmente Excluir o Envio de Cobrança Bancárias para o Mês Selecionado?','Desfazer',Mb_YesNo + Mb_IConQuestion) = Id_Yes then
   begin
     If not dtmBaseDados.dbBaseDados.Intransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;
     qryBuscaLanc.Close;
     qryBuscaLanc.Sql.Clear;
     qryBuscaLanc.Sql.Add(' SELECT                               ');
     qryBuscaLanc.Sql.Add('  DISTINCT CODDOCPREV, MES, IDTITULAR ');
     qryBuscaLanc.Sql.Add(' FROM HSTCONTRIBASS                   ');
     qryBuscaLanc.Sql.Add(' WHERE CODDOCPREV IS NOT NULL  AND FLGCOBCARNE = 1 AND MES = ' + QuotedStr(Mes));
     qryBuscaLanc.Open;
     qryBuscaLanc.First;

     if qryBuscaLanc.IsEmpty then
     begin
       showMessage('Não Há Lançamentos de Cobrança Bancária Para o Mês Selecionado.');
       exit;
     end;

     if Result = 0 then
     begin
       try
          (*  exclui documentos da HSTCONTRIBASS  *)
        qryBuscaLanc.First;
        contaBoleto := 1;
       lblExclui.Visible := true;

        while not qryBuscaLanc.Eof do
        begin
          try
            application.processMessages;
            lblExclui.Caption := 'Excluindo '+ intTostr(contaBoleto) +' de '+ IntToStr(qryBuscaLanc.RecordCount)+ ' Boletos...';
            lblExclui.Repaint;

            qryDesfaz.Close;
            qryDesfaz.sql.text := ' DELETE FROM HSTCONTRIBASS WHERE CODDOCPREV = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
            qryDesFaz.ExecSql;
            application.processMessages;

           (* exclui as msgs CNAB (se houver) *)
            qryDesfaz.Close;
            qryDesfaz.sql.text := ' DELETE FROM MENSAGENSCNAB WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
            qryDesFaz.ExecSql;
            application.processMessages;

             // -------------------------------------------------------------------------------------------------

             (* exclui os RecbtoPagto *)

            qryDesfaz.Close;
            qryDesfaz.sql.text := ' DELETE FROM RECBTOPAGTO WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
            qryDesFaz.ExecSql;
            application.processMessages;

             (* exclui os LoteXDocum *)


           qryDesfaz.Close;
           qryDesfaz.sql.text := ' DELETE FROM LOTEXDOCUM WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
           qryDesFaz.ExecSql;
           application.processMessages;

             (* exclui os RateioDocum *)
           qryDesfaz.Close;
           qryDesfaz.sql.text := ' DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
           qryDesFaz.ExecSql;
           application.processMessages;

             (* exclui os LanctoDocum *)
           qryDesfaz.Close;
           qryDesfaz.sql.text := ' DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
           qryDesFaz.ExecSql;
           application.processMessages;

             (* exclui o Documento *)
           qryDesfaz.Close;
           qryDesfaz.sql.text := ' DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
           qryDesFaz.ExecSql;
           application.processMessages;
         except
           showMessage('Não Foi Possível Excluir o Envio de Coranças Banárias');
           exit;
         end;
         qryBuscaLanc.Next;
         contaBoleto := contaBoleto + 1;
       end; //while
      finally
         dtmBaseDados.dbBaseDados.Commit;
         result := 1;
         showMessage('Envio excluído com sucesso');
      end;
    end;
   end;
   lblExclui.Visible := false;
end;}
{
procedure MontaFiltro;
begin
  strLista:=''; btudo:=true;
  for i:=0 to chklstPatro.items.count-1 do
    if chklstPatro.checked[I] then
    begin
      if strLista = '' then
        strLista:=ListaAux[I]
      else
        strLista:=strLista+','+ListaAux[I];
    end
    else
      btudo:=false;
  if btudo then
    strLista:='';
end;}


procedure TfrmCobraContribuicao.MarcaClick(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to chkLstPatro.Items.Count - 1 do
    chkLstPatro.Checked[i] := not chkLstPatro.Checked[i];
end;

procedure TfrmCobraContribuicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlLancamento );
  inherited;
end;

procedure TfrmCobraContribuicao.FormCreate(Sender: TObject);
begin
  inherited;
  Try
   CtrlDocumento := TCtrlDocumento.Create;
   CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                             True,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,
                             True );
  Except
   MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
   Abort;
  End;

  Try
   CtrlLancamento := TCtrlLancamento.Create;
   CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                             True,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,
                             True );
  Except
   MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
   Abort;
  End;
end;

end.


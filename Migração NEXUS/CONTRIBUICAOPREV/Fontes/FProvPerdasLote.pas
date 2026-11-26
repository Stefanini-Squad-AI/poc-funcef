// Alterações:
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17819 PPM 1104948
//Responsável : Helio Lima Custódio
//Data        : 28/12/2015
//Descrição   : Criação da tela
//------------------------------------------------------------------------------

unit FProvPerdasLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, CheckLst, ComCtrls, Db, DBTables, Wwquery,
  UCtrlLancamento;

type
  TFrmProvPerdasLote = class(TfrmOkCancelar)
    Panel2: TPanel;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    bbtnEnviar: TBitBtn;
    bbtnDesfazer: TBitBtn;
    pgctrlOpcoes: TPageControl;
    tbsBasico: TTabSheet;
    pnlTabSheet1: TPanel;
    Label7: TLabel;
    lbPatro: TLabel;
    chklstPlano: TCheckListBox;
    chklstPatro: TCheckListBox;
    tbsResultado: TTabSheet;
    pnlTabResu: TPanel;
    bbtnSalvar: TBitBtn;
    memResult: TMemo;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    updContribuicao: TUpdateSQL;
    qryContribuicao: TwwQuery;
    qryContribuicaoFLGSELECIONADO: TFloatField;
    qryContribuicaoDEVOLUCAO: TStringField;
    qryContribuicaoMESREFERENCIA: TStringField;
    qryContribuicaoMESCOBRANCA: TStringField;
    qryContribuicaoPARCELA: TFloatField;
    qryContribuicaoDATAPREVISAORECE: TDateTimeField;
    qryContribuicaoDATARECEBIMENTO: TDateTimeField;
    qryContribuicaoVALORESPERADO: TFloatField;
    qryContribuicaoSOMAALTERADORES: TFloatField;
    qryContribuicaoTOTALESPERADO: TFloatField;
    qryContribuicaoVALORRECEBIDO: TFloatField;
    qryContribuicaoALTERADORESRECEB: TFloatField;
    qryContribuicaoTOTALRECEBIDO: TFloatField;
    qryContribuicaoTipoPgmto: TStringField;
    qryContribuicaoNODOCUMENTO: TFloatField;
    qryContribuicaoNOSSONUMERO: TStringField;
    qryContribuicaoNOMERESUM: TStringField;
    qryContribuicaoNOMESITUACAO: TStringField;
    qryContribuicaoDATAEMISSCOB: TDateTimeField;
    qryContribuicaoDATACANCELAMENTO: TDateTimeField;
    qryContribuicaoNOMECONTRIB: TStringField;
    qryContribuicaoVALORBASE1: TFloatField;
    qryContribuicaoFLGDEVOLUCAO: TFloatField;
    qryContribuicaoNOMEPLANO: TStringField;
    qryContribuicaoCODTIPDESEMBDEVOL: TStringField;
    qryContribuicaoPLACONTADEVOL: TStringField;
    qryContribuicaoCODCENTROCUSTOD: TStringField;
    qryContribuicaoCODTIPRECDES: TStringField;
    qryContribuicaoNOME: TStringField;
    qryContribuicaoSITRECEBIMENTO: TStringField;
    qryContribuicaoIDLOTE: TFloatField;
    qryContribuicaoNUMRECEBIMENTO: TFloatField;
    qryContribuicaoIDMOTIVO: TFloatField;
    qryContribuicaoCODPORTFORMA: TFloatField;
    qryContribuicaoVALOROP1: TFloatField;
    qryContribuicaoVALOROP2: TFloatField;
    qryContribuicaoVALOROP3: TFloatField;
    qryContribuicaoCODDOCUMENTOPREV: TFloatField;
    qryContribuicaoVALORCALCULADO: TFloatField;
    qryContribuicaoFLGDESCFOLHA: TFloatField;
    qryContribuicaoIDCONTRIBUICAO: TFloatField;
    qryContribuicaoIDPESSJUR: TFloatField;
    qryContribuicaoIDPLANOPREV: TFloatField;
    qryContribuicaoIDPESSOA: TFloatField;
    qryContribuicaoSEQPROPOSTA: TFloatField;
    qryContribuicaoDATAINICIO: TDateTimeField;
    qryContribuicaoDATAFINAL: TDateTimeField;
    qryContribuicaoFLGSITFUNDACAO: TStringField;
    qryContribuicaoFLGEVENTO: TFloatField;
    qryContribuicaoFLGCALCRESERVA: TFloatField;
    qryContribuicaoMATRICULA: TStringField;
    qryContribuicaoFLGPAGADOR: TStringField;
    qryContribuicaoINSCRICAONUMERO: TFloatField;
    qryContribuicaoFLGDESCFOLHA_1: TFloatField;
    qryContribuicaoDIAVENCIMENTO: TFloatField;
    qryContribuicaoPLANO: TFloatField;
    qryContribuicaoPLACONTAC: TStringField;
    qryContribuicaoPLACONTAD: TStringField;
    qryContribuicaoSALMANTIDO: TFloatField;
    qryContribuicaoDATAINICIO_1: TDateTimeField;
    qryContribuicaoIDEMPRESA: TFloatField;
    r: TFloatField;
    qryContribuicaoTIPCODIGO: TStringField;
    qryContribuicaoCODTIPDOC: TFloatField;
    qryContribuicaoPLANO13: TFloatField;
    qryContribuicaoPLACONTAC13: TStringField;
    qryContribuicaoPLACONTAD13: TStringField;
    qryContribuicaoCODCENTROCUSTOC13: TStringField;
    qryContribuicaoIDEMPRESA13: TFloatField;
    qryContribuicaoCODCENTROCUSTOD13: TStringField;
    qryContribuicaoUNIDNEGOC13: TFloatField;
    qryContribuicaoIDEMPRESAPROP13: TFloatField;
    qryContribuicaoCODCENTRORESPON13: TStringField;
    qryContribuicaoCODSUBCONTA13: TFloatField;
    qryContribuicaoRECPAG13: TStringField;
    qryContribuicaoCODTIPRECDES13: TStringField;
    qryContribuicaoTIPCODIGO13: TStringField;
    qryContribuicaoCODTIPDOC13: TFloatField;
    qryContribuicaoCODPORTFORMA13: TFloatField;
    qryContribuicaoIDPLANPREVCONTAB: TFloatField;
    qryContribuicaoPLACONTADBANCO: TStringField;
    qryContribuicaoPLACONTADBANCO13: TStringField;
    qryContribuicaoSALMANTIDO_1: TFloatField;
    qryContribuicaoFLGDEVOLUCAO_1: TFloatField;
    qryContribuicaoDATAINICIO_2: TDateTimeField;
    qryContribuicaoIDREGRACALCULO: TFloatField;
    qryContribuicaoFLGINTERNO: TStringField;
    qryContribuicaoCODCENTROCUSTOC: TStringField;
    qryContribuicaoCODSUBCONTA: TFloatField;
    qryContribuicaoCODCENTRORESPON: TStringField;
    qryContribuicaoUNIDNEGOC: TFloatField;
    qryContribuicaoCODCCUSTODEVOL: TStringField;
    qryContribuicaoIDPESSJURCEDIDO: TFloatField;
    qryContribuicaoPERCINADIPLENTE: TFloatField;
    qryContribuicaoPLNCODIGO: TFloatField;
    qryContribuicaoRECPAGDOC: TStringField;
    qryContribuicaoIDTITULAR: TFloatField;
    qryContribuicaoPERCENTUAL: TFloatField;
    qryContribuicaoVALORPROV: TFloatField;
    qryContribuicaoDIASATRASO: TFloatField;
    qryContribuicaoESTAINADIPLENTE: TFloatField;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    qryContabilPLACONTADEBITO: TStringField;
    updContabil: TUpdateSQL;
    updQryProvPerds: TUpdateSQL;
    qryProvPerds: TwwQuery;
    qryProvPerdsPERCENTUAL: TFloatField;
    qryProvPerdsVALORPROV: TFloatField;
    qryProvPerdsDIASATRASO: TFloatField;
    qryProvPerdsESTAINADIPLENTE: TFloatField;
    qryPatroIDPESSOA: TFloatField;
    qryPatroNOME: TStringField;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    SaveDlg: TSaveDialog;
    qryContribuicaoDATAPRIMEIRAINADIMPLENCIA: TDateTimeField;
    qryContribuicaoFLGPROVISIONADO: TFloatField;
    qryContribuicaoDESCPROVISIONADO: TStringField;
    qryProvContribEnviadas: TwwQuery;
    qryProvContribEnviadasSITRECEBIMENTO: TStringField;
    qryProvContribEnviadasNUMRECEBIMENTO: TFloatField;
    qryProvContribEnviadasMATRICULA: TStringField;
    qryProvContribEnviadasPERCENTUAL: TFloatField;
    qryProvContribEnviadasVALORPROV: TFloatField;
    qryProvContribEnviadasDIASATRASO: TFloatField;
    qryProvContribEnviadasESTAINADIPLENTE: TFloatField;
    qryProvContribEnviadasTOTALESPERADO: TFloatField;
    qryProvContribEnviadasIDTITULAR: TFloatField;
    qryProvContribEnviadasIDPESSOA: TFloatField;
    qryProvContribEnviadasIDPESSJUR: TFloatField;
    qryProvContribEnviadasIDCONTRIBUICAO: TFloatField;
    qryProvContribEnviadasIDPLANOPREV: TFloatField;
    qryProvContribEnviadasIDPLANPREVCONTAB: TFloatField;
    qryProvContribEnviadasNUMRECEBIMENTO_1: TFloatField;
    qryProvContribEnviadasCODCENTROCUSTOD: TStringField;
    qryProvContribEnviadasRECPAGDOC: TStringField;
    qryProvContribEnviadasINSCRICAONUMERO: TFloatField;
    qryProvContribEnviadasMESREFERENCIA: TStringField;
    qryProvContribEnviadasMESCOBRANCA: TStringField;
    qryProvContribEnviadasDATAPREVISAORECE: TDateTimeField;
    qryProvContribEnviadasDATAPRIMEIRAINADIMPLENCIA: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnEnviarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlLancamento : TCtrlLancamento;
    
    procedure LimpaTela;
    procedure PreencheChklstPatro;
    procedure PreencheChklstPlano;
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    function VerificaPreenchimento:Boolean;
    function TemPatrocinadoraSelecionda : Boolean;
    function TemPlanoSelecionado : Boolean;
    procedure Processa(reverteProvisao : Boolean);
    function ObtemAnoMesSelecionado : String;
    function ObtemPatroSelSeparadoPorVirgula : String;
    function ObtemPlanoSelSeparadoPorVirgula : String;
    procedure AbreQryContribuicao(reverteProvisao : Boolean);
    procedure AddLstMatriculaLog(msg : String; lstMatriculas : TStringList);
    procedure AbreQryContabilVazia;
    procedure IncluiCampoProvQryContribuicao;
    function ProcessaQryIndiceAtual(pQry: TWWQuery;
      reverteProvisao: Boolean; var sMsgErro: String): Boolean;
    procedure AbreQryProvContribEnviadas(pIdPessoa, pIdPessJur: Integer);
  public
    { Public declarations }
  end;

var
  FrmProvPerdasLote: TFrmProvPerdasLote;

implementation
{$R *.DFM}

uses UAdmPrev, UVerificaPreenchimento, UMensErro, USistema, UContribuicaoPrev,
     DBaseDados;

procedure TFrmProvPerdasLote.FormShow(Sender: TObject);
begin
  inherited;
  LimpaTela;
  cmbMesCob.SetFocus;

  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  try
     CtrlLancamento := TCtrlLancamento.Create;
     CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True
                              );

  except
     MsgDlg('Erro ao criar Controle de Lancamentos.','Erro',mtError,[mbOK],0);
     Abort;
  end;
end;

procedure TFrmProvPerdasLote.LimpaTela;
var
  AYear, AMonth, ADay: Word;
begin
  DecodeDate(date, AYear, AMonth, ADay);
  spedAnoCob.Text := IntToStr(AYear);
  cmbMesCob.Text := '';
  memResult.Clear;

  PreencheChklstPatro;
  PreencheChklstPlano;
end;

procedure TFrmProvPerdasLote.PreencheChklstPatro;
begin
      qryPatro.Close;
      qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
      qryPatro.Open;
      CriaLista(chkLstPatro,qryPatro);
end;

procedure TFrmProvPerdasLote.PreencheChklstPlano;
var
    i : Integer;
    strPatro,
    sSQLWhere : String;
begin
  qryPlano.Close;
  qryPlano.SQL.Clear;

  for i := 0 to chklstPatro.Items.Count - 1 do
     if chklstPatro.checked[i]
     then begin
        if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey])
        then begin
           strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
        end;
   end;//for

   if Trim(strPatro) <> ''
   then begin
      strPatro   := Copy(strPatro, 1, Length(strPatro) - 2);

      sSQLWhere  := ' WHERE PP.IDPLANOPREV = PPP.IDPLANOPREV   '+
                    ' AND   PPP.IDPESSJUR  IN ('+strPatro+')   ';


      qryPlano.SQL.Add(' SELECT DISTINCT PP.IDPLANOPREV, PP.NOME                   '+
                       ' FROM   PLANPREV PP, PLANPREVPATRO PPP ');
      qryPlano.SQL.Add(sSQLWhere);
      qryPlano.SQL.Add(' ORDER  BY PP.NOME ');
   end
   else
      qryPlano.SQL.Add(' SELECT IDPLANOPREV,  NOME '+
                       ' FROM   PLANPREV   '+
                       ' ORDER  BY NOME ');

  qryPlano.Open;
  CriaLista(chklstPlano,qryPlano);
end;

procedure TFrmProvPerdasLote.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not EOF do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

procedure TFrmProvPerdasLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
  qryPlano.Close;
  qryProvContribEnviadas.Close;
end;

procedure TFrmProvPerdasLote.chklstPatroClickCheck(Sender: TObject);
begin
  inherited;
  PreencheChklstPlano;
end;

procedure TFrmProvPerdasLote.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
  cmbMesCob.SetFocus;
end;

function TFrmProvPerdasLote.TemPatrocinadoraSelecionda : Boolean;
var
    temSelecionado : Boolean;
    i : Integer;
begin
       temSelecionado := False;
       for i := 0 to chklstPatro.Items.Count - 1 do
       begin
          if chklstPatro.Checked[i] then
          begin
                temSelecionado := True;
                Break;
          end;
       end;

       Result := temSelecionado;
end;

function TFrmProvPerdasLote.TemPlanoSelecionado : Boolean;
var
    temSelecionado : Boolean;
    i : Integer;
begin
       temSelecionado := False;
       for i := 0 to chklstPlano.Items.Count - 1 do
       begin
          if chklstPlano.Checked[i] then
          begin
                temSelecionado := True;
                Break;
          end;
       end;

       Result := temSelecionado;
end;

function TFrmProvPerdasLote.VerificaPreenchimento:Boolean;
begin
   
   Result := False;

   try
      if cmbMesCob.ItemIndex < 0 then
           raise EValidacao.CreateVal('É necessário selecionar o ano/mês de cobrança das contribuições.', cmbMesCob);

      if (Trim(spedAnoCob.Text) = '') then
           raise EValidacao.CreateVal('É necessário selecionar o ano/mês de cobrança das contribuições.', spedAnoCob);

      if Not TemPatrocinadoraSelecionda then
           raise EValidacao.CreateVal('É necessário selecionar pelo menos uma patrocinadora.', chklstPatro);

      if Not TemPlanoSelecionado then
           raise EValidacao.CreateVal('É necessário selecionar pelo menos um plano previdenciário.', chklstPlano);

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

procedure TFrmProvPerdasLote.bbtnEnviarClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then
       Processa(false);
end;

procedure TFrmProvPerdasLote.AddLstMatriculaLog(msg : String; lstMatriculas : TStringList);
var
    i : Integer;
begin
       if lstMatriculas.Count > 0 then
       begin
               memResult.Lines.Add(msg);

               for i := 0 to lstMatriculas.Count - 1 do
                     memResult.Lines.Add(lstMatriculas[i]);
       end;
end;

procedure TFrmProvPerdasLote.Processa(reverteProvisao : Boolean);
var
    operacaoOk : Boolean;
    lstMatriculasOk : TStringList;
    lstMatriculasErr : TStringList;
    var sMsgErro : String;
begin

       AbreQryContribuicao(reverteProvisao);

       lstMatriculasOk := TStringList.Create;
       lstMatriculasErr := TStringList.Create;
       
       lstMatriculasOk.Clear;
       lstMatriculasErr.Clear;

       operacaoOk := True;
       qryContribuicao.First;
       while Not qryContribuicao.Eof do
       begin
              operacaoOk := True;

              if (reverteProvisao) and
                 (qryContribuicaoFLGPROVISIONADO.AsInteger = 0) then
              begin
                    qryContribuicao.Next;
                    Continue;
              end;

              if (Not reverteProvisao) and
                 (qryContribuicaoFLGPROVISIONADO.AsInteger = 1) then
              begin
                    qryContribuicao.Next;
                    Continue;
              end;

              if Not ProcessaQryIndiceAtual(qryContribuicao, reverteProvisao, sMsgErro) then
                  operacaoOk := False;

              if operacaoOk then
                  lstMatriculasOk.Add(qryContribuicaoMATRICULA.AsString)
              else
                  lstMatriculasErr.Add(qryContribuicaoMATRICULA.AsString + ' - ' + sMsgErro);

              qryContribuicao.Next;
       end;

       If reverteProvisao then
       while Not qryProvContribEnviadas.Eof do
       begin
              operacaoOk := True;
              
              if Not ProcessaQryIndiceAtual(qryProvContribEnviadas, reverteProvisao, sMsgErro) then
                  operacaoOk := False;


              if operacaoOk then
              begin
                  lstMatriculasOk.Clear;
                  lstMatriculasOk.Add(qryProvContribEnviadasMATRICULA.AsString);
              end else
                  lstMatriculasErr.Add(qryProvContribEnviadasMATRICULA.AsString + ' - ' + sMsgErro);

              qryProvContribEnviadas.Next;
       end;



       memResult.Lines.Clear;
       AddLstMatriculaLog('Matriculas com processamento efetuado com sucesso:', lstMatriculasOk);
       if lstMatriculasOk.Count > 0 then memResult.Lines.Add('');
       AddLstMatriculaLog('Matriculas que não tiveram o processamento efetuado com sucesso:', lstMatriculasErr);
       
       if operacaoOk then
           MsgDlg('Processo finalizado com sucesso. ','Confirmação',mtInformation,[mbOK],0)
       else
           MsgDlg('Processo finalizado com erros. Verifique a aba Resultados. ','Confirmação',mtInformation,[mbOK],0);


       pgctrlOpcoes.ActivePage := tbsResultado;

       qryContribuicao.Close;

       lstMatriculasOk.Free;
       lstMatriculasErr.Free;
end;

function TFrmProvPerdasLote.ProcessaQryIndiceAtual(pQry : TWWQuery;
                                                   reverteProvisao : Boolean;
                                                   var sMsgErro : String) : Boolean;
var
    vPlnCodigo : Integer;
begin

     Result := True;
     try
           AbreQryContabilVazia;

           vPlnCodigo := -1;

           if Not dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.StartTransaction;

           qryProvPerds.Close;
           qryProvPerds.Open;     
           qryProvPerds.Edit;
           qryProvPerdsPERCENTUAL.AsFloat        := pQry.FieldByName('PERCENTUAL').AsFloat;
           qryProvPerdsVALORPROV.AsFloat         := pQry.FieldByName('VALORPROV').AsFloat;
           qryProvPerdsDIASATRASO.AsInteger      := pQry.FieldByName('DIASATRASO').AsInteger;
           qryProvPerdsESTAINADIPLENTE.AsInteger := pQry.FieldByName('ESTAINADIPLENTE').AsInteger;
           qryProvPerds.Post;

           if Not IncluiContabilidadeProvPerdas(qryContabil,
                                                qryProvPerds,
                                                CtrlLancamento,
                                                reverteProvisao,
                                                pQry.FieldByName('TOTALESPERADO').AsFloat,//pQry.FieldByName('ValorEsperado').AsFloat,
                                                pQry.FieldByName('IDTITULAR').AsInteger,
                                                pQry.FieldByName('IDPESSOA').AsInteger,
                                                pQry.FieldByName('IDPESSJUR').AsInteger,
                                                pQry.FieldByName('IDCONTRIBUICAO').AsInteger,
                                                pQry.FieldByName('IDPLANOPREV').AsInteger,
                                                pQry.FieldByName('IDPLANPREVCONTAB').AsInteger,
                                                pQry.FieldByName('NUMRECEBIMENTO').AsInteger,
                                                pQry.FieldByName('CODCENTROCUSTOD').AsString,
                                                pQry.FieldByName('RECPAGDOC').AsString,
                                                pQry.FieldByName('INSCRICAONUMERO').AsString,
                                                pQry.FieldByName('MESREFERENCIA').AsString,
                                                pQry.FieldByName('MESCOBRANCA').AsString,
                                                pQry.FieldByName('DATAPREVISAORECE').AsString,
                                                pQry.FieldByName('DataPrevisaoRece').AsString,
                                                pQry.FieldByName('DATAPRIMEIRAINADIMPLENCIA').AsString,
                                                vPlnCodigo,
                                                sMsgErro) then
                    Raise Exception.Create(sMsgErro);


           if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Commit;

           qryContabil.Close;
      except
           on E : Exception do
           begin
              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.RollBack;

              qryContabil.Close;
              //memResult.Lines.Add(E.Message);
              sMsgErro := E.Message;

              Result := False;
           end;
      end;
end;

procedure TFrmProvPerdasLote.AbreQryContabilVazia;
begin
       qryContabil.Close;
       qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
       qryContabil.Prepare;
       qryContabil.Open;
end;

function TFrmProvPerdasLote.ObtemAnoMesSelecionado : String;
var
    intMes : Integer;
    strMes : String;
begin
       intMes := cmbMesCob.ItemIndex + 1;
       strMes := '';

       if intMes < 10 then
            strMes := '0';

       strMes := strMes + IntToStr(intMes);

       Result := spedAnoCob.Text +
                 '/' +
                 strMes;
end;

function TFrmProvPerdasLote.ObtemPatroSelSeparadoPorVirgula : String;
var
    patroSel : String;
    i : Integer;
begin
    patroSel := '';
    qryPatro.First;
    for i := 0 to chklstPatro.Items.Count - 1 do
    begin
       if chklstPatro.Checked[i] then
       begin
            if patroSel <> '' then patroSel := patroSel + ', ';
            patroSel := patroSel + qryPatro.FieldByName('IDPESSOA').AsString;
       end;
       qryPatro.Next;
    end;

    Result := patroSel;
end;

function TFrmProvPerdasLote.ObtemPlanoSelSeparadoPorVirgula : String;
var
    planoSel : String;
    i : Integer;
begin
    planoSel := '';
    qryPlano.First;
    for i := 0 to chklstPlano.Items.Count - 1 do
    begin
       if chklstPlano.Checked[i] then
       begin
            if planoSel <> '' then planoSel := planoSel + ', ';
            planoSel := planoSel + qryPlano.FieldByName('IDPLANOPREV').AsString;
       end;
       qryPlano.Next;
    end;

    Result := planoSel;
end;

procedure TFrmProvPerdasLote.AbreQryContribuicao(reverteProvisao : Boolean);
var
    sqlConsultIdFaixaProvPerd,
    anoMesCobrSel,
    patroSelSepVirgula,
    planoSelSepVirgula,
    sqlConsultSitRecebPai,
    sqlPrimeiraDataInad,
    sqlCalcTOTALESPERADO : String;
begin

   anoMesCobrSel := ObtemAnoMesSelecionado;
   patroSelSepVirgula := ObtemPatroSelSeparadoPorVirgula;
   planoSelSepVirgula := ObtemPlanoSelSeparadoPorVirgula;

   sqlPrimeiraDataInad := '' + #13#10 +
                          '--Inicio PRIMEIRA DATA DE INADIPLENCIA' + #13#10 +
                          '(SELECT MIN(DATAPREVISAORECE) FROM HSTCONTRIBPREV HSTCEMP' + #13#10 +
                          '         WHERE HSTCEMP.NUMRECEBIMENTO        =   HST.NUMRECEBIMENTOPAI' + #13#10 +
                          '               AND HSTCEMP.IDPESSJUR         = HST.IDPESSJUR' + #13#10 +
                          '               AND HSTCEMP.IDPESSOA          = HST.IDPESSOA' + #13#10 +
                          //'               AND HSTCEMP.IDTITULAR         = HST.IDTITULAR' + #13#10 +
                          '               AND HSTCEMP.IDPLANOPREV       = HST.IDPLANOPREV' + #13#10 +
                          '               AND HSTCEMP.IDPLANPREVCONTAB  = HST.IDPLANPREVCONTAB)' + #13#10 +
                          '--FIM PRIMEIRA DATA DE INADIPLENCIA' + #13#10 +
                          '';

  sqlConsultSitRecebPai := '' + #13#10 +
                           '--Inicio SITRECEBIMENTO' + #13#10 +
                           '(SELECT SITRECEBIMENTO FROM HSTCONTRIBPREV HSTCEMP2' + #13#10 +
                           '         WHERE HSTCEMP2.NUMRECEBIMENTO        =   HST.NUMRECEBIMENTOPAI' + #13#10 +
                           '               AND HSTCEMP2.IDPESSJUR         = HST.IDPESSJUR' + #13#10 +
                           '               AND HSTCEMP2.IDPESSOA          = HST.IDPESSOA' + #13#10 +
                           //'               AND HSTCEMP2.IDTITULAR         = HST.IDTITULAR' + #13#10 +
                           '               AND HSTCEMP2.IDPLANOPREV       = HST.IDPLANOPREV' + #13#10 +
                           '               AND HSTCEMP2.IDPLANPREVCONTAB  = HST.IDPLANPREVCONTAB' + #13#10 +
                           '               AND HSTCEMP2.DATAPREVISAORECE = ' + sqlPrimeiraDataInad + ')' + #13#10 +
                           '--FIM SITRECEBIMENTO' + #13#10 +
                           '';

   sqlCalcTOTALESPERADO := '(ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), NVL(-HST.VALORESPERADO,0) )+SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0))))';

   qryContribuicao.DisableControls;
   with qryContribuicao do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT 0.00 AS FLGSELECIONADO,                                                         ');
      SQL.Add('        D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,                      ');
      SQL.Add('        C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,                  ');
      SQL.Add('        HST.DATAPREVISAORECE,                                                           ');
      SQL.Add('        HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,               ');
      SQL.Add('        HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,                 ');

      // André Pontes - pendência 26613 (reabertura) - 28/02/2008
      SQL.Add('        DECODE(NVL(HST.FLGDEVOLUCAO, 0), 1, ''devolução'', '''') AS DEVOLUCAO, '         );

      SQL.Add('        HST.IDMOTIVO,         HST.DATARECEBIMENTO,                                      ');
      SQL.Add('        HST.VALOROP1,                                                                   ');
      SQL.Add('        HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCUMENTOPREV,             ');
      SQL.Add('        HST.VALORCALCULADO,   HST.FLGDESCFOLHA,                                         ');
      SQL.Add('        HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,                  ');
      SQL.Add('        HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,                   ');
      SQL.Add('        HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,                    ');
      SQL.Add('        HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,               ');
      SQL.Add('        HST.PARCELA,                                                                    ');
      SQL.Add('        EL.MATRICULA,         CP.FLGPAGADOR,                                            ');
      SQL.Add('        CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICAONUMERO,               ');
      SQL.Add('        CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRECDES,                  ');
      SQL.Add('        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,                    ');
      SQL.Add('        C.NOME  NOMECONTRIB,  CP.CODSUBCONTA ,        CP.CODCENTRORESPON,               ');
      SQL.Add('        PP.SALMANTIDO,        CP.UNIDNEGOC,                                             ');
      SQL.Add('        CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINICIO,                   ');
      SQL.Add('        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                            ');
      SQL.Add('        NVL(HST.CODPORTFORMA,CPP.CODPORTFORMA) AS CODPORTFORMA,                         ');
      SQL.Add('        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,                  ');
      SQL.Add('        CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,            ');
      SQL.Add('        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,            ');
      SQL.Add('        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,               ');
      SQL.Add('        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,               ');
      SQL.Add('        NVL(CPP.IDPLANPREVCONTAB, HST.IDPLANOPREV) AS IDPLANPREVCONTAB, ');
      SQL.Add('        CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,             ');
      SQL.Add('        CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADEVOL,                   ');
      SQL.Add('        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,                   ');
      SQL.Add('        DECODE(HST.FLGDEVOLUCAO, 0, DECODE( HST.SITRECEBIMENTO, ''0'', ''Não enviada para cobrança'', ');
      SQL.Add('                                                                ''1'', ''Enviada e não recebida'',    ');
      SQL.Add('                                                                ''2'', ''Recebida corretamente'',     ');
      SQL.Add('                                                                ''3'', ''Recebida com divergência(NT)'', ');
      SQL.Add('                                                                ''4'', ''Atrasada e já tratada'',          ');
      SQL.Add('                                                                ''5'', ''Divergência paga'',             ');
      SQL.Add('                                                                ''6'', ''Divergência enviada e não recebida'', ');
      SQL.Add('                                                                ''7'', ''Financiada ou Renegociada'',          ');
      SQL.Add('                                                                ''8'', ''Cancelada'',                          ');
      SQL.Add('                                                                ''9'', ''Cobrada na Folha de Benefício''),     ');
      SQL.Add('                                    DECODE( HST.SITRECEBIMENTO, ''0'', ''Não enviada para devolução'',         ');
      SQL.Add('                                                                ''1'', ''Enviada e não efetivamente paga'',    ');
      SQL.Add('                                                                ''2'', ''Paga corretamente'',                  ');
      SQL.Add('                                                                ''3'', ''Paga com divergência(NT)'',           ');
      //BRUNO AZEVEDO SOL KINTANA
      SQL.Add('                                                                ''4'', ''Atrasada e já tratada'',          ');
      SQL.Add('                                                                ''7'', ''Financiada ou Renegociada'',          ');
      SQL.Add('                                                                ''8'', ''Cancelada'',                          ');
      SQL.Add('                                                                ''9'', ''Paga na Folha de Benefício'')) AS NOMESITUACAO, ');
      SQL.Add('        CP.IDREGRACALCULO,    SP.FLGINTERNO,                                                  ');


      // Daniel Begnami SOL:104817

//    SQL.Add('        DECODE(HST.FLGDEVOLUCAO,0,                                                                                    ');
//    SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALOR,''D'',HA.VALOR,0)),                       ');
//    SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',HA.VALOR,''D'',-HA.VALOR,0))) AS SOMAALTERADORES,   ');

      //BRUNO AZEVEDO SOL KINTANA
      SQL.Add(' SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)) AS SOMAALTERADORES,');


      SQL.Add('      DECODE(HST.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)),               ');
      SQL.Add('                          SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALOR,0),''D'',NVL(-HA.VALOR,0),0)))AS SOMAALTERADORES,  ');


//    SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), -NVL(HST.VALORESPERADO,0))+                          ');
//    SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALOR,''D'',HA.VALOR,0))) AS TOTALESPERADO,                         ');

      //SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), NVL(-HST.VALORESPERADO,0) )+                         ');
      //SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)))AS TOTALESPERADO,            ');
      SQL.Add('              ' + sqlCalcTOTALESPERADO + ' AS TOTALESPERADO,            ');


//    SQL.Add('        SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALORRECEBIDO,''D'',HA.VALORRECEBIDO,0)) AS ALTERADORESRECEB,             ');

      SQL.Add('        DECODE(HST.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO,0),''D'',NVL(HA.VALORRECEBIDO,0),0)), ');
      SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALORRECEBIDO,0),''D'',NVL(-HA.VALORRECEBIDO,0),0))  ');
      SQL.Add('        )AS ALTERADORESRECEB,                                                                                                 ');



//    SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORRECEBIDO,0), -NVL(HST.VALORRECEBIDO,0))+                          ');
//    SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALORRECEBIDO,''D'',HA.VALORRECEBIDO,0))) AS  TOTALRECEBIDO,        ');

      SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO, 0,NVL(HST.VALORRECEBIDO,0), NVL(-HST.VALORRECEBIDO,0) )+                         ');
      SQL.Add('        SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO,0),''D'',NVL(HA.VALORRECEBIDO,0),0))) AS  TOTALRECEBIDO,    ');

      // FIM SOL:104817

      SQL.Add('        NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO, ');

      SQL.Add('        D.RECPAG RECPAGDOC,     ');
      SQL.Add('        (SELECT DECODE(HST.IDPLANPREVCONTAB,2,''REG/REPLAN'',74,''NOVO PLANO'',PN.NOME) AS NOME from PLANPREVCONTABIL PN WHERE ( HST.IDPLANPREVCONTAB = PN.IDPLANOPREV)) as NOMEPLANO, HST.valorbase1,  ');  //higor Nayde SOL162126*RE01
      SQL.Add('        L.PLNCODIGO, 0 AS PERCINADIPLENTE, HST.IDTITULAR,                                                                  ');

      SQL.Add('        FAIXPROV.PERCENTUAL, ');
      //SQL.Add('        HST.VALORESPERADO/100 * FAIXPROV.PERCENTUAL AS VALORPROV, ');
      SQL.Add('           (' + sqlCalcTOTALESPERADO + ' / 100) * FAIXPROV.PERCENTUAL AS VALORPROV, ');
      SQL.Add('        (TRUNC(SYSDATE) - ' + sqlPrimeiraDataInad + ') AS DIASATRASO, ');
      SQL.Add('        1 ESTAINADIPLENTE, ');
      SQL.Add('        ' + sqlPrimeiraDataInad + ' AS DATAPRIMEIRAINADIMPLENCIA, ');
      SQL.Add('        0 AS FLGPROVISIONADO,');
      SQL.Add('        ''                '' AS DESCPROVISIONADO ');

      SQL.Add(' FROM   CONTRIBUICAO C,       CONTPREV CP, PATRO PT,  SITPART SP,                             ');
      SQL.Add('        ELEGPATRO EL,         PARTPREVPLAN PP,  CONTRIBPREVPARTP CPP,                         ');
      SQL.Add('        HSTCONTRIBPREV HST,   DOCUMENTO D, HSTATRASOCONTRIB HA, TIPOALTERADOR TA,             ');
      SQL.Add('        LANCTODOCUM L, FAIXASPROVISAOPERDACONTRIB FAIXPROV                                                                        ');



      //SQL.Add(' WHERE  (HST.IDPESSOA    = '+qryTitular.FieldByName('IdPessoa').AsString+' )                  ');
      //SQL.Add(' AND    (HST.IDPESSJUR   = '+qryTitular.FieldByName('IdPessJur').AsString+' )                 ');
      //SQL.Add(' AND    (HST.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' )               ');
      SQL.Add(' WHERE    (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) )                                           ');
      
      SQL.Add(' AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)                                               ');
      SQL.Add(' AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)                                                  ');
      SQL.Add(' AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (CPP.IDPESSOA       = HST.IDPESSOA)                                                   ');
      SQL.Add(' AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)                                                ');
      SQL.Add(' AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)                                             ');
      SQL.Add(' AND    (PP.IDPESSJUR       = CPP.IDPESSJUR)                                                  ');
      SQL.Add(' AND    (PP.IDPLANOPREV     = CPP.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (PP.IDPESSOA        = CPP.IDPESSOA)                                                   ');
      SQL.Add(' AND    (PP.SEQPROPOSTA     = CPP.SEQPROPOSTA)                                                ');
      SQL.Add(' AND    (PT.IDPESSOA        = PP.IDPESSJUR)                                                   ');
      SQL.Add(' AND    (EL.IDPESSOA        = PP.IDPESSOA)                                                    ');
      SQL.Add(' AND    (EL.IDPESSJUR       = PP.IDPESSJUR)                                                   ');
      SQL.Add(' AND    (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)                                             ');
      SQL.Add(' AND    (CP.IDPLANOPREV     = CPP.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)                                              ');
      SQL.Add(' AND    (PP.IDSITPART       = SP.IDSITPART)                                                   ');
      SQL.Add(' AND    (HA.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO)                                           ');
      SQL.Add(' AND    (HA.MESCOBRANCA(+)    = HST.MESCOBRANCA)                                              ');
      SQL.Add(' AND    (HA.MESREFERENCIA(+)  = HST.MESREFERENCIA)                                            ');
      SQL.Add(' AND    (HA.IDMOTIVO(+)       = HST.IDMOTIVO)                                                 ');
      SQL.Add(' AND    (HA.CODALTERADOR      = TA.CODALTERADOR(+))                                           ');
      
      SQL.Add(' AND    (HST.MESCOBRANCA    <>  HST.MESREFERENCIA)                                            ');
      SQL.Add(' AND    (L.CODDOCUMENTO(+) = D.NODOCUMENTO)                                                   ');
      SQL.Add(' AND    (L.OPERACAO IS NULL OR L.OPERACAO = 2)                                                ');


      SQL.Add(' AND    (HST.MESCOBRANCA = ' + QuotedStr(anoMesCobrSel) + ')                                             ');
      SQL.Add(' AND    (PP.IDPESSJUR IN( ' + patroSelSepVirgula + ' ))                                        ');
      SQL.Add(' AND    (PP.IDPLANOPREV IN ( ' + planoSelSepVirgula + ' ))                                          ');

      sqlConsultIdFaixaProvPerd := ConstroiSQLProvPerdas(sqlCalcTOTALESPERADO,//'HST.VALORESPERADO',
                                                         '(TRUNC(SYSDATE) - TRUNC(' + sqlPrimeiraDataInad + '))',
                                                         'HST.IDPLANOPREV',
                                                         'HST.IDCONTRIBUICAO',
                                                         'HST.MESREFERENCIA',
                                                         'HST.MESCOBRANCA',
                                                         true);
      SQL.Add(' AND (FAIXPROV.IDFAIXASPROVISAOPERDACONTRIB = (' + sqlConsultIdFaixaProvPerd + ')) ');
      SQL.Add(' AND (HST.SITRECEBIMENTO IN (0, 1)) ');
      SQL.Add(' AND (4 = (' + sqlConsultSitRecebPai + ')) '); //SITRECEBIMENTO DO PAI COMO ATRASADO E JÁ TRATADO

      If Not reverteProvisao then
      begin
            //não traz os já provisionados
            SQL.Add(' AND NOT EXISTS( SELECT 1 FROM PROVISAOPERDASCONTRIBUICAO P ');
            SQL.Add('                          WHERE P.IDPESSJUR = HST.IDPESSJUR  ');
            SQL.Add('                            AND P.IDPLANOPREV = HST.IDPLANOPREV ');
            SQL.Add('                            AND P.IDCONTRIBUICAO = HST.IDCONTRIBUICAO  ');
            SQL.Add('                            AND (P.IDTITULAR = HST.IDTITULAR OR (P.IDTITULAR IS NULL AND HST.IDTITULAR IS NULL))  ');
            SQL.Add('                            AND P.IDPESSOA = HST.IDPESSOA  ');
            SQL.Add('                            AND P.MESCOBRANCA = HST.MESCOBRANCA  ');
            SQL.Add('                            AND P.MESREFERENCIA = HST.MESREFERENCIA  ');
            SQL.Add('                            AND P.FLGATIVO = 1   ');
            SQL.Add('                            AND P.FLGREVERSAO = 0 ) ');
      end else
      begin
            //traz SOMENTE os já provisionados
            SQL.Add(' AND EXISTS( SELECT 1 FROM PROVISAOPERDASCONTRIBUICAO P ');
            SQL.Add('                          WHERE P.IDPESSJUR = HST.IDPESSJUR  ');
            SQL.Add('                            AND P.IDPLANOPREV = HST.IDPLANOPREV ');
            SQL.Add('                            AND P.IDCONTRIBUICAO = HST.IDCONTRIBUICAO  ');
            SQL.Add('                            AND (P.IDTITULAR = HST.IDTITULAR OR (P.IDTITULAR IS NULL AND HST.IDTITULAR IS NULL))  ');
            SQL.Add('                            AND P.IDPESSOA = HST.IDPESSOA  ');
            SQL.Add('                            AND P.MESCOBRANCA = HST.MESCOBRANCA  ');
            SQL.Add('                            AND P.MESREFERENCIA = HST.MESREFERENCIA  ');
            SQL.Add('                            AND P.FLGATIVO = 1   ');
            SQL.Add('                            AND P.FLGREVERSAO = 0 ) ');
      end;

      //helio aqui - remover
      //SQL.Add(' AND IDTITULAR = 860610 ');

      SQl.Add('GROUP BY D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,                     ');
      SQL.Add('        C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,                  ');
      SQL.Add('        HST.DATAPREVISAORECE,                                                           ');
      SQL.Add('        HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,               ');
      SQL.Add('        HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,                 ');

      // André Pontes - pendência 26613 (reabertura) - 28/02/2008
      SQL.Add('        DECODE(NVL(HST.FLGDEVOLUCAO, 0), 1, ''devolução'', ''''), '                      );

      SQL.Add('        HST.IDMOTIVO,         HST.DATARECEBIMENTO,                                      ');
      SQL.Add('        HST.VALOROP1,                                                                   ');
      SQL.Add('        HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCUMENTOPREV,             ');
      SQL.Add('        HST.VALORCALCULADO,   HST.FLGDESCFOLHA,                                         ');
      SQL.Add('        HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,                  ');
      SQL.Add('        HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,                   ');
      SQL.Add('        HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,                    ');
      SQL.Add('        HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,               ');
      SQL.Add('        HST.PARCELA,                                                                    ');
      SQL.Add('        EL.MATRICULA,         CP.FLGPAGADOR,                                            ');
      SQL.Add('        CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICAONUMERO,               ');
      SQL.Add('        CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRECDES,                  ');
      SQL.Add('        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,                    ');
      SQL.Add('        CP.CODSUBCONTA ,        CP.CODCENTRORESPON,                                     ');
      SQL.Add('        PP.SALMANTIDO,        CP.UNIDNEGOC,                                             ');
      SQL.Add('        CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINICIO,                   ');
      SQL.Add('        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                            ');
      SQL.Add('        HST.CODPORTFORMA,     CPP.CODPORTFORMA,                                         ');
      SQL.Add('        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,                  ');
      SQL.Add('        CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,            ');
      SQL.Add('        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,            ');
      SQL.Add('        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,               ');
      SQL.Add('        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,               ');
      SQL.Add('        CPP.IDPLANPREVCONTAB, CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,             ');
      SQL.Add('        CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADEVOL,                   ');
      SQL.Add('        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,                   ');
      SQL.Add('        HST.FLGDEVOLUCAO,     HST.SITRECEBIMENTO,                                       ');
      SQL.Add('        CP.IDREGRACALCULO,    SP.FLGINTERNO , NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR),    ');
      SQL.Add('        D.RECPAG,HST.valorbase1 ,HST.IDPLANPREVCONTAB, L.PLNCODIGO, HST.IDTITULAR,      '); //Higor Nayde 162126*RE01 KINTANA 792563
      SQL.Add('        FAIXPROV.PERCENTUAL, HST.NUMRECEBIMENTOPAI');

      Open;
   end;
   qryContribuicao.EnableControls;

   IncluiCampoProvQryContribuicao;

end;

procedure TFrmProvPerdasLote.AbreQryProvContribEnviadas(pIdPessoa, pIdPessJur : Integer);
var
    anoMesCobrSel,
    patroSelSepVirgula,
    planoSelSepVirgula : string;
begin
       anoMesCobrSel := ObtemAnoMesSelecionado;
       patroSelSepVirgula := ObtemPatroSelSeparadoPorVirgula;
       planoSelSepVirgula := ObtemPlanoSelSeparadoPorVirgula;

       qryProvContribEnviadas.Close;

       qryProvContribEnviadas.SQL.Text := 'SELECT H.SITRECEBIMENTO, H.NUMRECEBIMENTO, EL.MATRICULA,' + #13#10 +
                                          '       P.PERCENTUALPROVISAO AS PERCENTUAL,' + #13#10 +
                                          '       P.VALORPROVISAO AS VALORPROV,' + #13#10 +
                                          '       TRUNC(SYSDATE) - TRUNC(P.DATAPRIMEIRAINADIMPLENCIA) AS DIASATRASO,' + #13#10 +
                                          '       1 AS ESTAINADIPLENTE,' + #13#10 +
                                          '       P.VALORINADIMPLENCIA AS TOTALESPERADO,' + #13#10 +
                                          '       H.IDTITULAR,' + #13#10 +
                                          '       H.IDPESSOA,' + #13#10 +
                                          '       H.IDPESSJUR,' + #13#10 +
                                          '       H.IDCONTRIBUICAO,' + #13#10 +
                                          '       H.IDPLANOPREV,' + #13#10 +
                                          '       H.IDPLANPREVCONTAB,' + #13#10 +
                                          '       H.NUMRECEBIMENTO,' + #13#10 +
                                          '       CP.CODCENTROCUSTOD,' + #13#10 +
                                          '       D.RECPAG AS RECPAGDOC,' + #13#10 +
                                          '       PP.INSCRICAONUMERO,' + #13#10 +
                                          '       H.MESREFERENCIA,' + #13#10 +
                                          '       H.MESCOBRANCA,' + #13#10 +
                                          '       H.DATAPREVISAORECE,' + #13#10 +
                                          '       P.DATAPRIMEIRAINADIMPLENCIA' + #13#10 +
                                          '' + #13#10 +
                                          '  FROM PROVISAOPERDASCONTRIBUICAO P' + #13#10 +
                                          '  INNER JOIN HSTCONTRIBPREV H' + #13#10 +
                                          '    ON H.NUMRECEBIMENTO = P.NUMRECEBIMENTO' + #13#10 +
                                          '   AND H.MESCOBRANCA = P.MESCOBRANCA' + #13#10 +
                                          '   AND H.MESREFERENCIA = P.MESREFERENCIA' + #13#10 +
                                          '  INNER JOIN ELEGPATRO EL' + #13#10 +
                                          '    ON EL.IDPESSOA = H.IDPESSOA' + #13#10 +
                                          '    AND EL.IDPESSJUR = P.IDPESSJUR' + #13#10 +
                                          '  INNER JOIN CONTPREV CP' + #13#10 +
                                          '    ON CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO' + #13#10 +
                                          '    AND CP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                                          '  INNER JOIN PARTPREVPLAN PP' + #13#10 +
                                          '    ON PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
                                          '    AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                                          '    AND PP.IDPESSOA = H.IDPESSOA' + #13#10 +
                                          '    AND PP.SEQPROPOSTA = H.SEQPROPOSTA' + #13#10 +
                                          '  LEFT JOIN DOCUMENTO D' + #13#10 +
                                          '    ON D.CODDOCUMENTO = H.CODDOCUMENTOPREV' + #13#10 +
                                          '   WHERE P.FLGREVERSAO = 0' + #13#10 +
                                          '   AND P.FLGATIVO = 1' + #13#10 +
                                          '   AND H.SITRECEBIMENTO = 2' + #13#10 +
                                          '   AND P.IDPESSJUR IN (' + patroSelSepVirgula + ')' + #13#10 +
                                          '   AND P.MESCOBRANCA = ' + QuotedStr(anoMesCobrSel)  + #13#10 +
                                          '   AND P.IDPLANOPREV IN (' + planoSelSepVirgula + ')';


       qryProvContribEnviadas.Open;
end;

procedure TFrmProvPerdasLote.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TFrmProvPerdasLote.bbtnDesfazerClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then
  begin
       AbreQryProvContribEnviadas(qryContribuicaoIDPESSOA.AsInteger,
                                  qryContribuicaoIDPESSJUR.AsInteger);
       Processa(true);
       qryProvContribEnviadas.Close;
  end;
end;

procedure TFrmProvPerdasLote.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlLancamento );
end;

procedure TFrmProvPerdasLote.IncluiCampoProvQryContribuicao;
begin
       qryContribuicao.DisableControls;
       qryContribuicao.First;

       while not qryContribuicao.Eof do
       begin
             qryContribuicao.Edit;
             if VerificaContribFoiProvisionada(qryContribuicao.FieldByName('IDPESSJUR').AsInteger,
                                               qryContribuicao.FieldByName('IDPLANOPREV').AsInteger,
                                               qryContribuicao.FieldByName('IDPLANPREVCONTAB').AsInteger,
                                               qryContribuicao.FieldByName('IDCONTRIBUICAO').AsInteger,
                                               qryContribuicao.FieldByName('IDTITULAR').AsInteger,
                                               qryContribuicao.FieldByName('IDPESSOA').AsInteger,
                                               qryContribuicao.FieldByName('MESCOBRANCA').AsString,
                                               qryContribuicao.FieldByName('MESREFERENCIA').AsString)
             then begin
                        qryContribuicaoFLGPROVISIONADO.AsInteger := 1;
                        qryContribuicaoDESCPROVISIONADO.AsString := 'Provisionado';
             end else
             begin
                        qryContribuicaoFLGPROVISIONADO.AsInteger := 0;
                        qryContribuicaoDESCPROVISIONADO.AsString := 'Não Provisionado';
             end;
             qryContribuicao.Post;

             qryContribuicao.Next;
       end;

       qryContribuicao.EnableControls;
end;


end.
